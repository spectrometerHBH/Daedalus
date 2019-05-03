package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

//Simple constant propagation
//        This pass implements constant propagation and merging. It looks for instructions involving only constant operands and replaces them with a constant value instead of an instruction. For example:
//        add i32 1, 2
//        becomes
//        i32 3
//        NOTE: this pass has a habit of making definitions be dead. It is a good idea to run a Dead Instruction Elimination pass sometime after running this pass.
//LLVM Pass

// TODO : SCCP

class ConstantAndCopyPropagator extends Pass {
    ConstantAndCopyPropagator(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        irRoot.getFunctionMap().values().forEach(function -> {
            calcDefUseChain(function);
            constantAndCopyPropagation(function);
        });
        return changed;
    }

    private void constantAndCopyPropagation(Function function) {
        LinkedList<IRInstruction> workList = getAllStatements(function);
        Set<IRInstruction> inQueue = new HashSet<>(workList);
        while (!workList.isEmpty()) {
            IRInstruction S = workList.poll();
            inQueue.remove(S);
            if (S instanceof Phi) {
                Operand val = ((Phi) S).getPaths().values().iterator().next();
                if (val instanceof Immediate) {
                    int c = ((Immediate) val).getImmediate();
                    if (((Phi) S).getPaths().values().stream().allMatch(x -> (x == null) || (x instanceof Immediate && ((Immediate) x).getImmediate() == c)))
                        substituteOperand(workList, inQueue, S, ((Phi) S).getDst(), val);
                }
            } else if (S instanceof Move) {
                if (((Move) S).getSrc() instanceof Immediate || ((Move) S).getSrc() instanceof VirtualRegister) {
                    substituteOperand(workList, inQueue, S, ((Move) S).getDst(), ((Move) S).getSrc());
                }
            } else if (S instanceof Binary) {
                Binary inst = (Binary) S;
                if (inst.getSrc1() instanceof Immediate && inst.getSrc2() instanceof Immediate) {
                    changed = true;
                    int src1 = ((Immediate) inst.getSrc1()).getImmediate(), src2 = ((Immediate) inst.getSrc2()).getImmediate(), res;
                    switch (inst.getOp()) {
                        case ADD:
                            res = src1 + src2;
                            break;
                        case SUB:
                            res = src1 - src2;
                            break;
                        case MUL:
                            res = src1 * src2;
                            break;
                        case OR:
                            res = src1 | src2;
                            break;
                        case AND:
                            res = src1 & src2;
                            break;
                        case XOR:
                            res = src1 ^ src2;
                            break;
                        case DIV:
                            res = src2 == 0 ? 0 : src1 / src2;
                            break;
                        case MOD:
                            res = src2 == 0 ? 0 : src1 % src2;
                            break;
                        case SHL:
                            res = src1 << src2;
                            break;
                        case SHR:
                            res = src1 >> src2;
                            break;
                        default:
                            throw new RuntimeException();
                    }
                    Move newMove = new Move(inst.getCurrentBB(), new Immediate(res), inst.getDst());
                    S.replaceInstruction(newMove);
                    workList.add(newMove);
                    inQueue.add(newMove);
                }
            } else if (S instanceof Unary) {
                Unary inst = (Unary) S;
                if (inst.getSrc() instanceof Immediate) {
                    changed = true;
                    int src = ((Immediate) inst.getSrc()).getImmediate(), res;
                    switch (inst.getOp()) {
                        case DEC:
                            res = src - 1;
                            break;
                        case INC:
                            res = src + 1;
                            break;
                        case NOT:
                            res = ~src;
                            break;
                        case NEG:
                            res = -src;
                            break;
                        case POS:
                            res = src;
                            break;
                        default:
                            throw new RuntimeException();
                    }
                    Move newMove = new Move(inst.getCurrentBB(), new Immediate(res), inst.getDst());
                    S.replaceInstruction(newMove);
                    workList.add(newMove);
                    inQueue.add(newMove);
                }
            } else if (S instanceof Cmp) {
                Cmp inst = (Cmp) S;
                if (inst.getSrc1() instanceof Immediate && inst.getSrc2() instanceof Immediate) {
                    changed = true;
                    int src1 = ((Immediate) inst.getSrc1()).getImmediate(), src2 = ((Immediate) inst.getSrc2()).getImmediate(), res;
                    switch (inst.getOp()) {
                        case LT:
                            res = src1 < src2 ? 1 : 0;
                            break;
                        case EQ:
                            res = src1 == src2 ? 1 : 0;
                            break;
                        case GT:
                            res = src1 > src2 ? 1 : 0;
                            break;
                        case GEQ:
                            res = src1 >= src2 ? 1 : 0;
                            break;
                        case LEQ:
                            res = src1 <= src2 ? 1 : 0;
                            break;
                        case NEQ:
                            res = src1 != src2 ? 1 : 0;
                            break;
                        default:
                            throw new RuntimeException();
                    }
                    Move newMove = new Move(inst.getCurrentBB(), new Immediate(res), inst.getDst());
                    S.replaceInstruction(newMove);
                    workList.add(newMove);
                    inQueue.add(newMove);
                }
            } else if (S instanceof Call) {
                Function callee = ((Call) S).getCallee();
                if (!irRoot.stringConstantFunctions.contains(callee)) continue;
                boolean check0 = ((Call) S).getObjectPointer() instanceof GlobalVariable;
                boolean check1 = ((Call) S).getParameterList().size() > 0 && ((Call) S).getParameterList().get(0) instanceof GlobalVariable;
                boolean check2 = ((Call) S).getParameterList().size() > 1 && ((Call) S).getParameterList().get(1) instanceof GlobalVariable;
                GlobalVariable _this = check0 ? (GlobalVariable) ((Call) S).getObjectPointer() : null;
                GlobalVariable lhs = check1 ? (GlobalVariable) ((Call) S).getParameterList().get(0) : null;
                GlobalVariable rhs = check2 ? (GlobalVariable) ((Call) S).getParameterList().get(1) : null;
                if (callee == irRoot.builtinStringAdd) {
                    if (check1 && check2) {
                        changed = true;
                        String res = irRoot.staticStringValMap.get(lhs) + irRoot.staticStringValMap.get(rhs);
                        StaticString staticString = new StaticString(new GlobalI64Value("__str_const", true), res);
                        irRoot.addStaticString(staticString);
                        S.replaceInstruction(new Move(S.getCurrentBB(), staticString.getBase(), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringLT) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) < 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringLEQ) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) <= 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringEQ) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) == 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringGEQ) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) >= 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringGT) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) > 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringNEQ) {
                    if (check1 && check2) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(lhs).compareTo(irRoot.staticStringValMap.get(rhs)) != 0 ? 1 : 0;
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinToString) {
                    if (((Call) S).getParameterList().get(0) instanceof Immediate) {
                        changed = true;
                        int res = ((Immediate) ((Call) S).getParameterList().get(0)).getImmediate();
                        StaticString staticString = new StaticString(new GlobalI64Value("__str_const", true), String.valueOf(res));
                        irRoot.addStaticString(staticString);
                        S.replaceInstruction(new Move(S.getCurrentBB(), staticString.getBase(), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinStringLength) {
                    if (check0) {
                        changed = true;
                        int res = irRoot.staticStringValMap.get(_this).length();
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinSubstring) {
                    if (check0) {
                        if (((Call) S).getParameterList().get(0) instanceof Immediate && ((Call) S).getParameterList().get(1) instanceof Immediate) {
                            changed = true;
                            int left = ((Immediate) ((Call) S).getParameterList().get(0)).getImmediate();
                            int right = ((Immediate) ((Call) S).getParameterList().get(1)).getImmediate();
                            String res = irRoot.staticStringValMap.get(_this).substring(left, right);
                            StaticString staticString = new StaticString(new GlobalI64Value("__str__const", true), res);
                            irRoot.addStaticString(staticString);
                            S.replaceInstruction(new Move(S.getCurrentBB(), staticString.getBase(), ((Call) S).getResult()));
                        }
                    }
                } else if (callee == irRoot.builtinParseInt) {
                    if (check0) {
                        changed = true;
                        String str = irRoot.staticStringValMap.get(_this);
                        char[] charArray = str.toCharArray();
                        int res = 0;
                        for (char ch : charArray) {
                            if (ch < '0' || ch > '9') break;
                            res = res * 10 + ch - '0';
                        }
                        S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                    }
                } else if (callee == irRoot.builtinOrd) {
                    if (check0) {
                        if (((Call) S).getParameterList().get(0) instanceof Immediate) {
                            int pos = ((Immediate) ((Call) S).getParameterList().get(0)).getImmediate();
                            if (pos < irRoot.staticStringValMap.get(_this).length()) {
                                changed = true;
                                int res = (int) irRoot.staticStringValMap.get(_this).charAt(pos);
                                S.replaceInstruction(new Move(S.getCurrentBB(), new Immediate(res), ((Call) S).getResult()));
                            }
                        }
                    }
                }
            }
        }
    }

    private void substituteOperand(LinkedList<IRInstruction> workList, Set<IRInstruction> inQueue, IRInstruction irInstruction, Operand oldOperand, Operand newOperand) {
        if (newOperand instanceof Immediate) {
            Set<IRInstruction> oldUses = use.get(oldOperand);
            for (IRInstruction user : oldUses)
                if (user != irInstruction) {
                    changed = true;
                    user.replaceUseRegister(oldOperand, newOperand);
                    if (!inQueue.contains(user)) {
                        workList.add(user);
                        inQueue.add(user);
                    }
                }
            oldUses.clear();
            irInstruction.removeSelf();
        } else if (newOperand instanceof VirtualRegister) {
            Set<IRInstruction> oldUses = use.get(oldOperand);
            Set<IRInstruction> newUses = use.get(newOperand);
            for (IRInstruction user : oldUses)
                if (user != irInstruction) {
                    changed = true;
                    user.replaceUseRegister(oldOperand, newOperand);
                    newUses.add(user);
                    if (!inQueue.contains(user)) {
                        workList.add(user);
                        inQueue.add(user);
                    }
                }
            oldUses.clear();
            newUses.remove(irInstruction);
            irInstruction.removeSelf();
        }
    }
}

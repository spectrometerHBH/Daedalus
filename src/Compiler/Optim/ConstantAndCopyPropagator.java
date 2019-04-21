package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.VirtualRegister;

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
    void run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            calcDefUseChain(function);
            constantAndCopyPropagation(function);
        });
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
                if (((Move) S).getSrc() instanceof Immediate || ((Move) S).getSrc() instanceof VirtualRegister)
                    substituteOperand(workList, inQueue, S, ((Move) S).getDst(), ((Move) S).getSrc());
            } else if (S instanceof Binary) {
                Binary inst = (Binary) S;
                if (inst.getSrc1() instanceof Immediate && inst.getSrc2() instanceof Immediate) {
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
            }
        }
    }

    private void substituteOperand(LinkedList<IRInstruction> workList, Set<IRInstruction> inQueue, IRInstruction irInstruction, Operand oldOperand, Operand newOperand) {
        if (newOperand instanceof Immediate) {
            Set<IRInstruction> oldUses = use.get(oldOperand);
            for (IRInstruction user : oldUses)
                if (user != irInstruction) {
                    user.replaceOperand(oldOperand, newOperand);
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
                    user.replaceOperand(oldOperand, newOperand);
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

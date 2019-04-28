package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

//Combine expression patterns
//        Combine expression patterns to form expressions with fewer, simple instructions. This pass does not modify the CFG.
//        For example, this pass reduce width of expressions post-dominated by TruncInst into smaller width when applicable.
//        It differs from instcombine pass in that it contains pattern optimization that requires higher complexity than the O(1), thus, it should run fewer times than instcombine pass.
//LLVM Pass

// TODO : algebraic simplification

class InstructionCombiner extends Pass {
    InstructionCombiner(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    void run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            calcDefUseChain(function);
            //generate Lea for single-used temporary if possible
            generateLea(function);
            //merge address calculation for single-used temporary into Load/Store
            mergeAddrCalcWithLoadAndStore(function);
            //merge cmp with branch for code generation
            mergeCmpWithBranch(function);
        });
    }

    private boolean checkOperandToCombine(Operand operand) {
        if (operand instanceof Register) {
            if (use.get(operand).size() > 1) return false;
            IRInstruction defInst = def.get(operand);
            if (defInst instanceof Binary) {
                switch (((Binary) defInst).getOp()) {
                    case ADD:
                    case SUB:
                    case MUL:
                        return true;
                    default:
                        return false;
                }
            } else return defInst instanceof Lea;
        } else return false;
    }

    private void generateLea(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                if (irInstruction instanceof Binary) {
                    Binary inst = (Binary) irInstruction;
                    switch (inst.getOp()) {
                        case ADD:
                        case SUB:
                        case MUL: {
                            IRInstruction resultInst = null, combineInst = null;
                            if (checkOperandToCombine(inst.getSrc1())) combineInst = def.get(inst.getSrc1());
                            else if (checkOperandToCombine(inst.getSrc2())) combineInst = def.get(inst.getSrc2());
                            if (combineInst != null) {
                                resultInst = ((Binary) irInstruction).combine(combineInst);
                                if (resultInst != null) {
                                    for (Register useRegister : combineInst.getUseRegisters())
                                        use.get(useRegister).remove(combineInst);
                                    combineInst.removeSelf();
                                    for (Register useRegister : irInstruction.getUseRegisters())
                                        use.get(useRegister).remove(irInstruction);
                                    irInstruction.replaceInstruction(resultInst);
                                    def.remove(combineInst.getDefRegister());
                                    for (Register useRegister : resultInst.getUseRegisters())
                                        use.get(useRegister).add(resultInst);
                                    def.put(resultInst.getDefRegister(), resultInst);
                                }
                            }
                            break;
                        }
                        default:
                    }
                }
            }
        });
    }

    private void mergeAddrCalcWithLoadAndStore(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                if (irInstruction instanceof Load) {
                    if (((Load) irInstruction).getSrc() instanceof VirtualRegister) {
                        VirtualRegister addr = (VirtualRegister) ((Load) irInstruction).getSrc();
                        if (use.get(addr).size() == 1) {
                            IRInstruction defOfAddr_tmp = def.get(addr);
                            Lea defOfAddr = null;
                            if (defOfAddr_tmp instanceof Lea) defOfAddr = (Lea) defOfAddr_tmp;
                            else if (defOfAddr_tmp instanceof Binary)
                                defOfAddr = ((Binary) defOfAddr_tmp).transformBinary2Lea((Binary) defOfAddr_tmp);
                            if (defOfAddr != null) {
                                defOfAddr_tmp.removeSelf();
                                for (Register useRegister : defOfAddr_tmp.getUseRegisters()) {
                                    use.get(useRegister).remove(defOfAddr_tmp);
                                    use.get(useRegister).add(irInstruction);
                                }
                                def.remove(addr);
                                irInstruction.replaceUseRegister(addr, defOfAddr.getSrc());
                            }
                        }
                    }
                    if (((Load) irInstruction).getSrc() instanceof VirtualRegister)
                        irInstruction.replaceUseRegister(((Load) irInstruction).getSrc(), new DynamicData(((Register) ((Load) irInstruction).getSrc()), null, new Immediate(0), new Immediate(0)));
                } else if (irInstruction instanceof Store) {
                    if (((Store) irInstruction).getDst() instanceof VirtualRegister) {
                        VirtualRegister addr = (VirtualRegister) ((Store) irInstruction).getDst();
                        if (use.get(addr).size() == 1) {
                            IRInstruction defOfAddr_tmp = def.get(addr);
                            Lea defOfAddr = null;
                            if (defOfAddr_tmp instanceof Lea) defOfAddr = (Lea) defOfAddr_tmp;
                            else if (defOfAddr_tmp instanceof Binary)
                                defOfAddr = ((Binary) defOfAddr_tmp).transformBinary2Lea((Binary) defOfAddr_tmp);
                            if (defOfAddr != null) {
                                defOfAddr_tmp.removeSelf();
                                for (Register useRegister : defOfAddr_tmp.getUseRegisters()) {
                                    use.get(useRegister).remove(defOfAddr_tmp);
                                    use.get(useRegister).add(irInstruction);
                                }
                                def.remove(addr);
                                irInstruction.replaceUseRegister(addr, defOfAddr.getSrc());
                            }
                        }
                    }
                    if (((Store) irInstruction).getDst() instanceof VirtualRegister) {
                        irInstruction.replaceUseRegister(((Store) irInstruction).getDst(), new DynamicData((Register) (((Store) irInstruction).getDst()), null, new Immediate(0), new Immediate(0)));
                    }
                }
        });
    }

    private void mergeCmpWithBranch(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            if (basicBlock.tail instanceof Branch) {
                if (((Branch) basicBlock.tail).getCond() instanceof VirtualRegister) {
                    VirtualRegister cond = (VirtualRegister) ((Branch) basicBlock.tail).getCond();
                    if (def.get(cond) instanceof Cmp) {
                        Cmp defOfCond = (Cmp) def.get(cond);
                        defOfCond.setDefRegister(null);
                        ((Branch) basicBlock.tail).defOfCond = defOfCond;
                        ((Branch) basicBlock.tail).setCond(null);
                    } else {
                        IRInstruction defOfCond = def.get(cond);
                        Cmp newCmp = new Cmp(basicBlock, Cmp.Op.EQ, cond, new Immediate(1), null);
                        basicBlock.tail.prependInstruction(newCmp);
                        ((Branch) basicBlock.tail).defOfCond = newCmp;
                        ((Branch) basicBlock.tail).setCond(null);
                    }
                }
            }
        });
    }
}

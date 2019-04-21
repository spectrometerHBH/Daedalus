package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Lea;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

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
            generateLea(function);
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
}

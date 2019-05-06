package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Operand.VirtualRegister;

class SpillInstructor extends Pass {
    SpillInstructor(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            calcLoopInformation(function);
            markSpillPriority(function);
        });
        return false;
    }

    private void markSpillPriority(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            int loopLevel = belongingLoopHeaders.get(basicBlock) == null ? 0 : belongingLoopHeaders.get(basicBlock).size();
            int loopContribution = (int) Math.pow(10, loopLevel);
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                irInstruction.calcUseAndDef();
                for (VirtualRegister def : irInstruction.getDef())
                    def.spillPriority += loopContribution;
                for (VirtualRegister use : irInstruction.getUse())
                    use.spillPriority += loopContribution;
            }
        });
    }
}

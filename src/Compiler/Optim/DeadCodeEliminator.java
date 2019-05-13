package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.Register;

import java.util.HashSet;
import java.util.Set;

//Dead Code Elimination
//          Dead instruction elimination performs a single pass over the function, removing instructions that are obviously dead.
//          Dead code elimination is similar to dead instruction elimination, but it rechecks instructions that were used by removed instructions to see if they are newly dead.
//LLVM Pass

class DeadCodeEliminator extends Pass {
    private Set<IRInstruction> markSet = new HashSet<>();

    DeadCodeEliminator(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        irRoot.getFunctionMap().values().forEach(function -> {
            calcDefUseChain(function);
            computePostDominateTree(function);
            computeReverseDominantFrontier(function);
            aggressiveDeadCodeElimination(function);
        });
        return changed;
    }

    private void aggressiveDeadCodeElimination(Function function) {
        mark(function);
        sweep(function);
    }

    private boolean isCritical(IRInstruction irInstruction) {
        return !(irInstruction instanceof Binary || irInstruction instanceof Cmp || irInstruction instanceof Unary
                || irInstruction instanceof Branch || irInstruction instanceof Move || irInstruction instanceof Phi || irInstruction instanceof Jump);
    }

    private void mark(Function function) {
        Set<IRInstruction> workList = new HashSet<>();
        markSet.clear();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                if (isCritical(irInstruction)) {
                    markSet.add(irInstruction);
                    workList.add(irInstruction);
                }
            }
        });
        while (!workList.isEmpty()) {
            IRInstruction inst = workList.iterator().next();
            workList.remove(inst);
            if (inst == null) {
                System.err.println("ha?");
            }
            for (Register use : inst.getUseRegisters()) {
                IRInstruction defOfUse = def.get(use);
                if (defOfUse != null)
                    if (!markSet.contains(defOfUse)) {
                        markSet.add(defOfUse);
                        workList.add(defOfUse);
                    }
            }
            for (BasicBlock b : inst.getCurrentBB().RDF) {
                IRInstruction j = b.tail;
                if (!markSet.contains(j)) {
                    markSet.add(j);
                    workList.add(j);
                }
            }
        }
    }

    private void sweep(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                if (!markSet.contains(irInstruction)) {
                    if (irInstruction instanceof Branch) {
                        changed = true;
                        irInstruction.getCurrentBB().removeInst();
                        irInstruction.getCurrentBB().terminate(new Jump(basicBlock, basicBlock.postIDOM));
                    } else if (!(irInstruction instanceof Jump)) {
                        changed = true;
                        irInstruction.removeSelf();
                    }
                }
            }
        });
    }
}

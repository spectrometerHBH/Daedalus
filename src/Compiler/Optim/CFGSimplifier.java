package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Branch;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Jump;
import Compiler.IR.Instruction.Phi;
import Compiler.IR.Operand.Immediate;

import java.util.LinkedList;
import java.util.List;

//Simplify the CFG
//        Performs dead code elimination and basic block merging. Specifically:
//        Removes basic blocks with no predecessors.(ok)
//        Merges a basic block into its predecessor if there is only one and the predecessor only has one successor.(ok)
//        Eliminates PHI nodes for basic blocks with a single predecessor.(ok)
//        TODO : Eliminates a basic block that only contains an unconditional branch.
//LLVM Pass

class CFGSimplifier extends Pass {
    CFGSimplifier(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    void run() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            convertClearBranch(function);
            removeUnreachableBB(function);
            mergeBB(function);
        });
    }

    void runMore() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            convertClearBranch(function);
            eliminateSingleBranchBB(function);
            removeUnreachableBB(function);
            mergeBB(function);
        });
    }

    private void convertClearBranch(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            if (basicBlock.tail instanceof Branch) {
                Branch branch = (Branch) basicBlock.tail;
                if (branch.getThenBB() == branch.getElseBB()) {
                    branch.replaceInstruction(new Jump(basicBlock, branch.getThenBB()));
                } else if (branch.getCond() instanceof Immediate) {
                    int cond = ((Immediate) branch.getCond()).getImmediate();
                    BasicBlock target = cond == 1 ? branch.getThenBB() : branch.getElseBB();
                    BasicBlock cut = cond == 1 ? branch.getElseBB() : branch.getThenBB();
                    branch.replaceInstruction(new Jump(basicBlock, target));
                    for (IRInstruction irInstruction = cut.head; irInstruction instanceof Phi; irInstruction = irInstruction.getNextInstruction())
                        ((Phi) irInstruction).removePath(basicBlock);
                    basicBlock.getSuccessors().remove(cut);
                    cut.getPredecessors().remove(basicBlock);
                }
            }
        });
        function.recalcReversePostOrderDFSBBList();
    }

    private void removeUnreachableBB(Function function) {
        //RPO remove orphan
        List<BasicBlock> removeList = new LinkedList<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> basicBlock.getPredecessors().forEach(predecessor -> {
            if (!function.reachable(predecessor)) removeList.add(predecessor);
        }));
        removeList.forEach(BasicBlock::removeSelf);
        function.recalcReversePostOrderDFSBBList();
    }

    private void mergeBB(Function function) {
        //PO merge BB
        for (int i = function.getReversePostOrderDFSBBList().size() - 1; i >= 0; i--) {
            BasicBlock basicBlock = function.getReversePostOrderDFSBBList().get(i);
            if (basicBlock.getSuccessors().size() == 1) {
                BasicBlock successor = basicBlock.getSuccessors().iterator().next();
                if (successor != function.getEntryBlock() && successor.getPredecessors().size() == 1) {
                    successor.mergeBB(basicBlock);
                }
            }
        }
        function.recalcReversePostOrderDFSBBList();
    }

    private void eliminateSingleBranchBB(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            if (basicBlock.head == basicBlock.tail && basicBlock.head instanceof Jump) {
                BasicBlock targetBB = ((Jump) basicBlock.head).getTargetBB();
                targetBB.getPredecessors().remove(basicBlock);
                for (BasicBlock predecessor : basicBlock.getPredecessors()) {
                    predecessor.getSuccessors().remove(basicBlock);
                    predecessor.getSuccessors().add(targetBB);
                    targetBB.getPredecessors().add(predecessor);
                    if (predecessor.tail instanceof Jump) {
                        ((Jump) predecessor.tail).setTargetBB(targetBB);
                    } else if (predecessor.tail instanceof Branch) {
                        ((Branch) predecessor.tail).replaceTarget(basicBlock, targetBB);
                    }
                }
            }
        });
    }
}

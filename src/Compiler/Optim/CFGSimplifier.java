package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;

import java.util.LinkedList;
import java.util.List;

//Simplify the CFG
//        Performs dead code elimination and basic block merging. Specifically:
//        Removes basic blocks with no predecessors.(ok)
//        Merges a basic block into its predecessor if there is only one and the predecessor only has one successor.(ok)
//        Eliminates PHI nodes for basic blocks with a single predecessor.(ok)
//        Eliminates a basic block that only contains an unconditional branch.
//LLVM Pass

class CFGSimplifier extends Pass {
    CFGSimplifier(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    void run() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            convertClearBranch(function);
            RemoveUnreachableBB(function);
            mergeBB(function);
        });
    }

    private void convertClearBranch(Function function) {

    }

    private void RemoveUnreachableBB(Function function) {
        //RPO remove orphan
        List<BasicBlock> removeList = new LinkedList<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            basicBlock.getPredecessors().forEach(predecessor -> {
                if (!function.reachable(predecessor)) removeList.add(predecessor);
            });
        });
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
}

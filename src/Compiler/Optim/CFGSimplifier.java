package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;

import java.util.Map;

//Simplify the CFG
//        Performs dead code elimination and basic block merging. Specifically:
//        Removes basic blocks with no predecessors.
//        Merges a basic block into its predecessor if there is only one and the predecessor only has one successor.
//        Eliminates PHI nodes for basic blocks with a single predecessor.
//        Eliminates a basic block that only contains an unconditional branch.
//LLVM Pass

class CFGSimplifier extends Pass {
    CFGSimplifier(IRRoot irRoot) {
        super(irRoot);
    }

    void run() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            RemoveDeadBB(function);
            mergeBB(function);
        });
    }

    private void RemoveDeadBB(Function function) {

    }

    private void mergeBB(Function function) {

    }
}

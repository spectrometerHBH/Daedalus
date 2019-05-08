package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;

//This pass performs loop invariant code motion, attempting to remove as much code from the body of a loop as possible.
// It does this by either hoisting code into the preheader block, or by sinking code to the exit blocks if it is safe. ]
// This pass also promotes must-aliased memory locations in the loop to live in registers, thus hoisting and sinking invariant loads and stores.
//LLVM Pass
//TODO

public class LoopInvariantCodeMover extends Pass {
    public LoopInvariantCodeMover(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        irRoot.getFunctionMap().values().forEach(function -> {
            calcLoopInformation(function);
            insertPreheader(function);
        });
        return changed;
    }

    private void insertPreheader(Function function) {

    }
}

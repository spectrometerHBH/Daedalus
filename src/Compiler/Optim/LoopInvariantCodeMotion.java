package Compiler.Optim;

import Compiler.IR.IRRoot;

//This pass performs loop invariant code motion, attempting to remove as much code from the body of a loop as possible.
// It does this by either hoisting code into the preheader block, or by sinking code to the exit blocks if it is safe. ]
// This pass also promotes must-aliased memory locations in the loop to live in registers, thus hoisting and sinking “invariant” loads and stores.
//LLVM Pass
//TODO

public class LoopInvariantCodeMotion extends Pass {
    public LoopInvariantCodeMotion(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    void run() {

    }
}

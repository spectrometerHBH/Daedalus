package Compiler.Optim;

import Compiler.IR.IRRoot;

//This pass transforms loops that contain branches on loop-invariant conditions to have multiple loops. For example, it turns the left into the right code:
//
//for (...)                  if (lic)
//    A                          for (...)
//    if (lic)                       A; B; C
//        B                  else
//    C                          for (...)
//                                   A; C
//This can increase the size of the code exponentially (doubling it every time a loop is unswitched) so we only unswitch if the resultant code will be smaller than a threshold.
//
//This pass expects LICM to be run before it to hoist invariant conditions out of the loop, to make the unswitching opportunity obvious.
//LLVM Pass
//TODO

public class LoopUnswitching extends Pass {
    public LoopUnswitching(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        return changed;
    }
}

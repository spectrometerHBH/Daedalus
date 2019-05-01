package Compiler.Backend;

//-inline: Function Integration/Inlining
//Bottom-up inlining of functions into callees.
//LLVM Pass
//TODO

import Compiler.IR.IRRoot;

public class FunctionInliner {
    private IRRoot irRoot;

    public FunctionInliner(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {

    }
}

package Compiler.Optim;

import Compiler.IR.IRRoot;

public class Pass {
    protected IRRoot irRoot;

    public Pass(IRRoot irRoot) {
        this.irRoot = irRoot;
    }
}

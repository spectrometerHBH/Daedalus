package Compiler.Optim;

import Compiler.IR.IRRoot;

public class Optimizer {
    private IRRoot irRoot;
    private SSAConstructor ssaConstructor;
    private SSADestructor ssaDestructor;
    private CFGSimplifier cfgSimplifier;
    private DeadCodeEliminator deadCodeEliminater;

    public Optimizer(IRRoot irRoot) {
        this.irRoot = irRoot;
        ssaConstructor = new SSAConstructor(irRoot);
        ssaDestructor = new SSADestructor(irRoot);
        cfgSimplifier = new CFGSimplifier(irRoot);
        deadCodeEliminater = new DeadCodeEliminator(irRoot);
    }

    public void simplifyCFG() {
        cfgSimplifier.run();
    }

    public void SSAConstruction() throws Exception {
        ssaConstructor.run();
    }

    public void SSADestruction() {
        ssaDestructor.run();
    }

    public void DeadCodeElimination() {
        deadCodeEliminater.run();
    }
}

package Compiler.Optim;

import Compiler.IR.IRRoot;

public class Optimizer {
    private SSAConstructor ssaConstructor;
    private SSADestructor ssaDestructor;
    private CFGSimplifier cfgSimplifier;
    private DeadCodeEliminator deadCodeEliminator;
    private ConstantAndCopyPropagator constantAndCopyPropagator;
    private InstructionCombiner instructionCombiner;

    public Optimizer(IRRoot irRoot) {
        ssaConstructor = new SSAConstructor(irRoot);
        ssaDestructor = new SSADestructor(irRoot);
        cfgSimplifier = new CFGSimplifier(irRoot);
        deadCodeEliminator = new DeadCodeEliminator(irRoot);
        constantAndCopyPropagator = new ConstantAndCopyPropagator(irRoot);
        instructionCombiner = new InstructionCombiner(irRoot);
    }

    public void simplifyCFG() {
        cfgSimplifier.run();
    }

    public void SSAConstruction() {
        ssaConstructor.run();
    }

    public void SSADestruction() {
        ssaDestructor.run();
    }

    public void DeadCodeElimination() {
        deadCodeEliminator.run();
    }

    public void ConstantAndCopyPropagation() {
        constantAndCopyPropagator.run();
    }

    public void InstructionCombination() {
        instructionCombiner.run();
    }
}

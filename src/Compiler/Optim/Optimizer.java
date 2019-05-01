package Compiler.Optim;

import Compiler.IR.IRRoot;

public class Optimizer {
    private SSAConstructor ssaConstructor;
    private SSADestructor ssaDestructor;
    private CFGSimplifier cfgSimplifier;
    private DeadCodeEliminator deadCodeEliminator;
    private ConstantAndCopyPropagator constantAndCopyPropagator;
    private InstructionCombiner instructionCombiner;
    private CommonSubexpressionEliminator commonSubexpressionEliminator;

    public Optimizer(IRRoot irRoot) {
        ssaConstructor = new SSAConstructor(irRoot);
        ssaDestructor = new SSADestructor(irRoot);
        cfgSimplifier = new CFGSimplifier(irRoot);
        deadCodeEliminator = new DeadCodeEliminator(irRoot);
        constantAndCopyPropagator = new ConstantAndCopyPropagator(irRoot);
        instructionCombiner = new InstructionCombiner(irRoot);
        commonSubexpressionEliminator = new CommonSubexpressionEliminator(irRoot);
    }

    public boolean simplifyCFG() {
        return cfgSimplifier.run();
    }

    public boolean simplifyCFG(boolean eliminateOK) {
        return cfgSimplifier.runMore();
    }

    public boolean SSAConstruction() {
        return ssaConstructor.run();
    }

    public boolean SSADestruction() {
        return ssaDestructor.run();
    }

    public boolean DeadCodeElimination() {
        return deadCodeEliminator.run();
    }

    public boolean ConstantAndCopyPropagation() {
        return constantAndCopyPropagator.run();
    }

    public boolean InstructionCombination() {
        return instructionCombiner.run();
    }

    public boolean CommonSubexpressionElimination() {
        return commonSubexpressionEliminator.run();
    }
}

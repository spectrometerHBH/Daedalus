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
    private SpillInstructor spillInstructor;
    private DivisionModularTransformer divisionModularTransformer;
    private LoopInvariantCodeMover loopInvariantCodeMover;

    public Optimizer(IRRoot irRoot) {
        ssaConstructor = new SSAConstructor(irRoot);
        ssaDestructor = new SSADestructor(irRoot);
        cfgSimplifier = new CFGSimplifier(irRoot);
        deadCodeEliminator = new DeadCodeEliminator(irRoot);
        constantAndCopyPropagator = new ConstantAndCopyPropagator(irRoot);
        instructionCombiner = new InstructionCombiner(irRoot);
        commonSubexpressionEliminator = new CommonSubexpressionEliminator(irRoot);
        spillInstructor = new SpillInstructor(irRoot);
        divisionModularTransformer = new DivisionModularTransformer(irRoot);
    }

    public boolean SimplifyCFG() {
        return cfgSimplifier.run();
    }

    public void SimplifyCFG(boolean eliminateOK) {
        cfgSimplifier.runMore();
    }

    public void SSAConstruction() {
        ssaConstructor.run();
    }

    public void SSADestruction() {
        ssaDestructor.run();
    }

    public boolean DeadCodeElimination() {
        return deadCodeEliminator.run();
    }

    public boolean ConstantAndCopyPropagation() {
        return constantAndCopyPropagator.run();
    }

    public void InstructionCombination() {
        instructionCombiner.run();
    }

    public boolean CommonSubexpressionElimination() {
        return commonSubexpressionEliminator.run();
    }

    public void SpillPriorityCalculation() {
        spillInstructor.run();
    }

    public void DivisionModularTransformation() {
        divisionModularTransformer.run();
    }

    public boolean LoopInvariantCodeMotion() {
        return loopInvariantCodeMover.run();
    }
}

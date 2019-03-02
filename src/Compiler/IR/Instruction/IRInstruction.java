package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;

public abstract class IRInstruction {
    private BasicBlock currentBB;
    private IRInstruction lastInstruction;
    private IRInstruction nextInstruction;

    public IRInstruction(BasicBlock currentBB) {
        this.currentBB = currentBB;
    }

    public BasicBlock getCurrentBB() {
        return currentBB;
    }

    public IRInstruction getLastInstruction() {
        return lastInstruction;
    }

    public void setLastInstruction(IRInstruction lastInstruction) {
        this.lastInstruction = lastInstruction;
    }

    public IRInstruction getNextInstruction() {
        return nextInstruction;
    }

    public void setNextInstruction(IRInstruction nextInstruction) {
        this.nextInstruction = nextInstruction;
    }

    public abstract void accept(IRVisitor irVisitor);
}

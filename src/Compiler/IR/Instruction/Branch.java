package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Branch extends IRInstruction {
    private BasicBlock thenBB;
    private BasicBlock elseBB;

    public Branch(BasicBlock currentBB, BasicBlock thenBB, BasicBlock elseBB) {
        super(currentBB);
        this.thenBB = thenBB;
        this.elseBB = elseBB;
    }

    public BasicBlock getThenBB() {
        return thenBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }
}

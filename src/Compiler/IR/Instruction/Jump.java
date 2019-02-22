package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Jump extends IRInstruction {
    private BasicBlock targetBB;

    public Jump(BasicBlock currentBB, BasicBlock targetBB) {
        super(currentBB);
        this.targetBB = targetBB;
    }

    public BasicBlock getTargetBB() {
        return targetBB;
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;

public class Jump extends IRInstruction {
    private BasicBlock targetBB;

    public Jump(BasicBlock currentBB, BasicBlock targetBB) {
        super(currentBB);
        this.targetBB = targetBB;
    }

    public BasicBlock getTargetBB() {
        return targetBB;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

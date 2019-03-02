package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;

public class Pop extends IRInstruction {
    public Pop(BasicBlock currentBB) {
        super(currentBB);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

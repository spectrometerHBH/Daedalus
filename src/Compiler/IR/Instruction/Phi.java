package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;

public class Phi extends IRInstruction{
    public Phi(BasicBlock currentBB) {
        super(currentBB);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class Immediate extends Operand {
    private int immediate;

    public Immediate(int immediate) {
        this.immediate = immediate;
    }

    public int getImmediate() {
        return immediate;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

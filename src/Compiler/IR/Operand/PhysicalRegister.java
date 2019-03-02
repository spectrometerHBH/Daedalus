package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class PhysicalRegister extends Register {
    public PhysicalRegister() {
    }

    public PhysicalRegister(String name) {
        super(name);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class I64Value extends Value {
    public I64Value() {
    }

    public I64Value(String name) {
        super(name);
    }

    public I64Value(String name, PhysicalRegister color) {
        super(name);
        this.color = color;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

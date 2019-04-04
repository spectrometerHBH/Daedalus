package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class GlobalI64Value extends Value implements GlobalVariable {
    public GlobalI64Value() {
    }

    public GlobalI64Value(String name) {
        super(name);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

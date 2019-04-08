package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class GlobalI64Value extends Value implements GlobalVariable {
    private boolean isString = false;

    public GlobalI64Value(String name) {
        super(name);
    }

    public GlobalI64Value(String name, boolean isString) {
        super(name);
        this.isString = isString;
    }

    public boolean isString() {
        return isString;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

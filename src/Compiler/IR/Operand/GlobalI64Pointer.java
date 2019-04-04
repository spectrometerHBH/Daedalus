package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class GlobalI64Pointer extends Pointer implements GlobalVariable {
    public GlobalI64Pointer() {
    }

    public GlobalI64Pointer(String name) {
        super(name);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

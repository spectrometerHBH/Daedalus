package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class I64Pointer extends Pointer{
    public I64Pointer() {
    }

    public I64Pointer(String name) {
        super(name);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

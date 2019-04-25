package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class DynamicData extends Memory {
    public DynamicData(Register base, Register index, Immediate scale, Immediate offset) {
        super(base, index, scale, offset);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

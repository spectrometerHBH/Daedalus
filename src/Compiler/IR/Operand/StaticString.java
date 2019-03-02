package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public class StaticString extends StaticData {
    private String val;

    public StaticString(VirtualRegister pointer, String val) {
        super(pointer);
        this.val = val;
    }

    public String getVal() {
        return val;
    }

    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

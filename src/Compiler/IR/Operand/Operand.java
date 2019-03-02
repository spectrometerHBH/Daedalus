package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

public abstract class Operand {
    String name;

    public Operand() {

    }

    public Operand(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public abstract void accept(IRVisitor irVisitor);
}

package Compiler.IR.Operand;

public abstract class Register extends Storage {
    public Register() {
    }

    public Register(String name) {
        super(name);
    }
}

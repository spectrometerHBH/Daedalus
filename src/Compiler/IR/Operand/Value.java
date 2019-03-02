package Compiler.IR.Operand;

public abstract class Value extends VirtualRegister {
    public Value() {
    }

    public Value(String name) {
        super(name);
    }
}

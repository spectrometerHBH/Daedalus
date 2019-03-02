package Compiler.IR.Operand;

public abstract class VirtualRegister extends Register {
    public VirtualRegister() {
    }

    public VirtualRegister(String name) {
        super(name);
    }
}

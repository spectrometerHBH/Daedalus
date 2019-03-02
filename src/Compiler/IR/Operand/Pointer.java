package Compiler.IR.Operand;

public abstract class Pointer extends VirtualRegister{
    public Pointer() {
    }

    public Pointer(String name) {
        super(name);
    }
}

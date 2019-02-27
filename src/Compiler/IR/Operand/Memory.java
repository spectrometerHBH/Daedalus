package Compiler.IR.Operand;

public abstract class Memory extends Storage {
    private VirtualRegister pointer;

    public Memory(VirtualRegister pointer) {
        this.pointer = pointer;
    }

    public VirtualRegister getPointer() {
        return pointer;
    }

    public void setPointer(VirtualRegister pointer) {
        this.pointer = pointer;
    }
}

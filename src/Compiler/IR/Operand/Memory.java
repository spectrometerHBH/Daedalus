package Compiler.IR.Operand;

public abstract class Memory extends Storage {
    private VirtualRegister pointer;
    private int size;

    public Memory(VirtualRegister pointer, int size) {
        this.pointer = pointer;
        this.size = size;
    }

    public VirtualRegister getPointer() {
        return pointer;
    }

    public void setPointer(VirtualRegister pointer) {
        this.pointer = pointer;
    }
}

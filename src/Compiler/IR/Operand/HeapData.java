package Compiler.IR.Operand;

public class HeapData extends Memory {
    public HeapData(VirtualRegister pointer, int size) {
        super(pointer, size);
    }
}

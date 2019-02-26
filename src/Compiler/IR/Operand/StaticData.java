package Compiler.IR.Operand;

public abstract class StaticData extends Memory {
    public StaticData(VirtualRegister pointer, int size) {
        super(pointer, size);
    }
}

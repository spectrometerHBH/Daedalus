package Compiler.IR.Operand;

public class GlobalVariable extends StaticData{
    public GlobalVariable(VirtualRegister pointer, int size) {
        super(pointer, size);
    }
}

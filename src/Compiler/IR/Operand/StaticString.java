package Compiler.IR.Operand;

public class StaticString extends StaticData {
    private String val;

    public StaticString(VirtualRegister pointer, int size, String val) {
        super(pointer, size);
        this.val = val;
    }
}

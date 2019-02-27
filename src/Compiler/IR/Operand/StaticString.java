package Compiler.IR.Operand;

public class StaticString extends StaticData {
    private String val;

    public StaticString(VirtualRegister pointer, String val) {
        super(pointer);
        this.val = val;
    }
}

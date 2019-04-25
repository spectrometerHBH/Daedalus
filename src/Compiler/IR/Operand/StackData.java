package Compiler.IR.Operand;

public class StackData extends DynamicData {
    public StackData(Register base, Register index, Immediate scale, Immediate offset) {
        super(base, index, scale, offset);
    }
}

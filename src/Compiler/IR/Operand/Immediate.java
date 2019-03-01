package Compiler.IR.Operand;

public class Immediate extends Operand {
    private int immediate;

    public Immediate(int immediate) {
        this.immediate = immediate;
    }

    public int getImmediate() {
        return immediate;
    }
}

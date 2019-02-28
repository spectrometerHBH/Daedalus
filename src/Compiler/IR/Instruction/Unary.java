package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Unary extends IRInstruction {
    public enum Op{
        NOT, NEG, INC, DEC, POS
    }

    private Op op;
    private Oprand Src;
    private Oprand Dst;

    public Unary(BasicBlock currentBB, Op op, Oprand src, Oprand dst) {
        super(currentBB);
        this.op = op;
        Src = src;
        Dst = dst;
    }
}

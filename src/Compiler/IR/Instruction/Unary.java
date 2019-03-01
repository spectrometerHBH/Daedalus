package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Unary extends IRInstruction {
    public enum Op{
        NOT, NEG, INC, DEC, POS
    }

    private Op op;
    private Operand Src;
    private Operand Dst;

    public Unary(BasicBlock currentBB, Op op, Operand src, Operand dst) {
        super(currentBB);
        this.op = op;
        Src = src;
        Dst = dst;
    }
}

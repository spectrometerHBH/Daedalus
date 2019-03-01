package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Cmp extends IRInstruction {
    public enum Op{
        LT, LEQ, EQ, GEQ, GT, NEQ
    }

    private Op op;
    private Operand lhs;
    private Operand rhs;
    private Operand dest;

    public Cmp(BasicBlock currentBB, Op op, Operand lhs, Operand rhs, Operand dest) {
        super(currentBB);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.dest = dest;
    }
}

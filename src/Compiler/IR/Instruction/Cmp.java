package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Cmp extends IRInstruction {
    public enum Op{
        LT, LEQ, EQ, GEQ, GT, NEQ
    }

    private Op op;
    private Oprand lhs;
    private Oprand rhs;
    private Oprand dest;

    public Cmp(BasicBlock currentBB, Op op, Oprand lhs, Oprand rhs, Oprand dest) {
        super(currentBB);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.dest = dest;
    }
}

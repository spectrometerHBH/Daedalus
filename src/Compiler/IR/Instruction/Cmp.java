package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

public class Cmp extends IRInstruction {
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

    public Op getOp() {
        return op;
    }

    public Operand getLhs() {
        return lhs;
    }

    public Operand getRhs() {
        return rhs;
    }

    public Operand getDest() {
        return dest;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    public enum Op {
        LT, LEQ, EQ, GEQ, GT, NEQ
    }
}

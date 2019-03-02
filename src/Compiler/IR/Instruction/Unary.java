package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

public class Unary extends IRInstruction {
    public enum Op{
        NOT, NEG, INC, DEC, POS, NOTL
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

    public Op getOp() {
        return op;
    }

    public Operand getSrc() {
        return Src;
    }

    public Operand getDst() {
        return Dst;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

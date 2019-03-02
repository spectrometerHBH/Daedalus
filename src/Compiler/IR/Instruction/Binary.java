package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

public class Binary extends IRInstruction {
    public enum Op{
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR, ANDL, ORL
    }

    private Op op;
    private Operand src1, src2, dest;

    public Binary(BasicBlock currentBB, Op op, Operand src1, Operand src2, Operand dest) {
        super(currentBB);
        this.op = op;
        this.src1 = src1;
        this.src2 = src2;
        this.dest = dest;
    }

    public Op getOp() {
        return op;
    }

    public Operand getSrc1() {
        return src1;
    }

    public Operand getSrc2() {
        return src2;
    }

    public Operand getDest() {
        return dest;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

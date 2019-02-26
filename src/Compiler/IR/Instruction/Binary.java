package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Binary extends IRInstruction {
    public enum Op{
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }

    private Op op;
    private Oprand src1, src2, dest;

    public Binary(BasicBlock currentBB, Op op, Oprand src1, Oprand src2, Oprand dest) {
        super(currentBB);
        this.op = op;
        this.src1 = src1;
        this.src2 = src2;
        this.dest = dest;
    }
}

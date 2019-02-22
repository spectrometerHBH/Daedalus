package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Unary extends IRInstruction {
    public enum Op{
        NOT, NEG, INC, DEC
    }

    public Unary(BasicBlock currentBB) {
        super(currentBB);
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Binary extends IRInstruction {
    public enum Op{
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }

    public Binary(BasicBlock currentBB) {
        super(currentBB);
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Push extends IRInstruction {
    public Push(BasicBlock currentBB) {
        super(currentBB);
    }
}

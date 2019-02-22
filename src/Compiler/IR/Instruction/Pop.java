package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Pop extends IRInstruction {
    public Pop(BasicBlock currentBB) {
        super(currentBB);
    }
}

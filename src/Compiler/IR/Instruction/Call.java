package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;

public class Call extends IRInstruction {
    public Call(BasicBlock currentBB) {
        super(currentBB);
    }
}

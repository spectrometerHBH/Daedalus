package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Load extends IRInstruction{
    private Operand src;
    private Operand dst;

    public Load(BasicBlock currentBB, Operand src, Operand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
    }
}

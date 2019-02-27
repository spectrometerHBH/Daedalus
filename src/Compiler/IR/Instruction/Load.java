package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Load extends IRInstruction{
    private Oprand src;
    private Oprand dst;

    public Load(BasicBlock currentBB, Oprand src, Oprand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
    }
}

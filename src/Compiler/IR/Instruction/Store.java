package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Store extends IRInstruction {
    private Oprand src;
    private Oprand dst;

    public Store(BasicBlock currentBB, Oprand src, Oprand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
    }
}

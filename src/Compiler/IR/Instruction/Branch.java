package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Branch extends IRInstruction {
    private Operand cond;
    private BasicBlock thenBB;
    private BasicBlock elseBB;

    public Branch(BasicBlock currentBB, Operand cond, BasicBlock thenBB, BasicBlock elseBB) {
        super(currentBB);
        this.cond = cond;
        this.thenBB = thenBB;
        this.elseBB = elseBB;
    }

    public BasicBlock getThenBB() {
        return thenBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Move extends IRInstruction {
    //Load  : src(Memory)   dst(Register)
    //Store : src(Register/Immediate) dst(Memory)
    //Move  : src(Register/Immediate) dst(Register)
    //Memory to Memory is not allowed.
    private Operand srcOperand;
    private Operand dstOperand;

    public Move(BasicBlock currentBB, Operand srcOperand, Operand dstOperand) {
        super(currentBB);
        this.srcOperand = srcOperand;
        this.dstOperand = dstOperand;
    }
}

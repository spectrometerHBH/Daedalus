package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Move extends IRInstruction {
    //Load  : src(Memory)   dst(Register)
    //Store : src(Register/Immediate) dst(Memory)
    //Move  : src(Register/Immediate) dst(Register)
    //Memory to Memory is not allowed.
    private Oprand srcOprand;
    private Oprand dstOprand;

    public Move(BasicBlock currentBB, Oprand srcOprand, Oprand dstOprand) {
        super(currentBB);
        this.srcOprand = srcOprand;
        this.dstOprand = dstOprand;
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;

public class Return extends IRInstruction{
    private Operand returnValue;

    public Return(BasicBlock currentBB, Operand returnValue) {
        super(currentBB);
        this.returnValue = returnValue;
    }

    public Operand getReturnValue() {
        return returnValue;
    }
}

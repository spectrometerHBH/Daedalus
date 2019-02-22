package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

public class Return extends IRInstruction{
    private Oprand returnValue;

    public Return(BasicBlock currentBB, Oprand returnValue) {
        super(currentBB);
        this.returnValue = returnValue;
    }
}

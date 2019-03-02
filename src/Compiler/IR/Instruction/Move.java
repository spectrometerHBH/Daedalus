package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

public class Move extends IRInstruction {
    private Operand srcOperand;
    private Operand dstOperand;

    public Move(BasicBlock currentBB, Operand srcOperand, Operand dstOperand) {
        super(currentBB);
        this.srcOperand = srcOperand;
        this.dstOperand = dstOperand;
    }

    public Operand getSrcOperand() {
        return srcOperand;
    }

    public Operand getDstOperand() {
        return dstOperand;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

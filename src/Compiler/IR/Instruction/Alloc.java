package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

public class Alloc extends IRInstruction {
    private Operand size;
    private Operand pointer;

    public Alloc(BasicBlock currentBB, Operand size, Operand pointer) {
        super(currentBB);
        this.size = size;
        this.pointer = pointer;
    }

    public Operand getSize() {
        return size;
    }

    public Operand getPointer() {
        return pointer;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

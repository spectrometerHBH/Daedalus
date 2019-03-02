package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.VirtualRegister;

public class Alloc extends IRInstruction {
    private Operand size;
    private VirtualRegister pointer;

    public Alloc(BasicBlock currentBB, Operand size, VirtualRegister pointer) {
        super(currentBB);
        this.size = size;
        this.pointer = pointer;
    }

    public Operand getSize() {
        return size;
    }

    public VirtualRegister getPointer() {
        return pointer;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

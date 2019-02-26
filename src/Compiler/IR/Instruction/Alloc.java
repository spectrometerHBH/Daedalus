package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.VirtualRegister;

public class Alloc extends IRInstruction {
    private int size;
    private VirtualRegister pointer;

    public Alloc(BasicBlock currentBB, int size, VirtualRegister pointer) {
        super(currentBB);
        this.size = size;
        this.pointer = pointer;
    }
}

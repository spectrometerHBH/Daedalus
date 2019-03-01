package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
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
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;
import Compiler.IR.Operand.VirtualRegister;

public class Alloc extends IRInstruction {
    private Oprand size;
    private VirtualRegister pointer;

    public Alloc(BasicBlock currentBB, Oprand size, VirtualRegister pointer) {
        super(currentBB);
        this.size = size;
        this.pointer = pointer;
    }
}

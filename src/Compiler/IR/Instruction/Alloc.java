package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Alloc extends IRInstruction {
    private Operand size;
    private Operand pointer;

    public Alloc(BasicBlock currentBB, Operand size, Operand pointer) {
        super(currentBB);
        this.size = size;
        this.pointer = pointer;
        updateUseRegisters();
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

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        if (size instanceof Register) useRegisters.add((Register) size);
    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (size instanceof Register) size = renameMap.get(size);
        updateUseRegisters();
    }

    @Override
    public Register getDefRegister() {
        return (Register) pointer;
    }

    @Override
    public void setDefRegister(Register newRegister) {
        pointer = newRegister;
    }

    @Override
    public void renameDefRegister() {
        if (pointer instanceof VirtualRegister && !(pointer instanceof GlobalVariable))
            pointer = ((VirtualRegister) pointer).getSSARenameRegister(((VirtualRegister) pointer).getNewId());
    }

    @Override
    public void renameUseRegisters() {
        if (size instanceof VirtualRegister && !(size instanceof GlobalVariable))
            size = ((VirtualRegister) size).getSSARenameRegister(((VirtualRegister) size).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceOperand(Operand oldOperand, Operand newOperand) {
        if (size == oldOperand) size = newOperand;
        updateUseRegisters();
    }
}

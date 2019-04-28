package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

import static Compiler.IR.Operand.PhysicalRegister.*;

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

    public void setSize(Operand size) {
        this.size = size;
        updateUseRegisters();
    }

    public void setPointer(Operand pointer) {
        this.pointer = pointer;
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
    public void renameDefRegisterForSSA() {
        if (pointer instanceof VirtualRegister && !(pointer instanceof GlobalVariable))
            pointer = ((VirtualRegister) pointer).getSSARenameRegister(((VirtualRegister) pointer).getNewId());
    }

    @Override
    public void renameUseRegistersForSSA() {
        if (size instanceof VirtualRegister && !(size instanceof GlobalVariable))
            size = ((VirtualRegister) size).getSSARenameRegister(((VirtualRegister) size).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (size == oldOperand) size = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (size instanceof VirtualRegister && !(size instanceof GlobalVariable)) use.add((VirtualRegister) size);
        if (pointer instanceof VirtualRegister && !(pointer instanceof GlobalVariable))
            def.add((VirtualRegister) pointer);
        def.addAll(callerSaveVRegisters);
        def.remove(vrsp);
        def.remove(vrbp);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (size == oldVR) size = newVR;
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {
        if (pointer == oldVR) pointer = newVR;
    }
}

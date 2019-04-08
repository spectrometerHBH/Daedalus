package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Load extends IRInstruction {
    private Operand src;
    private Operand dst;
    private boolean isInsertedForGlobalVariable;

    public Load(BasicBlock currentBB, Operand src, Operand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
        this.isInsertedForGlobalVariable = false;
        updateUseRegisters();
    }

    public Load(BasicBlock currentBB, Operand src, Operand dst, boolean isInsertedForGlobalVariable) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
        this.isInsertedForGlobalVariable = isInsertedForGlobalVariable;
        updateUseRegisters();
    }

    public Operand getSrc() {
        return src;
    }

    public Operand getDst() {
        return dst;
    }

    public boolean isInsertedForGlobalVariable() {
        return isInsertedForGlobalVariable;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        if (src instanceof Register) useRegisters.add((Register) src);
    }

    @Override
    public Register getDefRegister() {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register newRegister) {
        dst = newRegister;
    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (src instanceof Register) src = renameMap.get(src);
        updateUseRegisters();
    }

    @Override
    public void renameDefRegister() {
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).getNewId());
    }

    @Override
    public void renameUseRegisters() {
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable))
            src = ((VirtualRegister) src).getSSARenameRegister(((VirtualRegister) src).info.stack.peek());
        updateUseRegisters();
    }
}

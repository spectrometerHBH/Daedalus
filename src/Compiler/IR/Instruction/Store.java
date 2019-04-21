package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Store extends IRInstruction {
    private Operand src;
    private Operand dst;
    private boolean isInsertedForGlobalVariable;

    public Store(BasicBlock currentBB, Operand src, Operand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
        this.isInsertedForGlobalVariable = false;
        updateUseRegisters();
    }

    public Store(BasicBlock currentBB, Operand src, Operand dst, boolean isInsertedForGlobalVariable) {
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
        if (dst instanceof Register) useRegisters.add((Register) dst);
    }

    @Override
    public Register getDefRegister() {
        return null;
    }

    @Override
    public void setDefRegister(Register newRegister) {

    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (src instanceof Register) src = renameMap.get(src);
        if (dst instanceof Register) dst = renameMap.get(dst);
        updateUseRegisters();
    }

    @Override
    public void renameDefRegister() {

    }

    @Override
    public void renameUseRegisters() {
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable))
            src = ((VirtualRegister) src).getSSARenameRegister(((VirtualRegister) src).info.stack.peek());
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceOperand(Operand oldOperand, Operand newOperand) {
        if (src == oldOperand) src = newOperand;
        if (dst == oldOperand) dst = newOperand;
        updateUseRegisters();
    }
}

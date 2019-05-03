package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

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
        else if (dst instanceof Memory) useRegisters.addAll(((Memory) dst).useRegisters());
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
    public void renameDefRegisterForSSA() {

    }

    @Override
    public void renameUseRegistersForSSA() {
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable))
            src = ((VirtualRegister) src).getSSARenameRegister(((VirtualRegister) src).info.stack.peek());
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Store(fakeBBMap.getOrDefault(currentBB, currentBB), fakeRegMap.getOrDefault(src, src), fakeRegMap.getOrDefault(dst, dst));
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (src == oldOperand) src = newOperand;
        if (dst instanceof Register) {
            if (dst == oldOperand) dst = newOperand;
        } else if (dst instanceof Memory) ((Memory) dst).replaceOperand(oldOperand, newOperand);
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable)) use.add((VirtualRegister) src);
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable)) use.add((VirtualRegister) dst);
        else if (dst instanceof Memory) use.addAll(((Memory) dst).useRegisters());
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (src instanceof VirtualRegister) {
            if (src == oldVR) {
                src = newVR;
            }
        }
        if (dst instanceof VirtualRegister) {
            if (dst == oldVR) {
                dst = newVR;
            }
        } else if (dst instanceof Memory) {
            ((Memory) dst).replaceOperand(oldVR, newVR);
        }
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

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
        else if (src instanceof Memory) useRegisters.addAll(((Memory) src).useRegisters());
    }

    @Override
    public Register getDefRegister() {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register newRegister) {
        dst = newRegister;
    }

    //used in GlobalVariableResolver
    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (src instanceof Register) src = renameMap.get(src);
        updateUseRegisters();
    }

    //used in SSA construction
    @Override
    public void renameDefRegisterForSSA() {
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).getNewId());
    }

    @Override
    public void renameUseRegistersForSSA() {
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable))
            src = ((VirtualRegister) src).getSSARenameRegister(((VirtualRegister) src).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (src instanceof Register) {
            if (src == oldOperand) src = newOperand;
        } else if (src instanceof Memory) ((Memory) src).replaceOperand(oldOperand, newOperand);
        updateUseRegisters();
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Load(fakeBBMap.getOrDefault(currentBB, currentBB), fakeRegMap.getOrDefault(src, src), fakeRegMap.getOrDefault(dst, dst));
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable)) use.add((VirtualRegister) src);
        else if (src instanceof Memory) use.addAll(((Memory) src).useRegisters());
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable)) def.add((VirtualRegister) dst);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (src instanceof VirtualRegister) {
            if (src == oldVR) src = newVR;
        } else if (src instanceof Memory) ((Memory) src).replaceOperand(oldVR, newVR);
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {
        if (dst instanceof VirtualRegister) {
            if (dst == oldVR) dst = newVR;
        }
    }
}

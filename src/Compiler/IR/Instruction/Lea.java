package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.Map;

public class Lea extends IRInstruction {
    private Memory src;
    private Operand dst;

    public Lea(BasicBlock currentBB, Memory src, Operand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
        updateUseRegisters();
    }

    public Memory getSrc() {
        return src;
    }

    public Operand getDst() {
        return dst;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        useRegisters.addAll(src.useRegisters());
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
    public void renameDefRegisterForSSA() {

    }

    @Override
    public void renameUseRegistersForSSA() {

    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        src.replaceOperand(oldOperand, newOperand);
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        use.addAll(src.useRegisters());
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable)) def.add((VirtualRegister) dst);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        src.replaceOperand(oldVR, newVR);
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {
        if (dst == oldVR) dst = newVR;
    }
}

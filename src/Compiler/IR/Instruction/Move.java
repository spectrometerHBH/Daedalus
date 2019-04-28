package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Move extends IRInstruction {
    private Operand src;
    private Operand dst;

    public Move(BasicBlock currentBB, Operand src, Operand dst) {
        super(currentBB);
        this.src = src;
        this.dst = dst;
        updateUseRegisters();
    }

    public Operand getSrc() {
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
        if (src == oldOperand) src = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        assert src instanceof VirtualRegister;
        assert dst instanceof VirtualRegister;
        if (src instanceof VirtualRegister && !(src instanceof GlobalVariable)) use.add((VirtualRegister) src);
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable)) def.add((VirtualRegister) dst);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (src == oldVR) src = newVR;
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {
        if (dst == oldVR) dst = newVR;
    }
}

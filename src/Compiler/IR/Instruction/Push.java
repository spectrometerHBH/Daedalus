package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Push extends IRInstruction {
    private Operand src;

    public Push(BasicBlock currentBB, Operand src) {
        super(currentBB);
        this.src = src;
        updateUseRegisters();
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

    public Operand getSrc() {
        return src;
    }

    @Override
    public Register getDefRegister() {
        return null;
    }

    @Override
    public void setDefRegister(Register newRegister) {

    }

    @Override
    public void renameDefRegisterForSSA() {

    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }

    @Override
    public void renameUseRegistersForSSA() {

    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (src == oldOperand) src = newOperand;
        updateUseRegisters();
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return null;
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {

    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

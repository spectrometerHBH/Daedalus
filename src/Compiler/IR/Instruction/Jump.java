package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Jump extends IRInstruction {
    private BasicBlock targetBB;

    public Jump(BasicBlock currentBB, BasicBlock targetBB) {
        super(currentBB);
        this.targetBB = targetBB;
        updateUseRegisters();
    }

    public BasicBlock getTargetBB() {
        return targetBB;
    }

    public void setTargetBB(BasicBlock targetBB) {
        this.targetBB = targetBB;
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Jump(fakeBBMap.getOrDefault(currentBB, currentBB), fakeBBMap.getOrDefault(targetBB, targetBB));
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {

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
    public void renameUseRegistersForSSA() {

    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {

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

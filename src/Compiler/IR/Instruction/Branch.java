package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Branch extends IRInstruction {
    private Operand cond;
    private BasicBlock thenBB;
    private BasicBlock elseBB;

    public Cmp defOfCond = null;

    public Branch(BasicBlock currentBB, Operand cond, BasicBlock thenBB, BasicBlock elseBB) {
        super(currentBB);
        this.cond = cond;
        this.thenBB = thenBB;
        this.elseBB = elseBB;
        updateUseRegisters();
    }

    public BasicBlock getThenBB() {
        return thenBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }

    public void replaceTarget(BasicBlock oldBB, BasicBlock newBB) {
        if (thenBB == oldBB) thenBB = newBB;
        else elseBB = newBB;
    }

    public Operand getCond() {
        return cond;
    }

    public void setCond(Operand cond) {
        this.cond = cond;
        updateUseRegisters();
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Branch(fakeBBMap.getOrDefault(currentBB, currentBB), fakeRegMap.getOrDefault(cond, cond), fakeBBMap.getOrDefault(thenBB, thenBB), fakeBBMap.getOrDefault(elseBB, elseBB));
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        if (cond instanceof Register) useRegisters.add((Register) cond);
    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (cond instanceof Register) cond = renameMap.get(cond);
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
        if (cond instanceof VirtualRegister && !(cond instanceof GlobalVariable))
            cond = ((VirtualRegister) cond).getSSARenameRegister(((VirtualRegister) cond).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (cond == oldOperand) cond = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (defOfCond != null) {
            defOfCond.calcUseAndDef();
            use.addAll(defOfCond.use);
        } else {
            if (cond instanceof VirtualRegister && !(cond instanceof GlobalVariable)) use.add((VirtualRegister) cond);
        }
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (defOfCond != null) defOfCond.replaceUse(oldVR, newVR);
        else {
            if (cond == oldVR) cond = newVR;
        }
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

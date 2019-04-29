package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Pop extends IRInstruction {
    private Operand dst;

    public Pop(BasicBlock currentBB, Operand dst) {
        super(currentBB);
        this.dst = dst;
        updateUseRegisters();
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {

    }

    public Operand getDst() {
        return dst;
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
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }

    @Override
    public void renameUseRegistersForSSA() {

    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (dst == oldOperand) dst = newOperand;
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

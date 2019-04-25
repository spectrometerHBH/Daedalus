package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

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
    public void renameDefRegister() {

    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }

    @Override
    public void renameUseRegisters() {

    }

    @Override
    public void replaceOperand(Operand oldOperand, Operand newOperand) {
        if (dst == oldOperand) dst = newOperand;
    }
}

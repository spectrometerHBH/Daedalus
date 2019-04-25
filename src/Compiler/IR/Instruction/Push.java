package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

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
        if (src == oldOperand) src = newOperand;
        updateUseRegisters();
    }
}

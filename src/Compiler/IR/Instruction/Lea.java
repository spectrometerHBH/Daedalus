package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Memory;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

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
        src.replaceOperand(oldOperand, newOperand);
        updateUseRegisters();
    }
}

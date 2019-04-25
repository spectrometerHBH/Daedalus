package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class CDQ extends IRInstruction {
    public CDQ(BasicBlock currentBB) {
        super(currentBB);
    }

    @Override
    public void accept(IRVisitor irVisitor) {

    }

    @Override
    public void updateUseRegisters() {

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

    }
}

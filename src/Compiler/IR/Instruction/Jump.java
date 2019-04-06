package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Register;

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
}

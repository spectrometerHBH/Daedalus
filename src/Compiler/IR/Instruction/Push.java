package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Register;

import java.util.Map;

//not in use
public class Push extends IRInstruction {
    public Push(BasicBlock currentBB) {
        super(currentBB);
        updateUseRegisters();
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
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
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }
}

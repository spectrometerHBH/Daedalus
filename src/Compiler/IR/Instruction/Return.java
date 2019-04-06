package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.Map;

public class Return extends IRInstruction {
    private Operand returnValue;

    public Return(BasicBlock currentBB, Operand returnValue) {
        super(currentBB);
        this.returnValue = returnValue;
        updateUseRegisters();
    }

    public Operand getReturnValue() {
        return returnValue;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        if (returnValue instanceof Register) useRegisters.add((Register) returnValue);
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
        if (returnValue instanceof Register) returnValue = renameMap.get(returnValue);
        updateUseRegisters();
    }
}

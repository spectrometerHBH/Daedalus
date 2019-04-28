package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Return extends IRInstruction {
    private Operand returnValue;

    public Return(BasicBlock currentBB, Operand returnValue) {
        super(currentBB);
        this.returnValue = returnValue;
        updateUseRegisters();
    }

    public void setReturnValue(Operand returnValue) {
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

    @Override
    public void renameDefRegisterForSSA() {

    }

    @Override
    public void renameUseRegistersForSSA() {
        if (returnValue instanceof VirtualRegister && !(returnValue instanceof GlobalVariable))
            returnValue = ((VirtualRegister) returnValue).getSSARenameRegister(((VirtualRegister) returnValue).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (returnValue == oldOperand) returnValue = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (returnValue instanceof VirtualRegister && !(returnValue instanceof GlobalVariable))
            use.add((VirtualRegister) returnValue);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (returnValue == oldVR) returnValue = newVR;
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

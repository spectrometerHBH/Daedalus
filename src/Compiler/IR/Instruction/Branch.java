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

    public Operand getCond() {
        return cond;
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
    public void renameDefRegister() {

    }

    @Override
    public void renameUseRegisters() {
        if (cond instanceof VirtualRegister && !(cond instanceof GlobalVariable))
            cond = ((VirtualRegister) cond).getSSARenameRegister(((VirtualRegister) cond).info.stack.peek());
        updateUseRegisters();
    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Register;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class IRInstruction {
    protected BasicBlock currentBB;
    protected List<Register> useRegisters = new ArrayList<>();
    private IRInstruction lastInstruction;
    private IRInstruction nextInstruction;

    public IRInstruction(BasicBlock currentBB) {
        this.currentBB = currentBB;
    }

    public BasicBlock getCurrentBB() {
        return currentBB;
    }

    public void setCurrentBB(BasicBlock currentBB) {
        this.currentBB = currentBB;
    }

    public boolean hasLastInstruction() {
        return lastInstruction != null;
    }

    public IRInstruction getLastInstruction() {
        return lastInstruction;
    }

    public void setLastInstruction(IRInstruction lastInstruction) {
        this.lastInstruction = lastInstruction;
    }

    public boolean hasNextInstruction() {
        return nextInstruction != null;
    }

    public IRInstruction getNextInstruction() {
        return nextInstruction;
    }

    public void setNextInstruction(IRInstruction nextInstruction) {
        this.nextInstruction = nextInstruction;
    }

    public void replaceInstruction(IRInstruction newInstruction) {
        if (hasLastInstruction()) getLastInstruction().setNextInstruction(newInstruction);
        if (hasNextInstruction()) getNextInstruction().setLastInstruction(newInstruction);
    }

    public void prependInstruction(IRInstruction newInstruction) {
        if (lastInstruction != null) lastInstruction.setNextInstruction(newInstruction);
        else currentBB.head = newInstruction;
        newInstruction.setLastInstruction(lastInstruction);
        newInstruction.setNextInstruction(this);
        setLastInstruction(newInstruction);
    }

    public void postpendInstruction(IRInstruction newInstruction) {
        if (nextInstruction != null) nextInstruction.setLastInstruction(newInstruction);
        else currentBB.tail = newInstruction;
        newInstruction.setLastInstruction(this);
        newInstruction.setNextInstruction(nextInstruction);
        setNextInstruction(newInstruction);
    }

    public abstract void accept(IRVisitor irVisitor);

    public abstract void updateUseRegisters();

    public abstract Register getDefRegister();

    public abstract void setDefRegister(Register newRegister);

    public List<Register> getUseRegisters() {
        return useRegisters;
    }

    public abstract void setUseRegisters(Map<Register, Register> renameMap);
}

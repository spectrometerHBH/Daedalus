package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

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

    private boolean hasLastInstruction() {
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
        if (hasLastInstruction()) {
            getLastInstruction().setNextInstruction(newInstruction);
            newInstruction.setLastInstruction(getLastInstruction());
        } else currentBB.head = newInstruction;
        if (hasNextInstruction()) {
            getNextInstruction().setLastInstruction(newInstruction);
            newInstruction.setNextInstruction(getNextInstruction());
        } else currentBB.tail = newInstruction;
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

    public void removeSelf() {
        if (this == currentBB.head) currentBB.head = this.getNextInstruction();
        if (this == currentBB.tail) currentBB.tail = this.getLastInstruction();
        if (hasLastInstruction()) getLastInstruction().setNextInstruction(this.nextInstruction);
        if (hasNextInstruction()) getNextInstruction().setLastInstruction(this.lastInstruction);
    }

    public abstract void accept(IRVisitor irVisitor);

    public abstract void updateUseRegisters();

    public abstract Register getDefRegister();

    public abstract void setDefRegister(Register newRegister);

    public List<Register> getUseRegisters() {
        updateUseRegisters();
        return useRegisters;
    }

    public abstract void setUseRegisters(Map<Register, Register> renameMap);

    public abstract IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap);

    //for Liveness Analysis during Register Allocation
    protected Set<VirtualRegister> use = new HashSet<>();
    protected Set<VirtualRegister> def = new HashSet<>();
    protected Set<VirtualRegister> liveIn = new HashSet<>();
    protected Set<VirtualRegister> liveOut = new HashSet<>();

    public abstract void renameDefRegisterForSSA();

    public abstract void renameUseRegistersForSSA();

    public abstract void replaceUseRegister(Operand oldOperand, Operand newOperand);

    public abstract void calcUseAndDef();

    public abstract void replaceUse(VirtualRegister oldVR, VirtualRegister newVR);

    public abstract void replaceDef(VirtualRegister oldVR, VirtualRegister newVR);

    public Set<VirtualRegister> getUse() {
        return use;
    }

    public Set<VirtualRegister> getDef() {
        return def;
    }

    public Set<VirtualRegister> getLiveIn() {
        return liveIn;
    }

    public Set<VirtualRegister> getLiveOut() {
        return liveOut;
    }
}

package Compiler.IR.Operand;

import java.util.ArrayList;
import java.util.List;

public abstract class Memory extends Storage {
    private Register base = null;
    private Register index = null;
    private Immediate scale = new Immediate(0);
    private Immediate offset = new Immediate(0);
    private List<VirtualRegister> useRegisters = new ArrayList<>();

    public Memory(VirtualRegister base) {
        super(base.getName());
        this.base = base;
    }

    public Memory(Register base, Register index, Immediate scale, Immediate offset) {
        this.base = base;
        this.index = index;
        this.scale = scale;
        this.offset = offset;
    }

    public Register getBase() {
        return base;
    }

    public void setBase(VirtualRegister base) {
        this.base = base;
    }

    public void setBase(Register base) {
        this.base = base;
    }

    public Register getIndex() {
        return index;
    }

    public void setIndex(Register index) {
        this.index = index;
    }

    public Immediate getScale() {
        return scale;
    }

    public void setScale(Immediate scale) {
        this.scale = scale;
    }

    public Immediate getOffset() {
        return offset;
    }

    public void setOffset(Immediate offset) {
        this.offset = offset;
    }

    public List<VirtualRegister> useRegisters() {
        useRegisters.clear();
        if (base != null && !(base instanceof GlobalVariable)) useRegisters.add((VirtualRegister) base);
        if (index != null && !(index instanceof GlobalVariable)) useRegisters.add((VirtualRegister) index);
        return useRegisters;
    }

    public void replaceOperand(Operand oldOperand, Operand newOperand) {
        if (base == oldOperand) base = (VirtualRegister) newOperand;
        if (index == oldOperand) index = (VirtualRegister) newOperand;
    }
}

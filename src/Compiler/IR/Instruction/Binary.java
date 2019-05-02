package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.*;

import java.util.Map;

public class Binary extends IRInstruction {
    private Op op;
    private Operand src1, src2, dst;
    //for CSE use
    public Operand previousResult = null;

    public Binary(BasicBlock currentBB, Op op, Operand src1, Operand src2, Operand dst) {
        super(currentBB);
        this.op = op;
        this.src1 = src1;
        this.src2 = src2;
        this.dst = dst;
        updateUseRegisters();
    }

    public Op getOp() {
        return op;
    }

    public Operand getSrc1() {
        return src1;
    }

    public void setSrc1(Operand src1) {
        this.src1 = src1;
        updateUseRegisters();
    }

    public Operand getSrc2() {
        return src2;
    }

    public void setSrc2(Operand src2) {
        this.src2 = src2;
        updateUseRegisters();
    }

    public Operand getDst() {
        return dst;
    }

    public void setDst(Operand dst) {
        this.dst = dst;
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Binary(fakeBBMap.getOrDefault(currentBB, currentBB), op, fakeRegMap.getOrDefault(src1, src1), fakeRegMap.getOrDefault(src2, src2), fakeRegMap.getOrDefault(dst, dst));
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        if (src1 instanceof Register) useRegisters.add((Register) src1);
        if (src2 instanceof Register) useRegisters.add((Register) src2);
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
    public void setUseRegisters(Map<Register, Register> renameMap) {
        if (src1 instanceof Register) src1 = renameMap.get(src1);
        if (src2 instanceof Register) src2 = renameMap.get(src2);
        updateUseRegisters();
    }

    @Override
    public void renameDefRegisterForSSA() {
        if (!(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).getNewId());
    }

    @Override
    public void renameUseRegistersForSSA() {
        if (src1 instanceof VirtualRegister && !(src1 instanceof GlobalVariable))
            src1 = ((VirtualRegister) src1).getSSARenameRegister(((VirtualRegister) src1).info.stack.peek());
        if (src2 instanceof VirtualRegister && !(src2 instanceof GlobalVariable))
            src2 = ((VirtualRegister) src2).getSSARenameRegister(((VirtualRegister) src2).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        if (src1 == oldOperand) src1 = newOperand;
        if (src2 == oldOperand) src2 = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        if (src1 instanceof VirtualRegister && !(src1 instanceof GlobalVariable)) use.add((VirtualRegister) src1);
        if (src2 instanceof VirtualRegister && !(src2 instanceof GlobalVariable)) use.add((VirtualRegister) src2);
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable)) def.add((VirtualRegister) dst);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        if (src1 == oldVR) src1 = newVR;
        if (src2 == oldVR) src2 = newVR;
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {
        if (dst == oldVR) dst = newVR;
    }

    public Lea transformBinary2Lea(Binary inst) {
        switch (inst.getOp()) {
            case ADD: {
                if (inst.src1 instanceof Immediate)
                    return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src2, null, new Immediate(0), (Immediate) inst.src1), inst.getDst());
                else if (inst.src2 instanceof Immediate)
                    return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src1, null, new Immediate(0), (Immediate) inst.src2), inst.getDst());
                else
                    return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src1, (VirtualRegister) inst.src2, new Immediate(1), new Immediate(0)), inst.getDst());
            }
            case SUB: {
                if (inst.src2 instanceof Immediate)
                    return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src1, null, new Immediate(0), new Immediate(-((Immediate) inst.src2).getImmediate())), inst.getDst());
                else
                    return null;
            }
            case MUL: {
                if (inst.src1 instanceof Immediate) {
                    int scale = ((Immediate) inst.src1).getImmediate();
                    if (scale == 1 || scale == 2 || scale == 4 || scale == 8)
                        return new Lea(inst.getCurrentBB(), new DynamicData(null, (VirtualRegister) inst.src2, (Immediate) inst.src1, new Immediate(0)), inst.getDst());
                    else if (scale == 3 || scale == 5 || scale == 9)
                        return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src2, (VirtualRegister) inst.src2, new Immediate(scale - 1), new Immediate(0)), inst.getDst());
                } else if (inst.src2 instanceof Immediate) {
                    int scale = ((Immediate) inst.src2).getImmediate();
                    if (scale == 1 || scale == 2 || scale == 4 || scale == 8)
                        return new Lea(inst.getCurrentBB(), new DynamicData(null, (VirtualRegister) inst.src1, (Immediate) inst.src2, new Immediate(0)), inst.getDst());
                    else if (scale == 3 || scale == 5 || scale == 9)
                        return new Lea(inst.getCurrentBB(), new DynamicData((VirtualRegister) inst.src1, (VirtualRegister) inst.src1, new Immediate(scale - 1), new Immediate(0)), inst.getDst());

                } else
                    return null;
            }
            default:
                return null;
        }
    }

    private Lea constructLea(Register base1, Register index1, int scale1, Register index2, int scale2, int offset, Register dst) {
        if (base1 != null) {
            if (index1 != null) {
                if (index2 != null) {
                    //base1 + index1 * scale1 + index2 * scale2 + offset
                    if (base1 == index1 && index1 == index2) {
                        int scale = scale1 + scale2 + 1;
                        if (scale == 1 || scale == 2 || scale == 4 || scale == 8)
                            return new Lea(currentBB, new DynamicData(null, base1, new Immediate(scale), new Immediate(offset)), dst);
                        else if (scale == 3 || scale == 5 || scale == 9)
                            return new Lea(currentBB, new DynamicData(base1, base1, new Immediate(scale - 1), new Immediate(offset)), dst);
                        else
                            return null;
                    } else if (base1 == index1) {
                        if (scale1 == 1 && scale2 == 1) {
                            return new Lea(currentBB, new DynamicData(index2, base1, new Immediate(2), new Immediate(offset)), dst);
                        } else
                            return null;
                    } else if (base1 == index2) {
                        if (scale1 == 1 && scale2 == 1)
                            return new Lea(currentBB, new DynamicData(index1, base1, new Immediate(2), new Immediate(offset)), dst);
                        else
                            return null;
                    } else if (index1 == index2) {
                        int scale = scale1 + scale2;
                        if (scale == 1 || scale == 2 || scale == 4 || scale == 8)
                            return new Lea(currentBB, new DynamicData(base1, index1, new Immediate(scale), new Immediate(offset)), dst);
                        else
                            return null;
                    } else
                        return null;
                } else {
                    //base1 + index1 * scale1 + offset
                    if (base1 == index1 && scale1 == 1)
                        return new Lea(currentBB, new DynamicData(null, base1, new Immediate(2), new Immediate(offset)), dst);
                    else
                        return new Lea(currentBB, new DynamicData(base1, index1, new Immediate(scale1), new Immediate(offset)), dst);
                }
            } else {
                if (index2 != null) {
                    //base1 + index2 * scale2 + offset
                    if (base1 == index2 && scale2 == 1)
                        return new Lea(currentBB, new DynamicData(null, base1, new Immediate(2), new Immediate(offset)), dst);
                    else
                        return new Lea(currentBB, new DynamicData(base1, index2, new Immediate(scale2), new Immediate(offset)), dst);
                } else {
                    //base1 + offset
                    return new Lea(currentBB, new DynamicData(base1, null, new Immediate(0), new Immediate(offset)), dst);
                }
            }
        } else {
            if (index1 != null) {
                if (index2 != null) {
                    //index1 * scale1 + index2 * scale2 + offset
                    if (index1 == index2) {
                        int scale = scale1 + scale2;
                        if (scale == 2 || scale == 4 || scale == 8)
                            return new Lea(currentBB, new DynamicData(null, index1, new Immediate(scale), new Immediate(offset)), dst);
                        else if (scale == 3 || scale == 5 || scale == 9)
                            return new Lea(currentBB, new DynamicData(index1, index1, new Immediate(scale - 1), new Immediate(offset)), dst);
                        else
                            return null;
                    } else {
                        if (scale1 == 1) {
                            return new Lea(currentBB, new DynamicData(index1, index2, new Immediate(scale2), new Immediate(offset)), dst);
                        } else if (scale2 == 1) {
                            return new Lea(currentBB, new DynamicData(index2, index1, new Immediate(scale1), new Immediate(offset)), dst);
                        } else
                            return null;
                    }
                } else {
                    //index1 * scale1 + offset
                    if (scale1 == 1)
                        return new Lea(currentBB, new DynamicData(index1, null, new Immediate(0), new Immediate(offset)), dst);
                    else
                        return new Lea(currentBB, new DynamicData(null, index1, new Immediate(scale1), new Immediate(offset)), dst);
                }
            } else {
                if (index2 != null) {
                    //index2 * scale2 + offset
                    if (scale2 == 1)
                        return new Lea(currentBB, new DynamicData(index2, null, new Immediate(0), new Immediate(offset)), dst);
                    else
                        return new Lea(currentBB, new DynamicData(null, index2, new Immediate(scale2), new Immediate(offset)), dst);
                } else {
                    //offset
                    return new Lea(currentBB, new DynamicData(null, null, new Immediate(0), new Immediate(offset)), dst);
                }
            }
        }
    }

    private Lea combineLea(Lea lea2, Lea lea1) {
        Register base1 = lea1.getSrc().getBase(), index1 = lea1.getSrc().getIndex();
        int scale1 = lea1.getSrc().getScale().getImmediate(), offset1 = lea1.getSrc().getOffset().getImmediate();
        Register base2 = lea2.getSrc().getBase(), index2 = lea2.getSrc().getIndex();
        int scale2 = lea2.getSrc().getScale().getImmediate(), offset2 = lea2.getSrc().getOffset().getImmediate();
        if (lea1.getDst() == base2)
            return constructLea(base1, index1, scale1, index2, scale2, offset1 + offset2, (Register) lea2.getDst());
        else if (lea1.getDst() == index2)
            return constructLea(base2, base1, scale2, index1, scale1 * scale2, offset1 * scale2 + offset2, (Register) lea2.getDst());
        else
            return null;
    }

    public IRInstruction combine(IRInstruction last) {
        Lea thisLea = transformBinary2Lea(this), lastLea;
        if (last instanceof Binary) lastLea = transformBinary2Lea((Binary) last);
        else lastLea = (Lea) last;
        if (thisLea != null && lastLea != null) return combineLea(thisLea, lastLea);
        else return null;
    }

    public boolean isCommutative() {
        return op == Op.ADD || op == Op.MUL || op == Op.AND || op == Op.OR || op == Op.XOR;
    }

    public enum Op {
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }
}

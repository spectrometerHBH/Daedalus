package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Cmp extends IRInstruction {
    private Op op;
    private Operand src1;
    private Operand src2;
    private Operand dst;

    //for CSE use
    public Operand previousResult = null;

    public Cmp(BasicBlock currentBB, Op op, Operand src1, Operand src2, Operand dst) {
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

    public Operand getSrc2() {
        return src2;
    }

    public Operand getDst() {
        return dst;
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        return new Cmp(fakeBBMap.getOrDefault(currentBB, currentBB), op, fakeRegMap.getOrDefault(src1, src1),
                fakeRegMap.getOrDefault(src2, src2), fakeRegMap.getOrDefault(dst, dst));
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
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
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

    public boolean isCommutative() {
        return op == Op.NEQ || op == Op.EQ;
    }

    public Cmp inverseInstruction() {
        Cmp.Op newOp = null;
        switch (this.op) {
            case LT:
                newOp = Op.GT;
                break;
            case LEQ:
                newOp = Op.GEQ;
                break;
            case EQ:
                newOp = Op.EQ;
                break;
            case GT:
                newOp = Op.LT;
                break;
            case GEQ:
                newOp = Op.LEQ;
                break;
            case NEQ:
                newOp = Op.NEQ;
                break;
        }
        return new Cmp(currentBB, newOp, src2, src1, dst);
    }

    public enum Op {
        LT, LEQ, EQ, GEQ, GT, NEQ
    }
}

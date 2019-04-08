package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.Map;

public class Binary extends IRInstruction {
    private Op op;
    private Operand src1, src2, dst;

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

    public Operand getSrc2() {
        return src2;
    }

    public Operand getDst() {
        return dst;
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
    public void renameDefRegister() {
        if (!(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).getNewId());
    }

    @Override
    public void renameUseRegisters() {
        if (src1 instanceof VirtualRegister && !(src1 instanceof GlobalVariable))
            src1 = ((VirtualRegister) src1).getSSARenameRegister(((VirtualRegister) src1).info.stack.peek());
        if (src2 instanceof VirtualRegister && !(src2 instanceof GlobalVariable))
            src2 = ((VirtualRegister) src2).getSSARenameRegister(((VirtualRegister) src2).info.stack.peek());
        updateUseRegisters();
    }

    public enum Op {
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }
}

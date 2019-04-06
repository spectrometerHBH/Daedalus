package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

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

    public enum Op {
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }
}

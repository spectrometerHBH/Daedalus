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
    private Operand lhs;
    private Operand rhs;
    private Operand dst;

    public Cmp(BasicBlock currentBB, Op op, Operand lhs, Operand rhs, Operand dst) {
        super(currentBB);
        this.op = op;
        this.lhs = lhs;
        this.rhs = rhs;
        this.dst = dst;
        updateUseRegisters();
    }

    public Op getOp() {
        return op;
    }

    public Operand getLhs() {
        return lhs;
    }

    public Operand getRhs() {
        return rhs;
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
        if (lhs instanceof Register) useRegisters.add((Register) lhs);
        if (rhs instanceof Register) useRegisters.add((Register) rhs);
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
        if (lhs instanceof Register) lhs = renameMap.get(lhs);
        if (rhs instanceof Register) rhs = renameMap.get(rhs);
        updateUseRegisters();
    }

    @Override
    public void renameDefRegister() {
        if (dst instanceof VirtualRegister && !(dst instanceof GlobalVariable))
            dst = ((VirtualRegister) dst).getSSARenameRegister(((VirtualRegister) dst).getNewId());
    }

    @Override
    public void renameUseRegisters() {
        if (lhs instanceof VirtualRegister && !(lhs instanceof GlobalVariable))
            lhs = ((VirtualRegister) lhs).getSSARenameRegister(((VirtualRegister) lhs).info.stack.peek());
        if (rhs instanceof VirtualRegister && !(rhs instanceof GlobalVariable))
            rhs = ((VirtualRegister) rhs).getSSARenameRegister(((VirtualRegister) rhs).info.stack.peek());
        updateUseRegisters();
    }

    public enum Op {
        LT, LEQ, EQ, GEQ, GT, NEQ
    }
}

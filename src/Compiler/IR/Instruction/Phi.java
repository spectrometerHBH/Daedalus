package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.LinkedHashMap;
import java.util.Map;

public class Phi extends IRInstruction {
    private Operand dst;
    private Map<BasicBlock, Operand> paths = new LinkedHashMap<>();

    public Phi(BasicBlock currentBB, Operand dst) {
        super(currentBB);
        this.dst = dst;
    }

    public Operand getDst() {
        return dst;
    }

    public void setDst(Operand dst) {
        this.dst = dst;
    }

    public Map<BasicBlock, Operand> getPaths() {
        return paths;
    }

    public void removePath(BasicBlock basicBlock) {
        paths.remove(basicBlock);
        if (paths.size() == 1) {
            IRInstruction newInstruction = new Move(currentBB, paths.values().iterator().next(), dst);
            replaceInstruction(newInstruction);
            if (this == currentBB.head) currentBB.head = newInstruction;
            if (this == currentBB.tail) currentBB.tail = newInstruction;
        }
    }

    public void replacePath(BasicBlock oldBasicBlock, BasicBlock newBasicBlock) {
        Operand operand = paths.get(oldBasicBlock);
        paths.remove(oldBasicBlock);
        paths.put(newBasicBlock, operand);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {

    }

    @Override
    public Register getDefRegister() {
        return (Register) dst;
    }

    @Override
    public void setDefRegister(Register newRegister) {

    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {

    }

    @Override
    public void renameDefRegister() {

    }

    @Override
    public void renameUseRegisters() {

    }
}

package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

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
        useRegisters.clear();
        for (Map.Entry<BasicBlock, Operand> entry : paths.entrySet()) {
            Operand operand = entry.getValue();
            if (operand instanceof Register) useRegisters.add((Register) operand);
        }
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
    public void renameDefRegisterForSSA() {

    }

    @Override
    public void renameUseRegistersForSSA() {

    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        for (Map.Entry<BasicBlock, Operand> entry : paths.entrySet()) {
            BasicBlock basicBlock = entry.getKey();
            Operand operand = entry.getValue();
            if (operand == oldOperand) paths.put(basicBlock, newOperand);
        }
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {

    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

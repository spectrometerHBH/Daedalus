package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Call extends IRInstruction {
    private List<Operand> parameterList = new ArrayList<>();
    private Function callee;
    private Operand objectPointer;
    private Operand result;

    public Call(BasicBlock currentBB, Function callee, Operand result) {
        super(currentBB);
        this.callee = callee;
        this.result = result;
        updateUseRegisters();
    }

    public void appendParameterList(Operand operand) {
        parameterList.add(operand);
    }

    public List<Operand> getParameterList() {
        return parameterList;
    }

    public Operand getObjectPointer() {
        return objectPointer;
    }

    public void setObjectPointer(Operand objectPointer) {
        this.objectPointer = objectPointer;
    }

    public Function getCallee() {
        return callee;
    }

    public Operand getResult() {
        return result;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    @Override
    public void updateUseRegisters() {
        useRegisters.clear();
        parameterList.forEach(parameter -> {
            if (parameter instanceof Register) useRegisters.add((Register) parameter);
        });
    }

    @Override
    public Register getDefRegister() {
        if (result != null) return (Register) result;
        else return null;
    }

    @Override
    public void setDefRegister(Register newRegister) {
        if (result != null) result = newRegister;
    }

    @Override
    public void setUseRegisters(Map<Register, Register> renameMap) {
        parameterList.forEach(parameter -> {
            if (parameter instanceof Register) parameter = renameMap.get(parameter);
        });
        updateUseRegisters();
    }
}

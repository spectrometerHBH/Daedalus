package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.LinkedList;
import java.util.Map;

import static Compiler.IR.Operand.PhysicalRegister.callerSaveVRegisters;
import static Compiler.IR.Operand.PhysicalRegister.vrsp;

public class Call extends IRInstruction {
    private LinkedList<Operand> parameterList = new LinkedList<>();
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
        updateUseRegisters();
    }

    public LinkedList<Operand> getParameterList() {
        return parameterList;
    }

    public Operand getObjectPointer() {
        return objectPointer;
    }

    public void setObjectPointer(Operand objectPointer) {
        this.objectPointer = objectPointer;
        updateUseRegisters();
    }

    public Function getCallee() {
        return callee;
    }

    public Operand getResult() {
        return result;
    }

    public void setResult(Operand result) {
        this.result = result;
        updateUseRegisters();
    }

    @Override
    public IRInstruction getFakeInstruction(Map<BasicBlock, BasicBlock> fakeBBMap, Map<Operand, Operand> fakeRegMap) {
        Call newCall = new Call(fakeBBMap.getOrDefault(currentBB, currentBB), callee, fakeRegMap.getOrDefault(result, result));
        parameterList.forEach(operand -> newCall.appendParameterList(fakeRegMap.getOrDefault(operand, operand)));
        newCall.setObjectPointer(fakeRegMap.getOrDefault(objectPointer, objectPointer));
        return newCall;
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
        if (objectPointer instanceof Register) useRegisters.add((Register) objectPointer);
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
        for (int i = 0; i < parameterList.size(); i++) {
            Operand parameter = parameterList.get(i);
            if (parameter instanceof Register) parameterList.set(i, renameMap.get(parameter));
        }
        if (objectPointer instanceof Register) objectPointer = renameMap.get(objectPointer);
        updateUseRegisters();
    }

    @Override
    public void renameDefRegisterForSSA() {
        if (result != null && result instanceof VirtualRegister && !(result instanceof GlobalVariable))
            result = ((VirtualRegister) result).getSSARenameRegister(((VirtualRegister) result).getNewId());
    }

    @Override
    public void renameUseRegistersForSSA() {
        for (int i = 0; i < parameterList.size(); i++) {
            Operand parameter = parameterList.get(i);
            if (parameter instanceof VirtualRegister && !(parameter instanceof GlobalVariable))
                parameterList.set(i, ((VirtualRegister) parameter).getSSARenameRegister(((VirtualRegister) parameter).info.stack.peek()));
        }
        if (objectPointer instanceof VirtualRegister && !(objectPointer instanceof GlobalVariable))
            objectPointer = ((VirtualRegister) objectPointer).getSSARenameRegister(((VirtualRegister) objectPointer).info.stack.peek());
        updateUseRegisters();
    }

    @Override
    public void replaceUseRegister(Operand oldOperand, Operand newOperand) {
        for (int i = 0; i < parameterList.size(); i++) {
            Operand parameter = parameterList.get(i);
            if (parameter == oldOperand) parameterList.set(i, newOperand);
        }
        if (objectPointer == oldOperand) objectPointer = newOperand;
        updateUseRegisters();
    }

    @Override
    public void calcUseAndDef() {
        use.clear();
        def.clear();
        parameterList.forEach(parameter -> {
            if (parameter instanceof VirtualRegister && !(parameter instanceof GlobalVariable))
                use.add((VirtualRegister) parameter);
        });
        if (objectPointer instanceof VirtualRegister && !(objectPointer instanceof GlobalVariable))
            use.add((VirtualRegister) objectPointer);
        if (result instanceof VirtualRegister && !(result instanceof GlobalVariable)) def.add((VirtualRegister) result);
        def.addAll(callerSaveVRegisters);
        def.remove(vrsp);
    }

    @Override
    public void replaceUse(VirtualRegister oldVR, VirtualRegister newVR) {
        for (int i = 0; i < parameterList.size(); i++) {
            Operand parameter = parameterList.get(i);
            if (parameter == oldVR) parameterList.set(i, newVR);
        }
        if (objectPointer == oldVR) objectPointer = newVR;
    }

    @Override
    public void replaceDef(VirtualRegister oldVR, VirtualRegister newVR) {

    }
}

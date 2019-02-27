package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;

import java.util.ArrayList;
import java.util.List;

public class Call extends IRInstruction {
    private List<Oprand> parameterList = new ArrayList<>();
    private Oprand objectPointer;
    private Oprand result;

    public Call(BasicBlock currentBB, Oprand result) {
        super(currentBB);
        this.result = result;
    }

    public void appendParameterList(Oprand oprand){
        parameterList.add(oprand);
    }

    public List<Oprand> getParameterList() {
        return parameterList;
    }

    public Oprand getObjectPointer() {
        return objectPointer;
    }

    public void setObjectPointer(Oprand objectPointer) {
        this.objectPointer = objectPointer;
    }
}

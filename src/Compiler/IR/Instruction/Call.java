package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.Operand.Operand;

import java.util.ArrayList;
import java.util.List;

public class Call extends IRInstruction {
    private List<Operand> parameterList = new ArrayList<>();
    private Function callee;
    private Operand objectPointer;
    private Operand result;

    public Call(BasicBlock currentBB, Function callee, Operand result) {
        super(currentBB);
        this.callee = callee;
        this.result = result;
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
}

package Compiler.IR;

import Compiler.IR.Instruction.Return;
import Compiler.IR.Operand.Storage;

import java.util.ArrayList;
import java.util.List;

public class Function {
    private BasicBlock entryBlock;
    private BasicBlock exitBlock;
    private List<Return> returnInstList = new ArrayList<>();
    private List<Storage> parameterList = new ArrayList<>();
    private String name;

    public void appendReturnList(Return irInstruction) {
        returnInstList.add(irInstruction);
    }
    public void appendParameterList(Storage storage){
        parameterList.add(storage);
    }
    public String getName() {
        return name;
    }
}

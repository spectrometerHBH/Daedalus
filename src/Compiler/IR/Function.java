package Compiler.IR;

import Compiler.IR.Instruction.Return;
import Compiler.IR.Operand.Storage;

import java.util.ArrayList;
import java.util.List;

public class Function {
    private BasicBlock entryBlock = new BasicBlock(this, "function_entry");
    private BasicBlock exitBlock = new BasicBlock(this, "function_exit");
    private List<Return> returnInstList = new ArrayList<>();
    private Storage referenceForClassMethod = null;
    private List<Storage> parameterList = new ArrayList<>();
    private String name;

    public Function() {
    }

    public void appendReturnList(Return irInstruction) {
        returnInstList.add(irInstruction);
    }

    public void appendParameterList(Storage storage){
        parameterList.add(storage);
    }

    public String getName() {
        return name;
    }

    public void setReferenceForClassMethod(Storage referenceForClassMethod) {
        this.referenceForClassMethod = referenceForClassMethod;
    }

    public BasicBlock getEntryBlock() {
        return entryBlock;
    }

    public void setEntryBlock(BasicBlock entryBlock) {
        this.entryBlock = entryBlock;
    }

    public BasicBlock getExitBlock() {
        return exitBlock;
    }

    public void setExitBlock(BasicBlock exitBlock) {
        this.exitBlock = exitBlock;
    }

    public Storage getReferenceForClassMethod() {
        return referenceForClassMethod;
    }

    public List<Return> getReturnInstList() {
        return returnInstList;
    }
}

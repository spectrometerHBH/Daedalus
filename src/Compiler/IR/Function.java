package Compiler.IR;

import Compiler.IR.Instruction.Return;
import Compiler.IR.Operand.Storage;

import java.util.*;

public class Function {
    private BasicBlock entryBlock = new BasicBlock(this, "function_entry");
    private BasicBlock exitBlock = new BasicBlock(this, "function_exit");
    private List<Return> returnInstList = new ArrayList<>();
    private Storage referenceForClassMethod = null;
    private List<Storage> parameterList = new ArrayList<>();
    private List<BasicBlock> postOrderDFSBBList = null;
    private Set<BasicBlock> visit = null;

    private String name;

    public Function(String name) {
        this.name = name;
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

    public void setReferenceForClassMethod(Storage referenceForClassMethod) {
        this.referenceForClassMethod = referenceForClassMethod;
    }

    public Storage getReferenceForClassMethod() {
        return referenceForClassMethod;
    }

    public List<Return> getReturnInstList() {
        return returnInstList;
    }

    public List<Storage> getParameterList() {
        return parameterList;
    }

    public List<BasicBlock> getPostOrderDFSBBList() {
        if (postOrderDFSBBList == null) calcPostOrderDFSBBList();
        return postOrderDFSBBList;
    }

    private void calcPostOrderDFSBBList() {
        postOrderDFSBBList = new ArrayList<>();
        visit = new HashSet<>();
        postOrderDFS(entryBlock);
        Collections.reverse(postOrderDFSBBList);
        visit = null;
    }

    private void postOrderDFS(BasicBlock nowBB) {
        visit.add(nowBB);
        nowBB.getSuccessors().forEach(x -> {
            if (!visit.contains(x)) postOrderDFS(x);
        });
        postOrderDFSBBList.add(nowBB);
    }

    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

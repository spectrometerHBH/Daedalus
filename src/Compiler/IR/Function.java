package Compiler.IR;

import Compiler.IR.Instruction.Call;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Return;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

public class Function {
    public Set<Function> calleeSet = new HashSet<>();
    public Set<Function> recursiveCalleeSet = new HashSet<>();
    public FunctionInfo functionInfo;
    public LinkedList<Call> callerInstructionList = new LinkedList<>();
    public int argumentLimit;
    public int temporaryCnt = 0;

    private BasicBlock entryBlock = new BasicBlock(this, "entry");
    private BasicBlock exitBlock = new BasicBlock(this, "exit");
    private List<Return> returnInstList = new ArrayList<>();
    private Register referenceForClassMethod = null;
    private List<Register> parameterList = new ArrayList<>();
    private List<Register> allParameterList = new ArrayList<>();
    private List<BasicBlock> postOrderDFSBBList = null;
    private List<BasicBlock> reversePostOrderDFSBBList = null;
    private List<BasicBlock> reverseCFGPostOrderDFSBBList = null;
    private Set<BasicBlock> visit = null;
    private Set<VirtualRegister> globals = new HashSet<>();
    private String name;

    public String builtinFunctionName;

    public Function(String name) {
        this.name = name;
        this.functionInfo = new FunctionInfo();
    }

    public Function(String name, String builtinFunctionName) {
        this.name = name;
        this.builtinFunctionName = builtinFunctionName;
        this.functionInfo = new FunctionInfo();
    }

    public void appendReturnList(Return irInstruction) {
        returnInstList.add(irInstruction);
    }

    public void appendParameterList(Register register) {
        parameterList.add(register);
    }

    public void appendGlobals(VirtualRegister virtualRegister) {
        globals.add(virtualRegister);
    }

    public void setParameterList(List<Register> parameterList) {
        this.parameterList = parameterList;
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

    public Set<VirtualRegister> getGlobals() {
        return globals;
    }

    public Register getReferenceForClassMethod() {
        return referenceForClassMethod;
    }

    public void setReferenceForClassMethod(Register referenceForClassMethod) {
        this.referenceForClassMethod = referenceForClassMethod;
    }

    public List<Return> getReturnInstList() {
        return returnInstList;
    }

    public List<Register> getParameterList() {
        return parameterList;
    }

    public List<Register> getAllParameterList() {
        allParameterList.clear();
        if (referenceForClassMethod != null) allParameterList.add(referenceForClassMethod);
        allParameterList.addAll(parameterList);
        return allParameterList;
    }

    public List<BasicBlock> getReversePostOrderDFSBBList() {
        if (reversePostOrderDFSBBList == null) calcReversePostOrderDFSBBList();
        return reversePostOrderDFSBBList;
    }

    public void recalcReversePostOrderDFSBBList() {
        calcReversePostOrderDFSBBList();
    }

    private void calcReversePostOrderDFSBBList() {
        reversePostOrderDFSBBList = new ArrayList<>();
        visit = new HashSet<>();
        postOrderDFS(entryBlock);
        for (int i = 0; i < reversePostOrderDFSBBList.size(); i++) {
            reversePostOrderDFSBBList.get(i).postOrderNumber = i;
        }
        Collections.reverse(reversePostOrderDFSBBList);
    }

    public List<BasicBlock> getPostOrderDFSBBList() {
        if (postOrderDFSBBList == null) {
            postOrderDFSBBList = new ArrayList<>();
            postOrderDFSBBList.addAll(reversePostOrderDFSBBList);
            Collections.reverse(postOrderDFSBBList);
        }
        return postOrderDFSBBList;
    }

    private void postOrderDFS(BasicBlock nowBB) {
        visit.add(nowBB);
        nowBB.getSuccessors().forEach(x -> {
            if (!visit.contains(x)) postOrderDFS(x);
        });
        reversePostOrderDFSBBList.add(nowBB);
    }

    public void calcReverseCFGPostOrderNumber() {
        visit = new HashSet<>();
        reverseCFGPostOrderDFSBBList = new LinkedList<>();
        reverseCFGPostOrderDFS(exitBlock);
        for (int i = 0; i < reverseCFGPostOrderDFSBBList.size(); i++) {
            reverseCFGPostOrderDFSBBList.get(i).reversePostOrderNumber = i;
        }
    }

    private void reverseCFGPostOrderDFS(BasicBlock nowBB) {
        visit.add(nowBB);
        nowBB.getPredecessors().forEach(x -> {
            if (!visit.contains(x)) reverseCFGPostOrderDFS(x);
        });
        reverseCFGPostOrderDFSBBList.add(nowBB);
    }

    public boolean reachable(BasicBlock basicBlock) {
        return visit.contains(basicBlock);
    }

    public void updateCalleeSet() {
        calleeSet.clear();
        getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                if (irInstruction instanceof Call) calleeSet.add(((Call) irInstruction).getCallee());
        });
    }

    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    public static class FunctionInfo {
        public Set<GlobalVariable> defGlobalVariable = new HashSet<>();
        public Set<GlobalVariable> recursiveUseGlobalVariable = new HashSet<>();
        public Set<GlobalVariable> recursiveDefGlobalVariable = new HashSet<>();
        public Map<GlobalVariable, VirtualRegister> globalTemporal = new HashMap<>();
    }
}


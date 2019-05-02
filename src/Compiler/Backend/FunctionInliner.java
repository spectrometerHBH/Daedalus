package Compiler.Backend;

//-inline: Function Integration/Inlining
//Bottom-up inlining of functions into callees.
//LLVM Pass
//TODO

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FunctionInliner {
    private IRRoot irRoot;
    private int inlineCalleeInstructionLimit = 50;
    private int inlineMaxDepth = 2;

    private Map<Function, Integer> functionInstructionCountMap = new HashMap<>();
    private Map<Function, Integer> functionCalledCountMap = new HashMap<>();
    private Map<Function, Function> unlimitedFunctionWorks = new HashMap<>();
    private Map<Function, Integer> functionFakerCountMap = new HashMap<>();
    private List<IRInstruction> tmpIRInstructionList = new ArrayList<>();

    private Map<BasicBlock, BasicBlock> basicBlockFakerMap = new HashMap<>();
    private Map<Operand, Operand> registerFakerMap = new HashMap<>();

    public FunctionInliner(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        collectStatistics();
        nonRecursiveInline();
        recursiveInline();
    }

    private void collectStatistics() {
        irRoot.getFunctionMap().values().forEach(function -> functionCalledCountMap.put(function, 0));
        irRoot.getFunctionMap().values().forEach(function -> {
            int instructionCount = 0;
            for (BasicBlock basicBlock : function.getReversePostOrderDFSBBList()) {
                for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                    instructionCount++;
                    if (irInstruction instanceof Call) {
                        Function callee = ((Call) irInstruction).getCallee();
                        if (functionCalledCountMap.containsKey(callee))
                            functionCalledCountMap.put(callee, functionCalledCountMap.get((callee)) + 1);
                    }
                }
            }
            functionInstructionCountMap.put(function, instructionCount);
        });
    }

    private Function functionFaker(Function function) {
        int fakeCount = functionFakerCountMap.getOrDefault(function, 0);
        fakeCount = fakeCount + 1;
        functionFakerCountMap.put(function, fakeCount);
        Function fakeFunction = new Function("fake_" + function.getName() + "_" + fakeCount);
        basicBlockFakerMap.clear();
        registerFakerMap.clear();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> basicBlockFakerMap.put(basicBlock, new BasicBlock(fakeFunction, basicBlock.getName())));
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            BasicBlock fakeBB = basicBlockFakerMap.get(basicBlock);
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                if (irInstruction == basicBlock.tail)
                    fakeBB.terminate(irInstruction.getFakeInstruction(basicBlockFakerMap, registerFakerMap));
                else fakeBB.appendInst(irInstruction.getFakeInstruction(basicBlockFakerMap, registerFakerMap));
        });
        fakeFunction.setEntryBlock(basicBlockFakerMap.get(function.getEntryBlock()));
        fakeFunction.setExitBlock(basicBlockFakerMap.get(function.getExitBlock()));
        fakeFunction.setReferenceForClassMethod(function.getReferenceForClassMethod());
        fakeFunction.setParameterList(function.getParameterList());
        return fakeFunction;
    }

    private void traceON() {
        unlimitedFunctionWorks.clear();
        for (Function function : irRoot.getFunctionMap().values()) {
            if (function.recursiveCalleeSet.contains(function)) {
                unlimitedFunctionWorks.put(function, functionFaker(function));
            }
        }
    }

    private boolean worthNonRecursiveInline(Function callee) {
        if (functionCalledCountMap.get(callee) == null) return false;
        if (callee.recursiveCalleeSet.contains(callee)) return false;
        if (callee.getReferenceForClassMethod() != null) return false;
        return functionInstructionCountMap.get(callee) <= inlineCalleeInstructionLimit;
    }

    private boolean worthRecursiveInline(Function callee) {
        if (functionCalledCountMap.get(callee) == null) return false;
        if (callee.getReferenceForClassMethod() != null) return false;
        return functionInstructionCountMap.get(callee) <= inlineCalleeInstructionLimit;
    }

    private void initRegisterFakerMap() {
        registerFakerMap.clear();
        irRoot.getGlobalVariableList().forEach(globalVariable -> registerFakerMap.put((GlobalI64Value) globalVariable, (GlobalI64Value) globalVariable));
        irRoot.getStaticStringList().forEach(staticString -> registerFakerMap.put(staticString.getBase(), staticString.getBase()));
    }

    private IRInstruction doInline(Call callInst) {
        Function caller = callInst.getCurrentBB().getCurrentFunction();
        Function callee = unlimitedFunctionWorks.getOrDefault(callInst.getCallee(), callInst.getCallee());
        //split the block
        BasicBlock splitter = new BasicBlock(caller, "splitter");
        callInst.getCurrentBB().getSuccessors().forEach(successor -> successor.replacePredecessor(callInst.getCurrentBB(), splitter));
        tmpIRInstructionList.clear();
        for (IRInstruction irInstruction = callInst.getCurrentBB().tail, nextInstruction; irInstruction != callInst; irInstruction = nextInstruction) {
            nextInstruction = irInstruction.getLastInstruction();
            callInst.getCurrentBB().removeInst();
            tmpIRInstructionList.add(irInstruction);
        }
        for (int i = tmpIRInstructionList.size() - 1; i >= 0; i--) {
            IRInstruction irInstruction = tmpIRInstructionList.get(i);
            irInstruction.setCurrentBB(splitter);
            if (irInstruction instanceof Return || irInstruction instanceof Jump || irInstruction instanceof Branch)
                splitter.terminate(irInstruction);
            else splitter.appendInst(irInstruction);
        }
        splitter.head.setLastInstruction(null);
        //set prolog and epilog
        basicBlockFakerMap.clear();
        initRegisterFakerMap();
        basicBlockFakerMap.put(callee.getEntryBlock(), callInst.getCurrentBB());
        basicBlockFakerMap.put(callee.getExitBlock(), splitter);
        if (caller.getExitBlock() == callInst.getCurrentBB()) caller.setExitBlock(splitter);
        for (int i = 0; i < callInst.getParameterList().size(); i++) {
            Register oldParameter = callee.getAllParamterList().get(i);
            VirtualRegister newParameter = new I64Value(oldParameter.getName());
            callInst.prependInstruction(new Move(callInst.getCurrentBB(), callInst.getParameterList().get(i), newParameter));
            registerFakerMap.put(oldParameter, newParameter);
        }
        callInst.removeSelf();
        for (BasicBlock realBB : callee.getReversePostOrderDFSBBList()) {
            if (!basicBlockFakerMap.containsKey(realBB))
                basicBlockFakerMap.put(realBB, new BasicBlock(caller, "faker_" + realBB.getName()));
        }
        IRInstruction splitterHead = splitter.head;
        for (BasicBlock realBB : callee.getReversePostOrderDFSBBList()) {
            BasicBlock fakeBB = basicBlockFakerMap.get(realBB);
            for (IRInstruction irInstruction = realBB.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                for (Register register : irInstruction.getUseRegisters())
                    if (!registerFakerMap.containsKey(register)) {
                        registerFakerMap.put(register, new I64Value(register.getName()));
                    }
                if (irInstruction.getDefRegister() != null) {
                    if (!registerFakerMap.containsKey(irInstruction.getDefRegister())) {
                        registerFakerMap.put(irInstruction.getDefRegister(), new I64Value(irInstruction.getDefRegister().getName()));
                    }
                }
                if (fakeBB == splitter) {
                    if (irInstruction != realBB.tail) {
                        splitterHead.prependInstruction(irInstruction.getFakeInstruction(basicBlockFakerMap, registerFakerMap));
                    }
                } else {
                    if (irInstruction == realBB.tail)
                        fakeBB.terminate(irInstruction.getFakeInstruction(basicBlockFakerMap, registerFakerMap));
                    else fakeBB.appendInst(irInstruction.getFakeInstruction(basicBlockFakerMap, registerFakerMap));
                }
            }
        }
        if (!callInst.getCurrentBB().isTerminated())
            callInst.getCurrentBB().terminate(new Jump(callInst.getCurrentBB(), splitter));
        Return returnInst = (Return) callee.getExitBlock().tail;
        if (returnInst.getReturnValue() != null)
            splitterHead.prependInstruction(new Move(splitter, registerFakerMap.getOrDefault(returnInst.getReturnValue(), returnInst.getReturnValue()), callInst.getResult()));
        return splitter.head;
    }

    private void nonRecursiveInline() {
        for (boolean changed = true; changed; ) {
            changed = false;
            for (Function function : irRoot.getFunctionMap().values()) {
                for (BasicBlock basicBlock : function.getReversePostOrderDFSBBList()) {
                    for (IRInstruction irInstruction = basicBlock.head, nextInstruction; irInstruction != null; irInstruction = nextInstruction) {
                        nextInstruction = irInstruction.getNextInstruction();
                        if (irInstruction instanceof Call && worthNonRecursiveInline(((Call) irInstruction).getCallee())) {
                            Function callee = ((Call) irInstruction).getCallee();
                            changed = true;
                            nextInstruction = doInline((Call) irInstruction);
                            functionInstructionCountMap.put(function, functionInstructionCountMap.get(function) + functionInstructionCountMap.get(callee));
                            functionCalledCountMap.put(callee, functionCalledCountMap.get(callee) - 1);
                        }
                    }
                }
                function.recalcReversePostOrderDFSBBList();
            }
            for (Map.Entry<Function, Integer> entry : functionCalledCountMap.entrySet()) {
                if (entry.getValue() == 0 && !entry.getKey().getName().equals("__init"))
                    irRoot.removeFunction(entry.getKey());
            }
        }
        irRoot.getFunctionMap().values().forEach(Function::updateCalleeSet);
        irRoot.calcRecursiveCalleeSet();
    }

    private void recursiveInline() {
        boolean changed = true;
        for (int i = 0; i < inlineMaxDepth && changed; i++) {
            changed = false;
            traceON();
            for (Function function : irRoot.getFunctionMap().values()) {
                for (BasicBlock basicBlock : function.getReversePostOrderDFSBBList()) {
                    for (IRInstruction irInstruction = basicBlock.head, nextInstruction; irInstruction != null; irInstruction = nextInstruction) {
                        nextInstruction = irInstruction.getNextInstruction();
                        if (irInstruction instanceof Call && worthRecursiveInline(((Call) irInstruction).getCallee())) {
                            Function callee = ((Call) irInstruction).getCallee();
                            changed = true;
                            nextInstruction = doInline((Call) irInstruction);
                            functionInstructionCountMap.put(function, functionInstructionCountMap.get(function) + functionInstructionCountMap.get(callee));
                        }
                    }
                }
                function.recalcReversePostOrderDFSBBList();
            }
        }
        irRoot.getFunctionMap().values().forEach(Function::updateCalleeSet);
        irRoot.calcRecursiveCalleeSet();
    }
}

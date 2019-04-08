package Compiler.Backend;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

import java.util.*;

public class GlobalVariableResolver {
    private IRRoot irRoot;

    public GlobalVariableResolver(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        Map<Register, Register> renameMap = new HashMap<>();
        irRoot.getFunctionMap().forEach((name, function) -> {
            function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
                for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                    if ((irInstruction instanceof Load && ((Load) irInstruction).isInsertedForGlobalVariable()) ||
                            (irInstruction instanceof Store && ((Store) irInstruction).isInsertedForGlobalVariable()))
                        continue;

                    List<Register> useRegisters = irInstruction.getUseRegisters();
                    Register defRegister = irInstruction.getDefRegister();
                    if (!useRegisters.isEmpty()) {
                        renameMap.clear();
                        for (Register useRegister : useRegisters)
                            if (useRegister instanceof GlobalVariable && !((GlobalI64Value)useRegister).isString())
                                renameMap.put(useRegister, getTemporal((GlobalVariable) useRegister, function.functionInfo.globalTemporal));
                            else
                                renameMap.put(useRegister, useRegister);
                        irInstruction.setUseRegisters(renameMap);
                    }
                    if (defRegister instanceof GlobalVariable && !((GlobalI64Value)defRegister).isString()) {
                        irInstruction.setDefRegister(getTemporal((GlobalVariable) defRegister, function.functionInfo.globalTemporal));
                        function.functionInfo.defGlobalVariable.add((GlobalVariable) defRegister);
                    }
                }
            });
            function.functionInfo.globalTemporal.forEach(((globalVariable, temporal) -> {
                function.getEntryBlock().appendFront(new Load(function.getEntryBlock(), (GlobalI64Value) globalVariable, temporal, true));
            }));
        });

        irRoot.getFunctionMap().forEach((name, function) -> {
            function.functionInfo.recursiveUseGlobalVariable.addAll(function.functionInfo.globalTemporal.keySet());
            function.functionInfo.recursiveDefGlobalVariable.addAll(function.functionInfo.defGlobalVariable);
            function.recursiveCalleeSet.forEach(callee -> {
                function.functionInfo.recursiveUseGlobalVariable.addAll(callee.functionInfo.globalTemporal.keySet());
                function.functionInfo.recursiveDefGlobalVariable.addAll(callee.functionInfo.defGlobalVariable);
            });
        });

        Set<GlobalVariable> reloadSet = new HashSet<>();
        irRoot.getFunctionMap().forEach((name, function) -> {
            Set<GlobalVariable> useGlobalVariable = function.functionInfo.globalTemporal.keySet();
            if (!useGlobalVariable.isEmpty()) {
                function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
                    for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                        if (!(irInstruction instanceof Call)) continue;
                        Function callee = ((Call) irInstruction).getCallee();

                        for (GlobalVariable defGlobalVariable : function.functionInfo.defGlobalVariable) {
                            if (callee.functionInfo.recursiveUseGlobalVariable.contains(defGlobalVariable))
                                irInstruction.prependInstruction(new Store(basicBlock, function.functionInfo.globalTemporal.get(defGlobalVariable), (GlobalI64Value) defGlobalVariable, true));
                        }

                        if (callee.functionInfo.recursiveDefGlobalVariable.isEmpty()) continue;
                        reloadSet.clear();
                        reloadSet.addAll(callee.functionInfo.recursiveDefGlobalVariable);
                        reloadSet.retainAll(useGlobalVariable);
                        for (GlobalVariable globalVariable : reloadSet)
                            irInstruction.postpendInstruction(new Load(basicBlock, (GlobalI64Value) globalVariable, function.functionInfo.globalTemporal.get(globalVariable), true));
                    }
                });
            }
        });

        irRoot.getFunctionMap().forEach((name, function) -> {
            Return ret = function.getReturnInstList().get(0);
            for (GlobalVariable globalVariable : function.functionInfo.defGlobalVariable) {
                ret.prependInstruction(new Store(ret.getCurrentBB(), function.functionInfo.globalTemporal.get(globalVariable), (GlobalI64Value) globalVariable, true));
            }
        });
    }

    private VirtualRegister getTemporal(GlobalVariable useRegister, Map<GlobalVariable, VirtualRegister> globalTemporal) {
        VirtualRegister temporal = globalTemporal.get(useRegister);
        if (temporal == null) {
            temporal = new I64Value();
            globalTemporal.put(useRegister, temporal);
        }
        return temporal;
    }
}

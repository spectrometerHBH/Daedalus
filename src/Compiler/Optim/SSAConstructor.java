package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Call;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Phi;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

class SSAConstructor extends Pass {
    Set<Integer> clearIndex = new HashSet<>();

    SSAConstructor(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            computeDominateTree(function);
            computeDominanceFrontier(function);
            findGlobalNames(function);
            insertPhiFunction(function);
            renameVariables(function);
        });
        return true;
    }

    private void findGlobalNames(Function function) {
        List<BasicBlock> basicBlockList = function.getReversePostOrderDFSBBList();
        Set<VirtualRegister> varKill = new HashSet<>();
        for (BasicBlock basicBlock : basicBlockList) {
            varKill.clear();
            for (IRInstruction irInstruction = basicBlock.head; ; irInstruction = irInstruction.getNextInstruction()) {
                List<Register> useRegisters = irInstruction.getUseRegisters();
                Register defRegister = irInstruction.getDefRegister();
                useRegisters.forEach(useRegister -> {
                    if (useRegister instanceof VirtualRegister && !varKill.contains(useRegister))
                        function.appendGlobals((VirtualRegister) useRegister);
                    if (useRegister instanceof VirtualRegister && ((VirtualRegister) useRegister).info == null)
                        ((VirtualRegister) useRegister).info = new VirtualRegister.RegisterInformation();
                });
                if (defRegister instanceof VirtualRegister) {
                    varKill.add((VirtualRegister) defRegister);
                    if (((VirtualRegister) defRegister).info == null)
                        ((VirtualRegister) defRegister).info = new VirtualRegister.RegisterInformation();
                    ((VirtualRegister) defRegister).info.defBB.add(basicBlock);
                }
                if (!irInstruction.hasNextInstruction()) break;
            }
        }
    }

    private void insertPhiFunction(Function function) {
        Queue<BasicBlock> workList = new LinkedList<>();
        Set<BasicBlock> visited = new HashSet<>();
        function.getGlobals().forEach(x -> {
            workList.clear();
            visited.clear();
            workList.addAll(x.info.defBB);
            while (!workList.isEmpty()) {
                BasicBlock b = workList.remove();
                b.DF.forEach(d -> {
                    if (!visited.contains(d)) {
                        visited.add(d);
                        d.appendFront(new Phi(d, x));
                        workList.add(d);
                    }
                });
            }
        });
    }

    private void rename(BasicBlock basicBlock) {
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
            if (!(irInstruction instanceof Phi)) break;
            VirtualRegister dst = (VirtualRegister) ((Phi) irInstruction).getDst();
            ((Phi) irInstruction).setDst(dst.getSSARenameRegister(dst.getNewId()));
        }

        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
            if (!(irInstruction instanceof Phi)) {
                irInstruction.renameUseRegistersForSSA();
                irInstruction.renameDefRegisterForSSA();
            }

        for (BasicBlock successor : basicBlock.getSuccessors()) {
            for (IRInstruction irInstruction = successor.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                if (!(irInstruction instanceof Phi)) break;
                VirtualRegister origin = ((VirtualRegister) ((Phi) irInstruction).getDst()).getOrigin();
                VirtualRegister alias = origin.info.stack.empty() ? null : origin.getSSARenameRegister(origin.info.stack.peek());
                ((Phi) irInstruction).getPaths().put(basicBlock, alias);
            }
        }

        basicBlock.DTSuccessors.forEach(this::rename);

        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
            VirtualRegister dst = (VirtualRegister) irInstruction.getDefRegister();
            if (dst != null) {
                dst.getOrigin().info.stack.pop();
            }
        }
    }

    private void renameVariables(Function function) {
        VirtualRegister _this = (VirtualRegister) function.getReferenceForClassMethod();
        boolean eliminateThis = false;
        if (_this != null) {
            if (_this.info == null) {
                //if _this is not used, eliminate its argument passing
                for (Call call : function.callerInstructionList) call.setObjectPointer(null);
                function.setReferenceForClassMethod(null);
                eliminateThis = true;
            } else function.setReferenceForClassMethod(_this.getSSARenameRegister(_this.getNewId()));
        }

        for (int i = 0; i < function.getParameterList().size(); i++) {
            VirtualRegister parameter = (VirtualRegister) function.getParameterList().get(i);
            if (parameter.info == null) {
                //if parameter is not used/def, eliminate its argument passing
                for (Call call : function.callerInstructionList) call.getParameterList().set(i, null);
                function.getParameterList().set(i, null);
            } else function.getParameterList().set(i, parameter.getSSARenameRegister(parameter.getNewId()));
        }
        function.getParameterList().removeAll(Collections.singleton(null));
        for (Call call : function.callerInstructionList) call.getParameterList().removeAll(Collections.singleton(null));

        rename(function.getEntryBlock());

        if (_this != null && !eliminateThis) _this.getOrigin().info.stack.pop();
        function.getParameterList().forEach(parameter -> ((VirtualRegister) parameter).getOrigin().info.stack.pop());
    }
}

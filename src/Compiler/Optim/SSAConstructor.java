package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Phi;
import Compiler.IR.Operand.Register;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

class SSAConstructor extends Pass {
    SSAConstructor(IRRoot irRoot) {
        super(irRoot);
    }

    void run() {
        irRoot.getFunctionMap().forEach((name, function) -> {
            computeDominateTree(function);
            computeDominanceFrontier(function);
            findGlobalNames(function);
            insertPhiFunction(function);
            renameVariables(function);
        });
    }

    private void computeDominateTree(Function function) {
        List<BasicBlock> RPO = function.getReversePostOrderDFSBBList();
        List<BasicBlock> basicBlockList = RPO.subList(1, RPO.size());
        basicBlockList.forEach(basicBlock -> basicBlock.IDOM = null);
        function.getEntryBlock().IDOM = function.getEntryBlock();
        boolean changed = true;
        while (changed) {
            changed = false;
            for (BasicBlock basicBlock : basicBlockList) {
                BasicBlock newIDOM = null;
                for (BasicBlock predecessor : basicBlock.getPredecessors()) {
                    if (predecessor.IDOM != null) newIDOM = predecessor;
                }
                for (BasicBlock predecessor : basicBlock.getPredecessors()) {
                    if (predecessor != newIDOM && predecessor.IDOM != null)
                        newIDOM = intersect(predecessor, newIDOM);
                }
                if (basicBlock.IDOM != newIDOM) {
                    basicBlock.IDOM = newIDOM;
                    changed = true;
                }
            }
        }
    }

    private BasicBlock intersect(BasicBlock basicBlock1, BasicBlock basicBlock2) {
        BasicBlock finger1 = basicBlock1;
        BasicBlock finger2 = basicBlock2;
        while (finger1 != finger2) {
            while (finger1.postOrderNumber < finger2.postOrderNumber) finger1 = finger1.IDOM;
            while (finger2.postOrderNumber < finger1.postOrderNumber) finger2 = finger2.IDOM;
        }
        return finger1;
    }

    private void computeDominanceFrontier(Function function) {
        List<BasicBlock> basicBlockList = function.getReversePostOrderDFSBBList();
        basicBlockList.forEach(basicBlock -> basicBlock.DF = new HashSet<>());
        for (BasicBlock basicBlock : basicBlockList) {
            if (basicBlock.getPredecessors().size() >= 2) {
                for (BasicBlock predecessor : basicBlock.getPredecessors()) {
                    BasicBlock runner = predecessor;
                    while (runner != basicBlock.IDOM) {
                        runner.DF.add(basicBlock);
                        runner = runner.IDOM;
                    }
                }
            }
        }
    }

    //find all global variables that used in one BB but not defined in that BB
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
                        ((VirtualRegister) useRegister).initRegisterInformation();
                });
                if (defRegister instanceof VirtualRegister) {
                    varKill.add((VirtualRegister) defRegister);
                    if (((VirtualRegister) defRegister).info == null)
                        ((VirtualRegister) defRegister).initRegisterInformation();
                    ((VirtualRegister) defRegister).appendDefBB(basicBlock);
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
            workList.addAll(x.getDefBB());
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

    private void renameVariables(Function function) {

    }
}

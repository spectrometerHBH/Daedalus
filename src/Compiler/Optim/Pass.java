package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Operand.Register;

import java.util.*;

public abstract class Pass {
    protected IRRoot irRoot;
    protected boolean changed;
    //def-use chain information
    protected Map<Register, IRInstruction> def;
    protected Map<Register, Set<IRInstruction>> use;
    //natural loop information
    protected Set<BasicBlock> loopHeaders;
    protected Map<BasicBlock, Set<BasicBlock>> loopBackers;
    protected Map<BasicBlock, Set<BasicBlock>> belongingLoopHeaders;
    protected Map<BasicBlock, Set<BasicBlock>> loopGroups;
    //instruction collection
    private LinkedList<IRInstruction> allStatements;

    Pass(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    abstract boolean run();

    void calcDefUseChain(Function function) {
        def = new HashMap<>();
        use = new HashMap<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                Register defRegister = irInstruction.getDefRegister();
                if (defRegister != null) {
                    def.put(defRegister, irInstruction);
                    use.computeIfAbsent(defRegister, k -> new HashSet<>());
                }
                for (Register useRegister : irInstruction.getUseRegisters()) {
                    use.computeIfAbsent(useRegister, k -> new HashSet<>());
                    use.get(useRegister).add(irInstruction);
                }
            }
        });
    }

    LinkedList<IRInstruction> getAllStatements(Function function) {
        allStatements = new LinkedList<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                allStatements.add(irInstruction);
        });
        return allStatements;
    }

    //Dominator Tree Construction
    //This pass is a simple dominator construction algorithm for finding forward dominators.
    //LLVM Pass
    private void computeDominateTreeAllSuccessors(BasicBlock basicBlock) {
        basicBlock.DTAllSuccessors = new HashSet<>();
        basicBlock.DTAllSuccessors.add(basicBlock);
        basicBlock.DTSuccessors.forEach(this::computeDominateTreeAllSuccessors);
        basicBlock.DTSuccessors.forEach(successor -> basicBlock.DTAllSuccessors.addAll(successor.DTAllSuccessors));
    }

    void computeDominateTree(Function function) {
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
        RPO.forEach(basicBlock -> basicBlock.DTSuccessors = new HashSet<>());
        basicBlockList.forEach(basicBlock -> basicBlock.IDOM.DTSuccessors.add(basicBlock));
        computeDominateTreeAllSuccessors(function.getEntryBlock());
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

    //Dominance Frontier Construction
    //This pass is a simple dominator construction algorithm for finding forward dominator frontiers.
    //LLVM Pass
    void computeDominanceFrontier(Function function) {
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

    //Post-Dominator Tree Construction
    //This pass is a simple post-dominator construction algorithm for finding post-dominators.
    //LLVM Pass
    void computePostDominateTree(Function function) {
        function.calcReverseCFGPostOrderNumber();
        List<BasicBlock> basicBlockList = new LinkedList<>(function.getReversePostOrderDFSBBList());
        Collections.reverse(basicBlockList);
        basicBlockList.remove(function.getExitBlock());
        function.getExitBlock().postIDOM = function.getExitBlock();
        boolean changed = true;
        while (changed) {
            changed = false;
            for (BasicBlock basicBlock : basicBlockList) {
                BasicBlock newPostIDOM = null;
                for (BasicBlock successor : basicBlock.getSuccessors()) {
                    if (successor.postIDOM != null) newPostIDOM = successor;
                }
                for (BasicBlock successor : basicBlock.getSuccessors()) {
                    if (successor != newPostIDOM && successor.postIDOM != null)
                        newPostIDOM = intersectPost(successor, newPostIDOM);
                }
                if (basicBlock.postIDOM != newPostIDOM) {
                    basicBlock.postIDOM = newPostIDOM;
                    changed = true;
                }
            }
        }
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> basicBlock.RDFSuccessors = new HashSet<>());
        basicBlockList.forEach(basicBlock -> basicBlock.postIDOM.RDFSuccessors.add(basicBlock));
    }

    private BasicBlock intersectPost(BasicBlock basicBlock1, BasicBlock basicBlock2) {
        BasicBlock finger1 = basicBlock1;
        BasicBlock finger2 = basicBlock2;
        while (finger1 != finger2) {
            while (finger1.reversePostOrderNumber < finger2.reversePostOrderNumber) finger1 = finger1.postIDOM;
            while (finger2.reversePostOrderNumber < finger1.reversePostOrderNumber) finger2 = finger2.postIDOM;
        }
        return finger1;
    }

    //Post-Dominance Frontier Construction
    //This pass is a simple post-dominator construction algorithm for finding post-dominator frontiers.
    //LLVM Pass
    void computeReverseDominantFrontier(Function function) {
        List<BasicBlock> basicBlockList = function.getReversePostOrderDFSBBList();
        basicBlockList.forEach(basicBlock -> basicBlock.RDF = new HashSet<>());
        for (BasicBlock basicBlock : basicBlockList) {
            if (basicBlock.getSuccessors().size() >= 2) {
                for (BasicBlock successor : basicBlock.getSuccessors()) {
                    BasicBlock runner = successor;
                    while (runner != basicBlock.postIDOM) {
                        runner.RDF.add(basicBlock);
                        runner = runner.postIDOM;
                    }
                }
            }
        }
    }

    //Natural Loop Information
    //This analysis is used to identify natural loops and determine the loop depth of various nodes of the CFG.
    //Note that the loops identified may actually be several natural loops that share the same header node not just a single natural loop.
    //LLVM Pass
    void calcLoopInformation(Function function) {
        computeDominateTree(function);
        //mark loop headers and record loop backers
        loopHeaders = new HashSet<>();
        loopBackers = new HashMap<>();
        belongingLoopHeaders = new HashMap<>();
        loopGroups = new HashMap<>();
        for (BasicBlock basicBlock : function.getReversePostOrderDFSBBList()) {
            for (BasicBlock successor : basicBlock.getSuccessors()) {
                if (successor.DTAllSuccessors.contains(basicBlock)) {
                    loopHeaders.add(successor);
                    loopBackers.computeIfAbsent(successor, k -> new HashSet<>());
                    loopBackers.get(successor).add(basicBlock);
                }
            }
        }
        //compute loop groups
        Stack<BasicBlock> workList = new Stack<>();
        for (BasicBlock loopHeader : loopHeaders) {
            workList.clear();
            loopGroups.put(loopHeader, new HashSet<>());
            loopGroups.get(loopHeader).add(loopHeader);
            for (BasicBlock backer : loopBackers.get(loopHeader)) {
                workList.add(backer);
                loopGroups.get(loopHeader).add(backer);
                for (; !workList.isEmpty(); ) {
                    BasicBlock nowBlock = workList.pop();
                    for (BasicBlock predecessor : nowBlock.getPredecessors())
                        if (!loopGroups.get(loopHeader).contains(predecessor)) {
                            loopGroups.get(loopHeader).add(predecessor);
                            workList.add(predecessor);
                            belongingLoopHeaders.computeIfAbsent(predecessor, k -> new HashSet<>());
                            belongingLoopHeaders.get(predecessor).add(loopHeader);
                        }
                }
            }
        }
    }
}

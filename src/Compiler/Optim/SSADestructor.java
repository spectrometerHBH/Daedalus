package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.I64Value;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;
import Compiler.IR.Operand.VirtualRegister;

import java.util.*;

class SSADestructor extends Pass {
    private Map<BasicBlock, List<ParallelCopy>> parallelCopyInfo = new HashMap<>();

    SSADestructor(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    void run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            removePhiFunction(function);
            function.recalcReversePostOrderDFSBBList();
            sequentializationParallelCopy(function);
        });
    }

    private void removePhiFunction(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> parallelCopyInfo.computeIfAbsent(basicBlock, k -> new LinkedList<>()));
        Map<BasicBlock, List<ParallelCopy>> PCmap = new HashMap<>();
        List<BasicBlock> predecessors = new LinkedList<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            PCmap.clear();
            predecessors.clear();
            predecessors.addAll(basicBlock.getPredecessors());
            predecessors.forEach(predecessor -> {
                if (predecessor.getSuccessors().size() > 1) {
                    BasicBlock pcBB = new BasicBlock(function, "parallel_copy");
                    pcBB.terminate(new Jump(pcBB, basicBlock));
                    ((Branch) predecessor.tail).replaceTarget(basicBlock, pcBB);
                    predecessor.getSuccessors().remove(basicBlock);
                    predecessor.getSuccessors().add(pcBB);
                    pcBB.getPredecessors().add(predecessor);
                    pcBB.getSuccessors().add(basicBlock);
                    basicBlock.getPredecessors().remove(predecessor);
                    basicBlock.getPredecessors().add(pcBB);
                    parallelCopyInfo.computeIfAbsent(pcBB, k -> new LinkedList<>());
                    PCmap.put(predecessor, parallelCopyInfo.get(pcBB));
                } else
                    PCmap.put(predecessor, parallelCopyInfo.get(predecessor));
            });

            IRInstruction irInstruction = basicBlock.head;
            for (; irInstruction instanceof Phi; irInstruction = irInstruction.getNextInstruction()) {
                for (Map.Entry<BasicBlock, Operand> entry : ((Phi) irInstruction).getPaths().entrySet()) {
                    BasicBlock comingBasicBlock = entry.getKey();
                    Operand comingRegister = entry.getValue();
                    PCmap.get(comingBasicBlock).add(new ParallelCopy((VirtualRegister) ((Phi) irInstruction).getDst(), comingRegister == null ? new Immediate(0) : comingRegister));
                }
            }

            basicBlock.head = irInstruction;
            basicBlock.head.setLastInstruction(null);
        });
    }

    private void sequentializationParallelCopy(Function function) {
        Queue<VirtualRegister> ready = new LinkedList<>();
        Queue<VirtualRegister> to_do = new LinkedList<>();
        Map<VirtualRegister, VirtualRegister> pred = new HashMap<>();
        Map<VirtualRegister, VirtualRegister> loc = new HashMap<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            ready.clear();
            to_do.clear();
            pred.clear();
            loc.clear();
            VirtualRegister n = new I64Value("breaker");
            pred.put(n, null);
            parallelCopyInfo.get(basicBlock).forEach(parallelCopy -> {
                if (parallelCopy.src instanceof VirtualRegister) {
                    loc.put(parallelCopy.dst, null);
                    pred.put((VirtualRegister) parallelCopy.src, null);
                }
            });
            parallelCopyInfo.get(basicBlock).forEach(parallelCopy -> {
                if (parallelCopy.src instanceof VirtualRegister) {
                    VirtualRegister src = (VirtualRegister) parallelCopy.src;
                    loc.put(src, src);
                    pred.put(parallelCopy.dst, src);
                    to_do.add(parallelCopy.dst);
                }
            });
            parallelCopyInfo.get(basicBlock).forEach(parallelCopy -> {
                if (parallelCopy.src instanceof VirtualRegister) {
                    if (loc.get(parallelCopy.dst) == null)
                        ready.add(parallelCopy.dst);
                }
            });
            while (!to_do.isEmpty()) {
                while (!ready.isEmpty()) {
                    VirtualRegister b = ready.poll();
                    VirtualRegister a = pred.get(b);
                    VirtualRegister c = loc.get(a);
                    basicBlock.tail.prependInstruction(new Move(basicBlock, c, b));
                    loc.put(a, b);
                    if (a == c && pred.get(a) != null) ready.add(a);
                }
                VirtualRegister b = to_do.poll();
                if (b == loc.get(pred.get(b))) {
                    basicBlock.tail.prependInstruction(new Move(basicBlock, b, n));
                    loc.put(b, n);
                    ready.add(b);
                }
            }
            parallelCopyInfo.get(basicBlock).forEach(parallelCopy -> {
                if (parallelCopy.src instanceof Immediate)
                    basicBlock.tail.prependInstruction(new Move(basicBlock, parallelCopy.src, parallelCopy.dst));
            });
        });
    }

    static class ParallelCopy {
        VirtualRegister dst;
        Operand src;

        ParallelCopy(VirtualRegister dst, Operand src) {
            this.dst = dst;
            this.src = src;
        }
    }
}

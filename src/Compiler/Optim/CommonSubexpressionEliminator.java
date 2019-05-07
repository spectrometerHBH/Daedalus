package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.Cmp;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

// Extended Local Common Subexpression Elimination

class CommonSubexpressionEliminator extends Pass {
    private Set<BasicBlock> visit = new HashSet<>();
    private HashMap<BinaryCmpHash, Operand> binaryHashMap = new HashMap<>();

    CommonSubexpressionEliminator(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        irRoot.getFunctionMap().values().forEach(function -> {
            visit.clear();
            function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
                if (!visit.contains(basicBlock)) {
                    binaryHashMap.clear();
                    commonSubexpressionElimination(basicBlock);
                }
            });
        });
        return changed;
    }

    private void commonSubexpressionElimination(BasicBlock basicBlock) {
        visit.add(basicBlock);
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
            if (irInstruction instanceof Binary) {
                BinaryCmpHash binaryCmpHash = new BinaryCmpHash((Binary) irInstruction);
                Operand dst = binaryHashMap.get(binaryCmpHash);
                if (dst != null) {
                    changed = true;
                    ((Binary) irInstruction).previousResult = dst;
                    irInstruction.replaceInstruction(new Move(basicBlock, dst, ((Binary) irInstruction).getDst()));
                } else {
                    ((Binary) irInstruction).previousResult = null;
                    binaryHashMap.put(binaryCmpHash, ((Binary) irInstruction).getDst());
                    if (((Binary) irInstruction).isCommutative()) {
                        BinaryCmpHash binaryCmpHashComm = new BinaryCmpHash((Binary) irInstruction);
                        binaryHashMap.put(binaryCmpHashComm, ((Binary) irInstruction).getDst());
                    }
                }
            } else if (irInstruction instanceof Cmp) {
                BinaryCmpHash binaryCmpHash = new BinaryCmpHash((Cmp) irInstruction);
                Operand dst = binaryHashMap.get(binaryCmpHash);
                if (dst != null) {
                    changed = true;
                    ((Cmp) irInstruction).previousResult = dst;
                    irInstruction.replaceInstruction(new Move(basicBlock, dst, ((Cmp) irInstruction).getDst()));
                } else {
                    ((Cmp) irInstruction).previousResult = null;
                    binaryHashMap.put(binaryCmpHash, ((Cmp) irInstruction).getDst());
                    if (((Cmp) irInstruction).isCommutative()) {
                        BinaryCmpHash binaryCmpHashComm = new BinaryCmpHash((Cmp) irInstruction);
                        binaryHashMap.put(binaryCmpHashComm, ((Cmp) irInstruction).getDst());
                    }
                }
            }
        basicBlock.getSuccessors().forEach(successor -> {
            if (successor.getPredecessors().size() == 1 && successor != basicBlock)
                commonSubexpressionElimination(successor);
        });
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
            if (irInstruction instanceof Binary && ((Binary) irInstruction).previousResult == null) {
                BinaryCmpHash binaryCmpHash = new BinaryCmpHash((Binary) irInstruction);
                binaryHashMap.remove(binaryCmpHash);
                if (((Binary) irInstruction).isCommutative()) {
                    BinaryCmpHash binaryCmpHashComm = new BinaryCmpHash((Binary) irInstruction);
                    binaryHashMap.remove(binaryCmpHashComm);
                }
            } else if (irInstruction instanceof Cmp && ((Cmp) irInstruction).previousResult == null) {
                BinaryCmpHash binaryCmpHash = new BinaryCmpHash((Cmp) irInstruction);
                binaryHashMap.remove(binaryCmpHash);
                if (((Cmp) irInstruction).isCommutative()) {
                    BinaryCmpHash binaryCmpHashComm = new BinaryCmpHash((Cmp) irInstruction);
                    binaryHashMap.remove(binaryCmpHashComm);
                }
            }
    }

    static class BinaryCmpHash {
        String op, src1, src2;

        BinaryCmpHash(Binary inst) {
            this.op = inst.getOp().toString();
            this.src1 = inst.getSrc1() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc1()).getImmediate()) : inst.getSrc1().toString();
            this.src2 = inst.getSrc2() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc2()).getImmediate()) : inst.getSrc2().toString();
        }

        BinaryCmpHash(Cmp inst) {
            this.op = inst.getOp().toString();
            this.src1 = inst.getSrc1() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc1()).getImmediate()) : inst.getSrc1().toString();
            this.src2 = inst.getSrc2() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc2()).getImmediate()) : inst.getSrc2().toString();
        }

        @Override
        public boolean equals(Object object) {
            if (object instanceof BinaryCmpHash)
                return op.equals(((BinaryCmpHash) object).op) && src1.equals(((BinaryCmpHash) object).src1) && src2.equals(((BinaryCmpHash) object).src2);
            else
                return false;
        }

        @Override
        public int hashCode() {
            return op.hashCode() ^ src1.hashCode() ^ src2.hashCode();
        }
    }
}

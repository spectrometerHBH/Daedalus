package Compiler.Optim;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
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
    private HashMap<BinaryHash, Operand> binaryHashMap = new HashMap<>();

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
                BinaryHash binaryHash = new BinaryHash((Binary) irInstruction);
                Operand dst = binaryHashMap.get(binaryHash);
                if (dst != null) {
                    changed = true;
                    ((Binary) irInstruction).previousResult = dst;
                    irInstruction.replaceInstruction(new Move(basicBlock, dst, ((Binary) irInstruction).getDst()));
                } else {
                    ((Binary) irInstruction).previousResult = null;
                    binaryHashMap.put(binaryHash, ((Binary) irInstruction).getDst());
                    if (((Binary) irInstruction).isCommutative()) {
                        BinaryHash binaryHashComm = new BinaryHash((Binary) irInstruction);
                        binaryHashMap.put(binaryHashComm, ((Binary) irInstruction).getDst());
                    }
                }
            }
        basicBlock.getSuccessors().forEach(successor -> {
            if (successor.getPredecessors().size() == 1)
                commonSubexpressionElimination(successor);
        });
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
            if (irInstruction instanceof Binary && ((Binary) irInstruction).previousResult == null) {
                BinaryHash binaryHash = new BinaryHash((Binary) irInstruction);
                binaryHashMap.remove(binaryHash);
                if (((Binary) irInstruction).isCommutative()) {
                    BinaryHash binaryHashComm = new BinaryHash((Binary) irInstruction);
                    binaryHashMap.remove(binaryHashComm);
                }
            }
    }

    static class BinaryHash {
        String op, src1, src2;

        BinaryHash(Binary inst) {
            this.op = inst.getOp().toString();
            this.src1 = inst.getSrc1() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc1()).getImmediate()) : inst.getSrc1().toString();
            this.src2 = inst.getSrc2() instanceof Immediate ? String.valueOf(((Immediate) inst.getSrc2()).getImmediate()) : inst.getSrc2().toString();
        }

        @Override
        public boolean equals(Object object) {
            if (object instanceof BinaryHash)
                return op.equals(((BinaryHash) object).op) && src1.equals(((BinaryHash) object).src1) && src2.equals(((BinaryHash) object).src2);
            else
                return false;
        }

        @Override
        public int hashCode() {
            return op.hashCode() ^ src1.hashCode() ^ src2.hashCode();
        }
    }
}

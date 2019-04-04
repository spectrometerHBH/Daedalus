package Compiler.IR.Instruction;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Operand.Operand;

import java.util.LinkedHashMap;
import java.util.Map;

public class Phi extends IRInstruction {
    private Operand dest;
    private Map<BasicBlock, Operand> paths = new LinkedHashMap<>();

    public Phi(BasicBlock currentBB) {
        super(currentBB);
    }

    public void removePath(BasicBlock basicBlock) {
        paths.remove(basicBlock);
        if (paths.size() == 1) {
            IRInstruction newInstruction = new Move(currentBB, paths.values().iterator().next(), dest);
            replaceInstruction(newInstruction);
            if (this == currentBB.head) currentBB.head = newInstruction;
            if (this == currentBB.tail) currentBB.tail = newInstruction;
        }
    }

    public void replacePath(BasicBlock oldBasicBlock, BasicBlock newBasicBlock) {
        Operand operand = paths.get(oldBasicBlock);
        paths.remove(oldBasicBlock);
        paths.put(newBasicBlock, operand);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

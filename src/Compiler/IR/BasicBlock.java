package Compiler.IR;

import Compiler.IR.Instruction.*;

import java.util.HashSet;
import java.util.Set;

public class BasicBlock {
    public IRInstruction head;
    public IRInstruction tail;
    public BasicBlock IDOM;
    public int postOrderNumber;
    public Set<BasicBlock> DF;

    private Function currentFunction;
    private String name;
    private Set<BasicBlock> predecessors = new HashSet<>();
    private Set<BasicBlock> successors = new HashSet<>();
    private boolean terminated;

    public BasicBlock(Function currentFunction, String name) {
        this.currentFunction = currentFunction;
        this.name = name;
    }

    public String getName() {
        return currentFunction.getName() + "_" + name;
    }

    public Set<BasicBlock> getPredecessors() {
        return predecessors;
    }

    public Set<BasicBlock> getSuccessors() {
        return successors;
    }

    public boolean isTerminated() {
        return terminated;
    }

    private void appendSuccessor(BasicBlock BB) {
        successors.add(BB);
    }

    private void appendPredecessor(BasicBlock BB) {
        predecessors.add(BB);
    }

    private void removeSuccessor(BasicBlock BB) {
        if (BB == null) return;
        successors.remove(BB);
    }

    private void removePredecessor(BasicBlock BB) {
        if (BB == null) return;
        predecessors.remove(BB);
    }

    private void replacePredecessor(BasicBlock oldBB, BasicBlock newBB) {
        predecessors.remove(oldBB);
        predecessors.add(newBB);
        newBB.successors.add(this);
    }

    public void appendInst(IRInstruction irInstruction) {
        if (tail == null) {
            head = tail = irInstruction;
        } else {
            tail.setNextInstruction(irInstruction);
            irInstruction.setLastInstruction(tail);
            tail = irInstruction;
        }
    }

    public void appendFront(IRInstruction irInstruction) {
        if (tail == null) {
            head = tail = irInstruction;
        } else {
            irInstruction.setNextInstruction(head);
            head.setLastInstruction(irInstruction);
            head = irInstruction;
        }
    }

    public void removeInst() {
        terminated = false;
        if (tail == null) {
            throw new RuntimeException("empty BB!");
        } else {
            if (tail instanceof Branch) {
                removeSuccessor(((Branch) tail).getThenBB());
                removeSuccessor(((Branch) tail).getElseBB());
            } else if (tail instanceof Jump) {
                removeSuccessor(((Jump) tail).getTargetBB());
            } else if (tail instanceof Return) {
                currentFunction.getReturnInstList().remove(tail);
            }
            tail = tail.getLastInstruction();
            if (tail != null) tail.setNextInstruction(null);
            else head = tail = null;
        }
    }

    private void appendBB(BasicBlock BB) {
        if (BB == null) return;
        this.appendSuccessor(BB);
        BB.appendPredecessor(this);
    }

    public void terminate(IRInstruction irInstruction) {
        appendInst(irInstruction);
        if (irInstruction instanceof Branch) {
            appendBB(((Branch) irInstruction).getThenBB());
            appendBB(((Branch) irInstruction).getElseBB());
        } else if (irInstruction instanceof Jump) {
            appendBB(((Jump) irInstruction).getTargetBB());
        } else if (irInstruction instanceof Return) {
            currentFunction.appendReturnList((Return) irInstruction);
        }
        terminated = true;
    }

    public void removeSelf() {
        getSuccessors().forEach(successor -> {
            for (IRInstruction irInstruction = successor.head; ; irInstruction = irInstruction.getNextInstruction()) {
                if (irInstruction instanceof Phi) ((Phi) irInstruction).removePath(this);
                else break;
                if (!irInstruction.hasNextInstruction()) break;
            }
        });
        getSuccessors().forEach(successor -> successor.removePredecessor(this));
        getPredecessors().forEach(predecessor -> predecessor.removeSuccessor(this));
    }

    public void mergeBB(BasicBlock newBasicBlock) {
        getSuccessors().forEach(successor -> {
            for (IRInstruction irInstruction = successor.head; ; irInstruction = irInstruction.getNextInstruction()) {
                if (irInstruction instanceof Phi) ((Phi) irInstruction).replacePath(this, newBasicBlock);
                else break;
                if (!irInstruction.hasNextInstruction()) break;
            }
        });
        getSuccessors().forEach(successor -> successor.replacePredecessor(this, newBasicBlock));
        newBasicBlock.removeInst();
        newBasicBlock.appendInst(this.head);
        newBasicBlock.tail = this.tail;
        newBasicBlock.terminated = true;
        for (IRInstruction irInstruction = this.head; ; irInstruction = irInstruction.getNextInstruction()) {
            irInstruction.setCurrentBB(newBasicBlock);
            if (!irInstruction.hasNextInstruction()) break;
        }
    }
}
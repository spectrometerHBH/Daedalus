package Compiler.IR;

import Compiler.IR.Instruction.Branch;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Jump;
import Compiler.IR.Instruction.Return;

import java.util.LinkedList;
import java.util.List;

public class BasicBlock {
    private IRInstruction head;
    private IRInstruction tail;
    private Function currentFunction;
    private String name;
    private List<BasicBlock> predecessors = new LinkedList<>();
    private List<BasicBlock> successors = new LinkedList<>();
    private boolean terminated;

    public BasicBlock(Function currentFunction, String name) {
        this.currentFunction = currentFunction;
        this.name = name;
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
        successors.remove(BB);
        BB.predecessors.remove(this);
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
        }
    }

    private void appendBB(BasicBlock BB) {
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
}
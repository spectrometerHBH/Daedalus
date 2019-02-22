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
    private List<BasicBlock> predecessors = new LinkedList<BasicBlock>();
    private List<BasicBlock> successors = new LinkedList<BasicBlock>();
    private boolean terminated;

    public BasicBlock(Function currentFunction, String name) {
        this.currentFunction = currentFunction;
        this.name = name;
    }

    public boolean isTerminated() {
        return terminated;
    }

    public void appendSuccessor(BasicBlock BB){
        successors.add(BB);
    }

    public void appendPredecessor(BasicBlock BB){
        predecessors.add(BB);
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

    public void appendBB(BasicBlock BB) {
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
        } else if (irInstruction instanceof Return){
            currentFunction.appendReturnList((Return) irInstruction);
        }
        terminated = true;
    }
}
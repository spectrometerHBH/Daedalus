package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.IRVisitor;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.StaticString;
import Compiler.IR.Operand.Storage;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import static Compiler.IR.Operand.PhysicalRegister.rbp;
import static Compiler.IR.Operand.PhysicalRegister.rsp;

public class X86CodeEmitter implements IRVisitor {
    private IRRoot irRoot;
    private PrintStream out;
    private Map<Storage, String> storageStringMap = new HashMap<>();
    private Map<BasicBlock, String> basicBlockStringMap = new HashMap<>();
    private Map<String, Integer> nameCountMap = new HashMap<>();

    public X86CodeEmitter(IRRoot irRoot, PrintStream out) {
        this.irRoot = irRoot;
        this.out = out;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(this::constructStackFrame);
        visit(irRoot);
    }

    private void constructStackFrame(Function function) {
        BasicBlock entryBB = function.getEntryBlock();
        BasicBlock exitBB = function.getExitBlock();
        int stackFrameSize = (Math.max(function.argumentLimit - 6, 0) + function.temporaryCnt) * 8;

        if (stackFrameSize != 0)
            entryBB.head.prependInstruction(new Binary(entryBB, Binary.Op.SUB, rsp, new Immediate(stackFrameSize), rsp));
        entryBB.head.prependInstruction(new Move(entryBB, rsp, rbp));
        entryBB.head.prependInstruction(new Push(entryBB, rbp));

        if (stackFrameSize != 0)
            exitBB.tail.prependInstruction(new Binary(exitBB, Binary.Op.ADD, rsp, new Immediate(stackFrameSize), rsp));
        exitBB.tail.prependInstruction(new Pop(exitBB, rbp));
    }


    @Override
    public void visit(IRRoot irRoot) {

    }

    @Override
    public void visit(Function function) {

    }

    @Override
    public void visit(StaticString staticString) {

    }

    @Override
    public void visit(BasicBlock basicBlock) {

    }

    @Override
    public void visit(Alloc inst) {

    }

    @Override
    public void visit(Binary inst) {

    }

    @Override
    public void visit(Branch inst) {

    }

    @Override
    public void visit(Call inst) {

    }

    @Override
    public void visit(Cmp inst) {

    }

    @Override
    public void visit(Jump inst) {

    }

    @Override
    public void visit(Load inst) {

    }

    @Override
    public void visit(Move inst) {

    }

    @Override
    public void visit(Return inst) {

    }

    @Override
    public void visit(Store inst) {

    }

    @Override
    public void visit(Unary inst) {

    }

    @Override
    public void visit(Phi inst) {

    }

    @Override
    public void visit(Lea inst) {

    }

    @Override
    public void visit(Push inst) {

    }

    @Override
    public void visit(Pop inst) {

    }

    @Override
    public void visit(Storage storage) {

    }

    @Override
    public void visit(Immediate immediate) {

    }
}

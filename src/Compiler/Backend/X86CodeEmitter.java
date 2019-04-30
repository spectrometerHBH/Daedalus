package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Instruction.Pop;
import Compiler.IR.Instruction.Push;
import Compiler.IR.Operand.Immediate;

import static Compiler.IR.Operand.PhysicalRegister.rbp;
import static Compiler.IR.Operand.PhysicalRegister.rsp;

public class X86CodeEmitter {
    private IRRoot irRoot;

    public X86CodeEmitter(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(this::constructStackFrame);
        translateGlobalVariables();
        irRoot.getFunctionMap().values().forEach(this::translateInstructions);
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

    private void translateGlobalVariables() {

    }

    private void translateInstructions(Function function) {

    }
}

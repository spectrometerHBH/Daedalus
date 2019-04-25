package Compiler.Backend;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Load;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Operand.*;

import java.util.LinkedList;

import static Compiler.IR.Operand.PhysicalRegister.argumentPassVRegisters;
import static Compiler.IR.Operand.PhysicalRegister.vrbp;

//Convert IR to X86 form
//TODO : calling convention resolve
//TODO : div/mod, shl/shr

public class X86ConstraintResolver {
    private IRRoot irRoot;
    private LinkedList<Register> parameterList = new LinkedList<>();

    public X86ConstraintResolver(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(this::twoAddressInstructionResolve);
        irRoot.getFunctionMap().values().forEach(this::processCallingConvention);
        irRoot.getFunctionMap().values().forEach(this::processDivAndShift);
        irRoot.getFunctionMap().values().forEach(this::processHeapAllocation);
    }

    private void twoAddressInstructionResolve(Function function) {
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            IRInstruction nowIRInstruction = basicBlock.head, nextIRInstruction;
            for (; nowIRInstruction != null; nowIRInstruction = nextIRInstruction) {
                nextIRInstruction = nowIRInstruction.getNextInstruction();
                if (nowIRInstruction instanceof Binary) {
                    Operand dst = ((Binary) nowIRInstruction).getDst();
                    Operand src1 = ((Binary) nowIRInstruction).getSrc1();
                    Operand src2 = ((Binary) nowIRInstruction).getSrc2();
                    if (dst == src1) continue;
                    if (dst == src2) {
                        if (((Binary) nowIRInstruction).isCommutative()) {
                            //z = y op z
                            //-->
                            //z = z op y
                            ((Binary) nowIRInstruction).setSrc2(((Binary) nowIRInstruction).getSrc1());
                            ((Binary) nowIRInstruction).setSrc1(((Binary) nowIRInstruction).getDst());
                        } else {
                            //z = y op z
                            //-->
                            //z' = z
                            //z = y
                            //z = z op z'
                            I64Value tmp = new I64Value();
                            nowIRInstruction.prependInstruction(new Move(basicBlock, src2, tmp));
                            nowIRInstruction.prependInstruction(new Move(basicBlock, src1, dst));
                            nowIRInstruction.replaceInstruction(new Binary(basicBlock, ((Binary) nowIRInstruction).getOp(), dst, dst, tmp));
                        }
                    } else {
                        //z = x op y
                        //-->
                        //z = x
                        //z = z op y
                        nowIRInstruction.prependInstruction(new Move(basicBlock, src1, dst));
                        nowIRInstruction.replaceInstruction(new Binary(basicBlock, ((Binary) nowIRInstruction).getOp(), dst, src2, dst));
                    }
                }
            }
        });
    }

    private void processCallingConvention(Function function) {
        if (function.getReferenceForClassMethod() != null)
            parameterList.add(function.getReferenceForClassMethod());
        parameterList.addAll(function.getParameterList());
        for (int i = 0; i < parameterList.size(); i++)
            if (i < 6)
                function.getEntryBlock().head.prependInstruction(new Move(function.getEntryBlock(), argumentPassVRegisters.get(i), parameterList.get(i)));
            else
                function.getEntryBlock().head.prependInstruction(new Load(function.getEntryBlock(), new StackData(vrbp, null, new Immediate(0), new Immediate(16 + i * 8)), parameterList.get(i)));
    }

    private void processDivAndShift(Function function) {

    }

    private void processHeapAllocation(Function function) {

    }
}

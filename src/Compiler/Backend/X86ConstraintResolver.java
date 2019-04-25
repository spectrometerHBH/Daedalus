package Compiler.Backend;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

import java.util.LinkedList;

import static Compiler.IR.Operand.PhysicalRegister.*;

public class X86ConstraintResolver {
    private IRRoot irRoot;
    private LinkedList<Register> parameterList = new LinkedList<>();

    public X86ConstraintResolver(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(this::twoAddressInstructionResolve);
        irRoot.getFunctionMap().values().forEach(this::physicalRegisterConstraintResolve);
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

    private void physicalRegisterConstraintResolve(Function function) {
        //load arguments
        parameterList.clear();
        if (function.getReferenceForClassMethod() != null)
            parameterList.add(function.getReferenceForClassMethod());
        parameterList.addAll(function.getParameterList());
        for (int i = 0; i < parameterList.size(); i++)
            if (i < 6)
                function.getEntryBlock().head.prependInstruction(new Move(function.getEntryBlock(), argumentPassVRegisters.get(i), parameterList.get(i)));
            else {
                function.getEntryBlock().head.prependInstruction(new Load(function.getEntryBlock(), new StackData(vrbp, null, new Immediate(0), new Immediate(16 + (i - 6) * 8)), parameterList.get(i)));
            }
        //modify return
        Return returnInst = (Return) function.getExitBlock().tail;
        if (returnInst.getReturnValue() != null) {
            returnInst.prependInstruction(new Move(function.getExitBlock(), returnInst.getReturnValue(), vrax));
            returnInst.setReturnValue(null);
        }

        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                if (irInstruction instanceof Call) {
                    Call inst = (Call) irInstruction;
                    function.argumentLimit = Math.max(function.argumentLimit, inst.getObjectPointer() == null ? inst.getParameterList().size() : inst.getParameterList().size() + 1);

                    //set arguments
                    int registerLimit = inst.getObjectPointer() == null ? 6 : 5;
                    while (inst.getParameterList().size() > registerLimit)
                        irInstruction.prependInstruction(new Store(basicBlock, inst.getParameterList().removeLast(),
                                new StackData(vrsp, null, new Immediate(0), new Immediate((inst.getParameterList().size() - registerLimit) * 8))));
                    int cnt = 0;
                    if (((Call) irInstruction).getObjectPointer() != null) {
                        Operand operand = ((Call) irInstruction).getObjectPointer();
                        ((Call) irInstruction).setObjectPointer(argumentPassVRegisters.get(cnt));
                        irInstruction.prependInstruction(new Move(basicBlock, operand, argumentPassVRegisters.get(cnt++)));
                    }
                    for (int i = 0; i < ((Call) irInstruction).getParameterList().size(); i++) {
                        Operand operand = ((Call) irInstruction).getParameterList().get(i);
                        ((Call) irInstruction).getParameterList().set(i, argumentPassVRegisters.get(cnt));
                        irInstruction.updateUseRegisters();
                        irInstruction.prependInstruction(new Move(basicBlock, operand, argumentPassVRegisters.get(cnt++)));
                    }
                    //get function call result
                    if (((Call) irInstruction).getResult() != null) {
                        irInstruction.postpendInstruction(new Move(basicBlock, vrax, ((Call) irInstruction).getResult()));
                        ((Call) irInstruction).setResult(vrax);
                    }
                } else if (irInstruction instanceof Binary) {
                    switch (((Binary) irInstruction).getOp()) {
                        //shl & shr
                        case SHL:
                        case SHR: {
                            irInstruction.prependInstruction(new Move(basicBlock, ((Binary) irInstruction).getSrc2(), vrcx));
                            irInstruction.replaceOperand(((Binary) irInstruction).getSrc2(), vrcx);
                            break;
                        }
                        //mod & div
                        case MOD:
                        case DIV: {
                            irInstruction.prependInstruction(new Move(basicBlock, ((Binary) irInstruction).getSrc1(), vrax));
                            irInstruction.prependInstruction(new CDQ(basicBlock));
                            irInstruction.replaceOperand(((Binary) irInstruction).getSrc1(), vrax);
                            if (((Binary) irInstruction).getOp() == Binary.Op.DIV)
                                irInstruction.postpendInstruction(new Move(basicBlock, vrax, ((Binary) irInstruction).getDst()));
                            else
                                irInstruction.postpendInstruction(new Move(basicBlock, vrdx, ((Binary) irInstruction).getDst()));
                            break;
                        }
                        default: {
                            break;
                        }
                    }
                } else if (irInstruction instanceof Alloc) {
                    irInstruction.prependInstruction(new Move(basicBlock, ((Alloc) irInstruction).getSize(), vrdi));
                    irInstruction.postpendInstruction(new Move(basicBlock, vrax, ((Alloc) irInstruction).getPointer()));
                    ((Alloc) irInstruction).setSize(vrdi);
                    ((Alloc) irInstruction).setPointer(vrax);
                }
        });
    }
}

package Compiler.Backend;

import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Operand.I64Value;
import Compiler.IR.Operand.Operand;

public class TwoAddressInstructionResolver {
    private IRRoot irRoot;

    public TwoAddressInstructionResolver(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(function -> function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
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
        }));
    }
}

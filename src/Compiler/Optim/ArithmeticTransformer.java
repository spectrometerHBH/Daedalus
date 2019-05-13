package Compiler.Optim;

import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Binary;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Operand.I64Value;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.Operand;

class ArithmeticTransformer extends Pass {
    ArithmeticTransformer(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
                for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                    if (irInstruction instanceof Binary) {
                        Binary inst = (Binary) irInstruction;
                        if ((inst.getOp() == Binary.Op.DIV || inst.getOp() == Binary.Op.MOD) && inst.getSrc2() instanceof Immediate) {
                            int N = 32;
                            int d = ((Immediate) inst.getSrc2()).getImmediate();
                            if ((d & (d - 1)) == 0 && inst.getOp() == Binary.Op.DIV) {
                                int shift = (int) Math.floor(Math.log(d) / Math.log(2));
                                irInstruction.replaceInstruction(new Binary(basicBlock, Binary.Op.SHR, inst.getSrc1(), new Immediate(shift), inst.getDst()));
                            } else {
                                if (d > 0) {
                                    Operand n = ((Binary) irInstruction).getSrc1();
                                    int l = Math.max((int) Math.ceil(Math.log(Math.abs(d)) / Math.log(2)), 1);
                                    long m = 1 + (long) Math.floor((long) Math.pow(2, N + l - 1) / (long) Math.abs(d));
                                    long m_ = m - (long) Math.pow(2, N);
                                    int sh_post = l - 1;

                                    I64Value tmp1 = new I64Value("div_tmp1");
                                    I64Value tmp2 = new I64Value("div_tmp2");
                                    I64Value tmp3 = new I64Value("div_tmp3");
                                    I64Value tmp4 = new I64Value("div_tmp4");
                                    I64Value tmp5 = new I64Value("div_tmp5");
                                    I64Value tmp6 = new I64Value("div_tmp6");
                                    I64Value tmp7 = new I64Value("div_tmp7");
                                    irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.MUL, n, new Immediate((int) m_), tmp1));
                                    irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.SHR, tmp1, new Immediate(32), tmp2));
                                    irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.ADD, n, tmp2, tmp3));
                                    irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.SHR, tmp3, new Immediate(sh_post), tmp4));
                                    irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.SHR, n, new Immediate(31), tmp5));
                                    if (inst.getOp() == Binary.Op.DIV) {
                                        //get quotient
                                        irInstruction.replaceInstruction(new Binary(basicBlock, Binary.Op.SUB, tmp4, tmp5, inst.getDst()));
                                    } else {
                                        //get quotient
                                        irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.SUB, tmp4, tmp5, tmp6));
                                        //get remainder
                                        irInstruction.prependInstruction(new Binary(basicBlock, Binary.Op.MUL, tmp6, new Immediate(d), tmp7));
                                        irInstruction.replaceInstruction(new Binary(basicBlock, Binary.Op.SUB, n, tmp7, inst.getDst()));
                                    }
                                }
                            }
                        } else if (inst.getOp() == Binary.Op.MUL && inst.getSrc2() instanceof Immediate) {
                            int d = ((Immediate) inst.getSrc2()).getImmediate();
                            if ((d & (d - 1)) == 0) {
                                int shift = (int) Math.floor(Math.log(d) / Math.log(2));
                                irInstruction.replaceInstruction(new Binary(basicBlock, Binary.Op.SHL, inst.getSrc1(), new Immediate(shift), inst.getDst()));
                            }
                        }
                    }
            });
        });
        return false;
    }
}

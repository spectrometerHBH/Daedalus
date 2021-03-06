package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.IRVisitor;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;
import org.apache.commons.text.StringEscapeUtils;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public class IRPrinter implements IRVisitor {
    private PrintStream out;
    private Map<Storage, String> storageStringMap = new HashMap<>();
    private Map<BasicBlock, String> basicBlockStringMap = new HashMap<>();
    private Map<String, Integer> nameCountMap = new HashMap<>();

    private boolean printColor = false;
    private boolean printDefUse = false;

    public IRPrinter(PrintStream out) {
        this.out = out;
    }

    public IRPrinter(PrintStream out, boolean printColor) {
        this.out = out;
        this.printColor = printColor;
    }

    public IRPrinter(PrintStream out, boolean printColor, boolean printDefUse) {
        this.out = out;
        this.printColor = printColor;
        this.printDefUse = printDefUse;
    }

    @Override
    public void visit(IRRoot irRoot) {
        irRoot.getGlobalVariableList().forEach(globalVariable -> out.println("@" + getName((Storage) globalVariable)));
        irRoot.getStaticStringList().forEach(staticString -> out.println("@" + getName(staticString.getBase()) + " = \"" + StringEscapeUtils.escapeJava(staticString.getVal()) + "\""));
        if (!irRoot.getGlobalVariableList().isEmpty() || !irRoot.getStaticStringList().isEmpty()) out.println();
        for (Map.Entry<String, Function> entry : irRoot.getFunctionMap().entrySet()) entry.getValue().accept(this);
    }

    @Override
    public void visit(Function function) {
        boolean isVoid = function.getReturnInstList().get(0).getReturnValue() == null;
        out.print("define " + (isVoid ? "void " : "i64 ") + "@" + function.getName() + " ");
        //if (function.getReferenceForClassMethod() != null) function.getReferenceForClassMethod().accept(this);
        //out.print(" ");
        //function.getParameterList().forEach(x -> {
        //    x.accept(this);
        //    out.print(" ");
        //});
        out.println("{");
        function.getReversePostOrderDFSBBList().forEach(this::visit);
        out.println("}");
        out.println();
    }

    @Override
    public void visit(StaticString staticString) {

    }

    @Override
    public void visit(BasicBlock basicBlock) {
        out.println(getLabel(basicBlock) + ":");
        //out.println(String.format("%d %d\n", basicBlock.getPredecessors().size(), basicBlock.getSuccessors().size()));
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
            out.print("    ");
            irInstruction.accept(this);
            if (printDefUse) {
                out.print("        //<def>");
                irInstruction.calcUseAndDef();
                for (VirtualRegister def : irInstruction.getDef())
                    out.print(" " + getName(def));
                out.println();
                out.print("        //<use>");
                for (VirtualRegister use : irInstruction.getUse())
                    out.print(" " + getName(use));
                out.println();
            }
        }
        out.println();
    }

    @Override
    public void visit(Alloc inst) {
        inst.getPointer().accept(this);
        out.print(" = alloc ");
        inst.getSize().accept(this);
        out.println();
    }

    @Override
    public void visit(Binary inst) {
        String op = null;
        switch (inst.getOp()) {
            case ADD:
                op = "add";
                break;
            case SUB:
                op = "sub";
                break;
            case MUL:
                op = "mul";
                break;
            case DIV:
                op = "div";
                break;
            case MOD:
                op = "mod";
                break;
            case SHL:
                op = "shl";
                break;
            case SHR:
                op = "shr";
                break;
            case AND:
                op = "and";
                break;
            case OR:
                op = "or";
                break;
            case XOR:
                op = "xor";
                break;
        }
        inst.getDst().accept(this);
        out.printf(" = %s ", op);
        inst.getSrc1().accept(this);
        out.print(" ");
        inst.getSrc2().accept(this);
        out.println();
    }

    @Override
    public void visit(Branch inst) {
        if (inst.defOfCond != null) {
            inst.defOfCond.accept(this);
            String op = null;
            switch (inst.defOfCond.getOp()) {
                case LT:
                    op = "slt";
                    break;
                case LEQ:
                    op = "sle";
                    break;
                case EQ:
                    op = "seq";
                    break;
                case GEQ:
                    op = "sge";
                    break;
                case GT:
                    op = "sgt";
                    break;
                case NEQ:
                    op = "sne";
                    break;
            }
            out.print("    ");
            out.print("br " + op);
            out.println(" " + getLabel(inst.getThenBB()) + " " + getLabel(inst.getElseBB()));
        } else {
            out.print("br ");
            inst.getCond().accept(this);
            out.println(" " + getLabel(inst.getThenBB()) + " " + getLabel(inst.getElseBB()));
        }
    }

    @Override
    public void visit(Call inst) {
        if (inst.getResult() != null) {
            inst.getResult().accept(this);
            out.print(" = call ");
        } else out.print("call ");
        out.print(inst.getCallee().getName() + " ");
        if (inst.getObjectPointer() != null) {
            inst.getObjectPointer().accept(this);
            out.print(" ");
        }
        inst.getParameterList().forEach(x -> {
            x.accept(this);
            out.print(" ");
        });
        out.println();
    }

    @Override
    public void visit(Cmp inst) {
        if (inst.getDst() == null) {
            out.print("cmp ");
            inst.getSrc1().accept(this);
            out.print(" ");
            inst.getSrc2().accept(this);
            out.println();
        } else {
            String op = null;
            switch (inst.getOp()) {
                case LT:
                    op = "slt";
                    break;
                case LEQ:
                    op = "sle";
                    break;
                case EQ:
                    op = "seq";
                    break;
                case GEQ:
                    op = "sge";
                    break;
                case GT:
                    op = "sgt";
                    break;
                case NEQ:
                    op = "sne";
                    break;
            }
            inst.getDst().accept(this);
            out.print(" = " + op + ' ');
            inst.getSrc1().accept(this);
            out.print(" ");
            inst.getSrc2().accept(this);
            out.println();
        }
    }

    @Override
    public void visit(Jump inst) {
        out.println("jump " + getLabel(inst.getTargetBB()));
    }

    @Override
    public void visit(Load inst) {
        inst.getDst().accept(this);
        out.print(" = load ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Move inst) {
        inst.getDst().accept(this);
        out.print(" = move ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Return inst) {
        out.print("ret ");
        if (inst.getReturnValue() != null) inst.getReturnValue().accept(this);
        out.println();
    }

    @Override
    public void visit(Store inst) {
        out.print("store ");
        inst.getSrc().accept(this);
        out.print(" ");
        inst.getDst().accept(this);
        out.println();
    }

    @Override
    public void visit(Unary inst) {
        String op = null;
        switch (inst.getOp()) {
            case NOT:
                op = "not";
                break;
            case NEG:
                op = "neg";
                break;
            case INC:
                op = "inc";
                break;
            case DEC:
                op = "dec";
                break;
            case POS:
                op = "pos";
                break;
            case NOTL:
                throw new RuntimeException();
        }
        inst.getDst().accept(this);
        out.print(" = " + op + " ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Phi inst) {
        inst.getDst().accept(this);
        out.print(" = phi ");
        inst.getPaths().forEach((basicBlock, operand) -> {
            out.print(getLabel(basicBlock) + " ");
            if (operand != null) {
                operand.accept(this);
            } else {
                out.print("undef");
            }
            out.print(" ");
        });
        out.println();
    }

    @Override
    public void visit(Lea inst) {
        inst.getDst().accept(this);
        out.print(" = lea ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Push inst) {
        out.print("push ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Pop inst) {
        out.print("pop ");
        inst.getDst().accept(this);
        out.println();
    }

    @Override
    public void visit(Storage storage) {
        if (storage instanceof Register) {
            if (storage instanceof GlobalVariable) out.print("@" + getName(storage));
            else out.print("%" + getName(storage));
        } else if (storage instanceof Memory) {
            //out.print("[");
            if (((Memory) storage).getBase() != null)
                visit(((Memory) storage).getBase());
            else
                out.print("null");
            out.print(" ");
            if (((Memory) storage).getIndex() != null) {
                visit(((Memory) storage).getIndex());
                out.print(" ");
                visit(((Memory) storage).getScale());
            } else {
                out.print("null 0");
            }
            out.print(" ");
            visit(((Memory) storage).getOffset());
        }
    }

    @Override
    public void visit(Immediate immediate) {
        out.print(immediate.getImmediate());
    }

    private String createName(Storage storage, String name) {
        int cnt = nameCountMap.getOrDefault(name, 0) + 1;
        nameCountMap.put(name, cnt);
        String newName = name + "_" + cnt;
        storageStringMap.put(storage, newName);
        return newName;
    }

    public String getName(Storage storage) {
        if (storage instanceof VirtualRegister) {
            if (printColor && !(storage instanceof GlobalVariable)) {
                return ((VirtualRegister) storage).color.getName();
            } else {
                /*
                VirtualRegister origin = ((VirtualRegister) storage).getOrigin();
                String name = storageStringMap.get(origin);
                name = name != null ? name : createName(origin, origin.getName() == null ? "t" : origin.getName());
                return name + "." + ((VirtualRegister) storage).getSSAID();
                */
                String name = storageStringMap.get(storage);
                name = name != null ? name : createName(storage, storage.getName() == null ? "t" : storage.getName());
                return name;
                //return origin.toString() + "." + ((VirtualRegister) storage).getSSAID();
            }
        } else if (storage instanceof PhysicalRegister) {
            return storage.getName();
        } else return "fuck_you";
    }

    private String createLabel(BasicBlock basicBlock, String name) {
        int cnt = nameCountMap.getOrDefault(name, 0) + 1;
        nameCountMap.put(name, cnt);
        String newName = name + "_" + cnt;
        basicBlockStringMap.put(basicBlock, newName);
        return newName;
    }

    private String getLabel(BasicBlock basicBlock) {
        if (basicBlock == null) return "";
        String name = basicBlockStringMap.get(basicBlock);
        return name != null ? name : createLabel(basicBlock, basicBlock.getName());
    }

}
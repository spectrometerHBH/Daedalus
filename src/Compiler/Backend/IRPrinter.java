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

public class IRPrinter implements IRVisitor {
    private PrintStream out;
    private Map<Storage, String> storageStringMap = new HashMap<>();
    private Map<BasicBlock, String> basicBlockStringMap = new HashMap<>();
    private Map<String, Integer> nameCountMap = new HashMap<>();

    public IRPrinter(PrintStream out) {
        this.out = out;
    }

    @Override
    public void visit(IRRoot irRoot) {
        irRoot.getGlobalVariableList().forEach(globalVariable -> out.println("@" + getName((Storage) globalVariable)));
        irRoot.getStaticStringList().forEach(staticString -> out.println("@" + getName(staticString.getPointer()) + " = " + staticString.getVal()));
        if (!irRoot.getGlobalVariableList().isEmpty() || !irRoot.getStaticStringList().isEmpty()) out.println();
        for (Map.Entry<String, Function> entry : irRoot.getFunctionMap().entrySet()) entry.getValue().accept(this);
    }

    @Override
    public void visit(Function function) {
        out.print("define func @" + function.getName() + "() ");
        if (function.getReferenceForClassMethod() != null) function.getReferenceForClassMethod().accept(this);
        function.getParameterList().forEach(x -> {
            x.accept(this);
            out.print(" ");
        });
        out.println("{");
        function.getPostOrderDFSBBList().forEach(this::visit);
        out.println("}");
        out.println();
    }

    @Override
    public void visit(StaticString staticString) {

    }

    @Override
    public void visit(BasicBlock basicBlock) {
        out.println(getLabel(basicBlock) + ":");
        for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
            out.print("    ");
            irInstruction.accept(this);
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
        inst.getDest().accept(this);
        out.printf(" = %s ", op);
        inst.getSrc1().accept(this);
        out.print(" ");
        inst.getSrc2().accept(this);
        out.println();
    }

    @Override
    public void visit(Branch inst) {
        out.print("branch ");
        inst.getCond().accept(this);
        out.println(" " + getLabel(inst.getThenBB()) + " " + getLabel(inst.getElseBB()));
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
        inst.getDest().accept(this);
        out.print(" = " + op + " ");
        inst.getLhs().accept(this);
        out.print(" ");
        inst.getRhs().accept(this);
        out.println();
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
        inst.getDstOperand().accept(this);
        out.print(" = move ");
        inst.getSrcOperand().accept(this);
        out.println();
    }

    @Override
    public void visit(Pop inst) {
        //not now
    }

    @Override
    public void visit(Push inst) {
        //not now
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
            case NEG:
                op = "neg";
            case INC:
                op = "inc";
            case DEC:
                op = "dec";
            case POS:
                op = "pos";
        }
        inst.getDst().accept(this);
        out.print(" = " + op + " ");
        inst.getSrc().accept(this);
        out.println();
    }

    @Override
    public void visit(Storage storage) {
        out.print("%" + getName(storage));
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

    private String getName(Storage storage) {
        String name = storageStringMap.get(storage);
        return name != null ? name : createName(storage, storage.getName() == null ? "__tmp" : storage.getName());
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
package Compiler.IR;

import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.StaticString;
import Compiler.IR.Operand.Storage;

public interface IRVisitor {
    void visit(IRRoot irRoot);

    void visit(Function function);

    void visit(StaticString staticString);

    void visit(BasicBlock basicBlock);

    void visit(Alloc inst);

    void visit(Binary inst);

    void visit(Branch inst);

    void visit(Call inst);

    void visit(Cmp inst);

    void visit(Jump inst);

    void visit(Load inst);

    void visit(Move inst);

    void visit(Pop inst);

    void visit(Push inst);

    void visit(Return inst);

    void visit(Store inst);

    void visit(Unary inst);

    void visit(Storage storage);

    void visit(Immediate immediate);

    void visit(Phi inst);
}

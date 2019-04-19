package Compiler.AST;

public interface ASTVisitor {
    void visit(ProgramNode node);

    void visit(VarDeclNode node);

    void visit(FuncDeclNode node);

    void visit(ClassDeclNode node);

    void visit(ArrayTypeNode node);

    void visit(ClassTypeNode node);

    void visit(BoolTypeNode node);

    void visit(IntTypeNode node);

    void visit(VoidTypeNode node);

    void visit(StringTypeNode node);

    void visit(BlockStmtNode node);

    void visit(VarDeclStmtNode node);

    void visit(ExprStmtNode node);

    void visit(IfStmtNode node);

    void visit(WhileStmtNode node);

    void visit(ForStmtNode node);

    void visit(ReturnNode node);

    void visit(BreakNode node);

    void visit(ContinueNode node);

    void visit(ArrayIndexNode node);

    void visit(BinaryExprNode node);

    void visit(ClassMemberNode node);

    void visit(FuncCallExprNode node);

    void visit(IDExprNode node);

    void visit(NewExprNode node);

    void visit(ThisExprNode node);

    void visit(UnaryExprNode node);

    void visit(IntLiteralNode node);

    void visit(BoolLiteralNode node);

    void visit(NullLiteralNode node);

    void visit(StringLiteralNode node);
}

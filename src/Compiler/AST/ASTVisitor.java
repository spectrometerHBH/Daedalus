package Compiler.AST;

public interface ASTVisitor {
    void visit(ProgramNode node);
    void visit(VarDeclListNode node);
    void visit(VarDeclNode node);
    void visit(FuncDeclNode node);
    void visit(ClassDeclNode node);
    void visit(ArrayTypeNode node);
    void visit(ClassTypeNode node);
    void visit(FuncTypeNode node);
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
    void visit(ConstExprNode node);
    void visit(FuncallExprNode node);
    void visit(IDExprNode node);
    void visit(NewExprNode node);
    void visit(ThisExprNode node);
    void visit(UnaryExprNode node);
}

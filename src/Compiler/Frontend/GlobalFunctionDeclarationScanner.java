package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.Type;
import Compiler.Symbol.VariableSymbol;

public class GlobalFunctionDeclarationScanner implements ASTVisitor {
    private GlobalScope globalScope;

    public GlobalFunctionDeclarationScanner(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) {
         node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclListNode node) {

    }

    @Override
    public void visit(VarDeclNode node) {

    }

    @Override
    public void visit(FuncDeclNode node) {
        Type returnType = globalScope.resolveType(node.getType());
        FunctionSymbol functionSymbol = new FunctionSymbol(node.getIdentifier(), returnType, node, globalScope);
        for (VarDeclNode varDeclNode : node.getParameterList()){
            Type parameterType = globalScope.resolveType(node.getType());
            functionSymbol.defineVariable(new VariableSymbol(varDeclNode.getIdentifier(), parameterType, varDeclNode));
        }
        globalScope.defineFunction(functionSymbol);
    }

    @Override
    public void visit(ClassDeclNode node) {

    }

    @Override
    public void visit(ArrayTypeNode node) {

    }

    @Override
    public void visit(ClassTypeNode node) {

    }

    @Override
    public void visit(FuncTypeNode node) {

    }

    @Override
    public void visit(BoolTypeNode node) {

    }

    @Override
    public void visit(IntTypeNode node) {

    }

    @Override
    public void visit(VoidTypeNode node) {

    }

    @Override
    public void visit(StringTypeNode node) {

    }

    @Override
    public void visit(BlockStmtNode node) {

    }

    @Override
    public void visit(VarDeclStmtNode node) {

    }

    @Override
    public void visit(ExprStmtNode node) {

    }

    @Override
    public void visit(IfStmtNode node) {

    }

    @Override
    public void visit(WhileStmtNode node) {

    }

    @Override
    public void visit(ForStmtNode node) {

    }

    @Override
    public void visit(ReturnNode node) {

    }

    @Override
    public void visit(BreakNode node) {

    }

    @Override
    public void visit(ContinueNode node) {

    }

    @Override
    public void visit(ArrayIndexNode node) {

    }

    @Override
    public void visit(BinaryExprNode node) {

    }

    @Override
    public void visit(ClassMemberNode node) {

    }

    @Override
    public void visit(FuncallExprNode node) {

    }

    @Override
    public void visit(IDExprNode node) {

    }

    @Override
    public void visit(NewExprNode node) {

    }

    @Override
    public void visit(ThisExprNode node) {

    }

    @Override
    public void visit(UnaryExprNode node) {

    }

    @Override
    public void visit(IntLiteralNode node) {

    }

    @Override
    public void visit(BoolLiteralNode node) {

    }

    @Override
    public void visit(NullLiteralNode node) {

    }

    @Override
    public void visit(StringLiteralNode node) {

    }
}

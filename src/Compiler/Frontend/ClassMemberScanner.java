package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;
import Compiler.Utils.SemanticError;
import Compiler.Utils.Util;

public class ClassMemberScanner implements ASTVisitor {
    private GlobalScope globalScope;
    private Scope currentScope;

    public ClassMemberScanner(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(x -> {
            if (x instanceof ClassDeclNode) x.accept(this);
        });
    }

    @Override
    public void visit(VarDeclNode node) {
        Type type = Util.TypeNode2Type(node.getType(), globalScope);
        VariableSymbol variableSymbol = new VariableSymbol(node.getIdentifier(), type, node);
        currentScope.defineVariable(variableSymbol);
    }

    @Override
    public void visit(FuncDeclNode node) {
        Type returnType = node.getType() == null
                ? (ClassSymbol)currentScope :
                Util.TypeNode2Type(node.getType(), globalScope);
        FunctionSymbol functionSymbol = new FunctionSymbol(node.getIdentifier(), returnType, node, currentScope);
        node.setFunctionSymbol(functionSymbol);
        currentScope.defineFunction(functionSymbol);
        if (currentScope instanceof ClassSymbol) {
            if (node.getIdentifier().equals(((ClassSymbol) currentScope).getTypeName())) {
                if (node.getType() == null) {
                    if (((ClassSymbol) currentScope).getConstructor() != null)
                        throw new SemanticError("Duplicated constructors", node.getPosition());
                    ((ClassSymbol) currentScope).setConstructor(functionSymbol);
                } else throw new SemanticError("Wrong type for constructor", node.getPosition());
            }else if (node.getType() == null) throw new SemanticError("Return type missing", node.getPosition());
        }
        currentScope = functionSymbol;
        node.getParameterList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(ClassDeclNode node) {
        ClassSymbol classSymbol = node.getClassSymbol();
        currentScope = classSymbol;
        node.getVarDecList().forEach(x -> x.accept(this));
        node.getFuncDeclList().forEach(x -> {
            x.accept(this);
            currentScope = classSymbol;
        });
    }

    @Override
    public void visit(ArrayTypeNode node) {

    }

    @Override
    public void visit(ClassTypeNode node) {

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

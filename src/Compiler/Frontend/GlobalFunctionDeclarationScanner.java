package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;
import Compiler.Utils.Util;

public class GlobalFunctionDeclarationScanner implements ASTVisitor {
    private GlobalScope globalScope;

    public GlobalFunctionDeclarationScanner(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    private void MainFunctionChecker(Symbol main) {
        if (main.getType() instanceof PrimitiveTypeSymbol) {
            if (!main.getType().getTypeName().equals("int"))
                throw new SemanticError("Return type of main function ought to be int", new Position(0, 0));
            if (!(((FuncDeclNode) main.getDef()).getParameterList().isEmpty()))
                throw new SemanticError("Parameter list of main function ought to be empty", new Position(0, 0));
        } else throw new SemanticError("Return Type of main Function ought to be int", new Position(0, 0));
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(x -> x.accept(this));
        MainFunctionChecker(globalScope.resolveMain());
    }

    @Override
    public void visit(VarDeclNode node) {

    }

    @Override
    public void visit(FuncDeclNode node) {
        if (node.getType() == null)
            throw new SemanticError("Global function should have return type", node.getPosition());
        Type returnType = Util.TypeNode2Type(node.getType(), globalScope);
        FunctionSymbol functionSymbol = new FunctionSymbol(node.getIdentifier(), returnType, node, globalScope);
        node.setFunctionSymbol(functionSymbol);
        for (VarDeclNode varDeclNode : node.getParameterList()) {
            Type parameterType = Util.TypeNode2Type(varDeclNode.getType(), globalScope);
            VariableSymbol variableSymbol = new VariableSymbol(varDeclNode.getIdentifier(), parameterType, varDeclNode);
            varDeclNode.setVariableSymbol(variableSymbol);
            functionSymbol.defineVariable(variableSymbol);
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

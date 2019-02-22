package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;
import Compiler.Utils.SemanticError;
import Compiler.Utils.Util;

import java.util.Stack;

public class SymbolTableBuilder implements ASTVisitor {
    private GlobalScope globalScope;
    private Scope currentScope;
    private ClassSymbol currentClassSymbol;
    private FunctionSymbol currentFunctionSymbol;
    private Stack<Loop> stackOfLoops = new Stack<Loop>();

    public SymbolTableBuilder(GlobalScope globalScope) {
        this.globalScope = globalScope;
        currentScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) {
        currentScope = globalScope;
        currentClassSymbol = null;
        currentFunctionSymbol = null;
        node.getDeclNodeList().forEach(x -> {
            x.accept(this);
            currentScope = globalScope;
            currentClassSymbol = null;
            currentFunctionSymbol = null;
        });
    }

    @Override
    public void visit(VarDeclNode node) {
        if (node.getExpr() != null) node.getExpr().accept(this);
        Type type = Util.TypeNode2Type(node.getType(), globalScope);
        node.setTypeAfterResolve(type);
        VariableSymbol variableSymbol = new VariableSymbol(node.getIdentifier(), type, node);
        currentScope.defineVariable(variableSymbol);
        if (currentScope == globalScope) node.setGlobalVariable();
    }

    @Override
    public void visit(FuncDeclNode node) {
        FunctionSymbol functionSymbol = (FunctionSymbol) currentScope.resolveSymbol(node.getIdentifier(), node.getPosition());
        currentScope = functionSymbol;
        currentFunctionSymbol = functionSymbol;
        visit(node.getBlock());
    }

    @Override
    public void visit(ClassDeclNode node) {
        ClassSymbol classSymbol = (ClassSymbol) globalScope.resolveSymbol(node.getIdentifier(), node.getPosition());
        currentScope = classSymbol;
        currentClassSymbol = classSymbol;
        node.getFuncDeclList().forEach(x -> {
            x.accept(this);
            currentScope = classSymbol;
        });
    }

    @Override
    public void visit(ArrayTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ClassTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BoolTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(IntTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(VoidTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(StringTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BlockStmtNode node) {
        LocalScope localScope = new LocalScope("block local scope", currentScope);
        currentScope = localScope;
        node.getStmtList().forEach(x -> {
            x.accept(this);
            currentScope = localScope;
        });
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        node.getVarDeclList().getList().forEach(x -> {
            if (x.getExpr() != null) x.getExpr().accept(this);
            Type type = Util.TypeNode2Type(x.getType(), globalScope);
            x.setTypeAfterResolve(type);
            currentScope.defineVariable(new VariableSymbol(x.getIdentifier(), type, x));
        });
    }

    @Override
    public void visit(ExprStmtNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) {
        node.getExpression().accept(this);
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) {
        stackOfLoops.push(node);
        node.getExpression().accept(this);
        if (node.getStatement() != null) {
            node.getStatement().accept(this);
        }
        stackOfLoops.pop();
    }

    @Override
    public void visit(ForStmtNode node) {
        stackOfLoops.push(node);
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null) node.getCond().accept(this);
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) {
            node.getStatement().accept(this);
        }
        stackOfLoops.pop();
    }

    @Override
    public void visit(ReturnNode node) {
        if (node.getExpression() != null) node.getExpression().accept(this);
        if (currentFunctionSymbol == null)
            throw new SemanticError("Return should be in a function", node.getPosition());
        node.setFunctionSymbol(currentFunctionSymbol);
    }

    @Override
    public void visit(BreakNode node) {
        if (stackOfLoops.empty())
            throw new SemanticError("Break should be in a loop", node.getPosition());
        node.setCurrentLoop(stackOfLoops.peek());
    }

    @Override
    public void visit(ContinueNode node) {
        if (stackOfLoops.empty())
            throw new SemanticError("Continue should be in a loop", node.getPosition());
        node.setCurrentLoop(stackOfLoops.peek());
    }

    @Override
    public void visit(ArrayIndexNode node) {
        node.getArray().accept(this);
        node.getIndex().accept(this);
    }

    @Override
    public void visit(BinaryExprNode node) {
        node.getLhs().accept(this);
        node.getRhs().accept(this);
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
    }

    @Override
    public void visit(FuncallExprNode node) {
        node.getFunction().accept(this);
        node.getParameterList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(IDExprNode node) {
        Symbol symbol = currentScope.resolveSymbol(node.getIdentifier(), node.getPosition());
        node.setSymbol(symbol);
    }

    @Override
    public void visit(NewExprNode node) {
        Type type = Util.TypeNode2Type(node.getBaseType(), globalScope);
        node.setBaseTypeAfterResolve(type);
        node.getExprNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(ThisExprNode node) {
        if (currentClassSymbol == null) throw new SemanticError("No corresponding class for this", node.getPosition());
        node.setScope(currentClassSymbol);
    }

    @Override
    public void visit(UnaryExprNode node) {
        node.getExpression().accept(this);
    }

    @Override
    public void visit(IntLiteralNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BoolLiteralNode node) {
        //need doing nothing
    }

    @Override
    public void visit(NullLiteralNode node) {
        //need doing nothing
    }

    @Override
    public void visit(StringLiteralNode node) {
        //need doing nothing
    }
}

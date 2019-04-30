package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;

import java.util.*;

//A function has no side effect when
//1. All callee of it have no side effect
//2. Only uses no global variable symbol
//3. All parameters are primitive type
//This is naive and not sufficient, but more complex criterion requires fined data/dependency/alias analysis

public class SideEffectSolver implements ASTVisitor {
    private GlobalScope globalScope;
    private FunctionSymbol currentFunctionSymbol;
    private Map<FunctionSymbol, Set<FunctionSymbol>> calleeMap = new HashMap<>();
    private Stack<Boolean> isAssign = new Stack<>();
    private boolean DEBUG = false;

    public SideEffectSolver(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(declNode -> {
            if (declNode instanceof FuncDeclNode) {
                currentFunctionSymbol = ((FuncDeclNode) declNode).getFunctionSymbol();
                calleeMap.put(currentFunctionSymbol, new HashSet<>());
                for (VarDeclNode varDeclNode : ((FuncDeclNode) declNode).getParameterList()) {
                    VariableSymbol variableSymbol = varDeclNode.getVariableSymbol();
                    if (!(variableSymbol.getType() instanceof PrimitiveTypeSymbol)
                            || (variableSymbol.getType() instanceof ClassSymbol && variableSymbol.getType() != globalScope.getString())) {
                        currentFunctionSymbol.hasSideEffect = true;
                        break;
                    }
                }
                isAssign.push(false);
                if (!currentFunctionSymbol.hasSideEffect) declNode.accept(this);
                isAssign.pop();
            }
        });

        boolean changed = true;
        for (; changed; ) {
            changed = false;
            for (Map.Entry<FunctionSymbol, Set<FunctionSymbol>> entry : calleeMap.entrySet()) {
                FunctionSymbol caller = entry.getKey();
                Set<FunctionSymbol> callees = entry.getValue();
                boolean newValue = caller.hasSideEffect;
                for (FunctionSymbol callee : callees) newValue |= callee.hasSideEffect;
                if (caller.hasSideEffect != newValue) {
                    changed = true;
                    caller.hasSideEffect = newValue;
                }
            }
        }
        if (DEBUG) {
            node.getDeclNodeList().forEach(declNode -> {
                if (declNode instanceof FuncDeclNode) {
                    System.err.println(((FuncDeclNode) declNode).getIdentifier() + " " + ((FuncDeclNode) declNode).getFunctionSymbol().hasSideEffect);
                }
            });
        }
    }

    @Override
    public void visit(VarDeclNode node) {
        if (node.getExpr() != null) {
            isAssign.push(false);
            node.getExpr().accept(this);
            isAssign.pop();
        }
    }

    @Override
    public void visit(FuncDeclNode node) {
        node.getBlock().accept(this);
    }

    @Override
    public void visit(ClassDeclNode node) {
        //need doing nothing
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
        node.getStmtList().forEach(stmtNode -> stmtNode.accept(this));
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        node.getVarDeclList().getList().forEach(varDeclNode -> varDeclNode.accept(this));
    }

    @Override
    public void visit(ExprStmtNode node) {
        isAssign.push(false);
        node.getExpr().accept(this);
        isAssign.pop();
    }

    @Override
    public void visit(IfStmtNode node) {
        isAssign.push(false);
        node.getExpression().accept(this);
        isAssign.pop();
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) {
        isAssign.push(false);
        node.getExpression().accept(this);
        isAssign.pop();
        node.getStatement().accept(this);
    }

    @Override
    public void visit(ForStmtNode node) {
        isAssign.push(false);
        if (node.getInit() != null) node.getInit().accept(this);
        isAssign.pop();
        isAssign.push(false);
        if (node.getCond() != null) node.getCond().accept(this);
        isAssign.pop();
        isAssign.push(false);
        if (node.getStep() != null) node.getStep().accept(this);
        isAssign.pop();
        node.getStatement().accept(this);
    }

    @Override
    public void visit(ReturnNode node) {
        if (node.getExpression() != null) {
            isAssign.push(false);
            node.getExpression().accept(this);
            isAssign.pop();
        }
    }

    @Override
    public void visit(BreakNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ContinueNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ArrayIndexNode node) {
        node.getArray().accept(this);
        isAssign.push(false);
        node.getIndex().accept(this);
        isAssign.pop();
    }

    @Override
    public void visit(BinaryExprNode node) {
        if (node.getOp() == BinaryExprNode.Op.ASSIGN) {
            isAssign.push(true);
            node.getLhs().accept(this);
            isAssign.pop();
            isAssign.push(false);
            node.getRhs().accept(this);
            isAssign.pop();
        } else {
            isAssign.push(false);
            node.getLhs().accept(this);
            isAssign.pop();
            isAssign.push(false);
            node.getRhs().accept(this);
            isAssign.pop();
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        if (node.getExpression().isAccessable()) {
            if (!(node.getSymbol() instanceof VariableSymbol)
                    || (node.getSymbol() instanceof VariableSymbol && !(node.getSymbol().getType() instanceof PrimitiveTypeSymbol)))
                currentFunctionSymbol.hasSideEffect = true;
        }
    }

    @Override
    public void visit(FuncCallExprNode node) {
        FunctionSymbol callee = node.getFunction().getFunctionSymbol();
        if (callee.isMemberFunction() && !(currentFunctionSymbol.getEnclosingScope() == globalScope.getString()))
            currentFunctionSymbol.hasSideEffect = true;
        calleeMap.get(currentFunctionSymbol).add(callee);
    }

    @Override
    public void visit(IDExprNode node) {
        if (isAssign.peek()) {
            if (node.getSymbol() instanceof VariableSymbol) {
                if (node.getSymbol().getScope() == globalScope) {
                    currentFunctionSymbol.hasSideEffect = true;
                }
            }
        }
    }

    @Override
    public void visit(NewExprNode node) {
        isAssign.push(false);
        node.getExprNodeList().forEach(exprNode -> exprNode.accept(this));
        isAssign.pop();
    }

    @Override
    public void visit(ThisExprNode node) {
        assert false;
    }

    @Override
    public void visit(UnaryExprNode node) {
        isAssign.push(true);
        node.getExpression().accept(this);
        isAssign.pop();
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

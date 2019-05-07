package Compiler.Frontend;

import Compiler.AST.*;

import java.util.HashMap;
import java.util.Map;

//transform trivial bool expression outside if statement to non-logical expression
//trivial means :
//1. without array expression
//2. without class member expression
//3. without division or modular

public class boolExpressionTransformer implements ASTVisitor {
    public static Map<ASTNode, Boolean> trivialNodeMap = new HashMap<>();
    private boolean collectMode;

    public boolExpressionTransformer() {
    }

    @Override
    public void visit(ProgramNode node) {
        collectMode = true;
        node.getDeclNodeList().forEach(x -> x.accept(this));
        collectMode = false;
        node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclNode node) {
        if (collectMode) {
            if (node.getExpr() != null) node.getExpr().accept(this);
        } else {
            if (node.getExpr() != null && trivialNodeMap.get(node.getExpr())) node.getExpr().accept(this);
        }
    }

    @Override
    public void visit(FuncDeclNode node) {
        visit(node.getBlock());
    }

    @Override
    public void visit(ClassDeclNode node) {
        node.getFuncDeclList().forEach(x -> x.accept(this));
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
        node.getStmtList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        node.getVarDeclList().getList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(ExprStmtNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) {
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) {
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ForStmtNode node) {
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ReturnNode node) {
        if (collectMode) {
            if (node.getExpression() != null) node.getExpression().accept(this);
        } else {
            if (node.getExpression() != null && trivialNodeMap.get(node.getExpression())) {
                node.getExpression().accept(this);
            }
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
        trivialNodeMap.put(node, false);
    }

    @Override
    public void visit(BinaryExprNode node) {
        switch (node.getOp()) {
            case LT:
            case LEQ:
            case EQ:
            case GT:
            case GEQ:
            case NEQ: {
                if (collectMode) {
                    node.getLhs().accept(this);
                    node.getRhs().accept(this);
                    trivialNodeMap.put(node, trivialNodeMap.get(node.getLhs()) & trivialNodeMap.get(node.getRhs()));
                }
                break;
            }
            case ORL: {
                if (collectMode) {
                    node.getLhs().accept(this);
                    node.getRhs().accept(this);
                    trivialNodeMap.put(node, trivialNodeMap.get(node.getLhs()) & trivialNodeMap.get(node.getRhs()));
                } else {
                    node.setOp(BinaryExprNode.Op.OR);
                    node.getLhs().accept(this);
                    node.getRhs().accept(this);
                }
                break;
            }
            case ANDL: {
                if (collectMode) {
                    node.getLhs().accept(this);
                    node.getRhs().accept(this);
                    trivialNodeMap.put(node, trivialNodeMap.get(node.getLhs()) & trivialNodeMap.get(node.getRhs()));
                } else {
                    node.setOp(BinaryExprNode.Op.AND);
                    node.getLhs().accept(this);
                    node.getRhs().accept(this);
                }
                break;
            }
            case ASSIGN: {
                if (collectMode) {
                    node.getRhs().accept(this);
                    trivialNodeMap.put(node, false);
                } else {
                    if (trivialNodeMap.get(node.getRhs())) node.getRhs().accept(this);
                }
                break;
            }
            default: {
                trivialNodeMap.put(node, false);
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        trivialNodeMap.put(node, false);
    }

    @Override
    public void visit(FuncCallExprNode node) {
        trivialNodeMap.put(node, false);
    }

    @Override
    public void visit(IDExprNode node) {
        trivialNodeMap.put(node, true);
    }

    @Override
    public void visit(NewExprNode node) {
        trivialNodeMap.put(node, false);
    }

    @Override
    public void visit(ThisExprNode node) {
        trivialNodeMap.put(node, false);
    }

    @Override
    public void visit(UnaryExprNode node) {
        if (node.getOp() == UnaryExprNode.Op.NOTL) {
            if (collectMode) {
                node.getExpression().accept(this);
                trivialNodeMap.put(node, trivialNodeMap.get(node.getExpression()));
            } else {
                node.setOp(UnaryExprNode.Op.NOT);
                node.getExpression().accept(this);
            }
        } else {
            trivialNodeMap.put(node, false);
        }
    }

    @Override
    public void visit(IntLiteralNode node) {
        trivialNodeMap.put(node, true);
    }

    @Override
    public void visit(BoolLiteralNode node) {
        trivialNodeMap.put(node, true);
    }

    @Override
    public void visit(NullLiteralNode node) {
        trivialNodeMap.put(node, true);
    }

    @Override
    public void visit(StringLiteralNode node) {
        trivialNodeMap.put(node, true);
    }
}

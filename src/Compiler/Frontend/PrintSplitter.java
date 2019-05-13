package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.GlobalScope;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class PrintSplitter implements ASTVisitor {
    private GlobalScope globalScope;
    private FunctionSymbol printlnFunctionSymbol;
    private FunctionSymbol printFunctionSymbol;
    private List<ExprNode> nodeList = new LinkedList<>();
    private BlockStmtNode fatherNode;
    private ExprStmtNode thisNode;
    private boolean collect = false;

    public PrintSplitter(GlobalScope globalScope) {
        this.globalScope = globalScope;
        this.printlnFunctionSymbol = (FunctionSymbol) globalScope.resolveSymbol("println", null);
        this.printFunctionSymbol = (FunctionSymbol) globalScope.resolveSymbol("print", null);
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclNode node) {

    }

    @Override
    public void visit(FuncDeclNode node) {
        node.getBlock().accept(this);
    }

    @Override
    public void visit(ClassDeclNode node) {
        node.getFuncDeclList().forEach(x -> x.accept(this));
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
        List<StmtNode> stmtNodeList = new ArrayList<>(node.getStmtList());
        stmtNodeList.forEach(x -> {
            fatherNode = node;
            x.accept(this);
        });
    }

    @Override
    public void visit(VarDeclStmtNode node) {

    }

    @Override
    public void visit(ExprStmtNode node) {
        thisNode = node;
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
        if (node.getStatement() != null) node.getStatement().accept(this);
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
        if (collect) {
            nodeList.add(node);
        }
    }

    @Override
    public void visit(BinaryExprNode node) {
        if (collect) {
            node.getLhs().accept(this);
            node.getRhs().accept(this);
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        if (collect) {
            nodeList.add(node);
        }
    }

    @Override
    public void visit(FuncCallExprNode node) {
        FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
        if (functionSymbol == printFunctionSymbol || functionSymbol == printlnFunctionSymbol) {
            IDExprNode printFunction = new IDExprNode("print", null);
            printFunction.setCategory(ExprNode.Category.FUNCTION);
            printFunction.setType(printFunctionSymbol.getType());
            printFunction.setSymbol(printFunctionSymbol);
            printFunction.setFunctionSymbol(printFunctionSymbol);
            IDExprNode printlnFunction = new IDExprNode("println", null);
            printlnFunction.setCategory(ExprNode.Category.FUNCTION);
            printlnFunction.setType(printlnFunctionSymbol.getType());
            printlnFunction.setSymbol(printlnFunctionSymbol);
            printlnFunction.setFunctionSymbol(printlnFunctionSymbol);

            nodeList.clear();

            collect = true;
            node.getParameterList().forEach(x -> x.accept(this));
            collect = false;

            if (nodeList.size() > 1) {
                List<StmtNode> printList = new LinkedList<>();
                for (int i = 0; i < nodeList.size(); i++) {
                    List<ExprNode> parameterList = new ArrayList<>();
                    parameterList.add(nodeList.get(i));
                    FuncCallExprNode funcCallExprNode = new FuncCallExprNode(functionSymbol == printlnFunctionSymbol && i + 1 == nodeList.size() ? printlnFunction : printFunction,
                            parameterList, null);
                    funcCallExprNode.setCategory(ExprNode.Category.RVALUE);
                    funcCallExprNode.setType(functionSymbol.getType());
                    printList.add(new ExprStmtNode(funcCallExprNode, null));
                }
                BlockStmtNode blockStmtNode = new BlockStmtNode(printList, null);
                int pos = fatherNode.getStmtList().indexOf(thisNode);
                fatherNode.getStmtList().remove(pos);
                fatherNode.getStmtList().add(pos, blockStmtNode);
            }
        } else {
            if (collect) {
                nodeList.add(node);
            }
        }
    }

    @Override
    public void visit(IDExprNode node) {
        if (collect) {
            nodeList.add(node);
        }
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
        if (collect) {
            nodeList.add(node);
        }
    }
}

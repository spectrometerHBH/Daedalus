package Compiler.AST;

import Compiler.Utils.Position;

public class IfStmtNode extends StmtNode {
    private ExprNode expression;
    private StmtNode thenStmt;
    private StmtNode elseStmt;

    public IfStmtNode(ExprNode expression, StmtNode thenStmt, StmtNode elseStmt, Position position){
        super(position);
        this.expression = expression;
        this.thenStmt = thenStmt;
        this.elseStmt = elseStmt;
    }

    public ExprNode getExpression() {
        return expression;
    }

    public StmtNode getThenStmt() {
        return thenStmt;
    }

    public StmtNode getElseStmt() {
        return elseStmt;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

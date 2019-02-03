package Compiler.AST;

import Compiler.Utils.Position;

public class IfStmtNode extends StmtNode {
    private ExprNode expression;
    private StmtNode thenStmt;
    private StmtNode elseStmt;
    private Position position;

    public IfStmtNode(ExprNode expression, StmtNode thenStmt, StmtNode elseStmt, Position position){
        this.expression = expression;
        this.thenStmt = thenStmt;
        this.elseStmt = elseStmt;
        this.position = position;
    }
}

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
}

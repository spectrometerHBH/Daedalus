package Compiler.AST;

import Compiler.Utils.Position;

public class WhileStmtNode extends StmtNode {
    private ExprNode expression;
    private StmtNode statement;
    private Position position;

    public WhileStmtNode(ExprNode expression, StmtNode statement, Position position){
        this.expression = expression;
        this.statement = statement;
        this.position = position;
    }
}

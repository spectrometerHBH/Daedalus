package Compiler.AST;

import Compiler.Utils.Position;

public class ExprStmtNode extends StmtNode {
    private ExprNode expr;

    public ExprStmtNode(ExprNode expr, Position position){
        super(position);
        this.expr = expr;
    }
}

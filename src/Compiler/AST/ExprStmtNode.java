package Compiler.AST;

import Compiler.Utils.Position;

public class ExprStmtNode extends StmtNode {
    private ExprNode expr;

    public ExprStmtNode(ExprNode expr, Position position){
        super(position);
        this.expr = expr;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

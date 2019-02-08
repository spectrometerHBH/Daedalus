package Compiler.AST;

import Compiler.Utils.Position;

public class ForStmtNode extends StmtNode {
    private ExprNode init;
    private ExprNode cond;
    private ExprNode step;
    private StmtNode statement;

    public ForStmtNode(ExprNode init, ExprNode cond, ExprNode step, StmtNode statement, Position position){
        super(position);
        this.init = init;
        this.cond = cond;
        this.step = step;
        this.statement = statement;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

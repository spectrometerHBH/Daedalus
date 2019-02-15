package Compiler.AST;

import Compiler.Utils.Position;

public class UnaryExprNode extends ExprNode {
    public enum Op{
        PRE_INC, PRE_DEC, SUF_INC, SUF_DEC, POS, NEG, NOTL, NOT
    };

    private Op op;
    private ExprNode expression;

    public UnaryExprNode(ExprNode expression, Op op, Position position){
        super(position);
        this.expression = expression;
        this.op = op;
    }

    public ExprNode getExpression() {
        return expression;
    }

    public Op getOp() {
        return op;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

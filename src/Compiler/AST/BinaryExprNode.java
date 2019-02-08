package Compiler.AST;

import Compiler.Utils.Position;

public class BinaryExprNode extends ExprNode {
    public enum Op{
        MUL, DIV, MOD, ADD, SUB, SHL, SHR, LT, GT, LEQ, GEQ, EQ, NEQ, AND, XOR, OR, ANDL, ORL, ASSIGN
    };

    private Op op;
    private ExprNode lhs, rhs;

    public BinaryExprNode(ExprNode lhs, ExprNode rhs, Op op, Position position){
        super(position);
        this.lhs = lhs;
        this.rhs = rhs;
        this.op = op;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public class ClassMemberNode extends ExprNode {
    private ExprNode expression;
    private String identifier;

    public ClassMemberNode(ExprNode expression, String identifier, Position position){
        super(position);
        this.expression = expression;
        this.identifier = identifier;
    }

    public ExprNode getExpression() {
        return expression;
    }

    public String getIdentifier() {
        return identifier;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

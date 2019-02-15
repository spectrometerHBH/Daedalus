package Compiler.AST;

import Compiler.Utils.Position;

public class VarDeclNode extends DeclNode {
    private TypeNode type;
    private ExprNode expr;
    private String identifier;
    private Position position;

    public VarDeclNode(TypeNode type, ExprNode expr, String identifier, Position position){
        super(position);
        this.type = type;
        this.expr = expr;
        this.identifier = identifier;
    }

    public void setType(TypeNode type){
        this.type = type;
    }

    public TypeNode getType() {
        return type;
    }

    public String getIdentifier() {
        return identifier;
    }

    public ExprNode getExpr() {
        return expr;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public class NewExprNode extends ExprNode {
    private TypeNode type;
    private int numDims;

    public NewExprNode(TypeNode type, int numDims, Position position){
        super(position);
        this.type = type;
        this.numDims = numDims;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

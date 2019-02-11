package Compiler.AST;

import Compiler.Utils.Position;

public class ArrayTypeNode extends TypeNode {
    private TypeNode baseType;
    private ExprNode expr;
    private int dims;

    public ArrayTypeNode(TypeNode typeNode, ExprNode expr, Position position){
        super(position, typeNode instanceof ArrayTypeNode ? ((ArrayTypeNode) typeNode).baseType.getTypeIdentifier() : typeNode.getTypeIdentifier());
        this.expr = expr;
        if (typeNode instanceof ArrayTypeNode){
            baseType = ((ArrayTypeNode) typeNode).baseType;
            dims = ((ArrayTypeNode) typeNode).dims + 1;
        }else{
            baseType = typeNode;
            dims = 1;
        }
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

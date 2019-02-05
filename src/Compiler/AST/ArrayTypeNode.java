package Compiler.AST;

import Compiler.Utils.Position;

public class ArrayTypeNode extends TypeNode {
    private TypeNode baseType;
    private ExprNode expr;
    private int dims;

    public ArrayTypeNode(TypeNode typeNode, ExprNode expr, Position position){
        super(position);
        this.expr = expr;
        if (typeNode instanceof ArrayTypeNode){
            baseType = ((ArrayTypeNode) typeNode).baseType;
            dims = ((ArrayTypeNode) typeNode).dims + 1;
        }else{
            baseType = typeNode;
            dims = 1;
        }
    }
}

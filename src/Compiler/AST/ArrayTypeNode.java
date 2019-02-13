package Compiler.AST;

import Compiler.Utils.Position;

public class ArrayTypeNode extends TypeNode {
    private TypeNode baseType;
    private int dims;

    public ArrayTypeNode(TypeNode typeNode, Position position){
        super(typeNode.getTypeIdentifier(), position);
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

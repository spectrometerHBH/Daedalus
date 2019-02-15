package Compiler.AST;

import Compiler.Symbol.ArrayType;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

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

    @Override
    public void compatible(ExprNode exprNode) {
        Type type = exprNode.getType();
        if (type instanceof ArrayType){
            if (type.getTypeName().equals(baseType.getTypeIdentifier())){
                if (dims >= ((ArrayType) type).getDims()) return;
            }
        }else if (type == null){
            if (exprNode.getCategory() == ExprNode.category.NULL) return;
        }
        throw new SemanticError("Type " + baseType.getTypeIdentifier() + " array is not compatible with " + exprNode.getType().getTypeName(), getPosition());
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

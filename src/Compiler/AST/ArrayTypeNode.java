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

    public int getDims() {
        return dims;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

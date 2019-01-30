package Compiler.AST;

import Compiler.Utils.Position;

public class ArrayTypeNode extends TypeNode {
    private TypeNode typeNode;

    public ArrayTypeNode(TypeNode typeNode, Position position){
        super(position);
        this.typeNode = typeNode;
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public abstract class TypeNode extends ASTNode {
    private String typeIdentifier;

    public TypeNode(Position position, String typeIdentifier) {
        super(position);
        this.typeIdentifier = typeIdentifier;
    }

    public String getTypeIdentifier(){
        return typeIdentifier;
    }
}

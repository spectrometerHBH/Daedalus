package Compiler.AST;

import Compiler.Utils.Position;

public abstract class TypeNode extends ASTNode {
    private String typeIdentifier;

    public TypeNode(String typeIdentifier, Position position) {
        super(position);
        this.typeIdentifier = typeIdentifier;
    }

    public String getTypeIdentifier(){
        return typeIdentifier;
    }

    public abstract void compatible(ExprNode exprNode);
}

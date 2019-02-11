package Compiler.AST;

import Compiler.Utils.Position;

public abstract class PrimitiveTypeNode extends TypeNode {
    public PrimitiveTypeNode(String typeIdentifier, Position position) {
        super(typeIdentifier, position);
    }
}

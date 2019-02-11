package Compiler.AST;

import Compiler.Utils.Position;

public abstract class PrimitiveTypeNode extends TypeNode {
    public PrimitiveTypeNode(Position position, String typeIdentifier) {
        super(position, typeIdentifier);
    }
}

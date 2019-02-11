package Compiler.AST;

import Compiler.Utils.Position;

public class StringTypeNode extends PrimitiveTypeNode {
    public StringTypeNode(Position position){
        super(position, "string");
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

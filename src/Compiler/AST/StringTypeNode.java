package Compiler.AST;

import Compiler.Utils.Position;

public class StringTypeNode extends PrimitiveTypeNode {
    public StringTypeNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public class IntTypeNode extends PrimitiveTypeNode {
    public IntTypeNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

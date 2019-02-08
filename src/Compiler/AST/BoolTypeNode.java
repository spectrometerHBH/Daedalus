package Compiler.AST;

import Compiler.Utils.Position;

public class BoolTypeNode extends PrimitiveTypeNode {
    public BoolTypeNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

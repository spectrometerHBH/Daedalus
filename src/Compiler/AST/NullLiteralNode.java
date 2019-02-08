package Compiler.AST;

import Compiler.Utils.Position;

public class NullLiteralNode extends ConstExprNode {
    public NullLiteralNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public class ThisExprNode extends ExprNode {
    public ThisExprNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

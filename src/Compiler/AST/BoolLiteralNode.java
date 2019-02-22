package Compiler.AST;

import Compiler.Utils.Position;

public class BoolLiteralNode extends ConstExprNode {
    private boolean val;

    public BoolLiteralNode(boolean val, Position position){
        super(position);
        this.val = val;
    }

    public boolean getVal() {
        return val;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

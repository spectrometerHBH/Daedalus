package Compiler.AST;

import Compiler.Utils.Position;

public class BoolLiteralNode extends ConstExprNode {
    private boolean val;

    public BoolLiteralNode(boolean val, Position position){
        super(position);
        this.val = val;
    }
}

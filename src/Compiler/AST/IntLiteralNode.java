package Compiler.AST;

import Compiler.Utils.Position;

public class IntLiteralNode extends ConstExprNode {
    private int val;

    public IntLiteralNode(int val, Position position){
        super(position);
        this.val = val;
    }
}

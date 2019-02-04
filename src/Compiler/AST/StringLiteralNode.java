package Compiler.AST;

import Compiler.Utils.Position;

public class StringLiteralNode extends ConstExprNode {
    private String val;

    public StringLiteralNode(String val, Position position){
        super(position);
        this.val = val;
    }
}

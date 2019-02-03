package Compiler.AST;

import Compiler.Utils.Position;

public class IDExprNode extends ExprNode {
    private String identifier;

    public IDExprNode(String identifier, Position position){
        super(position);
        this.identifier = identifier;
    }
}

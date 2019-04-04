package Compiler.AST;

import Compiler.Utils.Position;

public abstract class ConstExprNode extends ExprNode {
    public ConstExprNode(Position position) {
        super(position);
    }
}

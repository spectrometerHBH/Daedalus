package Compiler.AST;

import Compiler.Utils.Position;

public class ReturnNode extends StmtNode {
    private ExprNode expression;

    public ReturnNode(ExprNode expression, Position position){
        super(position);
        this.expression = expression;
    }
}

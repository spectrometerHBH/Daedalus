package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class FuncallExprNode extends ExprNode {
    private ExprNode function;
    private List<ExprNode> parameterList;

    public FuncallExprNode(ExprNode function, List<ExprNode> parameterList, Position position){
        super(position);
        this.function = function;
        this.parameterList = parameterList;
    }
}

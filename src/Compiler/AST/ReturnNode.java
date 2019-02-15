package Compiler.AST;

import Compiler.Symbol.FunctionSymbol;
import Compiler.Utils.Position;

public class ReturnNode extends StmtNode {
    private ExprNode expression;
    private FunctionSymbol functionSymbol;

    public ReturnNode(ExprNode expression, Position position){
        super(position);
        this.expression = expression;
    }

    public ExprNode getExpression() {
        return expression;
    }

    public FunctionSymbol getFunctionSymbol() {
        return functionSymbol;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol) {
        this.functionSymbol = functionSymbol;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

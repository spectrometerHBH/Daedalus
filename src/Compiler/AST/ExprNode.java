package Compiler.AST;

import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    public enum category {
        VARIABLE, CLASS, FUNCTION, NONLVALUE, NULL
    }

    private category category;
    private Type type;
    private FunctionSymbol functionSymbol;

    public ExprNode(Position position){
        super(position);
    }

    public ExprNode.category getCategory() {
        return category;
    }

    public void setCategory(ExprNode.category category) {
        this.category = category;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public FunctionSymbol getFunctionSymbol() {
        return functionSymbol;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol) {
        this.functionSymbol = functionSymbol;
    }
}

package Compiler.AST;

import Compiler.Symbol.Symbol;
import Compiler.Utils.Position;

public class ClassMemberNode extends ExprNode {
    private ExprNode expression;
    private String identifier;
    private Symbol symbol;

    public ClassMemberNode(ExprNode expression, String identifier, Position position) {
        super(position);
        this.expression = expression;
        this.identifier = identifier;
    }

    public ExprNode getExpression() {
        return expression;
    }

    public String getIdentifier() {
        return identifier;
    }

    public Symbol getSymbol() {
        return symbol;
    }

    public void setSymbol(Symbol symbol) {
        this.symbol = symbol;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}

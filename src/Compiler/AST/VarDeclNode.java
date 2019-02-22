package Compiler.AST;

import Compiler.Symbol.Type;
import Compiler.Symbol.VariableSymbol;
import Compiler.Utils.Position;

public class VarDeclNode extends DeclNode {
    private TypeNode type;
    private Type typeAfterResolve;
    private ExprNode expr;
    private String identifier;
    private Position position;

    //for IR
    private VariableSymbol variableSymbol;
    private boolean isGlobalVariable;

    public VarDeclNode(TypeNode type, ExprNode expr, String identifier, Position position){
        super(position);
        this.type = type;
        this.expr = expr;
        this.identifier = identifier;
        this.isGlobalVariable = false;
    }

    public VariableSymbol getVariableSymbol() {
        return variableSymbol;
    }

    public void setVariableSymbol(VariableSymbol variableSymbol) {
        this.variableSymbol = variableSymbol;
    }

    public void setType(TypeNode type){
        this.type = type;
    }

    public boolean isGlobalVariable() {
        return isGlobalVariable;
    }

    public void setGlobalVariable() {
        isGlobalVariable = true;
    }

    public TypeNode getType() {
        return type;
    }

    public String getIdentifier() {
        return identifier;
    }

    public ExprNode getExpr() {
        return expr;
    }

    public Type getTypeAfterResolve() {
        return typeAfterResolve;
    }

    public void setTypeAfterResolve(Type typeAfterResolve) {
        this.typeAfterResolve = typeAfterResolve;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

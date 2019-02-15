package Compiler.AST;

import Compiler.Symbol.Scope;
import Compiler.Utils.Position;

public class ThisExprNode extends ExprNode {
    private Scope scope;

    public ThisExprNode(Position position){
        super(position);
    }

    public Scope getScope() {
        return scope;
    }

    public void setScope(Scope scope) {
        this.scope = scope;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

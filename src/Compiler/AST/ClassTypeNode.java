package Compiler.AST;

import Compiler.Symbol.ClassSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ClassTypeNode extends TypeNode {
    private String identifier;

    public ClassTypeNode(String identifier, Position position) {
        super(identifier, position);
        this.identifier = identifier;
    }

    @Override
    public void compatible(ExprNode exprNode) {
        Type type = exprNode.getType();
        if (type instanceof ClassSymbol){
            if (type.getTypeName().equals(identifier)) return;
        }else if (type == null){
            if (exprNode.getCategory() == ExprNode.category.NULL) return;
        }
        throw new SemanticError("Type " + identifier + " is not compatible with "  + exprNode.getType().getTypeName(), getPosition());
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

package Compiler.AST;

import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class BoolTypeNode extends PrimitiveTypeNode {
    public BoolTypeNode(Position position) {
        super("bool", position);
    }

    @Override
    public void compatible(ExprNode exprNode) {
        Type type = exprNode.getType();
        if (type instanceof PrimitiveTypeSymbol){
            if (type.getTypeName().equals("bool")) return;
        }
        throw new SemanticError("Type bool not compatible with " + type.getTypeName(), getPosition());
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

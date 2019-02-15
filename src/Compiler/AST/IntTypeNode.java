package Compiler.AST;

import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IntTypeNode extends PrimitiveTypeNode {
    public IntTypeNode(Position position){
        super("int", position);
    }

    @Override
    public void compatible(ExprNode exprNode) {
        Type type = exprNode.getType();
        if (type instanceof PrimitiveTypeSymbol){
            if (type.getTypeName().equals("int")) return;
        }
        throw new SemanticError("Type int not compatible with " + exprNode.getType().getTypeName(), getPosition());
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

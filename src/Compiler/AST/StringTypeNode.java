package Compiler.AST;

import Compiler.Symbol.ClassSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class StringTypeNode extends PrimitiveTypeNode {
    public StringTypeNode(Position position){
        super("string", position);
    }

    @Override
    public void compatible(ExprNode exprNode) {
        Type type = exprNode.getType();
        if (type instanceof ClassSymbol){
            if (type.getTypeName().equals("string")) return;
        }
        throw new SemanticError("Type string not compatible with " + type.getTypeName(), getPosition());
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

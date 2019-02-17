package Compiler.AST;

import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class BoolTypeNode extends PrimitiveTypeNode {
    public BoolTypeNode(Position position) {
        super("bool", position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

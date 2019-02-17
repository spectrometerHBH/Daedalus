package Compiler.AST;

import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class IntTypeNode extends PrimitiveTypeNode {
    public IntTypeNode(Position position){
        super("int", position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

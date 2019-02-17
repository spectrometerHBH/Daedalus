package Compiler.AST;

import Compiler.Symbol.ClassSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class StringTypeNode extends PrimitiveTypeNode {
    public StringTypeNode(Position position){
        super("string", position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

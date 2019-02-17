package Compiler.AST;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class VoidTypeNode extends PrimitiveTypeNode {
    public VoidTypeNode(Position position){
        super("void", position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

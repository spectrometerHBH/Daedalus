package Compiler.AST;

import Compiler.Utils.Position;

public class ClassTypeNode extends TypeNode {
    private String identifier;

    public ClassTypeNode(Position position, String identifier) {
        super(position, identifier);
        this.identifier = identifier;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

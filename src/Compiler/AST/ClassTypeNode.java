package Compiler.AST;

import Compiler.Utils.Position;

public class ClassTypeNode extends TypeNode {
    private String identifier;

    public ClassTypeNode(String identifier, Position position) {
        super(identifier, position);
        this.identifier = identifier;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}

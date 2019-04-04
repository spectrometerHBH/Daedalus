package Compiler.AST;

import Compiler.Utils.Position;

public abstract class DeclNode extends ASTNode {
    public DeclNode(Position position) {
        super(position);
    }
}

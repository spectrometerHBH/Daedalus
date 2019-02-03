package Compiler.AST;

import Compiler.Utils.Position;

public abstract class ASTNode {
    private Position position;

    public ASTNode(Position position){
        this.position = position;
    }
}

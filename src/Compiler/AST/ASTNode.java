package Compiler.AST;

import Compiler.Utils.Position;

public abstract class ASTNode {
    private Position position;
    private boolean underLoop;

    public ASTNode(Position position){
        this.position = position;
        this.underLoop = false;
    }

    public Position getPosition(){
        return position;
    }

    public void setUnderLoop() {
        this.underLoop = true;
    }

    public boolean isUnderLoop() {
        return underLoop;
    }

    abstract public void accept(ASTVisitor visitor);
}

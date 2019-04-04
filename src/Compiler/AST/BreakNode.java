package Compiler.AST;

import Compiler.Utils.Position;

public class BreakNode extends StmtNode {
    private Loop currentLoop;

    public BreakNode(Position position) {
        super(position);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    public Loop getCurrentLoop() {
        return currentLoop;
    }

    public void setCurrentLoop(Loop currentLoop) {
        this.currentLoop = currentLoop;
    }
}

package Compiler.AST;

import Compiler.Utils.Position;

public class BreakNode extends StmtNode {
    public BreakNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

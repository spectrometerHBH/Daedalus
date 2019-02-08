package Compiler.AST;

import Compiler.Utils.Position;

public class ContinueNode extends StmtNode {
    public ContinueNode(Position position){
        super(position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

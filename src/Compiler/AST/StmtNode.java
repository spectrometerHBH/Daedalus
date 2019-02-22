package Compiler.AST;

import Compiler.Utils.Position;

public abstract class StmtNode extends ASTNode {

    public StmtNode(Position position){
        super(position);
    }
}

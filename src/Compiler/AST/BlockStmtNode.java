package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class BlockStmtNode extends StmtNode {
    private List<StmtNode> stmtList;
    private Position position;

    public BlockStmtNode(List<StmtNode> stmtList, Position position){
        super(position);
        this.stmtList = stmtList;
    }

    public List<StmtNode> getStmtList() {
        return stmtList;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

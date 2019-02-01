package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class BlockStmtNode extends StmtNode {
    private List<StmtNode> stmtList;
    private Position position;

    public BlockStmtNode(List<StmtNode> stmtList, Position position){
        this.stmtList = stmtList;
        this.position = position;
    }
}

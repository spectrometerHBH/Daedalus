package Compiler.AST;

import Compiler.Utils.Position;

import java.util.ArrayList;
import java.util.List;

public class BlockStmtNode extends StmtNode {
    private List<StmtNode> stmtList = new ArrayList<>();
    private Position position;

    public BlockStmtNode(StmtNode stmtNode, Position position) {
        super(position);
        if (stmtNode != null) stmtList.add(stmtNode);
    }

    public BlockStmtNode(List<StmtNode> stmtList, Position position) {
        super(position);
        this.stmtList = stmtList;
    }

    public List<StmtNode> getStmtList() {
        return stmtList;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}

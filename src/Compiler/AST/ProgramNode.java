package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class ProgramNode extends ASTNode {
    private List<DeclNode> declNodeList;

    public ProgramNode(List<DeclNode> declNodesList, Position position){
        super(position);
        this.declNodeList = declNodesList;
    }
}

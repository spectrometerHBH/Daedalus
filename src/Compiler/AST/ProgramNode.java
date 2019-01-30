package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class ProgramNode extends ASTNode {
    private List<DeclNode> declNodeList;
    private Position position;

    public ProgramNode(List<DeclNode> declNodesList, Position position){
        this.declNodeList = declNodesList;
        this.position = position;
    }
}

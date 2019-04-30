package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class ProgramNode extends ASTNode {
    private List<DeclNode> declNodeList;

    public boolean hasClassDeclNode = false;

    public ProgramNode(List<DeclNode> declNodesList, Position position, boolean hasClassDeclNode) {
        super(position);
        this.declNodeList = declNodesList;
        this.hasClassDeclNode = hasClassDeclNode;
    }

    public List<DeclNode> getDeclNodeList() {
        return this.declNodeList;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}

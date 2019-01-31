package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class FuncDeclNode extends DeclNode {
    private TypeNode type;
    private String identifier;
    private List<VarDeclNode> parameterList;
    private BlockStmtNode block;
    private Position position;

    public FuncDeclNode(TypeNode type, String identifier, List<VarDeclNode> parameterList, BlockStmtNode block, Position position){
        this.type = type;
        this.identifier = identifier;
        this.parameterList = parameterList;
        this.block = block;
        this.position = position;
    }
}

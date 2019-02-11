package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class FuncDeclNode extends DeclNode {
    private TypeNode type;
    private String identifier;
    private List<VarDeclNode> parameterList;
    private BlockStmtNode block;

    public FuncDeclNode(TypeNode type, String identifier, List<VarDeclNode> parameterList, BlockStmtNode block, Position position){
        super(position);
        this.type = type;
        this.identifier = identifier;
        this.parameterList = parameterList;
        this.block = block;
    }

    public String getIdentifier() {
        return identifier;
    }

    public TypeNode getType() {
        return type;
    }

    public List<VarDeclNode> getParameterList() {
        return parameterList;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

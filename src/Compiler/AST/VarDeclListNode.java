package Compiler.AST;

import Compiler.Utils.Position;

import java.util.ArrayList;
import java.util.List;

public class VarDeclListNode extends DeclNode{
    private List<VarDeclNode> decls;

    public VarDeclListNode(Position position){
        super(position);
        this.decls = new ArrayList<>();
    }

    public VarDeclListNode(List<VarDeclNode> decls, Position position){
        super(position);
        this.decls = decls;
    }

    public List<VarDeclNode> getList(){
        return decls;
    }

    public void setType(TypeNode type){
        for (VarDeclNode decl : decls)
            decl.setType(type);
    }

    public void addVar(VarDeclNode varDeclNode){
        decls.add(varDeclNode);
    }
}

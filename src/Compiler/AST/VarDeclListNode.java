package Compiler.AST;

import java.util.ArrayList;
import java.util.List;

public class VarDeclListNode extends DeclNode{
    private List<VarDeclNode> decls;

    public VarDeclListNode(){
        this.decls = new ArrayList<>();
    }

    public VarDeclListNode(List<VarDeclNode> decls){
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

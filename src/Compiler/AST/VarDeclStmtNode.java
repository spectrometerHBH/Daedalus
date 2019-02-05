package Compiler.AST;

import Compiler.Utils.Position;

public class VarDeclStmtNode extends StmtNode {
    private VarDeclListNode varDeclList;

    public VarDeclStmtNode(VarDeclListNode varDeclList, Position position){
        super(position);
        this.varDeclList = varDeclList;
    }
}

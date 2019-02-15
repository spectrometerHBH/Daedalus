package Compiler.Symbol;

import Compiler.AST.NewExprNode;

public class ArrayType implements Type {
    NewExprNode newExprNode;

    public ArrayType(NewExprNode newExprNode) {
        this.newExprNode = newExprNode;
    }

    public NewExprNode getNewExprNode() {
        return newExprNode;
    }

    @Override
    public String getTypeName() {
        return newExprNode.getBaseType().getTypeIdentifier() + " array";
    }

    public String getBaseTypeName(){
        return newExprNode.getBaseType().getTypeIdentifier();
    }
}

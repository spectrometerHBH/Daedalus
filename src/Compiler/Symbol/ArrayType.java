package Compiler.Symbol;

import Compiler.AST.TypeNode;

public class ArrayType implements Type {
    TypeNode typeNode;
    int dims;

    public ArrayType(TypeNode typeNode, int dims) {
        this.typeNode = typeNode;
        this.dims = dims;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    public void setTypeNode(TypeNode typeNode) {
        this.typeNode = typeNode;
    }

    public int getDims() {
        return dims;
    }

    public void setDims(int dims) {
        this.dims = dims;
    }

    @Override
    public String getTypeName() {
        return typeNode.getTypeIdentifier() + " array";
    }

    public String getBaseTypeName(){
        return typeNode.getTypeIdentifier();
    }
}

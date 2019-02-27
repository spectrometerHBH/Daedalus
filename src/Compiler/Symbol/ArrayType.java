package Compiler.Symbol;

import Compiler.Configuration;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class ArrayType implements Type {
    private Type baseType;
    private int dims;

    public ArrayType(Type baseType, int dims) {
        this.baseType = baseType;
        this.dims = dims;
    }

    public Type getBaseType() {
        return baseType;
    }

    public void setBaseType(Type baseType) {
        this.baseType = baseType;
    }

    public int getDims() {
        return dims;
    }

    public void setDims(int dims) {
        this.dims = dims;
    }

    @Override
    public String getTypeName() {
        return baseType.getTypeName() + " array";
    }

    public String getBaseTypeName(){
        return baseType.getTypeName();
    }

    @Override
    public void compatible(Type type, Position position) {
        if (type.getTypeName().equals("null")){

        } else if (type instanceof ArrayType){
            baseType.compatible(((ArrayType) type).getBaseType(), position);
            if (dims == ((ArrayType) type).getDims()){

            }else throw new SemanticError("Dimension not match", position);
        } else throw new SemanticError("Type " + getTypeName() + " is not compatible with type " + type.getTypeName(), position);
    }

    @Override
    public boolean isPrimitiveType() {
        return false;
    }

    @Override
    public boolean isClassType() {
        return false;
    }

    @Override
    public boolean isArrayType() {
        return true;
    }

    @Override
    public boolean isNullType() {
        return false;
    }

    @Override
    public boolean isPointerType() { return true; }

    @Override
    public int getTypeSize() {
        return Configuration.POINTER_SIZE();
    }
}

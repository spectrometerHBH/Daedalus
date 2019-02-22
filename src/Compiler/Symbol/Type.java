package Compiler.Symbol;

import Compiler.Utils.Position;

public interface Type {
    String getTypeName();
    void compatible(Type type, Position position);
    boolean isPrimitiveType();
    boolean isClassType();
    boolean isArrayType();
    boolean isNullType();
    int getTypeSize();
}

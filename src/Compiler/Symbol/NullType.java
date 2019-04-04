package Compiler.Symbol;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class NullType implements Type {
    @Override
    public String getTypeName() {
        return "null";
    }

    @Override
    public void compatible(Type type, Position position) {
        throw new SemanticError("Null expression is not assignable", position);
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
        return false;
    }

    @Override
    public boolean isNullType() {
        return true;
    }

    @Override
    public boolean isPointerType() {
        return true;
    }

    @Override
    public int getTypeSize() {
        return 0;
    }
}

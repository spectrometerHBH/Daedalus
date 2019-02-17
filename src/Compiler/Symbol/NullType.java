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
}

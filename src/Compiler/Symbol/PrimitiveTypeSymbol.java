package Compiler.Symbol;

import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

public class PrimitiveTypeSymbol extends Symbol implements Type {
    //int bool void
    public PrimitiveTypeSymbol(String name) {
        super(name, null, null);
    }

    @Override
    public String getTypeName() {
        return super.getSymbolName();
    }

    @Override
    public void compatible(Type type, Position position) {
        if (!type.getTypeName().equals("void")) {
            if (getTypeName().equals(type.getTypeName())) {

            } else
                throw new SemanticError("Type " + getTypeName() + " not compatible with type " + type.getTypeName(), position);
        } else throw new SemanticError("Void expression on right hand side", position);
    }

    @Override
    public boolean isPrimitiveType() {
        return true;
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
        return false;
    }
}

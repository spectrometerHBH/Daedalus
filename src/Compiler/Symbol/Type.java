package Compiler.Symbol;

import Compiler.Utils.Position;

public interface Type {
    String getTypeName();
    void compatible(Type type, Position position);
}

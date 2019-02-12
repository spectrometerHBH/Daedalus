package Compiler.Symbol;

import Compiler.Utils.Position;

public interface Scope {
    String getScopeName();
    Scope getEnclosingScope();
    void defineVariable(VariableSymbol sym);
    void defineFunction(FunctionSymbol sym);
    void defineClass(ClassSymbol sym);
    Symbol resolveSymbol(String identifier, Position position);
}

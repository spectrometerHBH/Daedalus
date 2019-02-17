package Compiler.Symbol;

import Compiler.Utils.Position;

public class LocalScope extends BaseScope {
    public LocalScope(String name, Scope enclosingScope) {
        super(name, enclosingScope);
    }

    @Override
    public void defineClass(ClassSymbol sym) {

    }

    @Override
    public Symbol resolveSymbol(String identifier, Position position) {
        if (symbolMap.containsKey(identifier)) return symbolMap.get(identifier);
        else return getEnclosingScope().resolveSymbol(identifier, position);
    }
}

package Compiler.Symbol;

import Compiler.Utils.Position;

public class LocalScope extends BaseScope {
    private boolean underLoop;
    public LocalScope(String name, Scope enclosingScope) {
        super(name, enclosingScope);
        underLoop = false;
    }

    @Override
    public void defineClass(ClassSymbol sym) {

    }

    public void setUnderLoop() {
        this.underLoop = true;
    }

    public boolean isUnderLoop() {
        return underLoop;
    }

    @Override
    public Symbol resolveSymbol(String identifier, Position position) {
        return null;
    }
}

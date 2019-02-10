package Compiler.Symbol;

public class LocalScope extends BaseScope {
    public LocalScope(String name, Scope enclosingScope) {
        super(name, enclosingScope);
    }

    @Override
    public void defineClass(ClassSymbol sym) {

    }

    @Override
    public Symbol resolve(String name) {
        return null;
    }
}

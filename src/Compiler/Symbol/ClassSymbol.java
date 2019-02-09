package Compiler.Symbol;

public class ClassSymbol extends Symbol implements Scope, Type {
    public ClassSymbol(String name) {
        super(name);
    }

    @Override
    public String getScopeName() {
        return null;
    }

    @Override
    public String getTypeName() {
        return null;
    }

    @Override
    public Scope getEnclosingScope() {
        return null;
    }

    @Override
    public void defineVariable(VariableSymbol sym) {

    }

    @Override
    public void defineFunction(FunctionSymbol sym) {

    }

    @Override
    public void defineClass(ClassSymbol sym) {

    }

    @Override
    public Symbol resolve(String name) {
        return null;
    }
}

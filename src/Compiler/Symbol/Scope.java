package Compiler.Symbol;

public interface Scope {
    String getScopeName();
    Scope getEnclosingScope();
    void defineVariable(Symbol sym);
    void defineFunction(Symbol sym);
    void defineClass(Symbol sym);
    Symbol resolve(String name);
}

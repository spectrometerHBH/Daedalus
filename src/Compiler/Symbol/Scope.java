package Compiler.Symbol;

public interface Scope {
    String getScopeName();
    Scope getEnclosingScope();
    void defineVariable(VariableSymbol sym);
    void defineFunction(FunctionSymbol sym);
    void defineClass(ClassSymbol sym);
    Symbol resolve(String name);
}

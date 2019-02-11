package Compiler.Symbol;

import Compiler.AST.ASTNode;

public interface Scope {
    String getScopeName();
    Scope getEnclosingScope();
    void defineVariable(VariableSymbol sym);
    void defineFunction(FunctionSymbol sym);
    void defineClass(ClassSymbol sym);
    Symbol resolveSymbol(ASTNode astNode);
}

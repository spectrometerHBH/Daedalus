package Compiler.Symbol;

import Compiler.AST.VarDeclNode;

public class VariableSymbol extends Symbol {
    public VariableSymbol(String name, Type type, VarDeclNode varDeclNode) {
        super(name, type, varDeclNode);
    }

    @Override
    public boolean isVariableSymbol() {
        return true;
    }
}

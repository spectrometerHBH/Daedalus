package Compiler.Symbol;

import Compiler.AST.VarDeclNode;

public class VariableSymbol extends Symbol {
    public VariableSymbol(String name, VarDeclNode varDeclNode) {
        super(name, varDeclNode);
    }
}

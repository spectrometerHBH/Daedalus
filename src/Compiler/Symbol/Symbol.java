package Compiler.Symbol;

import Compiler.AST.ASTNode;

public class Symbol {
    private String name;
    private ASTNode def;

    public Symbol(String name, ASTNode def) {
        this.name = name;
        this.def = def;
    }

    public String getSymbolName(){
        return this.name;
    }

    public ASTNode getDef(){
        return def;
    }
}

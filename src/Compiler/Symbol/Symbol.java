package Compiler.Symbol;

import Compiler.AST.ASTNode;

public class Symbol {
    private String name;
    private Type type;
    private ASTNode def;

    public Symbol(String name, Type type, ASTNode def) {
        this.name = name;
        this.type = type;
        this.def = def;
    }

    public String getSymbolName(){
        return this.name;
    }

    public ASTNode getDef(){
        return def;
    }
}

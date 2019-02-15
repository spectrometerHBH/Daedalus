package Compiler.Symbol;

import Compiler.AST.ASTNode;

public class Symbol {
    private String name;
    private Type type;
    private ASTNode define;

    public Symbol(String name, Type type, ASTNode define) {
        this.name = name;
        this.type = type;
        this.define = define;
    }

    public String getSymbolName(){
        return this.name;
    }

    public ASTNode getDef(){
        return define;
    }

    public Type getType() {
        return type;
    }
}

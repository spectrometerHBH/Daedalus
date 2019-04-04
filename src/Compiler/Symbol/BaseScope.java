package Compiler.Symbol;

import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public abstract class BaseScope implements Scope {
    Map<String, Symbol> symbolMap = new LinkedHashMap<>();
    private String name;
    private Scope enclosingScope;

    BaseScope(String name, Scope enclosingScope) {
        this.name = name;
        this.enclosingScope = enclosingScope;
    }

    @Override
    public String getScopeName() {
        return name;
    }

    @Override
    public Scope getEnclosingScope() {
        return enclosingScope;
    }

    @Override
    public void defineVariable(VariableSymbol symbol) {
        if (symbolMap.containsKey(symbol.getSymbolName()))
            throw new SemanticError("Duplicate identifiers.", symbol.getDef().getPosition());
        symbolMap.put(symbol.getSymbolName(), symbol);
        symbol.setScope(this);
    }

    @Override
    public void defineFunction(FunctionSymbol symbol) {
        if (symbolMap.containsKey(symbol.getSymbolName()))
            throw new SemanticError("Duplicate identifiers.", symbol.getDef().getPosition());
        symbolMap.put(symbol.getSymbolName(), symbol);
        symbol.setScope(this);
    }

}

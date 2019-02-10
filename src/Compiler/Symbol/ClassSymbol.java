package Compiler.Symbol;

import Compiler.AST.ClassDeclNode;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class ClassSymbol extends Symbol implements Scope, Type {
    private Scope enclosingScope;
    private Map<String, VariableSymbol> variableSymbolMap = new LinkedHashMap<>();
    private Map<String, FunctionSymbol> functionSymbolMap = new LinkedHashMap<>();

    public ClassSymbol(String name, Type type, ClassDeclNode classDeclNode, Scope enclosingScope) {
        super(name, null, classDeclNode);
        this.enclosingScope = enclosingScope;
    }

    @Override
    public String getScopeName() {
        return super.getSymbolName();
    }

    @Override
    public String getTypeName() {
        return super.getSymbolName();
    }

    @Override
    public Scope getEnclosingScope() {
        return enclosingScope;
    }

    @Override
    public void defineVariable(VariableSymbol symbol) {
        if (variableSymbolMap.containsKey(symbol.getSymbolName()) || functionSymbolMap.containsKey(symbol.getSymbolName()))
            throw new SemanticError("Duplicate identifiers", symbol.getDef().getPosition());
        variableSymbolMap.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public void defineFunction(FunctionSymbol symbol) {
        if (variableSymbolMap.containsKey(symbol.getSymbolName()) || functionSymbolMap.containsKey(symbol.getSymbolName()))
            throw new SemanticError("Duplicate identifiers", symbol.getDef().getPosition());
        functionSymbolMap.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public void defineClass(ClassSymbol symbol) {

    }

    @Override
    public Symbol resolve(String name) {
        return null;
    }
}

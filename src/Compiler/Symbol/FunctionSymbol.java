package Compiler.Symbol;

import Compiler.AST.FuncDeclNode;
import Compiler.Utils.SemanticError;

import java.util.Map;

public class FunctionSymbol extends Symbol implements Scope{
    private Scope enclosingScope;
    private Map<String, VariableSymbol> arguments;

    public FunctionSymbol(String name, FuncDeclNode funcDeclNode, Scope enclosingScope) {
        super(name, funcDeclNode);
        this.enclosingScope = enclosingScope;
    }

    @Override
    public String getScopeName() {
        return super.getSymbolName();
    }

    @Override
    public Scope getEnclosingScope() {
        return enclosingScope;
    }

    @Override
    public void defineVariable(VariableSymbol symbol) {
        if (arguments.containsKey(symbol.getSymbolName())) throw new SemanticError("duplicate name variables", symbol.getDef().getPosition());
        else arguments.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public void defineFunction(FunctionSymbol sym) {

    }

    @Override
    public void defineClass(ClassSymbol sym) {

    }

    @Override
    public Symbol resolve(String name) {
        return null;
    }
}

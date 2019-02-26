package Compiler.Symbol;

import Compiler.AST.FuncDeclNode;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class FunctionSymbol extends Symbol implements Scope{
    private Scope enclosingScope;
    private Map<String, VariableSymbol> arguments = new LinkedHashMap<>();

    //for IR
    private boolean isMemberFunction = false;

    public FunctionSymbol(String name, Type type, FuncDeclNode funcDeclNode, Scope enclosingScope) {
        super(name, type, funcDeclNode);
        this.enclosingScope = enclosingScope;
    }

    public Map<String, VariableSymbol> getArguments() {
        return arguments;
    }

    public boolean isMemberFunction() {
        return isMemberFunction;
    }

    public void setMemberFunction() {
        isMemberFunction = true;
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
    public Symbol resolveSymbol(String identifier, Position position) {
        Symbol symbol = arguments.get(identifier);
        if (symbol != null) return symbol;
        else return enclosingScope.resolveSymbol(identifier, position);
    }

    @Override
    public boolean isFunctionSymbol() {
        return true;
    }
}

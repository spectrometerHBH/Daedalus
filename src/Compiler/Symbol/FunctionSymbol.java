package Compiler.Symbol;

import Compiler.AST.FuncDeclNode;
import Compiler.IR.Function;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class FunctionSymbol extends Symbol implements Scope {
    private Scope enclosingScope;
    private Function function;
    private Map<String, VariableSymbol> arguments = new LinkedHashMap<>();

    //for HIR optimization
    public boolean hasSideEffect = false;

    //for IR
    private boolean isMemberFunction = false;

    public FunctionSymbol(String name, Type type, FuncDeclNode funcDeclNode, Scope enclosingScope) {
        super(name, type, funcDeclNode);
        this.enclosingScope = enclosingScope;
    }

    public FunctionSymbol(String name, Type type, FuncDeclNode funcDeclNode, Scope enclosingScope, boolean hasSideEffect) {
        super(name, type, funcDeclNode);
        this.enclosingScope = enclosingScope;
        this.hasSideEffect = hasSideEffect;
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

    public Function getFunction() {
        return function;
    }

    public void setFunction(Function function) {
        this.function = function;
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
        if (arguments.containsKey(symbol.getSymbolName()))
            throw new SemanticError("duplicate name variables", symbol.getDef().getPosition());
        else arguments.put(symbol.getSymbolName(), symbol);
        symbol.setScope(this);
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

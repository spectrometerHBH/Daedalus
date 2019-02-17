package Compiler.Symbol;

import Compiler.AST.ClassDeclNode;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;
import javafx.geometry.Pos;

import java.util.LinkedHashMap;
import java.util.Map;

public class ClassSymbol extends Symbol implements Scope, Type {
    private Scope enclosingScope;
    private FunctionSymbol constructor;
    private Map<String, VariableSymbol> variableSymbolMap = new LinkedHashMap<>();
    private Map<String, FunctionSymbol> functionSymbolMap = new LinkedHashMap<>();

    public ClassSymbol(String name, ClassDeclNode classDeclNode, Scope enclosingScope) {
        super(name, null, classDeclNode);
        this.enclosingScope = enclosingScope;
        constructor = null;
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

    public FunctionSymbol getConstructor() {
        return constructor;
    }

    public void setConstructor(FunctionSymbol constructor) {
        this.constructor = constructor;
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
    public Symbol resolveSymbol(String identifier, Position position) {
        if (variableSymbolMap.containsKey(identifier)) return variableSymbolMap.get(identifier);
        if (functionSymbolMap.containsKey(identifier)) return functionSymbolMap.get(identifier);
        return enclosingScope.resolveSymbol(identifier, position);
    }

    public Symbol resolveMember(String identifier, Position position){
        if (variableSymbolMap.containsKey(identifier)) return variableSymbolMap.get(identifier);
        if (functionSymbolMap.containsKey(identifier)) return functionSymbolMap.get(identifier);
        throw new SemanticError(identifier + " is not a member of " + getSymbolName(), position);
    }

    @Override
    public void compatible(Type type, Position position) {
        if (getTypeName().equals("string")){
            if (type.getTypeName().equals("string")){

            }else throw new SemanticError("Type string is not compatible with type " + type.getTypeName(), position);
        }else{
            if (type.getTypeName().equals("null") || type.getTypeName().equals(getTypeName())){

            }else throw new SemanticError("Type " + getTypeName() + " is not compatible with type " + type.getTypeName(), position);
        }
    }
}

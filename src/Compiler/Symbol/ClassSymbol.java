package Compiler.Symbol;

import Compiler.AST.ClassDeclNode;
import Compiler.Configuration;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class ClassSymbol extends Symbol implements Scope, Type {
    private Scope enclosingScope;
    private FunctionSymbol constructor;
    private Map<String, VariableSymbol> variableSymbolMap = new LinkedHashMap<>();
    private Map<String, FunctionSymbol> functionSymbolMap = new LinkedHashMap<>();

    //for IR
    private int size;

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
        symbol.setOffset(size);
        symbol.setScope(this);
        size += symbol.getType().getTypeSize();
    }

    @Override
    public void defineFunction(FunctionSymbol symbol) {
        if (variableSymbolMap.containsKey(symbol.getSymbolName()) || functionSymbolMap.containsKey(symbol.getSymbolName()))
            throw new SemanticError("Duplicate identifiers", symbol.getDef().getPosition());
        symbol.setMemberFunction();
        symbol.setScope(this);
        functionSymbolMap.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public void defineClass(ClassSymbol symbol) {

    }

    @Override
    public Symbol resolveSymbol(String identifier, Position position) {
        Symbol variableSymbol = variableSymbolMap.get(identifier);
        Symbol functionSymbol = functionSymbolMap.get(identifier);
        if (variableSymbol != null) return variableSymbol;
        if (functionSymbol != null) return functionSymbol;
        return enclosingScope.resolveSymbol(identifier, position);
    }

    public Symbol resolveMember(String identifier, Position position) {
        Symbol variableSymbol = variableSymbolMap.get(identifier);
        Symbol functionSymbol = functionSymbolMap.get(identifier);
        if (variableSymbol != null) return variableSymbol;
        if (functionSymbol != null) return functionSymbol;
        throw new SemanticError(identifier + " is not a member of " + getSymbolName(), position);
    }

    @Override
    public void compatible(Type type, Position position) {
        if (getTypeName().equals("string")) {
            if (type.getTypeName().equals("string")) {

            } else throw new SemanticError("Type string is not compatible with type " + type.getTypeName(), position);
        } else {
            if (type.getTypeName().equals("null") || type.getTypeName().equals(getTypeName())) {

            } else
                throw new SemanticError("Type " + getTypeName() + " is not compatible with type " + type.getTypeName(), position);
        }
    }

    @Override
    public boolean isClassSymbol() {
        return true;
    }

    @Override
    public boolean isPrimitiveType() {
        return false;
    }

    @Override
    public boolean isClassType() {
        return true;
    }

    @Override
    public boolean isArrayType() {
        return false;
    }

    @Override
    public boolean isNullType() {
        return false;
    }

    @Override
    public boolean isPointerType() {
        return true;
    }

    @Override
    public int getTypeSize() {
        return Configuration.POINTER_SIZE();
    }

    public int getObjectSize() {
        return size;
    }
}
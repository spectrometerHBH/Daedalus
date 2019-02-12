package Compiler.Symbol;

import Compiler.AST.TypeNode;
import Compiler.Utils.Position;
import Compiler.Utils.SemanticError;

import java.util.LinkedHashMap;
import java.util.Map;

public class GlobalScope extends BaseScope{
    private Map<String, Type> typeMap = new LinkedHashMap<>();

    public GlobalScope(String name){
        super(name, null);
    }

    @Override public void defineClass(ClassSymbol symbol){
        if (typeMap.containsKey(symbol.getTypeName())) throw new SemanticError("Duplicate identifiers.", symbol.getDef().getPosition());
        if (symbolMap.containsKey(symbol.getSymbolName())) throw new SemanticError("Duplicate identifiers.", symbol.getDef().getPosition());
        symbolMap.put(symbol.getSymbolName(), symbol);
    }

    public void definePrimitiveType(PrimitiveTypeSymbol symbol){
        typeMap.put(symbol.getSymbolName(), symbol);
        symbolMap.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public Symbol resolveSymbol(String identifier, Position position) {
        if (!symbolMap.containsKey(identifier)) throw new SemanticError("Unknown identifier", position);
        return symbolMap.get(identifier);
    }

    public Type resolveType(TypeNode typeNode) {
        if (!typeMap.containsKey(typeNode.getTypeIdentifier())) throw new SemanticError("Unknown type specifier", typeNode.getPosition());
        return typeMap.get(typeNode.getTypeIdentifier());
    }
}

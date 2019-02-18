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
        typeMap.put(symbol.getSymbolName(), symbol);
    }

    public void definePrimitiveType(PrimitiveTypeSymbol symbol){
        typeMap.put(symbol.getSymbolName(), symbol);
    }

    @Override
    public Symbol resolveSymbol(String identifier, Position position) {
        Symbol symbol = symbolMap.get(identifier);
        if (symbol == null) throw new SemanticError("Unknown identifier", position);
        return symbol;
    }

    public Type resolveType(TypeNode typeNode) {
        Type type = typeMap.get(typeNode.getTypeIdentifier());
        if (type == null) throw new SemanticError("Unknown type specifier", typeNode.getPosition());
        return type;
    }

    public Type resolveType(String identifier, Position position) {
        Type type = typeMap.get(identifier);
        if (type == null) throw new SemanticError("Unknown type specifier", position);
        return type;
    }

    public Symbol resolveMain() {
        if (!symbolMap.containsKey("main")) throw new SemanticError("Can't find main function", new Position(0, 0));
        return symbolMap.get("main");
    }
}

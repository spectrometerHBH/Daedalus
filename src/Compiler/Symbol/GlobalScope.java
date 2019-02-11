package Compiler.Symbol;

import Compiler.AST.ASTNode;
import Compiler.AST.ClassDeclNode;
import Compiler.AST.TypeNode;
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
    public Symbol resolveSymbol(ASTNode astNode) {
        if (astNode instanceof ClassDeclNode){
            if (!symbolMap.containsKey(((ClassDeclNode) astNode).getIdentifier())) throw new SemanticError("Unknown identifier", astNode.getPosition());
            return symbolMap.get(((ClassDeclNode) astNode).getIdentifier());
        } else return null;
    }

    public Type resolveType(TypeNode typeNode) {
        if (typeMap.containsKey(typeNode.getTypeIdentifier())) throw new SemanticError("Unknown type specifier", typeNode.getPosition());
        return typeMap.get(typeNode.getTypeIdentifier());
    }
}

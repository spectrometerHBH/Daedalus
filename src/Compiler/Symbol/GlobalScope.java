package Compiler.Symbol;

import java.util.LinkedHashMap;
import java.util.Map;

public class GlobalScope extends BaseScope{
    private Map<String, Type> typeMap = new LinkedHashMap<>();

    public GlobalScope(String name){
        super(name, null);
    }

    @Override public void defineVariable(VariableSymbol symbol){

    }

    @Override public void defineFunction(FunctionSymbol symbol){

    }

    @Override public void defineClass(ClassSymbol symbol){

    }

    public void definePrimitiveType(PrimitiveTypeSymbol symbol){
        typeMap.put(symbol.getSymbolName(), symbol);
    }

    public void defineBuiltinFunction(FunctionSymbol symbol){

    }

    @Override public Symbol resolve(String name){
        return null;
    }

}

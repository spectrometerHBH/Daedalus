package Compiler.Frontend;

import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Scope;

public class BuiltinSymbolsInitializer {
    private GlobalScope globalScope;

    public BuiltinSymbolsInitializer(){
        globalScope = new GlobalScope("Global Scope");
        //PrimitiveTypes
        globalScope.definePrimitiveType(new PrimitiveTypeSymbol("int"));
    }

    public GlobalScope getGlobalScope(){
        return globalScope;
    }
}

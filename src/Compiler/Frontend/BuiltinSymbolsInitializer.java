package Compiler.Frontend;

import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Symbol.Scope;

public class BuiltinSymbolsInitializer {
    private GlobalScope globalScope;
    
    public BuiltinSymbolsInitializer(){
        globalScope = new GlobalScope("Global Scope");
        //PrimitiveTypes
        globalScope.definePrimitiveType(new PrimitiveTypeSymbol("int"));
        globalScope.definePrimitiveType(new PrimitiveTypeSymbol("bool"));
        globalScope.definePrimitiveType(new PrimitiveTypeSymbol("string"));
        globalScope.definePrimitiveType(new PrimitiveTypeSymbol("void"));
        //BuiltinFunctions
        globalScope.defineBuiltinFunction(new FunctionSymbol("print", null, globalScope));
    }

    public GlobalScope getGlobalScope(){
        return globalScope;
    }
}

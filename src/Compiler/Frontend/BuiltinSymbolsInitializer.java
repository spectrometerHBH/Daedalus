package Compiler.Frontend;

import Compiler.Symbol.*;

public class BuiltinSymbolsInitializer {
    private final static GlobalScope globalScope = new GlobalScope("Global Scope");
    private final static ClassSymbol string = new ClassSymbol("string",null, null, globalScope);
    private final static PrimitiveTypeSymbol IntTypeSymbol = new PrimitiveTypeSymbol("int");
    private final static PrimitiveTypeSymbol BoolTypeSymbol = new PrimitiveTypeSymbol("bool");
    private final static PrimitiveTypeSymbol VoidTypeSymbol = new PrimitiveTypeSymbol("void");

    public BuiltinSymbolsInitializer(){
        //PrimitiveTypes
        globalScope.definePrimitiveType(IntTypeSymbol);
        globalScope.definePrimitiveType(BoolTypeSymbol);
        globalScope.definePrimitiveType(VoidTypeSymbol);

        //class string initialization
        string.defineFunction(new FunctionSymbol("length", IntTypeSymbol, null, string));
        string.defineFunction(new FunctionSymbol("substring", string, null, string){{
            defineVariable(new VariableSymbol("left", IntTypeSymbol, null));
            defineVariable(new VariableSymbol("right", IntTypeSymbol, null));
        }});
        string.defineFunction(new FunctionSymbol("parseInt", IntTypeSymbol,null, string));
        string.defineFunction(new FunctionSymbol("ord", IntTypeSymbol, null, string){{
            defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        }});
        globalScope.defineClass(string);

        //BuiltinFunctions
        globalScope.defineFunction(new FunctionSymbol("print", VoidTypeSymbol, null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("println", VoidTypeSymbol, null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("getString", string,null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("getInt", IntTypeSymbol, null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("toString", string, null, globalScope));
    }

    public GlobalScope getGlobalScope(){
        return globalScope;
    }
}

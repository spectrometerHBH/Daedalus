package Compiler.Symbol;

public class GlobalScope extends BaseScope{
    public GlobalScope(String name){
        super(name, null);
    }

    @Override public void defineVariable(Symbol symbol){

    }

    @Override public void defineFunction(Symbol symbol){

    }

    @Override public void defineClass(Symbol symbol){

    }

    public void definePrimitiveType(Symbol symbol){

    }

    @Override public Symbol resolve(String name){
        return null;
    }

}

package Compiler.Symbol;

public abstract class BaseScope implements Scope {
    private String name;
    private Scope enclosingScope;

    public BaseScope(String name, Scope enclosingScope){
        this.name = name;
        this.enclosingScope = enclosingScope;
    }

    @Override public String getScopeName(){
        return name;
    }

    @Override public Scope getEnclosingScope(){
        return enclosingScope;
    }

    public abstract void defineVariable(VariableSymbol sym);
    public abstract void defineFunction(FunctionSymbol sym);
    public abstract void defineClass(ClassSymbol sym);
    public abstract Symbol resolve(String name);
}

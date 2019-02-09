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

    public abstract void defineVariable(Symbol sym);
    public abstract void defineFunction(Symbol sym);
    public abstract void defineClass(Symbol sym);
    public abstract Symbol resolve(String name);
}

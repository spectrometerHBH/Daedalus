package Compiler.Symbol;

public class PrimitiveTypeSymbol extends Symbol implements Type {
    public PrimitiveTypeSymbol(String name) {
        super(name);
    }

    @Override
    public String getName() {
        return null;
    }
}

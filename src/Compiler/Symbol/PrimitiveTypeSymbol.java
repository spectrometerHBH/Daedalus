package Compiler.Symbol;

public class PrimitiveTypeSymbol extends Symbol implements Type {
    public PrimitiveTypeSymbol(String name) {
        super(name, null, null);
    }

    @Override
    public String getTypeName() {
        return super.getSymbolName();
    }
}

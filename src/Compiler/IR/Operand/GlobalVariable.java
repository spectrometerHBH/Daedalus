package Compiler.IR.Operand;

public class GlobalVariable extends StaticData{
    int size;

    public GlobalVariable(int size) {
        this.size = size;
    }
}

package Compiler.Utils;

import org.antlr.v4.runtime.Token;

public class Position {
    private int row, col;

    public Position(Token token){
        row = token.getLine();
        col = token.getCharPositionInLine();
    }

    public int getRow(){
        return row;
    }

    public int getCol(){
        return col;
    }
}


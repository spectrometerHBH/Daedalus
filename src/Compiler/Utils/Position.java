package Compiler.Utils;

import org.antlr.v4.runtime.Token;

public class Position {
    private int row, col;

    public Position(int row, int col) {
        this.row = row;
        this.col = col;
    }

    public Position(Token token) {
        row = token.getLine();
        col = token.getCharPositionInLine();
    }

    public int getRow() {
        return row;
    }

    public int getCol() {
        return col;
    }

    public String toString() {
        return "row : " + row + " col : " + col + "\n";
    }
}


package Compiler.Utils;

public class SyntaxError extends RuntimeException {
    private Position position;

    public SyntaxError() {
        position = null;
    }

    public SyntaxError(String msg, Position position) {
        super(msg);
        this.position = position;
    }

    @Override
    public String getMessage() {
        return "[Syntax Error] : " + super.getMessage() + position.toString();
    }
}

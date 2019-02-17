package Compiler.Utils;

public class SemanticError extends RuntimeException {
    private Position position;
    public SemanticError(){
        position = null;
    }
    public SemanticError(String msg, Position position){
        super(msg);
        this.position = position;
    }
    @Override
    public String getMessage(){
        return "[Semantic Error] : " + super.getMessage() + " @ " + position.toString();
    }
}

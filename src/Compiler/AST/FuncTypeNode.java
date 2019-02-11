package Compiler.AST;

import Compiler.Utils.Position;

public class FuncTypeNode extends TypeNode {
    public FuncTypeNode(Position position){
        super("function", position);
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

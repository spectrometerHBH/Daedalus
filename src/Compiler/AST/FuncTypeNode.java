package Compiler.AST;

import Compiler.Utils.Position;

public class FuncTypeNode extends TypeNode {
    public FuncTypeNode(Position position){
        super(position, "function");
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

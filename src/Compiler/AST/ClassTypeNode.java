package Compiler.AST;

import Compiler.Utils.Position;

public class ClassTypeNode extends TypeNode {
    String identifier;

    public ClassTypeNode(String identifier, Position position){
        super(position);
        this.identifier = identifier;
    }
}

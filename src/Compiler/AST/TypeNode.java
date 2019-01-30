package Compiler.AST;

import Compiler.AST.ASTNode;
import Compiler.Utils.Position;

public class TypeNode extends ASTNode {
    private Position position;

    public TypeNode(Position position){
        this.position = position;
    }
}

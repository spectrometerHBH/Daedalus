package Compiler.AST;

import Compiler.AST.ASTNode;
import Compiler.Utils.Position;

public abstract class TypeNode extends ASTNode {
    public TypeNode(Position position){
        super(position);
    }
}

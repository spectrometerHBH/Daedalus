package Compiler.AST;

import Compiler.AST.ASTNode;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    public ExprNode(Position position){
        super(position);
    }
}

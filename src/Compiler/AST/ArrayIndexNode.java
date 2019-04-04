package Compiler.AST;

import Compiler.Utils.Position;

public class ArrayIndexNode extends ExprNode {
    private ExprNode array;
    private ExprNode index;

    public ArrayIndexNode(ExprNode array, ExprNode index, Position position) {
        super(position);
        this.array = array;
        this.index = index;
    }

    public ExprNode getArray() {
        return array;
    }

    public ExprNode getIndex() {
        return index;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}

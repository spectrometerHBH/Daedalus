package Compiler.AST;

import Compiler.Utils.Position;

import java.util.List;

public class NewExprNode extends ExprNode {
    private TypeNode baseType;
    private int numDims;
    private List<ExprNode> exprNodeList;

    public NewExprNode(TypeNode baseType, int numDims, List<ExprNode> exprNodeList, Position position) {
        super(position);
        this.baseType = baseType;
        this.numDims = numDims;
        this.exprNodeList = exprNodeList;
    }

    public TypeNode getBaseType() {
        return baseType;
    }

    public int getNumDims() {
        return numDims;
    }

    public List<ExprNode> getExprNodeList() {
        return exprNodeList;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

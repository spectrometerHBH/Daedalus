package Compiler.AST;

import Compiler.Symbol.Type;
import Compiler.Utils.Position;

import java.util.ArrayList;
import java.util.List;

public class NewExprNode extends ExprNode {
    private TypeNode baseType;
    private Type baseTypeAfterResolve;
    private int numDims;
    private List<ExprNode> exprNodeList = new ArrayList<ExprNode>();

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

    public Type getBaseTypeAfterResolve() {
        return baseTypeAfterResolve;
    }

    public void setBaseTypeAfterResolve(Type baseTypeAfterResolve) {
        this.baseTypeAfterResolve = baseTypeAfterResolve;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}

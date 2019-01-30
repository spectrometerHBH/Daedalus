package Compiler.AST;

import Compiler.Utils.Position;

import java.util.ArrayList;
import java.util.List;

public class VarDeclNode extends DeclNode {
    private TypeNode type;
    private ExprNode expr;
    private String identifier;
    private Position position;

    public VarDeclNode(TypeNode type, ExprNode expr, String identifier, Position position){
        this.type = type;
        this.expr = expr;
        this.identifier = identifier;
        this.position = position;
    }

    public void setType(TypeNode type){
        this.type = type;
    }
}

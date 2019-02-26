package Compiler.AST;

import Compiler.Symbol.ClassSymbol;
import Compiler.Utils.Position;

import java.util.List;

public class ClassDeclNode extends DeclNode{
    private String identifier;
    private List<FuncDeclNode> funcDeclList;
    private List<VarDeclNode> varDecList;
    private ClassSymbol classSymbol;

    public ClassDeclNode(String identifier, List<FuncDeclNode> funcDeclList, List<VarDeclNode> varDecList, Position position){
        super(position);
        this.identifier = identifier;
        this.funcDeclList = funcDeclList;
        this.varDecList = varDecList;
    }

    @Override public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }

    public String getIdentifier() {
        return identifier;
    }

    public List<VarDeclNode> getVarDecList() {
        return varDecList;
    }

    public List<FuncDeclNode> getFuncDeclList() {
        return funcDeclList;
    }

    public ClassSymbol getClassSymbol() {
        return classSymbol;
    }

    public void setClassSymbol(ClassSymbol classSymbol) {
        this.classSymbol = classSymbol;
    }
}

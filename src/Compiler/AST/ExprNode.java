package Compiler.AST;

import Compiler.Symbol.*;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    public enum Category {
        VARIABLE, CLASS, FUNCTION, NONLVALUE, THIS
    }

    private Category category;
    private Type type; //PrimitiveType, ClassSymbol, ArrayType, NullType
    private FunctionSymbol functionSymbol;

    public ExprNode(Position position) {
        super(position);
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public FunctionSymbol getFunctionSymbol() {
        return functionSymbol;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol) {
        this.functionSymbol = functionSymbol;
    }

    public boolean isIntegerVaribale() {
        return (category == Category.VARIABLE && type.getTypeName().equals("int"));
    }

    public boolean isBooleanVariable() {
        return (category == Category.VARIABLE && type.getTypeName().equals("bool"));
    }

    public boolean isString(){
        return (category == Category.VARIABLE || category == Category.NONLVALUE)
                && type.getTypeName().equals("string");
    }

    public boolean isInteger() {
        return (category == Category.VARIABLE || category == Category.NONLVALUE)
                && type.getTypeName().equals("int");
    }

    public boolean isBoolean() {
        return (category == Category.VARIABLE || category == Category.NONLVALUE)
                && type.getTypeName().equals("bool");
    }

    public boolean isCallable() {
        return (category == Category.FUNCTION);
    }

    public boolean isAccessable() {
        return (category == Category.VARIABLE && type instanceof ClassSymbol) || (category == Category.THIS);
    }

    public boolean isAssignable() {
        return (category == Category.VARIABLE);
    }

    public boolean isValue(){
        return category != Category.CLASS && category != Category.FUNCTION;
    }

    public boolean isNullable(){
        return (category == Category.VARIABLE && (type instanceof ClassSymbol || type instanceof ArrayType)) || type instanceof NullType;
    }

    public boolean isNull(){
        return type instanceof NullType;
    }
}

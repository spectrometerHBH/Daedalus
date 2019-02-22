package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Oprand;
import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    public enum Category {
        VARIABLE, CLASS, FUNCTION, NONLVALUE, THIS
    }

    //for Semantic Check
    private Category category;//VARIABLE, NONLVALUE, THIS, CLASS, FUNCTION
    private Type type; //PrimitiveType, ClassSymbol, ArrayType, NullType
    private FunctionSymbol functionSymbol;

    //for IR
    private BasicBlock thenBB, elseBB;
    private Oprand resultOprand;

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

    public Oprand getResultOprand() {
        return resultOprand;
    }

    public void setResultOprand(Oprand resultOprand) {
        this.resultOprand = resultOprand;
    }

    public FunctionSymbol getFunctionSymbol() {
        return functionSymbol;
    }

    public void setFunctionSymbol(FunctionSymbol functionSymbol) {
        this.functionSymbol = functionSymbol;
    }

    public BasicBlock getThenBB() {
        return thenBB;
    }

    public void setThenBB(BasicBlock thenBB) {
        this.thenBB = thenBB;
    }

    public BasicBlock getElseBB() {
        return elseBB;
    }

    public void setElseBB(BasicBlock elseBB) {
        this.elseBB = elseBB;
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
        return (isValue() && type.isClassType());
    }

    public boolean isAssignable() {
        return (category == Category.VARIABLE);
    }

    public boolean isValue(){
        return category != Category.CLASS && category != Category.FUNCTION;
    }

    public boolean isNullable(){
        return (category == Category.VARIABLE && (type.isClassType() || type.isArrayType())) || type.isNullType();
    }

    public boolean isNull(){
        return type.isNullType();
    }
}

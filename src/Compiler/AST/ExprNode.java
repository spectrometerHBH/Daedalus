package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.IR.Operand.Operand;
import Compiler.Symbol.FunctionSymbol;
import Compiler.Symbol.Type;
import Compiler.Utils.Position;

public abstract class ExprNode extends ASTNode {
    //for Semantic Check
    private Category category;//LVALUE, RVALUE, THIS, CLASS, FUNCTION

    public boolean isIntegerVaribale() {
        return (category == Category.LVALUE && type.getTypeName().equals("int"));
    }
    private Type type; //PrimitiveType, ClassSymbol, ArrayType, NullType
    private FunctionSymbol functionSymbol;

    //for IR
    private BasicBlock thenBB, elseBB;
    private Operand resultOperand;

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

    public Operand getResultOperand() {
        return resultOperand;
    }

    public void setResultOperand(Operand resultOperand) {
        this.resultOperand = resultOperand;
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

    public boolean isBooleanVariable() {
        return (category == Category.LVALUE && type.getTypeName().equals("bool"));
    }

    public boolean isString(){
        return (category == Category.LVALUE || category == Category.RVALUE)
                && type.getTypeName().equals("string");
    }

    public boolean isInteger() {
        return (category == Category.LVALUE || category == Category.RVALUE)
                && type.getTypeName().equals("int");
    }

    public boolean isBoolean() {
        return (category == Category.LVALUE || category == Category.RVALUE)
                && type.getTypeName().equals("bool");
    }

    public boolean isAssignable() {
        return (category == Category.LVALUE);
    }

    public boolean isCallable() {
        return (category == Category.FUNCTION);
    }

    public boolean isAccessable() {
        return (isValue() && type.isClassType());
    }

    public boolean isNullable() {
        return (category == Category.LVALUE && (type.isClassType() || type.isArrayType())) || type.isNullType();
    }

    public boolean isValue() {
        return category != Category.CLASS && category != Category.FUNCTION;
    }

    public enum Category {
        LVALUE, RVALUE, CLASS, FUNCTION,
    }

    public boolean isNull(){
        return type.isNullType();
    }
}

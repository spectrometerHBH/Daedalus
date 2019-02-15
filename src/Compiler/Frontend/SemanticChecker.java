package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;
import Compiler.Utils.SemanticError;

import java.util.Iterator;

public class SemanticChecker implements ASTVisitor {
    private GlobalScope globalScope;
    private ClassSymbol stringTypeSymbol;
    private PrimitiveTypeSymbol intTypeSymbol, boolTypeSymbol, voidTypeSymbol;

    public SemanticChecker(GlobalScope globalScope, PrimitiveTypeSymbol intTypeSymbol, PrimitiveTypeSymbol boolTypeSymbol, ClassSymbol stringTypeSymbol, PrimitiveTypeSymbol voidTypeSymbol) {
        this.globalScope = globalScope;
        this.intTypeSymbol = intTypeSymbol;
        this.boolTypeSymbol = boolTypeSymbol;
        this.stringTypeSymbol = stringTypeSymbol;
        this.voidTypeSymbol = voidTypeSymbol;
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclNode node) {
        if (node.getType().getTypeIdentifier().equals("void")) throw new SemanticError("Type of variable can't be void", node.getPosition());
        node.getExpr().accept(this);
        node.getType().compatible(node.getExpr());
    }

    @Override
    public void visit(FuncDeclNode node) {
        visit(node.getBlock());
    }

    @Override
    public void visit(ClassDeclNode node) {
        node.getFuncDeclList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(ArrayTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ClassTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BoolTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(IntTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(VoidTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(StringTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BlockStmtNode node) {
        node.getStmtList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        node.getVarDeclList().getList().forEach(x -> {
            x.accept(this);
        });
    }

    @Override
    public void visit(ExprStmtNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) {
        node.getExpression().accept(this);
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) {
        node.getExpression().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ForStmtNode node) {
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null) node.getCond().accept(this);
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ReturnNode node) {
        TypeNode returnType = ((FuncDeclNode)((FunctionSymbol)node.getFunctionSymbol()).getDef()).getType();
        if (node.getExpression() != null){
            node.getExpression().accept(this);
           returnType.compatible(node.getExpression());
        }else{
            if (!(returnType instanceof VoidTypeNode)) throw new SemanticError("Function is void", node.getPosition());
        }
    }

    @Override
    public void visit(BreakNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ContinueNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ArrayIndexNode node) {
        ExprNode array = node.getArray();
        ExprNode index = node.getIndex();
        array.accept(this);
        index.accept(this);
        if (array.getCategory() != ExprNode.category.VARIABLE){
            if (array.getType() instanceof ArrayType){
                if (index.getType() != intTypeSymbol){
                    node.setCategory(ExprNode.category.VARIABLE);
                    node.setType(((ArrayType) array.getType()).getDims() == 1
                                    ? globalScope.resolveType(((ArrayType) array.getType()).getTypeNode())
                                    : new ArrayType(((ArrayType) array.getType()).getTypeNode(), ((ArrayType) array.getType()).getDims() - 1));
                }else throw new SemanticError("Subscript ought to be int type", node.getPosition());
            }else throw new SemanticError("Array expression ought to be array type", node.getPosition());
        }else throw new SemanticError("Array expression ought to be lvalue", node.getPosition());
    }

    @Override
    public void visit(BinaryExprNode node) {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        lhs.accept(this);
        rhs.accept(this);
        switch (node.getOp()){
            case MUL :
            case DIV :
            case MOD :
            case SUB :
            case SHL :
            case SHR :
            case AND :
            case XOR :
            case OR  : {
                if (lhs.getType() != intTypeSymbol || rhs.getType() != intTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(intTypeSymbol);
                }else throw new SemanticError("Operands ought to be integers", node.getPosition());
                break;
            }
            case ADD : {
                if (lhs.getType() != stringTypeSymbol || rhs.getType() != stringTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(stringTypeSymbol);
                }else if (lhs.getType() != intTypeSymbol || rhs.getType() != intTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(intTypeSymbol);
                }else throw new SemanticError("Operands ought to be both integers or strings", node.getPosition());
                break;
            }
            case LT   :
            case EQ   : {
                if (lhs.getType() != stringTypeSymbol || rhs.getType() != stringTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(boolTypeSymbol);
                }else if (lhs.getType() != intTypeSymbol || rhs.getType() != intTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(boolTypeSymbol);
                }else throw new SemanticError("Operands ought to be both integers or strings", node.getPosition());
                break;
            }
            case GT   :
            case LEQ  :
            case GEQ  :
            case NEQ  : {
                if (lhs.getType() != intTypeSymbol || rhs.getType() != intTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(boolTypeSymbol);
                }else throw new SemanticError("Operands ought to be both integers", node.getPosition());
                break;
            }
            case ANDL :
            case ORL  : {
                if (lhs.getType() != boolTypeSymbol || rhs.getType() != boolTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(boolTypeSymbol);
                }else throw new SemanticError("Operands ought to be both booleans", node.getPosition());
                break;
            }
            case ASSIGN : {
                if (lhs.getCategory() != ExprNode.category.VARIABLE
                        || rhs.getCategory() == ExprNode.category.CLASS
                        || rhs.getCategory() == ExprNode.category.FUNCTION) {
                    if (lhs.getType() instanceof VariableSymbol) {
                        ((VarDeclNode) ((VariableSymbol) lhs.getType()).getDef()).getType().compatible(rhs);
                        node.setCategory(ExprNode.category.NONLVALUE);
                        node.setType(voidTypeSymbol);
                    }else if (lhs.getType() instanceof ArrayType){
                        if (rhs.getType() instanceof ArrayType){
                            if (((ArrayType) lhs.getType()).getBaseTypeName().equals(((ArrayType) rhs.getType()).getBaseTypeName())) {
                                if (((ArrayType) lhs.getType()).getDims() == ((ArrayType) rhs.getType()).getDims()) {
                                    node.setCategory(ExprNode.category.NONLVALUE);
                                    node.setType(voidTypeSymbol);
                                } else throw new SemanticError("Array dimension not compatible", node.getPosition());
                            }else throw new SemanticError("Array base type not compatible", node.getPosition());
                        }else throw new SemanticError("Right hand side expression ought to be array type", node.getPosition());
                    }
                }else throw new SemanticError("Expression ought to be lvalue", node.getPosition());
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        if (node.getExpression().getCategory() == ExprNode.category.CLASS){
            ClassSymbol classSymbol = (ClassSymbol) node.getExpression().getType();
            Symbol memberSymbol = classSymbol.resolveSymbol(node.getIdentifier(), node.getPosition());
            if (memberSymbol instanceof VariableSymbol){
                node.setCategory(ExprNode.category.VARIABLE);
                node.setType(memberSymbol.getType());
            }else if (memberSymbol instanceof FunctionSymbol){
                node.setCategory(ExprNode.category.FUNCTION);
                node.setType(memberSymbol.getType());
                node.setFunctionSymbol((FunctionSymbol) memberSymbol);
            }
        }else throw new SemanticError("Member Access error, expression not a class", node.getPosition());
    }

    @Override
    public void visit(FuncallExprNode node) {
        node.getFunction().accept(this);
        node.getParameterList().forEach(x -> x.accept(this));
        if (node.getFunction().getCategory() == ExprNode.category.FUNCTION){
            if (node.getParameterList().size() == node.getFunction().getFunctionSymbol().getArguments().size()) {
                FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
                Iterator<ExprNode> iterator = node.getParameterList().iterator();
                functionSymbol.getArguments().forEach((identifier, variableSymbol) -> {
                    ((VarDeclNode) variableSymbol.getDef()).getType().compatible(iterator.next());
                });
                node.setCategory(ExprNode.category.NONLVALUE);
                node.setType(node.getFunction().getFunctionSymbol().getType());
            }else throw new SemanticError("Funcall expression error, parameter list error", node.getPosition());
        }else throw new SemanticError("Funcall expression error, expression not a function", node.getPosition());
    }

    @Override
    public void visit(IDExprNode node) {
        Symbol symbol = node.getSymbol();
        if (symbol instanceof VariableSymbol){
            node.setCategory(ExprNode.category.VARIABLE);
            node.setType(symbol.getType());
        }else if (symbol instanceof ClassSymbol){
            node.setCategory(ExprNode.category.CLASS);
            node.setType((ClassSymbol) symbol);
        }else if (symbol instanceof FunctionSymbol){
            node.setCategory(ExprNode.category.FUNCTION);
            node.setType(symbol.getType());
            node.setFunctionSymbol((FunctionSymbol)symbol);
        }
    }

    @Override
    public void visit(NewExprNode node) {
        node.getExprNodeList().forEach(x -> x.accept(this));
        node.setCategory(ExprNode.category.NONLVALUE);
        node.setType(new ArrayType(node.getBaseType(), node.getNumDims()));
    }

    @Override
    public void visit(ThisExprNode node) {
        node.setCategory(ExprNode.category.CLASS);
        node.setType((ClassSymbol) node.getScope());
    }

    @Override
    public void visit(UnaryExprNode node) {
        node.getExpression().accept(this);
        switch (node.getOp()){
            case PRE_INC :
            case PRE_DEC :
            case SUF_INC :
            case SUF_DEC : {
                if (node.getExpression().getCategory() == ExprNode.category.VARIABLE
                    && node.getExpression().getType() == intTypeSymbol){
                    node.setCategory(ExprNode.category.VARIABLE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Non-int expression", node.getPosition());
                break;
            }
            case POS     :
            case NEG     :
            case NOT     : {
                if ((node.getExpression().getCategory() == ExprNode.category.VARIABLE || node.getExpression().getCategory() == ExprNode.category.NONLVALUE)
                 && node.getExpression().getType() == intTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Non_int expression", node.getPosition());
                break;
            }
            case NOTL    : {
                if ((node.getExpression().getCategory() == ExprNode.category.VARIABLE || node.getExpression().getCategory() == ExprNode.category.NONLVALUE)
                && node.getExpression().getType() == boolTypeSymbol){
                    node.setCategory(ExprNode.category.NONLVALUE);
                    node.setType(boolTypeSymbol);
                }
                break;
            }
            default      : break;
        }
    }

    @Override
    public void visit(IntLiteralNode node) {
        node.setCategory(ExprNode.category.NONLVALUE);
        node.setType(intTypeSymbol);
    }

    @Override
    public void visit(BoolLiteralNode node) {
        node.setCategory(ExprNode.category.NONLVALUE);
        node.setType(boolTypeSymbol);
    }

    @Override
    public void visit(NullLiteralNode node) {
        node.setCategory(ExprNode.category.NULL);
        node.setType(null);
    }

    @Override
    public void visit(StringLiteralNode node) {
        node.setCategory(ExprNode.category.NONLVALUE);
        node.setType(stringTypeSymbol);
    }
}

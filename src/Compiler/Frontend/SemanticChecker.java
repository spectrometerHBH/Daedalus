package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;
import Compiler.Utils.SemanticError;

import java.util.Iterator;
import java.util.Map;

public class SemanticChecker implements ASTVisitor {
    private GlobalScope globalScope;
    private ClassSymbol stringTypeSymbol;
    private PrimitiveTypeSymbol intTypeSymbol, boolTypeSymbol, voidTypeSymbol;

    public SemanticChecker(GlobalScope globalScope) {
        this.globalScope = globalScope;
        this.intTypeSymbol = globalScope.getIntTypeSymbol();
        this.boolTypeSymbol = globalScope.getBoolTypeSymbol();
        this.stringTypeSymbol = globalScope.getString();
        this.voidTypeSymbol = globalScope.getVoidTypeSymbol();
    }

    @Override
    public void visit(ProgramNode node) {
        node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclNode node) {
        if (node.getExpr() != null) {
            node.getExpr().accept(this);
            node.getTypeAfterResolve().compatible(node.getExpr().getType(), node.getPosition());
        } else {
            Type type = node.getTypeAfterResolve();
            if (type.isPrimitiveType()) {
                if (type.getTypeName().equals("int")) {
                    node.setExpr(new IntLiteralNode(0, null));
                } else {
                    node.setExpr(new BoolLiteralNode(false, null));
                }
                node.getExpr().accept(this);
            } else if (type.isArrayType() || type.isClassType() || type.isNullType()) {
                if (!type.getTypeName().equals("string")) {
                    node.setExpr(new NullLiteralNode(null));
                } else {
                    node.setExpr(new StringLiteralNode("ACM", null));
                }
                node.getExpr().accept(this);
            }
        }
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
            if (x.getExpr() != null) x.getTypeAfterResolve().compatible(x.getExpr().getType(), node.getPosition());
        });
    }

    @Override
    public void visit(ExprStmtNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) {
        node.getExpression().accept(this);
        if (!node.getExpression().isBoolean())
            throw new SemanticError("Condition statement of if must be type bool", node.getPosition());
        node.getThenStmt().accept(this);
        if (node.getElseStmt() != null) node.getElseStmt().accept(this);
    }

    @Override
    public void visit(WhileStmtNode node) {
        node.getExpression().accept(this);
        if (!node.getExpression().isBoolean())
            throw new SemanticError("Condition statement of while must be type bool", node.getPosition());
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ForStmtNode node) {
        if (node.getInit() != null) node.getInit().accept(this);
        if (node.getCond() != null) {
            node.getCond().accept(this);
            if (!node.getCond().isBoolean())
                throw new SemanticError("Condition statement of for must be type bool", node.getPosition());
        }
        if (node.getStep() != null) node.getStep().accept(this);
        if (node.getStatement() != null) node.getStatement().accept(this);
    }

    @Override
    public void visit(ReturnNode node) {
        //if (((FuncDeclNode) node.getFunctionSymbol().getDef()).getType() == null)
        //    throw new SemanticError("Constructor shouldn't have return statement", node.getPosition());
        Type returnType = node.getFunctionSymbol().getType();
        if (node.getExpression() != null) {
            if (((FuncDeclNode) node.getFunctionSymbol().getDef()).getType() == null)
                throw new SemanticError("Constructor shouldn't have return statement with expression", node.getPosition());
            node.getExpression().accept(this);
            returnType.compatible(node.getExpression().getType(), node.getPosition());
        } else {
            if (!(returnType.getTypeName().equals("void") || ((FuncDeclNode) node.getFunctionSymbol().getDef()).getType() == null))
                throw new SemanticError("Return without expression", node.getPosition());
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
        //if (array.isAssignable()) {
        if (array.getType().isArrayType()) {
            if (index.isInteger()) {
                node.setCategory(ExprNode.Category.LVALUE);
                node.setType(((ArrayType) array.getType()).getDims() == 1
                        ? ((ArrayType) array.getType()).getBaseType()
                        : new ArrayType(((ArrayType) array.getType()).getBaseType(), ((ArrayType) array.getType()).getDims() - 1));
            } else throw new SemanticError("Subscript ought to be int type", node.getPosition());
        } else throw new SemanticError("Array expression ought to be array type", node.getPosition());
        //} else throw new SemanticError("Array expression ought to be lvalue", node.getPosition());
    }

    @Override
    public void visit(BinaryExprNode node) {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        lhs.accept(this);
        rhs.accept(this);
        switch (node.getOp()) {
            case MUL:
            case DIV:
            case MOD:
            case SUB:
            case SHL:
            case SHR:
            case AND:
            case XOR:
            case OR: {
                if (lhs.isInteger() && rhs.isInteger()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Operands ought to be integers", node.getPosition());
                break;
            }
            case ADD: {
                if (lhs.isString() && rhs.isString()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(stringTypeSymbol);
                } else if (lhs.isInteger() && rhs.isInteger()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Operands ought to be both integers or strings", node.getPosition());
                break;
            }
            case GT:
            case LEQ:
            case GEQ:
            case LT: {
                if (lhs.isString() && rhs.isString()) {
                    node.setCategory(ExprNode.Category.LVALUE);
                    node.setType(boolTypeSymbol);
                } else if (lhs.isInteger() && rhs.isInteger()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(boolTypeSymbol);
                } else throw new SemanticError("Operands ought to be both integers or strings", node.getPosition());
                break;
            }
            case NEQ:
            case EQ: {
                if ((lhs.isString() && rhs.isString())
                        || (lhs.isInteger() && rhs.isInteger())
                        || (lhs.isBoolean() && rhs.isBoolean())
                        || (lhs.isNullable() && rhs.isNull())
                        || (lhs.isNull() && rhs.isNullable())) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(boolTypeSymbol);
                } else
                    throw new SemanticError("Operands ought to be both integers or strings", node.getPosition());
                break;
            }
            case ANDL:
            case ORL: {
                if (lhs.isBoolean() && rhs.isBoolean()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(boolTypeSymbol);
                } else throw new SemanticError("Operands ought to be both booleans", node.getPosition());
                break;
            }
            case ASSIGN: {
                if (lhs.isAssignable() && rhs.isValue()) {
                    lhs.getType().compatible(rhs.getType(), node.getPosition());
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(voidTypeSymbol);
                } else throw new SemanticError("Expression ought to be lvalue", node.getPosition());
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        if (node.getExpression().isAccessable()) {
            ClassSymbol classSymbol = (ClassSymbol) node.getExpression().getType();
            Symbol memberSymbol = classSymbol.resolveMember(node.getIdentifier(), node.getPosition());
            node.setSymbol(memberSymbol);
            if (memberSymbol.isVariableSymbol()) {
                node.setCategory(ExprNode.Category.LVALUE);
                node.setType(memberSymbol.getType());
            } else if (memberSymbol.isFunctionSymbol()) {
                node.setCategory(ExprNode.Category.FUNCTION);
                node.setType(memberSymbol.getType());
                node.setFunctionSymbol((FunctionSymbol) memberSymbol);
            }
        } else if (node.getExpression().getType().isArrayType()) {
            if (node.getIdentifier().equals("size")) {
                node.setCategory(ExprNode.Category.FUNCTION);
                node.setType(intTypeSymbol);
                node.setFunctionSymbol(globalScope.getArraySizeFunctionSymbol());
            } else throw new SemanticError("Type array builtin function call error", node.getPosition());
        } else throw new SemanticError("Member Access error, expression not a class type variable", node.getPosition());
    }

    @Override
    public void visit(FuncCallExprNode node) {
        ExprNode function = node.getFunction();
        function.accept(this);
        node.getParameterList().forEach(x -> x.accept(this));
        if (function.isCallable()) {
            if (node.getParameterList().size() == function.getFunctionSymbol().getArguments().size()) {
                FunctionSymbol functionSymbol = function.getFunctionSymbol();
                Iterator<ExprNode> iterator = node.getParameterList().iterator();
                for (Map.Entry<String, VariableSymbol> entry : functionSymbol.getArguments().entrySet()) {
                    String identifier = entry.getKey();
                    VariableSymbol variableSymbol = entry.getValue();
                    ExprNode exprNode = iterator.next();
                    if (!exprNode.isValue())
                        throw new SemanticError("Function call expression error, parameter not a valid value", node.getPosition());
                    variableSymbol.getType().compatible(exprNode.getType(), node.getPosition());
                }
                node.setCategory(ExprNode.Category.RVALUE);
                node.setType(function.getFunctionSymbol().getType());
            } else
                throw new SemanticError("Function call expression error, parameter list length not match", node.getPosition());
        } else throw new SemanticError("Function call expression error, expression not a function", node.getPosition());
    }

    @Override
    public void visit(IDExprNode node) {
        Symbol symbol = node.getSymbol();
        if (symbol.isVariableSymbol()) {
            node.setCategory(ExprNode.Category.LVALUE);
            node.setType(symbol.getType());
        } else if (symbol.isClassSymbol()) {
            node.setCategory(ExprNode.Category.CLASS);
            node.setType((ClassSymbol) symbol);
        } else if (symbol.isFunctionSymbol()) {
            node.setCategory(ExprNode.Category.FUNCTION);
            node.setType(symbol.getType());
            node.setFunctionSymbol((FunctionSymbol) symbol);
        }
    }

    @Override
    public void visit(NewExprNode node) {
        node.getExprNodeList().forEach(x -> {
            x.accept(this);
            if (!(x.isInteger())) throw new SemanticError("Array subscript ought to be integers", node.getPosition());
        });
        Type type = node.getBaseTypeAfterResolve();
        if (node.getNumDims() == 0) {
            if (type.isClassType()) {
                if (type.getTypeName().equals("string")) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(type);
                } else {
                    if (((ClassSymbol) type).getConstructor() == null) {
                        node.setCategory(ExprNode.Category.RVALUE);
                        node.setType(type);
                    } else {
                        node.setCategory(ExprNode.Category.RVALUE);
                        node.setType(type);
                        node.setFunctionSymbol(((ClassSymbol) type).getConstructor());
                    }
                }
            } else {
                node.setCategory(ExprNode.Category.RVALUE);
                node.setType(type);
            }
        } else {
            node.setCategory(ExprNode.Category.RVALUE);
            node.setType(new ArrayType(type, node.getNumDims()));
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        node.setCategory(ExprNode.Category.RVALUE);
        node.setType((ClassSymbol) node.getScope());
    }

    @Override
    public void visit(UnaryExprNode node) {
        node.getExpression().accept(this);
        switch (node.getOp()) {
            case PRE_INC:
            case PRE_DEC: {
                if (node.getExpression().isIntegerVariable()) {
                    node.setCategory(ExprNode.Category.LVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Non-int variable", node.getPosition());
                break;
            }
            case SUF_INC:
            case SUF_DEC: {
                if (node.getExpression().isIntegerVariable()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Non-int variable", node.getPosition());
                break;
            }
            case POS:
            case NEG:
            case NOT: {
                if (node.getExpression().isInteger()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(intTypeSymbol);
                } else throw new SemanticError("Non_int expression", node.getPosition());
                break;
            }
            case NOTL: {
                if (node.getExpression().isBoolean()) {
                    node.setCategory(ExprNode.Category.RVALUE);
                    node.setType(boolTypeSymbol);
                }
                break;
            }
            default:
                break;
        }
    }

    @Override
    public void visit(IntLiteralNode node) {
        node.setCategory(ExprNode.Category.RVALUE);
        node.setType(intTypeSymbol);
    }

    @Override
    public void visit(BoolLiteralNode node) {
        node.setCategory(ExprNode.Category.RVALUE);
        node.setType(boolTypeSymbol);
    }

    @Override
    public void visit(NullLiteralNode node) {
        node.setCategory(ExprNode.Category.RVALUE);
        node.setType(new NullType());
    }

    @Override
    public void visit(StringLiteralNode node) {
        node.setCategory(ExprNode.Category.RVALUE);
        node.setType(stringTypeSymbol);
    }
}
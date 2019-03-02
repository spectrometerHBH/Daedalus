package Compiler.Backend;

import Compiler.AST.*;
import Compiler.Configuration;
import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;
import Compiler.Symbol.*;

public class IRBuilder implements ASTVisitor {
    private GlobalScope globalScope;
    private BasicBlock currentBB;
    private ClassSymbol currentClassSymbol;
    private Function currentFunction;
    private IRRoot irRoot = new IRRoot();

    public IRBuilder(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    public IRRoot getIrRoot() {
        return irRoot;
    }

    @Override
    public void visit(ProgramNode node) {
        builtinFunctionSymbolInitialization();
        node.getDeclNodeList().forEach(x -> {
            if (x instanceof FuncDeclNode) {
                FunctionSymbol functionSymbol = ((FuncDeclNode) x).getFunctionSymbol();
                functionSymbol.setFunction(new Function(functionSymbol.getSymbolName()));
            }
        });
        node.getDeclNodeList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(VarDeclNode node) {
        VariableSymbol variableSymbol = node.getVariableSymbol();
        Type type = node.getTypeAfterResolve();
        if (node.isGlobalVariable()) {
            VirtualRegister globalVariable = type.isPointerType() ? new GlobalI64Pointer(node.getIdentifier()) : new GlobalI64Value(node.getIdentifier());
            irRoot.addGlobalVariable((GlobalVariable) globalVariable);
            variableSymbol.setVariableStorage(globalVariable);
        } else {
            VirtualRegister virtualRegister = type.isPointerType() ? new I64Pointer(node.getIdentifier()) : new I64Value(node.getIdentifier());
            if (currentFunction != null && node.isParameterVariable())
                currentFunction.appendParameterList(virtualRegister);
            variableSymbol.setVariableStorage(virtualRegister);
            if (node.getExpr() != null) assign(type.isPointerType(), virtualRegister, node.getExpr());
        }
    }

    @Override
    public void visit(FuncDeclNode node) {
        FunctionSymbol functionSymbol = node.getFunctionSymbol();
        currentFunction = functionSymbol.getFunction();
        if (functionSymbol.isMemberFunction()) currentFunction.setReferenceForClassMethod(new I64Pointer("this"));
        irRoot.addFunction(currentFunction);
        currentBB = currentFunction.getEntryBlock();
        node.getParameterList().forEach(x -> x.accept(this));
        node.getBlock().accept(this);

        //process return
        //if without return in current control flow, append return for it
        if (!currentBB.isTerminated()) {
            if (functionSymbol.getType().getTypeName().equals("void")) currentBB.terminate(new Return(currentBB, null));
            else currentBB.terminate(new Return(currentBB, new Immediate(0)));
        }
        //merge multiple return in exitBB
        if (currentFunction.getReturnInstList().size() > 1) {
            BasicBlock exitBB = currentFunction.getExitBlock();
            Operand returnOperand = functionSymbol.getType().getTypeName().equals("void") ? null : functionSymbol.getType().isPointerType() ? new I64Pointer() : new I64Value();
            currentFunction.getReturnInstList().forEach(ret -> {
                currentBB.removeInst();
                if (ret.getReturnValue() != null)
                    currentBB.appendInst(new Move(currentBB, ret.getReturnValue(), returnOperand));
                currentBB.terminate(new Jump(currentBB, exitBB));
            });
        } else currentFunction.setExitBlock(currentFunction.getReturnInstList().get(0).getCurrentBB());

        currentFunction = null;
    }

    @Override
    public void visit(ClassDeclNode node) {
        currentClassSymbol = node.getClassSymbol();
        node.getFuncDeclList().forEach(x -> x.accept(this));
        currentClassSymbol = null;
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
        for (StmtNode stmtNode : node.getStmtList()) {
            stmtNode.accept(this);
            if (currentBB.isTerminated()) break;
        }
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        node.getVarDeclList().getList().forEach(x -> x.accept(this));
    }

    @Override
    public void visit(ExprStmtNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(IfStmtNode node) {
        BasicBlock thenBB = new BasicBlock(currentFunction, "if_then");
        BasicBlock elseBB = node.getElseStmt() == null ? null : new BasicBlock(currentFunction, "if_else");
        BasicBlock mergeBB = new BasicBlock(currentFunction, "if_merge");
        //generate cond
        node.getExpression().setThenBB(thenBB);
        node.getExpression().setElseBB(node.getElseStmt() == null ? mergeBB : elseBB);
        node.getExpression().accept(this);
        //generate then
        currentBB = thenBB;
        node.getThenStmt().accept(this);
        if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, mergeBB));
        //generate else
        if (node.getElseStmt() != null) {
            currentBB = elseBB;
            node.getElseStmt().accept(this);
            if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, mergeBB));
        }
        //merge
        currentBB = mergeBB;
    }

    @Override
    public void visit(WhileStmtNode node) {
        BasicBlock condBB = new BasicBlock(currentFunction, "while_cond");
        BasicBlock bodyBB = new BasicBlock(currentFunction, "while_body");
        BasicBlock mergeBB = new BasicBlock(currentFunction, "while_merge");
        node.setStepBB(bodyBB);
        node.setMergeBB(mergeBB);
        //generate cond
        currentBB.terminate(new Jump(currentBB, condBB));
        currentBB = condBB;
        node.getExpression().setThenBB(bodyBB);
        node.getExpression().setElseBB(mergeBB);
        node.getExpression().accept(this);
        //generate body
        currentBB = bodyBB;
        node.getStatement().accept(this);
        if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, condBB));
        //generate merge
        currentBB = mergeBB;
    }

    @Override
    public void visit(ForStmtNode node) {
        BasicBlock bodyBB = new BasicBlock(currentFunction, "for_body");
        BasicBlock condBB = node.getCond() == null ? bodyBB : new BasicBlock(currentFunction, "for_cond");
        BasicBlock stepBB = node.getStep() == null ? condBB : new BasicBlock(currentFunction, "for_step");
        BasicBlock mergeBB = new BasicBlock(currentFunction, "for_merge");
        //generate init
        if (node.getInit() != null) node.getInit().accept(this);
        currentBB.terminate(new Jump(currentBB, condBB));
        //generate cond
        if (node.getCond() != null) {
            currentBB = condBB;
            node.getCond().setThenBB(bodyBB);
            node.getCond().setElseBB(mergeBB);
            node.getCond().accept(this);
        }
        //generate body
        currentBB = bodyBB;
        node.getStatement().accept(this);
        if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, stepBB));
        //generate step
        if (node.getStep() != null) {
            currentBB = stepBB;
            node.getStep().accept(this);
            if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, condBB));
        }
        currentBB = mergeBB;
    }

    @Override
    public void visit(ReturnNode node) {
        if (node.getFunctionSymbol().getType().getTypeName().equals("void")) {
            currentBB.terminate(new Return(currentBB, null));
        } else {
            /*
            VirtualRegister virtualRegister = node.getFunctionSymbol().getType().isPointerType() ? new I64Pointer() : new I64Value();
            assign(node.getFunctionSymbol().getType().isPointerType(), virtualRegister, node.getExpression());
            currentBB.terminate(new Return(currentBB, virtualRegister));
            */
            node.getExpression().accept(this);
            if (node.getFunctionSymbol().getType().isPointerType()) {
                currentBB.terminate(new Return(currentBB, node.getExpression().getResultOperand()));
            } else {
                Operand retValue = getOperandForValueUse(currentBB, node.getExpression().getResultOperand());
                currentBB.terminate(new Return(currentBB, retValue));
            }
        }
    }

    @Override
    public void visit(BreakNode node) {
        currentBB.terminate(new Jump(currentBB, node.getCurrentLoop().getMergeBB()));
    }

    @Override
    public void visit(ContinueNode node) {
        currentBB.terminate(new Jump(currentBB, node.getCurrentLoop().getStepBB()));
    }

    @Override
    public void visit(ArrayIndexNode node) {
        ArrayType arrayType = (ArrayType) node.getType();
        ExprNode array = node.getArray();
        ExprNode index = node.getIndex();
        Pointer basePointer = (Pointer) array.getResultOperand();
        Operand indexValue = getOperandForValueUse(currentBB, index.getResultOperand());
        node.setResultOperand(new I64Pointer());
        I64Value offset = new I64Value();
        currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(arrayType.getDims() > 1 ? Configuration.POINTER_SIZE() : arrayType.getBaseType().getTypeSize()), offset));
        currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, offset, new Immediate(Configuration.REGISTER_SIZE), offset));
        currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, basePointer, offset, node.getResultOperand()));
        //short-circuit evaluation
        if (node.getThenBB() != null) {
            I64Value tmp = new I64Value();
            currentBB.terminate(new Load(currentBB, node.getResultOperand(), tmp));
            currentBB.terminate(new Branch(currentBB, tmp, node.getThenBB(), node.getElseBB()));
        }
    }

    @Override
    public void visit(BinaryExprNode node) {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        Binary.Op op_binary = Binary.Op.MUL;
        Cmp.Op op_cmp = Cmp.Op.LT;
        Function callFunction = irRoot.builtinStringAdd;
        switch (node.getOp()) {
            case MUL:
                op_binary = Binary.Op.MUL;
                break;
            case DIV:
                op_binary = Binary.Op.DIV;
                break;
            case MOD:
                op_binary = Binary.Op.MOD;
                break;
            case SUB:
                op_binary = Binary.Op.SUB;
                break;
            case SHL:
                op_binary = Binary.Op.SHL;
                break;
            case SHR:
                op_binary = Binary.Op.SHR;
                break;
            case AND:
                op_binary = Binary.Op.AND;
                break;
            case XOR:
                op_binary = Binary.Op.XOR;
                break;
            case OR:
                op_binary = Binary.Op.OR;
                break;
            case ADD:
                op_binary = Binary.Op.ADD;
                break;
            case GT:
                op_cmp = Cmp.Op.GT;
                callFunction = irRoot.builtinStringGT;
                break;
            case LEQ:
                op_cmp = Cmp.Op.LEQ;
                callFunction = irRoot.builtinStringLEQ;
                break;
            case GEQ:
                op_cmp = Cmp.Op.GEQ;
                callFunction = irRoot.builtinStringGEQ;
                break;
            case LT:
                op_cmp = Cmp.Op.LT;
                callFunction = irRoot.builtinStringLT;
                break;
            case NEQ:
                op_cmp = Cmp.Op.NEQ;
                callFunction = irRoot.builtinStringNEQ;
                break;
            case EQ:
                op_cmp = Cmp.Op.EQ;
                callFunction = irRoot.builtinStringEQ;
                break;
            case ANDL:
                break;
            case ORL:
                break;
            case ASSIGN:
                break;
        }

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
                //lhs & rhs are both int type
                lhs.accept(this);
                rhs.accept(this);
                Operand lhsValue = getOperandForValueUse(currentBB, lhs.getResultOperand());
                Operand rhsValue = getOperandForValueUse(currentBB, rhs.getResultOperand());
                node.setResultOperand(new I64Value());
                currentBB.appendInst(new Binary(currentBB, op_binary, lhsValue, rhsValue, node.getResultOperand()));
                break;
            }
            case ADD: {
                lhs.accept(this);
                rhs.accept(this);
                if (lhs.isString()) {
                    //both lhs & rhs are string
                    node.setResultOperand(new I64Pointer());
                    Call call = new Call(currentBB, irRoot.builtinStringAdd, node.getResultOperand());
                    call.appendParameterList(lhs.getResultOperand());
                    call.appendParameterList(rhs.getResultOperand());
                    currentBB.appendInst(call);
                } else {
                    //both lhs & rhs are int
                    Operand lhsValue = getOperandForValueUse(currentBB, lhs.getResultOperand());
                    Operand rhsValue = getOperandForValueUse(currentBB, rhs.getResultOperand());
                    node.setResultOperand(new I64Value());
                    currentBB.appendInst(new Binary(currentBB, op_binary, lhsValue, rhsValue, node.getResultOperand()));
                }
                break;
            }
            case GT:
            case LEQ:
            case GEQ:
            case LT: {
                lhs.accept(this);
                rhs.accept(this);
                node.setResultOperand(new I64Value());
                if (lhs.isString()) {
                    //both lhs & rhs are string
                    Call call = new Call(currentBB, callFunction, node.getResultOperand());
                    call.appendParameterList(lhs.getResultOperand());
                    call.appendParameterList(rhs.getResultOperand());
                    currentBB.appendInst(call);
                } else {
                    //both lhs & rhs are int
                    Operand lhsValue = getOperandForValueUse(currentBB, lhs.getResultOperand());
                    Operand rhsValue = getOperandForValueUse(currentBB, rhs.getResultOperand());
                    currentBB.appendInst(new Cmp(currentBB, op_cmp, lhsValue, rhsValue, node.getResultOperand()));
                }
                //short-circuit evaluation
                if (node.getThenBB() != null)
                    currentBB.terminate(new Branch(currentBB, node.getResultOperand(), node.getThenBB(), node.getElseBB()));
                break;
            }
            case NEQ:
            case EQ: {
                lhs.accept(this);
                rhs.accept(this);
                Operand lhsOperand = lhs.getResultOperand();
                Operand rhsOperand = rhs.getResultOperand();
                node.setResultOperand(new I64Value());
                if (lhs.isString()) {
                    //both string
                    Call call = new Call(currentBB, callFunction, node.getResultOperand());
                    call.appendParameterList(lhsOperand);
                    call.appendParameterList(rhsOperand);
                    currentBB.appendInst(call);
                } else if (lhs.isNullable()) {
                    //pointer == null  / null == pointer
                    currentBB.appendInst(new Cmp(currentBB, op_cmp, lhsOperand, rhsOperand, node.getResultOperand()));
                } else {
                    //int == int / bool == bool
                    Operand lhsValue = getOperandForValueUse(currentBB, lhsOperand);
                    Operand rhsValue = getOperandForValueUse(currentBB, rhsOperand);
                    currentBB.appendInst(new Cmp(currentBB, op_cmp, lhsValue, rhsValue, node.getResultOperand()));
                }
                //short-circuit evaluation
                if (node.getThenBB() != null)
                    currentBB.terminate(new Branch(currentBB, node.getResultOperand(), node.getThenBB(), node.getElseBB()));
                break;
            }
            case ANDL: {
                //short-circuit evaluation
                lhs.setThenBB(new BasicBlock(currentFunction, "lhs_then"));
                lhs.setElseBB(node.getElseBB());
                lhs.accept(this);
                currentBB = lhs.getThenBB();
                rhs.setThenBB(node.getThenBB());
                rhs.setElseBB(node.getElseBB());
                rhs.accept(this);
                break;
            }
            case ORL: {
                //short-circuit evaluation
                lhs.setThenBB(node.getThenBB());
                lhs.setElseBB(new BasicBlock(currentFunction, "lhs_else"));
                lhs.accept(this);
                currentBB = lhs.getElseBB();
                rhs.setThenBB(node.getThenBB());
                rhs.setElseBB(node.getElseBB());
                rhs.accept(this);
                break;
            }
            case ASSIGN: {
                lhs.accept(this);
                //rhs.accept(this);
                assign(lhs.getType().isPointerType(), lhs.getResultOperand(), rhs);
                break;
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        Pointer base = (Pointer) node.getExpression().getResultOperand();
        if (node.getExpression().isAccessable()) {
            //Class
            Symbol memberSymbol = node.getSymbol();
            if (memberSymbol instanceof VariableSymbol) {
                //Class.variable
                I64Pointer memberPointer = new I64Pointer();
                //compute offset & set result
                currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, base, new Immediate(((VariableSymbol) memberSymbol).getOffset()), memberPointer));
                node.setResultOperand(memberPointer);
                //short-circuit evaluation
                if (node.getThenBB() != null) {
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Load(currentBB, memberPointer, tmp));
                    currentBB.terminate(new Branch(currentBB, tmp, node.getThenBB(), node.getElseBB()));
                }
            } else {
                //Class.function()
                //note down pointer of class for function call use
                node.setResultOperand(base);
            }
        } else {
            //Array.size()
            //note down pointer of array for function call use
            node.setResultOperand(base);
        }
    }

    @Override
    public void visit(FuncallExprNode node) {
        if (stringLengthOrArraySize(node)) return;
        node.getFunction().accept(this);
        FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
        if (node.getType().isPointerType()) node.setResultOperand(new I64Pointer());
        else node.setResultOperand(new I64Value());
        Call call = new Call(currentBB, functionSymbol.getFunction(), node.getResultOperand());
        node.getParameterList().forEach(x -> {
            x.accept(this);
            call.appendParameterList(x.getResultOperand());
        });
        if (functionSymbol.isMemberFunction()) {
            //is member function, need pass class reference
            call.setObjectPointer(node.getFunction().getResultOperand());
        }
        currentBB.appendInst(call);
        //short-circuit evaluation
        if (node.getThenBB() != null) {
            Operand result = getOperandForValueUse(currentBB, node.getResultOperand());
            currentBB.terminate(new Branch(currentBB, result, node.getThenBB(), node.getElseBB()));
        }
    }

    @Override
    public void visit(IDExprNode node) {
        Symbol symbol = node.getSymbol();
        if (symbol instanceof VariableSymbol) {
            node.setResultOperand(((VariableSymbol) symbol).getVariableStorage());
            //short-circuit evaluation
            if (node.getThenBB() != null) {
                currentBB.terminate(new Branch(currentBB, ((VariableSymbol) symbol).getVariableStorage(), node.getThenBB(), node.getElseBB()));
            }
        }
    }

    @Override
    public void visit(NewExprNode node) {
        Type type = node.getBaseTypeAfterResolve();
        if (node.getNumDims() == 0) {
            //new an object
            node.setResultOperand(new I64Pointer());
            currentBB.appendInst(new Alloc(currentBB, new Immediate(type.getTypeSize()), (I64Pointer) node.getResultOperand()));
        } else {
            //new an array
            node.setResultOperand(new I64Pointer());
            arrayAllocation(node, (I64Pointer) node.getResultOperand(), 0);
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        node.setResultOperand(currentFunction.getReferenceForClassMethod());
    }

    @Override
    public void visit(UnaryExprNode node) {
        ExprNode exprNode = node.getExpression();
        Unary.Op op = Unary.Op.NOT;
        switch (node.getOp()) {
            case PRE_INC:
                op = Unary.Op.INC;
                break;
            case PRE_DEC:
                op = Unary.Op.DEC;
                break;
            case SUF_INC:
                op = Unary.Op.INC;
                break;
            case SUF_DEC:
                op = Unary.Op.DEC;
                break;
            case POS:
                op = Unary.Op.POS;
                break;
            case NEG:
                op = Unary.Op.NEG;
                break;
            case NOT:
                op = Unary.Op.NOT;
                break;
            case NOTL:
                break;
            default:
                break;
        }
        switch (node.getOp()) {
            case PRE_INC:
            case PRE_DEC: {
                exprNode.accept(this);
                Operand operand = exprNode.getResultOperand();
                Operand value = getOperandForValueUse(currentBB, operand);
                if (operand instanceof Pointer) {
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.PRE_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), tmp));
                    currentBB.appendInst(new Store(currentBB, tmp, operand));
                    node.setResultOperand(operand);
                } else if (operand instanceof Value) {
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.PRE_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), value));
                    node.setResultOperand(operand);
                }
                break;
            }
            case SUF_INC:
            case SUF_DEC: {
                exprNode.accept(this);
                Operand operand = exprNode.getResultOperand();
                Operand value = getOperandForValueUse(currentBB, operand);
                if (operand instanceof Pointer) {
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.SUF_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), tmp));
                    currentBB.appendInst(new Store(currentBB, tmp, operand));
                    node.setResultOperand(value);
                } else if (operand instanceof Value) {
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Move(currentBB, value, tmp));
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.SUF_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), value));
                    node.setResultOperand(tmp);
                }
                break;
            }
            case POS:
            case NEG:
            case NOT: {
                exprNode.accept(this);
                Operand value = getOperandForValueUse(currentBB, exprNode.getResultOperand());
                node.setResultOperand(new I64Value());
                currentBB.appendInst(new Unary(currentBB, op, value, node.getResultOperand()));
                break;
            }
            case NOTL: {
                //short-circuit evaluation
                exprNode.setThenBB(node.getElseBB());
                exprNode.setElseBB(node.getThenBB());
                exprNode.accept(this);
                break;
            }
            default:
                break;
        }
    }

    @Override
    public void visit(IntLiteralNode node) {
        node.setResultOperand(new Immediate(node.getVal()));
    }

    @Override
    public void visit(BoolLiteralNode node) {
        node.setResultOperand(new Immediate(node.getVal() ? 1 : 0));
    }

    @Override
    public void visit(NullLiteralNode node) {
        node.setResultOperand(new Immediate(0));
    }

    @Override
    public void visit(StringLiteralNode node) {
        StaticString staticString = new StaticString(new GlobalI64Pointer("str"), node.getVal());
        node.setResultOperand(staticString.getPointer());
        irRoot.addStaticString(staticString);
    }

    //lhs(Register/Memory) = rhsExpr(Register/Memory/Immediate)
    private void assign(boolean isPointerAssign, Operand lhs, ExprNode rhsExpr) {
        if (isPointerAssign) {
            rhsExpr.accept(this);
            currentBB.appendInst(new Move(currentBB, rhsExpr.getResultOperand(), lhs));
        } else {
            if (rhsExpr.isBoolean()) {
                BasicBlock thenBB = new BasicBlock(currentFunction, "thenBB");
                BasicBlock elseBB = new BasicBlock(currentFunction, "elseBB");
                BasicBlock mergeBB = new BasicBlock(currentFunction, "mergeBB");
                rhsExpr.setThenBB(thenBB);
                rhsExpr.setElseBB(elseBB);
                rhsExpr.accept(this);
                if (lhs instanceof Pointer) {
                    thenBB.appendInst(new Store(thenBB, new Immediate(1), lhs));
                    elseBB.appendInst(new Store(elseBB, new Immediate(0), lhs));
                } else {
                    thenBB.appendInst(new Move(thenBB, new Immediate(1), lhs));
                    elseBB.appendInst(new Move(elseBB, new Immediate(0), lhs));
                }
                thenBB.terminate(new Jump(thenBB, mergeBB));
                elseBB.terminate(new Jump(elseBB, mergeBB));
                currentBB = mergeBB;
            } else {
                rhsExpr.accept(this);
                if (rhsExpr.getResultOperand() instanceof Pointer) {
                    I64Value tmp_value = new I64Value();
                    currentBB.appendInst(new Load(currentBB, rhsExpr.getResultOperand(), tmp_value));
                    if (lhs instanceof Pointer) currentBB.appendInst(new Store(currentBB, tmp_value, lhs));
                    else currentBB.appendInst(new Move(currentBB, tmp_value, lhs));
                } else {
                    if (lhs instanceof Pointer)
                        currentBB.appendInst(new Store(currentBB, rhsExpr.getResultOperand(), lhs));
                    else currentBB.appendInst(new Move(currentBB, rhsExpr.getResultOperand(), lhs));
                }
            }
        }
    }

    //new Type [expr_1][expr_2]....[expr_n][][][]...[]
    //for NewExpr, expand it recursively
    private void arrayAllocation(NewExprNode node, I64Pointer resultOprand, int depth) {
        ExprNode indexExprNode = node.getExprNodeList().get(depth);
        indexExprNode.accept(this);
        Operand indexValue = getOperandForValueUse(currentBB, indexExprNode.getResultOperand());
        I64Value allocateSize = new I64Value();

        if (depth == node.getNumDims() - 1) {
            //ultimate dimension
            currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(node.getType().getTypeSize()), allocateSize));
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, allocateSize, new Immediate(Configuration.REGISTER_SIZE), allocateSize));
            currentBB.appendInst(new Alloc(currentBB, allocateSize, resultOprand));
            currentBB.appendInst(new Store(currentBB, indexValue, resultOprand));
        } else {
            //generate new
            currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(Configuration.POINTER_SIZE()), allocateSize));
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, allocateSize, new Immediate(Configuration.REGISTER_SIZE), allocateSize));
            currentBB.appendInst(new Alloc(currentBB, allocateSize, resultOprand));
            currentBB.appendInst(new Store(currentBB, indexValue, resultOprand));
            //generate for TODO: expand loops for compile-time constants
            BasicBlock bodyBB = new BasicBlock(currentFunction, "for_body");
            BasicBlock condBB = new BasicBlock(currentFunction, "for_cond");
            BasicBlock stepBB = new BasicBlock(currentFunction, "for_step");
            BasicBlock mergeBB = new BasicBlock(currentFunction, "for_merge");
            I64Pointer nowPointer = new I64Pointer();
            I64Pointer endPointer = new I64Pointer();
            I64Pointer tempPointer = new I64Pointer();
            //generate init
            currentBB.appendInst(new Move(currentBB, resultOprand, nowPointer));
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, resultOprand, allocateSize, endPointer));
            currentBB.terminate(new Jump(currentBB, condBB));
            //generate cond
            currentBB = condBB;
            I64Value cmp = new I64Value();
            condBB.appendInst(new Cmp(currentBB, Cmp.Op.EQ, nowPointer, endPointer, cmp));
            condBB.terminate(new Branch(currentBB, cmp, bodyBB, mergeBB));
            //generate body
            currentBB = bodyBB;
            arrayAllocation(node, nowPointer, depth + 1);
            currentBB.terminate(new Jump(currentBB, stepBB));
            //generate step
            currentBB = stepBB;
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, nowPointer, new Immediate(Configuration.POINTER_SIZE()), tempPointer));
            currentBB.appendInst(new Move(currentBB, tempPointer, nowPointer));
            currentBB.terminate(new Jump(currentBB, condBB));
            currentBB = mergeBB;
        }
    }

    //for Value -> just return this VR
    //for Pointer -> resolve it
    private Operand getOperandForValueUse(BasicBlock currentBB, Operand operand) {
        if (operand instanceof Pointer) {
            I64Value value = new I64Value();
            currentBB.appendInst(new Load(currentBB, operand, value));
            return value;
        } else return operand;
    }

    //for BuiltinFunctionCall
    private void builtinFunctionSymbolInitialization() {
        ((FunctionSymbol) globalScope.getString().resolveSymbol("substring", null)).setFunction(irRoot.builtinSubstring);
        ((FunctionSymbol) globalScope.getString().resolveSymbol("parseInt", null)).setFunction(irRoot.builtinParseInt);
        ((FunctionSymbol) globalScope.getString().resolveSymbol("ord", null)).setFunction(irRoot.builtinOrd);
        ((FunctionSymbol) globalScope.resolveSymbol("print", null)).setFunction(irRoot.builtinPrint);
        ((FunctionSymbol) globalScope.resolveSymbol("println", null)).setFunction(irRoot.builtinPrintln);
        ((FunctionSymbol) globalScope.resolveSymbol("getString", null)).setFunction(irRoot.builtinGetString);
        ((FunctionSymbol) globalScope.resolveSymbol("getInt", null)).setFunction(irRoot.builtinGetInt);
        ((FunctionSymbol) globalScope.resolveSymbol("toString", null)).setFunction(irRoot.builtinToString);
    }

    private boolean stringLengthOrArraySize(FuncallExprNode node) {
        FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
        String functionName = functionSymbol.getSymbolName();
        if (functionSymbol.isMemberFunction()) {
            if ((functionSymbol.getEnclosingScope() == globalScope.getString() && functionName.equals("length"))
                    || functionName.equals("array.size")) {
                node.getFunction().accept(this);
                Pointer objectPointer = (Pointer) node.getFunction().getResultOperand();
                node.setResultOperand(new I64Value());
                currentBB.appendInst(new Load(currentBB, objectPointer, node.getResultOperand()));
            } else return false;
        } else return false;
        return true;
    }
}
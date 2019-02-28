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
    private IRRoot irRoot;

    public IRBuilder(GlobalScope globalScope) {
        this.globalScope = globalScope;
    }

    public IRRoot getIrRoot() {
        return irRoot;
    }

    //TODO : 1.process null, allocate 0x0 for null
    @Override
    public void visit(ProgramNode node) {

    }

    @Override
    public void visit(VarDeclNode node) {
        VariableSymbol variableSymbol = node.getVariableSymbol();
        Type type = node.getTypeAfterResolve();
        if (node.isGlobalVariable()) {
            VirtualRegister globalVariable = type.isPointerType() ? new GlobalI64Pointer() : new GlobalI64Value();
            irRoot.addGlobalVariable((GlobalVariable) globalVariable);
            variableSymbol.setVariableStorage(globalVariable);
            //TODO global variable init
        } else {
            VirtualRegister virtualRegister = type.isPointerType() ? new I64Pointer() : new I64Value();
            if (currentFunction != null) currentFunction.appendParameterList(virtualRegister);
            variableSymbol.setVariableStorage(virtualRegister);
            if (node.getExpr() != null) assign(type.isPointerType(), virtualRegister, node.getExpr());
        }
    }

    //TODO
    @Override
    public void visit(FuncDeclNode node) {

    }

    //TODO
    @Override
    public void visit(ClassDeclNode node) {
        currentClassSymbol = node.getClassSymbol();
        node.getFuncDeclList().forEach(x -> {
            x.accept(this);
        });
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
            VirtualRegister virtualRegister = node.getFunctionSymbol().getType().isPointerType() ? new I64Pointer() : new I64Value();
            assign(node.getFunctionSymbol().getType().isPointerType(), virtualRegister, node.getExpression());
            currentBB.terminate(new Return(currentBB, virtualRegister));
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
        Pointer basePointer = (Pointer) array.getResultOprand();
        Value indexValue = getOprandForValueUse(currentBB, index.getResultOprand());
        node.setResultOprand(new I64Pointer());
        I64Value offset = new I64Value();
        currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(arrayType.getDims() > 1 ? Configuration.POINTER_SIZE() : arrayType.getBaseType().getTypeSize()), offset));
        currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, basePointer, offset, node.getResultOprand()));
    }

    @Override
    public void visit(BinaryExprNode node) {
        ExprNode lhs = node.getLhs();
        ExprNode rhs = node.getRhs();
        Binary.Op op_binary = Binary.Op.MUL;
        Cmp.Op op_cmp = Cmp.Op.LT;
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
                break;
            case LEQ:
                op_cmp = Cmp.Op.LEQ;
                break;
            case GEQ:
                op_cmp = Cmp.Op.GEQ;
                break;
            case LT:
                op_cmp = Cmp.Op.LT;
                break;
            case NEQ:
                op_cmp = Cmp.Op.NEQ;
                break;
            case EQ:
                op_cmp = Cmp.Op.EQ;
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
                Oprand lhsOprand = getOprandForValueUse(currentBB, lhs.getResultOprand());
                Oprand rhsOprand = getOprandForValueUse(currentBB, rhs.getResultOprand());
                node.setResultOprand(new I64Value());
                currentBB.appendInst(new Binary(currentBB, op_binary, lhsOprand, rhsOprand, node.getResultOprand()));
                break;
            }
            case ADD: {
                lhs.accept(this);
                rhs.accept(this);
                if (lhs.isString()) {
                    //both lhs & rhs are string
                    //TODO call string_add function
                } else {
                    //both lhs & rhs are int
                    Oprand lhsOprand = getOprandForValueUse(currentBB, lhs.getResultOprand());
                    Oprand rhsOprand = getOprandForValueUse(currentBB, rhs.getResultOprand());
                    node.setResultOprand(new I64Value());
                    currentBB.appendInst(new Binary(currentBB, op_binary, lhsOprand, rhsOprand, node.getResultOprand()));
                }
                break;
            }
            case GT:
            case LEQ:
            case GEQ:
            case LT: {
                lhs.accept(this);
                rhs.accept(this);
                Oprand lhsOprand = getOprandForValueUse(currentBB, lhs.getResultOprand());
                Oprand rhsOprand = getOprandForValueUse(currentBB, rhs.getResultOprand());
                if (lhs.isString()) {
                    //both lhs & rhs are string
                    //TODO call string_LT function
                } else {
                    //both lhs & rhs are int
                    node.setResultOprand(new I64Value());
                    currentBB.appendInst(new Cmp(currentBB, op_cmp, lhsOprand, rhsOprand, node.getResultOprand()));
                    if (node.getThenBB() != null)
                        currentBB.appendInst(new Branch(currentBB, node.getResultOprand(), node.getThenBB(), node.getElseBB()));
                }
                break;
            }
            case NEQ:
            case EQ: {
                lhs.accept(this);
                rhs.accept(this);
                Oprand lhsOprand = getOprandForValueUse(currentBB, lhs.getResultOprand());
                Oprand rhsOprand = getOprandForValueUse(currentBB, rhs.getResultOprand());
                if (lhs.isString()) {
                    //both string
                    //TODO call string_EQ funtion
                } else {
                    //both int
                    node.setResultOprand(new I64Value());
                    currentBB.appendInst(new Cmp(currentBB, op_cmp, lhsOprand, rhsOprand, node.getResultOprand()));
                    if (node.getThenBB() != null)
                        currentBB.appendInst(new Branch(currentBB, node.getResultOprand(), node.getThenBB(), node.getElseBB()));
                }
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
                rhs.accept(this);
                assign(lhs.getType().isPointerType(), lhs.getResultOprand(), rhs);
                break;
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        Pointer base = (Pointer) node.getExpression().getResultOprand();
        if (node.getExpression().isAccessable()) {
            //Class
            Symbol memberSymbol = node.getSymbol();
            if (memberSymbol instanceof VariableSymbol) {
                //Class.variable
                I64Pointer memberPointer = new I64Pointer();
                //compute offset & set result
                currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, base, new Immediate(((VariableSymbol) memberSymbol).getOffset()), memberPointer));
                node.setResultOprand(memberPointer);
            } else {
                //Class.function()
                //note down pointer of class for function call use
                node.setResultOprand(base);
            }
        } else {
            //Array.size()
            //note down pointer of array for function call use
            node.setResultOprand(base);
        }
    }

    @Override
    public void visit(FuncallExprNode node) {
        FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
        if (node.getType().isPointerType()) node.setResultOprand(new I64Pointer());
        else node.setResultOprand(new I64Value());
        Call call = new Call(currentBB, node.getResultOprand());
        node.getParameterList().forEach(x -> {
            x.accept(this);
            call.appendParameterList(x.getResultOprand());
        });
        if (functionSymbol.isMemberFunction()) {
            //is member function, need pass class reference
            call.setObjectPointer(node.getFunction().getResultOprand());
        }
        currentBB.appendInst(call);
    }

    @Override
    public void visit(IDExprNode node) {
        Symbol symbol = node.getSymbol();
        if (symbol instanceof VariableSymbol)
            node.setResultOprand(((VariableSymbol) symbol).getVariableStorage());
    }

    @Override
    public void visit(NewExprNode node) {
        Type type = node.getBaseTypeAfterResolve();
        if (node.getNumDims() == 0) {
            //new an object
            node.setResultOprand(new I64Pointer());
            currentBB.appendInst(new Alloc(currentBB, new Immediate(type.getTypeSize()), (I64Pointer) node.getResultOprand()));
        } else {
            //new an array
            node.setResultOprand(new I64Pointer());
            arrayAllocation(node, (I64Pointer) node.getResultOprand(), 0);
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        node.setResultOprand(currentFunction.getReferenceForClassMethod());
    }

    //TODO
    @Override
    public void visit(UnaryExprNode node) {
        ExprNode exprNode = node.getExpression();
        Unary.Op op = Unary.Op.NOT;
        switch (node.getOp()) {
            case PRE_INC : op = Unary.Op.INC;
            case PRE_DEC : op = Unary.Op.DEC;
            case SUF_INC : op = Unary.Op.INC;
            case SUF_DEC : op = Unary.Op.DEC;
            case POS : op = Unary.Op.POS;
            case NEG : op = Unary.Op.NEG;
            case NOT : op = Unary.Op.NOT;
            case NOTL : break;
            default : break;
        }
        switch (node.getOp()) {
            case PRE_INC:
            case PRE_DEC: {
                exprNode.accept(this);
                Oprand oprand = exprNode.getResultOprand();
                Value value = getOprandForValueUse(currentBB, oprand);
                if (oprand instanceof Pointer){
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.PRE_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), tmp));
                    currentBB.appendInst(new Store(currentBB, tmp, oprand));
                    node.setResultOprand(oprand);
                } else if (oprand instanceof Value){
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.PRE_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), value));
                    node.setResultOprand(oprand);
                }
                break;
            }
            case SUF_INC:
            case SUF_DEC: {
                exprNode.accept(this);
                Oprand oprand = exprNode.getResultOprand();
                Value value = getOprandForValueUse(currentBB, oprand);
                if (oprand instanceof Pointer){
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.SUF_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), tmp));
                    currentBB.appendInst(new Store(currentBB, tmp, oprand));
                    node.setResultOprand(value);
                } else if (oprand instanceof Value){
                    I64Value tmp = new I64Value();
                    currentBB.appendInst(new Move(currentBB, value, tmp));
                    currentBB.appendInst(new Binary(currentBB, node.getOp() == UnaryExprNode.Op.SUF_INC ? Binary.Op.ADD : Binary.Op.SUB, value, new Immediate(1), value));
                    node.setResultOprand(tmp);
                }
                break;
            }
            case POS:
            case NEG:
            case NOT: {
                exprNode.accept(this);
                Value value = getOprandForValueUse(currentBB, exprNode.getResultOprand());
                node.setResultOprand(new I64Value());
                currentBB.appendInst(new Unary(currentBB, op, value, node.getResultOprand()));
                break;
            }
            case NOTL: {
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
        node.setResultOprand(new Immediate(node.getVal()));
    }

    @Override
    public void visit(BoolLiteralNode node) {
        node.setResultOprand(new Immediate(node.getVal() ? 1 : 0));
    }

    @Override
    public void visit(NullLiteralNode node) {
        node.setResultOprand(new Immediate(0));
    }

    @Override
    public void visit(StringLiteralNode node) {
        StaticString staticString = new StaticString(new GlobalI64Pointer(), node.getVal());
        node.setResultOprand(staticString.getPointer());
        irRoot.addStaticString(staticString);
    }

    //oprand(Register/Memory) = expr(Register/Memory/Immediate)
    private void assign(boolean isPointerAssign, Oprand lhs, ExprNode rhsExpr) {
        if (isPointerAssign) {
            currentBB.appendInst(new Move(currentBB, rhsExpr.getResultOprand(), lhs));
        } else {
            if (rhsExpr.isBoolean()) {
                //short-circuit evaluation
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
                if (rhsExpr.getResultOprand() instanceof Pointer) {
                    I64Value tmp_value = new I64Value();
                    currentBB.appendInst(new Load(currentBB, rhsExpr.getResultOprand(), tmp_value));
                    if (lhs instanceof Pointer) currentBB.appendInst(new Store(currentBB, tmp_value, lhs));
                    else currentBB.appendInst(new Move(currentBB, tmp_value, lhs));
                } else {
                    if (lhs instanceof Pointer)
                        currentBB.appendInst(new Store(currentBB, rhsExpr.getResultOprand(), lhs));
                    else currentBB.appendInst(new Move(currentBB, rhsExpr.getResultOprand(), lhs));
                }
            }
        }
    }

    //new Type [expr_1][expr_2]....[expr_n][][][]...[]
    //for NewExpr, expand it recursively
    private void arrayAllocation(NewExprNode node, I64Pointer resultOprand, int depth) {
        ExprNode indexExprNode = node.getExprNodeList().get(depth);
        indexExprNode.accept(this);
        Value indexValue = getOprandForValueUse(currentBB, indexExprNode.getResultOprand());
        I64Value allocateSize = new I64Value();

        if (depth == node.getNumDims() - 1) {
            //ultimate dimension
            currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(node.getType().getTypeSize()), allocateSize));
            currentBB.appendInst(new Alloc(currentBB, allocateSize, resultOprand));
        } else {
            //generate new
            currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexValue, new Immediate(Configuration.POINTER_SIZE()), allocateSize));
            currentBB.appendInst(new Alloc(currentBB, allocateSize, resultOprand));
            //generate for TODO expand loops for compile-time constants
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
            currentBB.appendInst(new Jump(currentBB, condBB));
            //generate cond
            currentBB = condBB;
            I64Value cmp = new I64Value();
            condBB.appendInst(new Cmp(currentBB, Cmp.Op.EQ, nowPointer, endPointer, cmp));
            condBB.appendInst(new Branch(currentBB, cmp, bodyBB, mergeBB));
            //generate body
            currentBB = bodyBB;
            arrayAllocation(node, nowPointer, depth + 1);
            currentBB.terminate(new Jump(currentBB, stepBB));
            //generate step
            currentBB = stepBB;
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, nowPointer, new Immediate(Configuration.POINTER_SIZE()), tempPointer));
            currentBB.appendInst(new Move(currentBB, tempPointer, nowPointer));
            currentBB.appendInst(new Jump(currentBB, condBB));
            currentBB = mergeBB;
        }
    }

    private Value getOprandForValueUse(BasicBlock currentBB, Oprand oprand) {
        if (oprand instanceof Pointer) {
            I64Value value = new I64Value();
            currentBB.appendInst(new Load(currentBB, oprand, value));
            return value;
        } else return (Value) oprand;
    }
}
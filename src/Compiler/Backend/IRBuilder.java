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

    //TODO
    @Override
    public void visit(ProgramNode node) {

    }

    @Override
    public void visit(VarDeclNode node) {
        VariableSymbol variableSymbol = node.getVariableSymbol();
        Type type = node.getTypeAfterResolve();
        if (node.isGlobalVariable()) {
            GlobalVariable globalVariable = new GlobalVariable(new VirtualRegister(), type.getTypeSize());
            irRoot.addGlobalVariable(globalVariable);
            variableSymbol.setVariableStorage(globalVariable);
            //global variable init TODO
        } else {
            VirtualRegister virtualRegister = new VirtualRegister();
            if (currentFunction != null) currentFunction.appendParameterList(virtualRegister);
            variableSymbol.setVariableStorage(virtualRegister);
            if (node.getExpr() != null) assign(virtualRegister, node.getExpr());
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
            VirtualRegister virtualRegister = new VirtualRegister();
            assign(virtualRegister, node.getExpression());
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
        HeapData basePointer = (HeapData) array.getResultOprand();
        VirtualRegister indexVR = (VirtualRegister) array.getResultOprand();
        //Result type may be ArrayType or BaseType or Primitive
        if (arrayType.getDims() > 1) {
            //Result type is ArrayType
            HeapData result = new HeapData(new VirtualRegister(), Configuration.POINTER_SIZE());
            node.setResultOprand(result);
            VirtualRegister offset = new VirtualRegister();
            currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexVR, new Immediate(Configuration.POINTER_SIZE()), offset));
            currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, basePointer, offset, result));
        } else {
            if (arrayType.getBaseType() instanceof ClassSymbol) {
                //Result type is ClassType
                HeapData result = new HeapData(new VirtualRegister(), Configuration.POINTER_SIZE());
                VirtualRegister offset = new VirtualRegister();
                currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexVR, new Immediate(arrayType.getBaseType().getTypeSize()), offset));
                currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, basePointer, offset, result));
            } else {
                //Result type is baseType
                VirtualRegister offset = new VirtualRegister();
                currentBB.appendInst(new Binary(currentBB, Binary.Op.MUL, indexVR, new Immediate(arrayType.getBaseType().getTypeSize()), offset));
                VirtualRegister pointer = new VirtualRegister();
                currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, basePointer, offset, pointer));
                node.setResultOprand(new VirtualRegister());
                currentBB.appendInst(new Move(currentBB, new HeapData(pointer, arrayType.getBaseType().getTypeSize()), node.getResultOprand()));
            }
        }
    }

    //TODO
    @Override
    public void visit(BinaryExprNode node) {
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

            }
            case ADD: {

            }
            case GT:
            case LEQ:
            case GEQ:
            case LT: {

            }
            case NEQ:
            case EQ: {

            }
            case ANDL:
            case ORL: {

            }
            case ASSIGN: {
            }
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        node.getExpression().accept(this);
        Memory base = (Memory) node.getExpression().getResultOprand();
        if (node.getExpression().isAccessable()) {
            //Class
            ClassSymbol classSymbol = (ClassSymbol) node.getExpression().getType();
            Symbol memberSymbol = node.getSymbol();
            if (memberSymbol instanceof VariableSymbol) {
                //Class.variable
                //base is HeapData type, get its pointer, string has no variable member, so HeapData is safe
                HeapData memberPointer = new HeapData(new VirtualRegister(), memberSymbol.getType().getTypeSize());
                //compute offset
                currentBB.appendInst(new Binary(currentBB, Binary.Op.ADD, base.getPointer(), new Immediate(((VariableSymbol) memberSymbol).getOffset()), memberPointer.getPointer()));
                node.setResultOprand(new VirtualRegister());
                //load member from memory & note down the result VR
                currentBB.appendInst(new Move(currentBB, memberPointer, node.getResultOprand()));
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
        node.setResultOprand(new VirtualRegister());
        Call call = new Call(currentBB, (VirtualRegister) node.getResultOprand());
        node.getParameterList().forEach(x -> {
            x.accept(this);
            call.appendParameterList(x.getResultOprand());
        });
        FunctionSymbol functionSymbol = node.getFunction().getFunctionSymbol();
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

    //TODO
    @Override
    public void visit(NewExprNode node) {
        Type type = node.getBaseTypeAfterResolve();
        if (node.getNumDims() == 0) {
            //new an object
            node.setResultOprand(new HeapData(new VirtualRegister(), type.getTypeSize()));
            currentBB.appendInst(new Alloc(currentBB, type.getTypeSize(), ((HeapData)node.getResultOprand()).getPointer()));
        } else {
            //new an array

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
        switch (node.getOp()) {
            case PRE_INC:
            case PRE_DEC: {

            }
            case SUF_INC:
            case SUF_DEC: {

            }
            case POS:
            case NEG:
            case NOT: {

            }
            case NOTL: {

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
        StaticString staticString = new StaticString(new VirtualRegister(), node.getVal().length(), node.getVal());
        node.setResultOprand(staticString);
        irRoot.addStaticString(staticString);
    }

    private void assign(VirtualRegister virtualRegister, ExprNode exprNode) {
        if (exprNode.isBoolean()) {
            //short-circuit evaluation
            BasicBlock thenBB = new BasicBlock(currentFunction, "thenBB");
            BasicBlock elseBB = new BasicBlock(currentFunction, "elseBB");
            BasicBlock mergeBB = new BasicBlock(currentFunction, "mergeBB");
            exprNode.setThenBB(thenBB);
            exprNode.setElseBB(elseBB);
            exprNode.accept(this);
            thenBB.appendInst(new Move(thenBB, new Immediate(1), virtualRegister));
            thenBB.terminate(new Jump(thenBB, mergeBB));
            elseBB.appendInst(new Move(elseBB, new Immediate(0), virtualRegister));
            elseBB.terminate(new Jump(elseBB, mergeBB));
            currentBB = mergeBB;
        } else {
            exprNode.accept(this);
            currentBB.appendInst(new Move(currentBB, exprNode.getResultOprand(), virtualRegister));
        }
    }
}
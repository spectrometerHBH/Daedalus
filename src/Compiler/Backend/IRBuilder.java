package Compiler.Backend;

import Compiler.AST.*;
import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Jump;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Instruction.Return;
import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.Immediate;
import Compiler.IR.Operand.StaticString;
import Compiler.IR.Operand.VirtualRegister;
import Compiler.Symbol.ClassSymbol;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.Type;
import Compiler.Symbol.VariableSymbol;

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
            GlobalVariable globalVariable = new GlobalVariable(type.getTypeSize());
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
        if (node.getStep() != null){
            currentBB = stepBB;
            node.getStep().accept(this);
            if (!currentBB.isTerminated()) currentBB.terminate(new Jump(currentBB, condBB));
        }
        currentBB = mergeBB;
    }

    @Override
    public void visit(ReturnNode node) {
        if (node.getFunctionSymbol().getType().getTypeName().equals("void")){
            currentBB.terminate(new Return(currentBB, null));
        }else{
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
    //TODO
    @Override
    public void visit(ArrayIndexNode node) {

    }
    //TODO
    @Override
    public void visit(BinaryExprNode node) {

    }
    //TODO
    @Override
    public void visit(ClassMemberNode node) {

    }
    //TODO
    @Override
    public void visit(FuncallExprNode node) {

    }
    //TODO
    @Override
    public void visit(IDExprNode node) {

    }
    //TODO
    @Override
    public void visit(NewExprNode node) {

    }
    //TODO
    @Override
    public void visit(ThisExprNode node) {

    }
    //TODO
    @Override
    public void visit(UnaryExprNode node) {

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
        StaticString staticString = new StaticString(node.getVal());
        node.setResultOprand(staticString);
        irRoot.addStaticString(staticString);
    }

    private void assign(VirtualRegister virtualRegister, ExprNode exprNode){
        if (exprNode.isBoolean()){
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
        }else{
            exprNode.accept(this);
            currentBB.appendInst(new Move(currentBB, exprNode.getResultOprand(), virtualRegister));
        }
    }
}

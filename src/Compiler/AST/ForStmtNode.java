package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.Utils.Position;

public class ForStmtNode extends StmtNode implements Loop {
    private ExprNode init;
    private ExprNode cond;
    private ExprNode step;
    private StmtNode statement;

    //for IR
    private BasicBlock stepBB;
    private BasicBlock mergeBB;

    public ForStmtNode(ExprNode init, ExprNode cond, ExprNode step, StmtNode statement, Position position) {
        super(position);
        this.init = init;
        this.cond = cond;
        this.step = step;
        this.statement = statement;
    }

    public ExprNode getInit() {
        return init;
    }

    public ExprNode getCond() {
        return cond;
    }

    public ExprNode getStep() {
        return step;
    }

    public StmtNode getStatement() {
        return statement;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public BasicBlock getStepBB() {
        return stepBB;
    }

    public void setStepBB(BasicBlock stepBB) {
        this.stepBB = stepBB;
    }

    @Override
    public BasicBlock getMergeBB() {
        return mergeBB;
    }

    public void setMergeBB(BasicBlock mergeBB) {
        this.mergeBB = mergeBB;
    }
}

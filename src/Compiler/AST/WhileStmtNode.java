package Compiler.AST;

import Compiler.IR.BasicBlock;
import Compiler.Utils.Position;

public class WhileStmtNode extends StmtNode implements Loop {
    private ExprNode expression;
    private StmtNode statement;
    private Position position;

    //for IR
    private BasicBlock stepBB;
    private BasicBlock mergeBB;

    public WhileStmtNode(ExprNode expression, StmtNode statement, Position position) {
        super(position);
        this.expression = expression;
        this.statement = statement;
    }

    public ExprNode getExpression() {
        return expression;
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

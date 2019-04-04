package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Parser.MxstarBaseVisitor;
import Compiler.Parser.MxstarParser;
import Compiler.Utils.Position;
import Compiler.Utils.SyntaxError;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilder extends MxstarBaseVisitor<ASTNode> {
    @Override
    public ASTNode visitProgram(MxstarParser.ProgramContext ctx) {
        List<DeclNode> decls = new ArrayList<>();
        if (ctx.programSection() != null) {
            for (ParserRuleContext programSection : ctx.programSection()) {
                ASTNode decl = visit(programSection);
                if (decl instanceof VarDeclListNode) decls.addAll(((VarDeclListNode) decl).getList());
                else decls.add((DeclNode) decl);
            }
        }
        return new ProgramNode(decls, new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitProgramSection(MxstarParser.ProgramSectionContext ctx) {
        if (ctx.functionDecl() != null) return visit(ctx.functionDecl());
        if (ctx.variableDecl() != null) return visit(ctx.variableDecl());
        if (ctx.classDecl() != null) return visit(ctx.classDecl());
        return null;
    }

    @Override
    public ASTNode visitFunctionDecl(MxstarParser.FunctionDeclContext ctx) {
        TypeNode type = ctx.typeForFunc() == null ? null : (TypeNode) visit(ctx.typeForFunc());
        String identifier = ctx.Identifier().getText();
        List<VarDeclNode> parameterList = new ArrayList<>();
        if (ctx.parameterDeclarationList() != null) {
            ASTNode decl = visit(ctx.parameterDeclarationList());
            parameterList.addAll(((VarDeclListNode) decl).getList());
        }
        BlockStmtNode block = (BlockStmtNode) visit(ctx.block());
        return new FuncDeclNode(type, identifier, parameterList, block, new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitClassDecl(MxstarParser.ClassDeclContext ctx) {
        String identifier = ctx.Identifier().getText();
        List<FuncDeclNode> functionDeclList = new ArrayList<>();
        List<VarDeclNode> varDeclList = new ArrayList<>();
        for (ParserRuleContext decl : ctx.functionDecl())
            functionDeclList.add((FuncDeclNode) visit(decl));
        for (ParserRuleContext decl : ctx.variableDecl())
            varDeclList.addAll(((VarDeclListNode) visit(decl)).getList());
        return new ClassDeclNode(identifier, functionDeclList, varDeclList, new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitVariableDecl(MxstarParser.VariableDeclContext ctx) {
        TypeNode type = (TypeNode) visit(ctx.type());
        VarDeclListNode varDeclList = (VarDeclListNode) visit(ctx.variableList());
        varDeclList.setType(type);
        return varDeclList;
    }

    @Override
    public ASTNode visitVariableList(MxstarParser.VariableListContext ctx) {
        VarDeclListNode varDeclListNode = new VarDeclListNode(new Position(ctx.getStart()));
        for (ParserRuleContext singleVariableDecl : ctx.singleVariableDecl())
            varDeclListNode.addVar((VarDeclNode) visit(singleVariableDecl));
        return varDeclListNode;
    }

    @Override
    public ASTNode visitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx) {
        String identifier = ctx.Identifier().getText();
        ExprNode expr = ctx.expression() == null ? null : (ExprNode) visit(ctx.expression());
        return new VarDeclNode(null, expr, identifier, new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx) {
        VarDeclListNode parameterDeclListNode = new VarDeclListNode(new Position(ctx.getStart()));
        for (ParserRuleContext parameterDecl : ctx.parameterDeclaration())
            parameterDeclListNode.addVar((VarDeclNode) visit(parameterDecl));
        return parameterDeclListNode;
    }

    @Override
    public ASTNode visitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx) {
        TypeNode type = (TypeNode) visit(ctx.type());
        String identifier = ctx.Identifier().getText();
        return new VarDeclNode(type, null, identifier, new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitArrayType(MxstarParser.ArrayTypeContext ctx) {
        return new ArrayTypeNode((TypeNode) visit(ctx.type()), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayType(MxstarParser.NarrayTypeContext ctx) {
        return visit(ctx.nonArrayType());
    }

    @Override
    public ASTNode visitTypeForFunc(MxstarParser.TypeForFuncContext ctx) {
        if (ctx.type() != null) return visit(ctx.type());
        return new VoidTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayTypeInt(MxstarParser.NarrayTypeIntContext ctx) {
        return new IntTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayTypeBool(MxstarParser.NarrayTypeBoolContext ctx) {
        return new BoolTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayTypeString(MxstarParser.NarrayTypeStringContext ctx) {
        return new StringTypeNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayTypeIdentifier(MxstarParser.NarrayTypeIdentifierContext ctx) {
        return new ClassTypeNode(ctx.Identifier().getText(), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitBlockStmt(MxstarParser.BlockStmtContext ctx) {
        return visit(ctx.block());
    }

    @Override
    public ASTNode visitVarDeclStmt(MxstarParser.VarDeclStmtContext ctx) {
        return new VarDeclStmtNode((VarDeclListNode) visit(ctx.variableDecl()), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitExprStmt(MxstarParser.ExprStmtContext ctx) {
        return new ExprStmtNode((ExprNode) visit(ctx.expression()), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitConditionStmt(MxstarParser.ConditionStmtContext ctx) {
        return visit(ctx.conditionStatement());
    }

    @Override
    public ASTNode visitLoopStmt(MxstarParser.LoopStmtContext ctx) {
        return visit(ctx.loopStatement());
    }

    @Override
    public ASTNode visitJumpStmt(MxstarParser.JumpStmtContext ctx) {
        return visit(ctx.jumpStatement());
    }

    @Override
    public ASTNode visitBlankStmt(MxstarParser.BlankStmtContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitBlock(MxstarParser.BlockContext ctx) {
        List<StmtNode> stmtList = new ArrayList<>();
        for (ParserRuleContext stmt : ctx.statement()) {
            StmtNode stmtNode = (StmtNode) visit(stmt);
            if (stmtNode != null) stmtList.add((StmtNode) visit(stmt));
        }
        return new BlockStmtNode(stmtList, new Position(ctx.start));
    }

    @Override
    public ASTNode visitConditionStatement(MxstarParser.ConditionStatementContext ctx) {
        StmtNode thenStmt = (StmtNode) visit(ctx.thenStmt);
        StmtNode elseStmt = ctx.elseStmt == null ? null : (StmtNode) visit(ctx.elseStmt);
        if (!(thenStmt instanceof BlockStmtNode))
            thenStmt = new BlockStmtNode(thenStmt, new Position(ctx.getStart()));
        if (elseStmt != null && !(elseStmt instanceof BlockStmtNode))
            elseStmt = new BlockStmtNode(elseStmt, new Position(ctx.getStart()));
        return new IfStmtNode((ExprNode) visit(ctx.expression()),
                thenStmt,
                elseStmt,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitWhileStmt(MxstarParser.WhileStmtContext ctx) {
        StmtNode stmtNode = (StmtNode) visit(ctx.statement());
        if (!(stmtNode instanceof BlockStmtNode))
            stmtNode = new BlockStmtNode(stmtNode, new Position(ctx.getStart()));
        return new WhileStmtNode((ExprNode) visit(ctx.expression()),
                stmtNode,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitForStmt(MxstarParser.ForStmtContext ctx) {
        StmtNode stmtNode = (StmtNode) visit(ctx.statement());
        if (!(stmtNode instanceof BlockStmtNode))
            stmtNode = new BlockStmtNode(stmtNode, new Position(ctx.getStart()));
        return new ForStmtNode(
                ctx.init == null ? null : (ExprNode) visit(ctx.init),
                ctx.cond == null ? null : (ExprNode) visit(ctx.cond),
                ctx.step == null ? null : (ExprNode) visit(ctx.step),
                stmtNode,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitReturnStmt(MxstarParser.ReturnStmtContext ctx) {
        return new ReturnNode(ctx.expression() == null ? null : (ExprNode) visit(ctx.expression()),
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitBreakStmt(MxstarParser.BreakStmtContext ctx) {
        return new BreakNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitContinueStmt(MxstarParser.ContinueStmtContext ctx) {
        return new ContinueNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitIdentifier(MxstarParser.IdentifierContext ctx) {
        return new IDExprNode(ctx.Identifier().getText(), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitMemberAccess(MxstarParser.MemberAccessContext ctx) {
        return new ClassMemberNode((ExprNode) visit(ctx.expression()),
                ctx.Identifier().getText(),
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitLiteral(MxstarParser.LiteralContext ctx) {
        return visit(ctx.constant());
    }

    @Override
    public ASTNode visitBinaryExpr(MxstarParser.BinaryExprContext ctx) {
        BinaryExprNode.Op op;
        switch (ctx.op.getText()) {
            case "*":
                op = BinaryExprNode.Op.MUL;
                break;
            case "/":
                op = BinaryExprNode.Op.DIV;
                break;
            case "%":
                op = BinaryExprNode.Op.MOD;
                break;
            case "+":
                op = BinaryExprNode.Op.ADD;
                break;
            case "-":
                op = BinaryExprNode.Op.SUB;
                break;
            case "<<":
                op = BinaryExprNode.Op.SHL;
                break;
            case ">>":
                op = BinaryExprNode.Op.SHR;
                break;
            case "<":
                op = BinaryExprNode.Op.LT;
                break;
            case ">":
                op = BinaryExprNode.Op.GT;
                break;
            case "<=":
                op = BinaryExprNode.Op.LEQ;
                break;
            case ">=":
                op = BinaryExprNode.Op.GEQ;
                break;
            case "==":
                op = BinaryExprNode.Op.EQ;
                break;
            case "!=":
                op = BinaryExprNode.Op.NEQ;
                break;
            case "&":
                op = BinaryExprNode.Op.AND;
                break;
            case "^":
                op = BinaryExprNode.Op.XOR;
                break;
            case "|":
                op = BinaryExprNode.Op.OR;
                break;
            case "&&":
                op = BinaryExprNode.Op.ANDL;
                break;
            case "||":
                op = BinaryExprNode.Op.ORL;
                break;
            case "=":
                op = BinaryExprNode.Op.ASSIGN;
                break;
            default:
                op = null;
        }
        return new BinaryExprNode((ExprNode) visit(ctx.lhs),
                (ExprNode) visit(ctx.rhs),
                op,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNewExpr(MxstarParser.NewExprContext ctx) {
        return visit(ctx.creator());
    }

    @Override
    public ASTNode visitSubscript(MxstarParser.SubscriptContext ctx) {
        return new ArrayIndexNode((ExprNode) visit(ctx.array),
                (ExprNode) visit(ctx.index),
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitFunctionCall(MxstarParser.FunctionCallContext ctx) {
        List<ExprNode> parameterList = new ArrayList<>();
        if (ctx.parameterList() != null) {
            for (ParserRuleContext parameter : ctx.parameterList().expression())
                parameterList.add((ExprNode) visit(parameter));
        }
        return new FuncallExprNode((ExprNode) visit(ctx.expression()),
                parameterList,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitPostfixIncDec(MxstarParser.PostfixIncDecContext ctx) {
        return new UnaryExprNode((ExprNode) visit(ctx.expression()),
                (ctx.op.getText().equals("++")) ? UnaryExprNode.Op.SUF_INC : UnaryExprNode.Op.SUF_DEC,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitUnaryExpr(MxstarParser.UnaryExprContext ctx) {
        UnaryExprNode.Op op;
        switch (ctx.op.getText()) {
            case "++":
                op = UnaryExprNode.Op.PRE_INC;
                break;
            case "--":
                op = UnaryExprNode.Op.PRE_DEC;
                break;
            case "+":
                op = UnaryExprNode.Op.POS;
                break;
            case "-":
                op = UnaryExprNode.Op.NEG;
                break;
            case "!":
                op = UnaryExprNode.Op.NOTL;
                break;
            case "~":
                op = UnaryExprNode.Op.NOT;
                break;
            default:
                op = null;
        }
        return new UnaryExprNode((ExprNode) visit(ctx.expression()),
                op,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitSubExpression(MxstarParser.SubExpressionContext ctx) {
        return visit(ctx.expression());
    }

    @Override
    public ASTNode visitThisExpr(MxstarParser.ThisExprContext ctx) {
        return new ThisExprNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitParameterList(MxstarParser.ParameterListContext ctx) {
        return null;
    }

    @Override
    public ASTNode visitErrorCreator(MxstarParser.ErrorCreatorContext ctx) {
        throw new SyntaxError("Invalid new expression", new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitArrayCreator(MxstarParser.ArrayCreatorContext ctx) {
        List<ExprNode> exprNodeList = new ArrayList<>();
        for (ParserRuleContext expression : ctx.expression())
            exprNodeList.add((ExprNode) visit(expression));
        return new NewExprNode((TypeNode) visit(ctx.nonArrayType()),
                (ctx.getChildCount() - ctx.expression().size() - 1) / 2,
                exprNodeList,
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNarrayCreator(MxstarParser.NarrayCreatorContext ctx) {
        return new NewExprNode((TypeNode) visit(ctx.nonArrayType()),
                0,
                new ArrayList<>(),
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitClassCreator(MxstarParser.ClassCreatorContext ctx) {
        return new NewExprNode((TypeNode) visit(ctx.nonArrayType()),
                0,
                new ArrayList<>(),
                new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitIntegerLiteral(MxstarParser.IntegerLiteralContext ctx) {
        return new IntLiteralNode(Integer.valueOf(ctx.IntegerConstant().getText()), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitStringLiteral(MxstarParser.StringLiteralContext ctx) {
        return new StringLiteralNode(ctx.StringConstant().getText(), new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitNullLiteral(MxstarParser.NullLiteralContext ctx) {
        return new NullLiteralNode(new Position(ctx.getStart()));
    }

    @Override
    public ASTNode visitBoolLiteral(MxstarParser.BoolLiteralContext ctx) {
        return new BoolLiteralNode(Boolean.valueOf(ctx.BoolConstant().getText()), new Position(ctx.getStart()));
    }
}

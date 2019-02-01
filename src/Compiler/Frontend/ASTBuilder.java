package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Parser.MxstarBaseVisitor;
import Compiler.Parser.MxstarParser;
import Compiler.Utils.Position;
import javafx.geometry.Pos;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilder extends MxstarBaseVisitor<ASTNode> {
    @Override public ASTNode visitProgram(MxstarParser.ProgramContext ctx) {
        List<DeclNode> decls = new ArrayList<>();
        if (ctx.programSection() != null){
            for (ParserRuleContext programSection : ctx.programSection()){
                ASTNode decl = visit(programSection);
                if (decl instanceof VarDeclListNode) decls.addAll(((VarDeclListNode) decl).getList());
                else decls.add((DeclNode) decl);
            }
        }
        return new ProgramNode(decls, new Position(ctx.getStart()));
    }

    @Override public ASTNode visitProgramSection(MxstarParser.ProgramSectionContext ctx) {
        if (ctx.functionDecl() != null) return visit(ctx.functionDecl());
        if (ctx.variableDecl() != null) return visit(ctx.variableDecl());
        if (ctx.classDecl() != null) return visit(ctx.classDecl());
        return null;
    }

    @Override public ASTNode visitFunctionDecl(MxstarParser.FunctionDeclContext ctx) {
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

    @Override public ASTNode visitClassDecl(MxstarParser.ClassDeclContext ctx) {
        String identifier = ctx.Identifier().getText();
        List<FuncDeclNode> functionDeclList = new ArrayList<>();
        List<VarDeclNode> varDeclList = new ArrayList<>();
        for (ParserRuleContext decl : ctx.functionDecl())
            functionDeclList.add((FuncDeclNode) visit(decl));
        for (ParserRuleContext decl : ctx.variableDecl())
            varDeclList.add((VarDeclNode) visit(decl));
        return new ClassDeclNode(identifier, functionDeclList, varDeclList, new Position(ctx.getStart()));
    }

    @Override public ASTNode visitVariableDecl(MxstarParser.VariableDeclContext ctx) {
        TypeNode type = (TypeNode) visit(ctx.type());
        VarDeclListNode varDeclList = (VarDeclListNode) visit(ctx.variableList());
        varDeclList.setType(type);
        return varDeclList;
    }

    @Override public ASTNode visitVariableList(MxstarParser.VariableListContext ctx) {
        VarDeclListNode varDeclListNode = new VarDeclListNode();
        for (ParserRuleContext singleVariableDecl : ctx.singleVariableDecl())
            varDeclListNode.addVar((VarDeclNode) visit(singleVariableDecl));
        return varDeclListNode;
    }

    @Override public ASTNode visitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx) {
        String identifier = ctx.Identifier().getText();
        ExprNode expr = ctx.expression() == null ? null : (ExprNode) visit(ctx.expression());
        return new VarDeclNode(null, expr, identifier, new Position(ctx.getStart()));
    }

    @Override public ASTNode visitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx) {
        VarDeclListNode parameterDeclListNode = new VarDeclListNode();
        for (ParserRuleContext parameterDecl : ctx.parameterDeclaration())
            parameterDeclListNode.addVar((VarDeclNode) visit(parameterDecl));
        return parameterDeclListNode;
    }

    @Override public ASTNode visitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx) {
        TypeNode type = (TypeNode) visit(ctx.type());
        String identifier = ctx.Identifier().getText();
        return new VarDeclNode(type, null, identifier, new Position(ctx.getStart()));
    }

    @Override public ASTNode visitArrayType(MxstarParser.ArrayTypeContext ctx) {
        return new ArrayTypeNode((TypeNode) visit(ctx.type()), new Position(ctx.getStart()))
    }

    @Override public ASTNode visitNarrayType(MxstarParser.NarrayTypeContext ctx) {
        return visit(ctx.nonArrayType());
    }

    @Override public ASTNode visitTypeForFunc(MxstarParser.TypeForFuncContext ctx) {
        if (ctx.type() != null) return visit(ctx.type());
        return new VoidTypeNode(new Position(ctx.getStart()));
    }

    @Override public ASTNode visitNarrayTypeInt(MxstarParser.NarrayTypeIntContext ctx) {
        return new IntTypeNode(new Position(ctx.getStart()));
    }

    @Override public ASTNode visitNarrayTypeBool(MxstarParser.NarrayTypeBoolContext ctx) {
        return new BoolTypeNode(new Position(ctx.getStart()));
    }

    @Override public ASTNode visitNarrayTypeString(MxstarParser.NarrayTypeStringContext ctx) {
        return new StringTypeNode(new Position(ctx.getStart()));
    }

    @Override public ASTNode visitNarrayTypeIdentifier(MxstarParser.NarrayTypeIdentifierContext ctx) {
        return new ClassTypeNode(ctx.Identifier().getText(), new Position(ctx.getStart()));
    }

    @Override public ASTNode visitBlockStmt(MxstarParser.BlockStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitVarDeclStmt(MxstarParser.VarDeclStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitExprStmt(MxstarParser.ExprStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitConditionStmt(MxstarParser.ConditionStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitLoopStmt(MxstarParser.LoopStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitJumpStmt(MxstarParser.JumpStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitBlankStmt(MxstarParser.BlankStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitBlock(MxstarParser.BlockContext ctx) {
        List<StmtNode> stmtList = new ArrayList<>();
        for (ParserRuleContext stmt = ctx.statement())
            stmtList.add((StmtNode) visit(stmt));
        return new BlockStmtNode(stmtList, new Position(ctx.start));
    }

    @Override public ASTNode visitConditionStatement(MxstarParser.ConditionStatementContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitWhileStmt(MxstarParser.WhileStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitForStmt(MxstarParser.ForStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitReturnStmt(MxstarParser.ReturnStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitBreakStmt(MxstarParser.BreakStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitContinueStmt(MxstarParser.ContinueStmtContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitIdentifier(MxstarParser.IdentifierContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitMemberAccess(MxstarParser.MemberAccessContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitLiteral(MxstarParser.LiteralContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitBinaryExpr(MxstarParser.BinaryExprContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitNewExpr(MxstarParser.NewExprContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitSubscript(MxstarParser.SubscriptContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitFunctionCall(MxstarParser.FunctionCallContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitPostfixIncDec(MxstarParser.PostfixIncDecContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitUnaryExpr(MxstarParser.UnaryExprContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitSubExpression(MxstarParser.SubExpressionContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitThisExpr(MxstarParser.ThisExprContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitParameterList(MxstarParser.ParameterListContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitErrorCreator(MxstarParser.ErrorCreatorContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitArrayCreator(MxstarParser.ArrayCreatorContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitNarrayCreator(MxstarParser.NarrayCreatorContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitIntegerLiteral(MxstarParser.IntegerLiteralContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitStringLiteral(MxstarParser.StringLiteralContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitNullLiteral(MxstarParser.NullLiteralContext ctx) {
        return visitChildren(ctx);
    }

    @Override public ASTNode visitBoolLiteral(MxstarParser.BoolLiteralContext ctx) {
        return visitChildren(ctx);
    }
}

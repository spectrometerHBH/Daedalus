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

    @Override public ASTNode visitStatement(MxstarParser.StatementContext ctx) {

    }

    @Override public ASTNode visitBlock(MxstarParser.BlockContext ctx) {

    }

    @Override public ASTNode visitConditionStatement(MxstarParser.ConditionStatementContext ctx) {

    }

    @Override public ASTNode visitLoopStatement(MxstarParser.LoopStatementContext ctx) {

    }

    @Override public ASTNode visitJumpStatement(MxstarParser.JumpStatementContext ctx) {

    }

    @Override public ASTNode visitIdentifier(MxstarParser.IdentifierContext ctx) {

    }

    @Override public ASTNode visitMemberAccess(MxstarParser.MemberAccessContext ctx) { 
        
    }

    @Override public ASTNode visitLiteral(MxstarParser.LiteralContext ctx) { 
        
    }

    @Override public ASTNode visitBinaryExpr(MxstarParser.BinaryExprContext ctx) { 
        
    }

    @Override public ASTNode visitNewExpr(MxstarParser.NewExprContext ctx) { 
        
    }

    @Override public ASTNode visitSubscript(MxstarParser.SubscriptContext ctx) { 
        
    }

    @Override public ASTNode visitFunctionCall(MxstarParser.FunctionCallContext ctx) { 
        
    }

    @Override public ASTNode visitPostfixIncDec(MxstarParser.PostfixIncDecContext ctx) { 
        
    }

    @Override public ASTNode visitUnaryExpr(MxstarParser.UnaryExprContext ctx) { 
        
    }

    @Override public ASTNode visitSubExpression(MxstarParser.SubExpressionContext ctx) { 
        
    }

    @Override public ASTNode visitThisExpr(MxstarParser.ThisExprContext ctx) { 
        
    }

    @Override public ASTNode visitParameterList(MxstarParser.ParameterListContext ctx) {

    }

    @Override public ASTNode visitCreator(MxstarParser.CreatorContext ctx) {

    }

    @Override public ASTNode visitConstant(MxstarParser.ConstantContext ctx) {

    }
}

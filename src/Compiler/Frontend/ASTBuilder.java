package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Parser.MxstarBaseVisitor;
import Compiler.Parser.MxstarParser;
import Compiler.Utils.Position;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilder extends MxstarBaseVisitor<ASTNode> {
    @Override public ASTNode visitProgram(MxstarParser.ProgramContext ctx) {
        List<DeclNode> decls = new ArrayList<>();
        Position pos = new Position(ctx.getStart());
        if (ctx.programSection() != null){
            for (ParserRuleContext programSection : ctx.programSection()){
                ASTNode decl = visit(programSection);
                if (decl instanceof VarDeclListNode) decls.addAll(((VarDeclListNode) decl).getList());
                else decls.add((DeclNode) decl);
            }
        }
        return new ProgramNode(decls, pos);
    }

    @Override public ASTNode visitProgramSection(MxstarParser.ProgramSectionContext ctx) {
        if (ctx.functionDecl() != null) return visit(ctx.functionDecl());
        if (ctx.variableDecl() != null) return visit(ctx.variableDecl());
        if (ctx.classDecl() != null) return visit(ctx.classDecl());
        return null;
    }

    @Override public ASTNode visitFunctionDecl(MxstarParser.FunctionDeclContext ctx) {

    }

    @Override public ASTNode visitClassDecl(MxstarParser.ClassDeclContext ctx) {

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
    }

    @Override public ASTNode visitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx) {
        String identifier = ctx.Identifier().getText();
        Position pos = new Position(ctx.getStart());
        ExprNode expr = ctx.expression() == null ? null : (ExprNode) visit(ctx.expression());
        return new VarDeclNode(null, expr, identifier, pos);
    }

    @Override public ASTNode visitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx) {

    }

    @Override public ASTNode visitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx) {

    }

    @Override public ASTNode visitType(MxstarParser.TypeContext ctx) {

    }

    @Override public ASTNode visitTypeForFunc(MxstarParser.TypeForFuncContext ctx) {
        if (ctx.type() != null) return visit(ctx.type());
        return new VoidTypeNode();
    }

    @Override public ASTNode visitNonArrayType(MxstarParser.NonArrayTypeContext ctx) {

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

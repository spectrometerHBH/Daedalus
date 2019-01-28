package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Parser.MxstarBaseVisitor;
import Compiler.Parser.MxstarParser;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilder extends MxstarBaseVisitor<ASTNode> {
    @Override public ASTNode visitProgram(MxstarParser.ProgramContext ctx) {

    }

    @Override public ASTNode visitProgramSection(MxstarParser.ProgramSectionContext ctx) {

    }

    @Override public ASTNode visitFunctionDecl(MxstarParser.FunctionDeclContext ctx) {

    }

    @Override public ASTNode visitClassDecl(MxstarParser.ClassDeclContext ctx) {

    }

    @Override public ASTNode visitVariableDecl(MxstarParser.VariableDeclContext ctx) {

    }

    @Override public ASTNode visitVariableList(MxstarParser.VariableListContext ctx) {

    }

    @Override public ASTNode visitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx) {

    }

    @Override public ASTNode visitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx) {

    }

    @Override public ASTNode visitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx) {

    }

    @Override public ASTNode visitType(MxstarParser.TypeContext ctx) {

    }

    @Override public ASTNode visitTypeForFunc(MxstarParser.TypeForFuncContext ctx) {

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

    @Override public ASTNode visitExpression(MxstarParser.ExpressionContext ctx) {

    }

    @Override public ASTNode visitParameterList(MxstarParser.ParameterListContext ctx) {

    }

    @Override public ASTNode visitCreator(MxstarParser.CreatorContext ctx) {

    }

    @Override public ASTNode visitConstant(MxstarParser.ConstantContext ctx) {

    }
}

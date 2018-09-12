// Generated from Mxstar.g4 by ANTLR 4.7.1

package Compiler.Parser;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxstarParser}.
 */
public interface MxstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxstarParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxstarParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxstarParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDecl(MxstarParser.FunctionDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDecl(MxstarParser.FunctionDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#classDecl}.
	 * @param ctx the parse tree
	 */
	void enterClassDecl(MxstarParser.ClassDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#classDecl}.
	 * @param ctx the parse tree
	 */
	void exitClassDecl(MxstarParser.ClassDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void enterVariableDecl(MxstarParser.VariableDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void exitVariableDecl(MxstarParser.VariableDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableList}.
	 * @param ctx the parse tree
	 */
	void enterVariableList(MxstarParser.VariableListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableList}.
	 * @param ctx the parse tree
	 */
	void exitVariableList(MxstarParser.VariableListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#singleVariableDecl}.
	 * @param ctx the parse tree
	 */
	void enterSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#singleVariableDecl}.
	 * @param ctx the parse tree
	 */
	void exitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameterDeclarationList}.
	 * @param ctx the parse tree
	 */
	void enterParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameterDeclarationList}.
	 * @param ctx the parse tree
	 */
	void exitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameterDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameterDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(MxstarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(MxstarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#typeForFunc}.
	 * @param ctx the parse tree
	 */
	void enterTypeForFunc(MxstarParser.TypeForFuncContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#typeForFunc}.
	 * @param ctx the parse tree
	 */
	void exitTypeForFunc(MxstarParser.TypeForFuncContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#nonArrayType}.
	 * @param ctx the parse tree
	 */
	void enterNonArrayType(MxstarParser.NonArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#nonArrayType}.
	 * @param ctx the parse tree
	 */
	void exitNonArrayType(MxstarParser.NonArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MxstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MxstarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxstarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxstarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#conditionStatement}.
	 * @param ctx the parse tree
	 */
	void enterConditionStatement(MxstarParser.ConditionStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#conditionStatement}.
	 * @param ctx the parse tree
	 */
	void exitConditionStatement(MxstarParser.ConditionStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void enterLoopStatement(MxstarParser.LoopStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void exitLoopStatement(MxstarParser.LoopStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void enterJumpStatement(MxstarParser.JumpStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#jumpStatement}.
	 * @param ctx the parse tree
	 */
	void exitJumpStatement(MxstarParser.JumpStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(MxstarParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(MxstarParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterCreator(MxstarParser.CreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitCreator(MxstarParser.CreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterConstant(MxstarParser.ConstantContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitConstant(MxstarParser.ConstantContext ctx);
}
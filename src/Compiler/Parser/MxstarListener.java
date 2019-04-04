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
     *
     * @param ctx the parse tree
     */
    void enterProgram(MxstarParser.ProgramContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#program}.
     *
     * @param ctx the parse tree
     */
    void exitProgram(MxstarParser.ProgramContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#programSection}.
     *
     * @param ctx the parse tree
     */
    void enterProgramSection(MxstarParser.ProgramSectionContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#programSection}.
     *
     * @param ctx the parse tree
     */
    void exitProgramSection(MxstarParser.ProgramSectionContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#functionDecl}.
     *
     * @param ctx the parse tree
     */
    void enterFunctionDecl(MxstarParser.FunctionDeclContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#functionDecl}.
     *
     * @param ctx the parse tree
     */
    void exitFunctionDecl(MxstarParser.FunctionDeclContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#classDecl}.
     *
     * @param ctx the parse tree
     */
    void enterClassDecl(MxstarParser.ClassDeclContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#classDecl}.
     *
     * @param ctx the parse tree
     */
    void exitClassDecl(MxstarParser.ClassDeclContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#variableDecl}.
     *
     * @param ctx the parse tree
     */
    void enterVariableDecl(MxstarParser.VariableDeclContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#variableDecl}.
     *
     * @param ctx the parse tree
     */
    void exitVariableDecl(MxstarParser.VariableDeclContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#variableList}.
     *
     * @param ctx the parse tree
     */
    void enterVariableList(MxstarParser.VariableListContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#variableList}.
     *
     * @param ctx the parse tree
     */
    void exitVariableList(MxstarParser.VariableListContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#singleVariableDecl}.
     *
     * @param ctx the parse tree
     */
    void enterSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#singleVariableDecl}.
     *
     * @param ctx the parse tree
     */
    void exitSingleVariableDecl(MxstarParser.SingleVariableDeclContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#parameterDeclarationList}.
     *
     * @param ctx the parse tree
     */
    void enterParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#parameterDeclarationList}.
     *
     * @param ctx the parse tree
     */
    void exitParameterDeclarationList(MxstarParser.ParameterDeclarationListContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#parameterDeclaration}.
     *
     * @param ctx the parse tree
     */
    void enterParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#parameterDeclaration}.
     *
     * @param ctx the parse tree
     */
    void exitParameterDeclaration(MxstarParser.ParameterDeclarationContext ctx);

    /**
     * Enter a parse tree produced by the {@code arrayType}
     * labeled alternative in {@link MxstarParser#type}.
     *
     * @param ctx the parse tree
     */
    void enterArrayType(MxstarParser.ArrayTypeContext ctx);

    /**
     * Exit a parse tree produced by the {@code arrayType}
     * labeled alternative in {@link MxstarParser#type}.
     *
     * @param ctx the parse tree
     */
    void exitArrayType(MxstarParser.ArrayTypeContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayType}
     * labeled alternative in {@link MxstarParser#type}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayType(MxstarParser.NarrayTypeContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayType}
     * labeled alternative in {@link MxstarParser#type}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayType(MxstarParser.NarrayTypeContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#typeForFunc}.
     *
     * @param ctx the parse tree
     */
    void enterTypeForFunc(MxstarParser.TypeForFuncContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#typeForFunc}.
     *
     * @param ctx the parse tree
     */
    void exitTypeForFunc(MxstarParser.TypeForFuncContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayTypeInt}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayTypeInt(MxstarParser.NarrayTypeIntContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayTypeInt}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayTypeInt(MxstarParser.NarrayTypeIntContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayTypeBool}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayTypeBool(MxstarParser.NarrayTypeBoolContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayTypeBool}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayTypeBool(MxstarParser.NarrayTypeBoolContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayTypeString}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayTypeString(MxstarParser.NarrayTypeStringContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayTypeString}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayTypeString(MxstarParser.NarrayTypeStringContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayTypeIdentifier}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayTypeIdentifier(MxstarParser.NarrayTypeIdentifierContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayTypeIdentifier}
     * labeled alternative in {@link MxstarParser#nonArrayType}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayTypeIdentifier(MxstarParser.NarrayTypeIdentifierContext ctx);

    /**
     * Enter a parse tree produced by the {@code blockStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterBlockStmt(MxstarParser.BlockStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code blockStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitBlockStmt(MxstarParser.BlockStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code varDeclStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterVarDeclStmt(MxstarParser.VarDeclStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code varDeclStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitVarDeclStmt(MxstarParser.VarDeclStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code exprStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterExprStmt(MxstarParser.ExprStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code exprStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitExprStmt(MxstarParser.ExprStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code conditionStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterConditionStmt(MxstarParser.ConditionStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code conditionStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitConditionStmt(MxstarParser.ConditionStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code loopStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterLoopStmt(MxstarParser.LoopStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code loopStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitLoopStmt(MxstarParser.LoopStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code jumpStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterJumpStmt(MxstarParser.JumpStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code jumpStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitJumpStmt(MxstarParser.JumpStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code blankStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void enterBlankStmt(MxstarParser.BlankStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code blankStmt}
     * labeled alternative in {@link MxstarParser#statement}.
     *
     * @param ctx the parse tree
     */
    void exitBlankStmt(MxstarParser.BlankStmtContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#block}.
     *
     * @param ctx the parse tree
     */
    void enterBlock(MxstarParser.BlockContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#block}.
     *
     * @param ctx the parse tree
     */
    void exitBlock(MxstarParser.BlockContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#conditionStatement}.
     *
     * @param ctx the parse tree
     */
    void enterConditionStatement(MxstarParser.ConditionStatementContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#conditionStatement}.
     *
     * @param ctx the parse tree
     */
    void exitConditionStatement(MxstarParser.ConditionStatementContext ctx);

    /**
     * Enter a parse tree produced by the {@code whileStmt}
     * labeled alternative in {@link MxstarParser#loopStatement}.
     *
     * @param ctx the parse tree
     */
    void enterWhileStmt(MxstarParser.WhileStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code whileStmt}
     * labeled alternative in {@link MxstarParser#loopStatement}.
     *
     * @param ctx the parse tree
     */
    void exitWhileStmt(MxstarParser.WhileStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code forStmt}
     * labeled alternative in {@link MxstarParser#loopStatement}.
     *
     * @param ctx the parse tree
     */
    void enterForStmt(MxstarParser.ForStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code forStmt}
     * labeled alternative in {@link MxstarParser#loopStatement}.
     *
     * @param ctx the parse tree
     */
    void exitForStmt(MxstarParser.ForStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code returnStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void enterReturnStmt(MxstarParser.ReturnStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code returnStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void exitReturnStmt(MxstarParser.ReturnStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code breakStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void enterBreakStmt(MxstarParser.BreakStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code breakStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void exitBreakStmt(MxstarParser.BreakStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code continueStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void enterContinueStmt(MxstarParser.ContinueStmtContext ctx);

    /**
     * Exit a parse tree produced by the {@code continueStmt}
     * labeled alternative in {@link MxstarParser#jumpStatement}.
     *
     * @param ctx the parse tree
     */
    void exitContinueStmt(MxstarParser.ContinueStmtContext ctx);

    /**
     * Enter a parse tree produced by the {@code Identifier}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterIdentifier(MxstarParser.IdentifierContext ctx);

    /**
     * Exit a parse tree produced by the {@code Identifier}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitIdentifier(MxstarParser.IdentifierContext ctx);

    /**
     * Enter a parse tree produced by the {@code MemberAccess}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterMemberAccess(MxstarParser.MemberAccessContext ctx);

    /**
     * Exit a parse tree produced by the {@code MemberAccess}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitMemberAccess(MxstarParser.MemberAccessContext ctx);

    /**
     * Enter a parse tree produced by the {@code Literal}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterLiteral(MxstarParser.LiteralContext ctx);

    /**
     * Exit a parse tree produced by the {@code Literal}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitLiteral(MxstarParser.LiteralContext ctx);

    /**
     * Enter a parse tree produced by the {@code BinaryExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterBinaryExpr(MxstarParser.BinaryExprContext ctx);

    /**
     * Exit a parse tree produced by the {@code BinaryExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitBinaryExpr(MxstarParser.BinaryExprContext ctx);

    /**
     * Enter a parse tree produced by the {@code NewExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterNewExpr(MxstarParser.NewExprContext ctx);

    /**
     * Exit a parse tree produced by the {@code NewExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitNewExpr(MxstarParser.NewExprContext ctx);

    /**
     * Enter a parse tree produced by the {@code Subscript}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterSubscript(MxstarParser.SubscriptContext ctx);

    /**
     * Exit a parse tree produced by the {@code Subscript}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitSubscript(MxstarParser.SubscriptContext ctx);

    /**
     * Enter a parse tree produced by the {@code FunctionCall}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterFunctionCall(MxstarParser.FunctionCallContext ctx);

    /**
     * Exit a parse tree produced by the {@code FunctionCall}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitFunctionCall(MxstarParser.FunctionCallContext ctx);

    /**
     * Enter a parse tree produced by the {@code PostfixIncDec}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterPostfixIncDec(MxstarParser.PostfixIncDecContext ctx);

    /**
     * Exit a parse tree produced by the {@code PostfixIncDec}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitPostfixIncDec(MxstarParser.PostfixIncDecContext ctx);

    /**
     * Enter a parse tree produced by the {@code UnaryExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterUnaryExpr(MxstarParser.UnaryExprContext ctx);

    /**
     * Exit a parse tree produced by the {@code UnaryExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitUnaryExpr(MxstarParser.UnaryExprContext ctx);

    /**
     * Enter a parse tree produced by the {@code SubExpression}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterSubExpression(MxstarParser.SubExpressionContext ctx);

    /**
     * Exit a parse tree produced by the {@code SubExpression}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitSubExpression(MxstarParser.SubExpressionContext ctx);

    /**
     * Enter a parse tree produced by the {@code ThisExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void enterThisExpr(MxstarParser.ThisExprContext ctx);

    /**
     * Exit a parse tree produced by the {@code ThisExpr}
     * labeled alternative in {@link MxstarParser#expression}.
     *
     * @param ctx the parse tree
     */
    void exitThisExpr(MxstarParser.ThisExprContext ctx);

    /**
     * Enter a parse tree produced by {@link MxstarParser#parameterList}.
     *
     * @param ctx the parse tree
     */
    void enterParameterList(MxstarParser.ParameterListContext ctx);

    /**
     * Exit a parse tree produced by {@link MxstarParser#parameterList}.
     *
     * @param ctx the parse tree
     */
    void exitParameterList(MxstarParser.ParameterListContext ctx);

    /**
     * Enter a parse tree produced by the {@code errorCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void enterErrorCreator(MxstarParser.ErrorCreatorContext ctx);

    /**
     * Exit a parse tree produced by the {@code errorCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void exitErrorCreator(MxstarParser.ErrorCreatorContext ctx);

    /**
     * Enter a parse tree produced by the {@code arrayCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void enterArrayCreator(MxstarParser.ArrayCreatorContext ctx);

    /**
     * Exit a parse tree produced by the {@code arrayCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void exitArrayCreator(MxstarParser.ArrayCreatorContext ctx);

    /**
     * Enter a parse tree produced by the {@code narrayCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void enterNarrayCreator(MxstarParser.NarrayCreatorContext ctx);

    /**
     * Exit a parse tree produced by the {@code narrayCreator}
     * labeled alternative in {@link MxstarParser#creator}.
     *
     * @param ctx the parse tree
     */
    void exitNarrayCreator(MxstarParser.NarrayCreatorContext ctx);

    /**
     * Enter a parse tree produced by the {@code integerLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void enterIntegerLiteral(MxstarParser.IntegerLiteralContext ctx);

    /**
     * Exit a parse tree produced by the {@code integerLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void exitIntegerLiteral(MxstarParser.IntegerLiteralContext ctx);

    /**
     * Enter a parse tree produced by the {@code stringLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void enterStringLiteral(MxstarParser.StringLiteralContext ctx);

    /**
     * Exit a parse tree produced by the {@code stringLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void exitStringLiteral(MxstarParser.StringLiteralContext ctx);

    /**
     * Enter a parse tree produced by the {@code nullLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void enterNullLiteral(MxstarParser.NullLiteralContext ctx);

    /**
     * Exit a parse tree produced by the {@code nullLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void exitNullLiteral(MxstarParser.NullLiteralContext ctx);

    /**
     * Enter a parse tree produced by the {@code boolLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void enterBoolLiteral(MxstarParser.BoolLiteralContext ctx);

    /**
     * Exit a parse tree produced by the {@code boolLiteral}
     * labeled alternative in {@link MxstarParser#constant}.
     *
     * @param ctx the parse tree
     */
    void exitBoolLiteral(MxstarParser.BoolLiteralContext ctx);
}
grammar Mxstar;

@header {
package Compiler.Parser;
}

program
    :   programSection*
    ;

programSection
    :   functionDecl
    |   classDecl
    |   variableDecl
    ;
    
// --- Declaration
functionDecl
    :   typeForFunc ? Identifier '(' parameterDeclarationList? ')' block
    ;

classDecl
    :   Class Identifier '{' (functionDecl | variableDecl)* '}'
    ;

variableDecl
    :   type variableList ';'
    ;

variableList
    :   singleVariableDecl (',' singleVariableDecl)*
    ;

singleVariableDecl
    :   Identifier ('=' expression) ? 
    ;

parameterDeclarationList
    :   parameterDeclaration (',' parameterDeclaration)*
    ;

parameterDeclaration
    :   type Identifier
    ;

type
    :   type '[' ']'
    |   nonArrayType
    ;

typeForFunc
    :   type
    |   Void
    ;

nonArrayType
    :   Int
    |   Bool
    |   String
    |   Identifier
    ;

// --- Statement
statement 
    :   block
    |   variableDecl
    |   expression ';'
    |   conditionStatement
    |   loopStatement
    |   jumpStatement
    |   ';' 
    ;

block
    :   '{' statement* '}'
    ;

conditionStatement
    :   If '(' expression ')' thenStmt = statement (Else elseStmt=statement)?
    ;

loopStatement
    :   While '(' expression ')' statement
    |   For '(' init=expression ';' cond=expression ';' step=expression ')' statement
    ;

jumpStatement
    :   Return expression? ';'
    |   Break ';'
    |   Continue ';'
    ;

// --- Expression
expression
    :   expression op=('++' | '--')                                 #PostfixIncDec
    |   expression '(' parameterList? ')'                           #FunctionCall    
    |   expression '[' expression ']'                               #Subscript
    |   expression '.' Identifier                                   #MemberAccess
    |   <assoc=right> op=('++' | '--') expression                   #UnaryExpr
    |   <assoc=right> op=('+' | '-') expression                     #UnaryExpr
    |   <assoc=right> op=('!' | '~') expression                     #UnaryExpr
    |   <assoc=right> 'new' creator                                 #NewExpr    
    |   lhs = expression op=('*' | '/' | '%') rhs = expression      #BinaryExpr
    |   lhs = expression op=('+' | '-') rhs = expression            #BinaryExpr
    |   lhs = expression op=('<<' | '>>') rhs = expression          #BinaryExpr
    |   lhs = expression op=('<' | '>') rhs = expression            #BinaryExpr
    |   lhs = expression op=('<=' | '>=') rhs = expression          #BinaryExpr
    |   lhs = expression op=('==' | '!=') rhs = expression          #BinaryExpr   
    |   lhs = expression op='&' rhs = expression                    #BinaryExpr
    |   lhs = expression op='^' rhs = expression                    #BinaryExpr
    |   lhs = expression op='|' rhs = expression                    #BinaryExpr
    |   lhs = expression op='&&' rhs = expression                   #BinaryExpr
    |   lhs = expression op='||' rhs = expression                   #BinaryExpr
    |   <assoc=right> lhs = expression op='=' rhs = expression      #BinaryExpr
    |   Identifier                                                  #Identifier
    |   This                                                        #ThisExpr
    |   constant                                                    #Literal
    |   '(' expression ')'                                          #SubExpression
    ;

parameterList
    :   expression (',' expression)*
    ;

creator
    :   nonArrayType ('[' expression ']')+ ('[' ']')+ ('[' expression ']')+  
    |   nonArrayType ('[' expression ']')+ ('[' ']')*                        
    |   nonArrayType                                                         
    ;

constant
    :   IntegerConstant
    |   StringConstant
    |   NullLiteral
    |   BoolConstant
    ;

// --- Reserved words
Bool : 'bool';
Int : 'int';
String : 'string';
fragment Null : 'null';
Void : 'void';
fragment True : 'true';
fragment False : 'false';
If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Break : 'break';
Continue : 'continue';
Return : 'return';
New : 'new';
Class : 'class';
This : 'this';

// --- Constant
IntegerConstant
    :   [0-9]+
    ;

StringConstant
    :   '"' ('\\n' | '\\\\' | '\\"' | .)*? '"' 
    ;

NullLiteral
    : Null
    ;

BoolConstant
    : True
    | False
    ;

// --- Identifier
Identifier
    :   [a-zA-Z] + [a-zA-Z_0-9]*
    ;

// --- Skip
WhiteSpace
    :   [ \t\n\r]+ -> skip
    ;

LineComment
    :   '//' ~[\r\n]* -> skip
    ;

BlockComment
    :   '/*' .*? '*/' -> skip
    ;
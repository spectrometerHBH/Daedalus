// Generated from Mxstar.g4 by ANTLR 4.7.1

package Compiler.Parser;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.ATN;
import org.antlr.v4.runtime.atn.ATNDeserializer;
import org.antlr.v4.runtime.atn.ParserATNSimulator;
import org.antlr.v4.runtime.atn.PredictionContextCache;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.List;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxstarParser extends Parser {
    public static final int
            T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, T__6 = 7, T__7 = 8, T__8 = 9,
            T__9 = 10, T__10 = 11, T__11 = 12, T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17,
            T__17 = 18, T__18 = 19, T__19 = 20, T__20 = 21, T__21 = 22, T__22 = 23, T__23 = 24,
            T__24 = 25, T__25 = 26, T__26 = 27, T__27 = 28, T__28 = 29, T__29 = 30, T__30 = 31,
            T__31 = 32, Bool = 33, Int = 34, String = 35, Void = 36, If = 37, Else = 38, For = 39,
            While = 40, Break = 41, Continue = 42, Return = 43, New = 44, Class = 45, This = 46,
            IntegerConstant = 47, StringConstant = 48, NullLiteral = 49, BoolConstant = 50,
            Identifier = 51, WhiteSpace = 52, LineComment = 53, BlockComment = 54;
    public static final int
            RULE_program = 0, RULE_programSection = 1, RULE_functionDecl = 2, RULE_classDecl = 3,
            RULE_variableDecl = 4, RULE_variableList = 5, RULE_singleVariableDecl = 6,
            RULE_parameterDeclarationList = 7, RULE_parameterDeclaration = 8, RULE_type = 9,
            RULE_typeForFunc = 10, RULE_nonArrayType = 11, RULE_statement = 12, RULE_block = 13,
            RULE_conditionStatement = 14, RULE_loopStatement = 15, RULE_jumpStatement = 16,
            RULE_expression = 17, RULE_parameterList = 18, RULE_creator = 19, RULE_constant = 20;
    public static final String[] ruleNames = {
            "program", "programSection", "functionDecl", "classDecl", "variableDecl",
            "variableList", "singleVariableDecl", "parameterDeclarationList", "parameterDeclaration",
            "type", "typeForFunc", "nonArrayType", "statement", "block", "conditionStatement",
            "loopStatement", "jumpStatement", "expression", "parameterList", "creator",
            "constant"
    };
    /**
     * @deprecated Use {@link #VOCABULARY} instead.
     */
    @Deprecated
    public static final String[] tokenNames;
    public static final String _serializedATN =
            "\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\38\u0146\4\2\t\2\4" +
                    "\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t" +
                    "\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22" +
                    "\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\3\2\7\2.\n\2\f\2\16\2\61\13\2" +
                    "\3\3\3\3\3\3\5\3\66\n\3\3\4\5\49\n\4\3\4\3\4\3\4\5\4>\n\4\3\4\3\4\3\4" +
                    "\3\5\3\5\3\5\3\5\3\5\7\5H\n\5\f\5\16\5K\13\5\3\5\3\5\3\6\3\6\3\6\3\6\3" +
                    "\7\3\7\3\7\7\7V\n\7\f\7\16\7Y\13\7\3\b\3\b\3\b\5\b^\n\b\3\t\3\t\3\t\7" +
                    "\tc\n\t\f\t\16\tf\13\t\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\13\7\13" +
                    "q\n\13\f\13\16\13t\13\13\3\f\3\f\5\fx\n\f\3\r\3\r\3\r\3\r\5\r~\n\r\3\16" +
                    "\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\5\16\u0089\n\16\3\17\3\17\7\17" +
                    "\u008d\n\17\f\17\16\17\u0090\13\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20" +
                    "\3\20\3\20\5\20\u009b\n\20\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21" +
                    "\5\21\u00a6\n\21\3\21\3\21\5\21\u00aa\n\21\3\21\3\21\5\21\u00ae\n\21\3" +
                    "\21\3\21\5\21\u00b2\n\21\3\22\3\22\5\22\u00b6\n\22\3\22\3\22\3\22\3\22" +
                    "\3\22\5\22\u00bd\n\22\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23" +
                    "\3\23\3\23\3\23\3\23\3\23\3\23\5\23\u00cf\n\23\3\23\3\23\3\23\3\23\3\23" +
                    "\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23" +
                    "\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23" +
                    "\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\5\23\u00fa\n\23\3\23\3\23\3\23" +
                    "\3\23\3\23\3\23\3\23\3\23\3\23\7\23\u0105\n\23\f\23\16\23\u0108\13\23" +
                    "\3\24\3\24\3\24\7\24\u010d\n\24\f\24\16\24\u0110\13\24\3\25\3\25\3\25" +
                    "\3\25\3\25\6\25\u0117\n\25\r\25\16\25\u0118\3\25\3\25\6\25\u011d\n\25" +
                    "\r\25\16\25\u011e\3\25\3\25\3\25\3\25\6\25\u0125\n\25\r\25\16\25\u0126" +
                    "\3\25\3\25\3\25\3\25\3\25\6\25\u012e\n\25\r\25\16\25\u012f\3\25\3\25\7" +
                    "\25\u0134\n\25\f\25\16\25\u0137\13\25\3\25\3\25\3\25\3\25\3\25\5\25\u013e" +
                    "\n\25\3\26\3\26\3\26\3\26\5\26\u0144\n\26\3\26\2\4\24$\27\2\4\6\b\n\f" +
                    "\16\20\22\24\26\30\32\34\36 \"$&(*\2\n\3\2\f\r\3\2\17\20\3\2\21\22\3\2" +
                    "\23\25\3\2\26\27\3\2\30\31\3\2\32\33\3\2\34\35\2\u0172\2/\3\2\2\2\4\65" +
                    "\3\2\2\2\68\3\2\2\2\bB\3\2\2\2\nN\3\2\2\2\fR\3\2\2\2\16Z\3\2\2\2\20_\3" +
                    "\2\2\2\22g\3\2\2\2\24j\3\2\2\2\26w\3\2\2\2\30}\3\2\2\2\32\u0088\3\2\2" +
                    "\2\34\u008a\3\2\2\2\36\u0093\3\2\2\2 \u00b1\3\2\2\2\"\u00bc\3\2\2\2$\u00ce" +
                    "\3\2\2\2&\u0109\3\2\2\2(\u013d\3\2\2\2*\u0143\3\2\2\2,.\5\4\3\2-,\3\2" +
                    "\2\2.\61\3\2\2\2/-\3\2\2\2/\60\3\2\2\2\60\3\3\2\2\2\61/\3\2\2\2\62\66" +
                    "\5\6\4\2\63\66\5\b\5\2\64\66\5\n\6\2\65\62\3\2\2\2\65\63\3\2\2\2\65\64" +
                    "\3\2\2\2\66\5\3\2\2\2\679\5\26\f\28\67\3\2\2\289\3\2\2\29:\3\2\2\2:;\7" +
                    "\65\2\2;=\7\3\2\2<>\5\20\t\2=<\3\2\2\2=>\3\2\2\2>?\3\2\2\2?@\7\4\2\2@" +
                    "A\5\34\17\2A\7\3\2\2\2BC\7/\2\2CD\7\65\2\2DI\7\5\2\2EH\5\6\4\2FH\5\n\6" +
                    "\2GE\3\2\2\2GF\3\2\2\2HK\3\2\2\2IG\3\2\2\2IJ\3\2\2\2JL\3\2\2\2KI\3\2\2" +
                    "\2LM\7\6\2\2M\t\3\2\2\2NO\5\24\13\2OP\5\f\7\2PQ\7\7\2\2Q\13\3\2\2\2RW" +
                    "\5\16\b\2ST\7\b\2\2TV\5\16\b\2US\3\2\2\2VY\3\2\2\2WU\3\2\2\2WX\3\2\2\2" +
                    "X\r\3\2\2\2YW\3\2\2\2Z]\7\65\2\2[\\\7\t\2\2\\^\5$\23\2][\3\2\2\2]^\3\2" +
                    "\2\2^\17\3\2\2\2_d\5\22\n\2`a\7\b\2\2ac\5\22\n\2b`\3\2\2\2cf\3\2\2\2d" +
                    "b\3\2\2\2de\3\2\2\2e\21\3\2\2\2fd\3\2\2\2gh\5\24\13\2hi\7\65\2\2i\23\3" +
                    "\2\2\2jk\b\13\1\2kl\5\30\r\2lr\3\2\2\2mn\f\4\2\2no\7\n\2\2oq\7\13\2\2" +
                    "pm\3\2\2\2qt\3\2\2\2rp\3\2\2\2rs\3\2\2\2s\25\3\2\2\2tr\3\2\2\2ux\5\24" +
                    "\13\2vx\7&\2\2wu\3\2\2\2wv\3\2\2\2x\27\3\2\2\2y~\7$\2\2z~\7#\2\2{~\7%" +
                    "\2\2|~\7\65\2\2}y\3\2\2\2}z\3\2\2\2}{\3\2\2\2}|\3\2\2\2~\31\3\2\2\2\177" +
                    "\u0089\5\34\17\2\u0080\u0089\5\n\6\2\u0081\u0082\5$\23\2\u0082\u0083\7" +
                    "\7\2\2\u0083\u0089\3\2\2\2\u0084\u0089\5\36\20\2\u0085\u0089\5 \21\2\u0086" +
                    "\u0089\5\"\22\2\u0087\u0089\7\7\2\2\u0088\177\3\2\2\2\u0088\u0080\3\2" +
                    "\2\2\u0088\u0081\3\2\2\2\u0088\u0084\3\2\2\2\u0088\u0085\3\2\2\2\u0088" +
                    "\u0086\3\2\2\2\u0088\u0087\3\2\2\2\u0089\33\3\2\2\2\u008a\u008e\7\5\2" +
                    "\2\u008b\u008d\5\32\16\2\u008c\u008b\3\2\2\2\u008d\u0090\3\2\2\2\u008e" +
                    "\u008c\3\2\2\2\u008e\u008f\3\2\2\2\u008f\u0091\3\2\2\2\u0090\u008e\3\2" +
                    "\2\2\u0091\u0092\7\6\2\2\u0092\35\3\2\2\2\u0093\u0094\7\'\2\2\u0094\u0095" +
                    "\7\3\2\2\u0095\u0096\5$\23\2\u0096\u0097\7\4\2\2\u0097\u009a\5\32\16\2" +
                    "\u0098\u0099\7(\2\2\u0099\u009b\5\32\16\2\u009a\u0098\3\2\2\2\u009a\u009b" +
                    "\3\2\2\2\u009b\37\3\2\2\2\u009c\u009d\7*\2\2\u009d\u009e\7\3\2\2\u009e" +
                    "\u009f\5$\23\2\u009f\u00a0\7\4\2\2\u00a0\u00a1\5\32\16\2\u00a1\u00b2\3" +
                    "\2\2\2\u00a2\u00a3\7)\2\2\u00a3\u00a5\7\3\2\2\u00a4\u00a6\5$\23\2\u00a5" +
                    "\u00a4\3\2\2\2\u00a5\u00a6\3\2\2\2\u00a6\u00a7\3\2\2\2\u00a7\u00a9\7\7" +
                    "\2\2\u00a8\u00aa\5$\23\2\u00a9\u00a8\3\2\2\2\u00a9\u00aa\3\2\2\2\u00aa" +
                    "\u00ab\3\2\2\2\u00ab\u00ad\7\7\2\2\u00ac\u00ae\5$\23\2\u00ad\u00ac\3\2" +
                    "\2\2\u00ad\u00ae\3\2\2\2\u00ae\u00af\3\2\2\2\u00af\u00b0\7\4\2\2\u00b0" +
                    "\u00b2\5\32\16\2\u00b1\u009c\3\2\2\2\u00b1\u00a2\3\2\2\2\u00b2!\3\2\2" +
                    "\2\u00b3\u00b5\7-\2\2\u00b4\u00b6\5$\23\2\u00b5\u00b4\3\2\2\2\u00b5\u00b6" +
                    "\3\2\2\2\u00b6\u00b7\3\2\2\2\u00b7\u00bd\7\7\2\2\u00b8\u00b9\7+\2\2\u00b9" +
                    "\u00bd\7\7\2\2\u00ba\u00bb\7,\2\2\u00bb\u00bd\7\7\2\2\u00bc\u00b3\3\2" +
                    "\2\2\u00bc\u00b8\3\2\2\2\u00bc\u00ba\3\2\2\2\u00bd#\3\2\2\2\u00be\u00bf" +
                    "\b\23\1\2\u00bf\u00c0\7.\2\2\u00c0\u00cf\5(\25\2\u00c1\u00c2\t\2\2\2\u00c2" +
                    "\u00cf\5$\23\25\u00c3\u00c4\t\3\2\2\u00c4\u00cf\5$\23\24\u00c5\u00c6\t" +
                    "\4\2\2\u00c6\u00cf\5$\23\23\u00c7\u00cf\7\65\2\2\u00c8\u00cf\7\60\2\2" +
                    "\u00c9\u00cf\5*\26\2\u00ca\u00cb\7\3\2\2\u00cb\u00cc\5$\23\2\u00cc\u00cd" +
                    "\7\4\2\2\u00cd\u00cf\3\2\2\2\u00ce\u00be\3\2\2\2\u00ce\u00c1\3\2\2\2\u00ce" +
                    "\u00c3\3\2\2\2\u00ce\u00c5\3\2\2\2\u00ce\u00c7\3\2\2\2\u00ce\u00c8\3\2" +
                    "\2\2\u00ce\u00c9\3\2\2\2\u00ce\u00ca\3\2\2\2\u00cf\u0106\3\2\2\2\u00d0" +
                    "\u00d1\f\22\2\2\u00d1\u00d2\t\5\2\2\u00d2\u0105\5$\23\23\u00d3\u00d4\f" +
                    "\21\2\2\u00d4\u00d5\t\3\2\2\u00d5\u0105\5$\23\22\u00d6\u00d7\f\20\2\2" +
                    "\u00d7\u00d8\t\6\2\2\u00d8\u0105\5$\23\21\u00d9\u00da\f\17\2\2\u00da\u00db" +
                    "\t\7\2\2\u00db\u0105\5$\23\20\u00dc\u00dd\f\16\2\2\u00dd\u00de\t\b\2\2" +
                    "\u00de\u0105\5$\23\17\u00df\u00e0\f\r\2\2\u00e0\u00e1\t\t\2\2\u00e1\u0105" +
                    "\5$\23\16\u00e2\u00e3\f\f\2\2\u00e3\u00e4\7\36\2\2\u00e4\u0105\5$\23\r" +
                    "\u00e5\u00e6\f\13\2\2\u00e6\u00e7\7\37\2\2\u00e7\u0105\5$\23\f\u00e8\u00e9" +
                    "\f\n\2\2\u00e9\u00ea\7 \2\2\u00ea\u0105\5$\23\13\u00eb\u00ec\f\t\2\2\u00ec" +
                    "\u00ed\7!\2\2\u00ed\u0105\5$\23\n\u00ee\u00ef\f\b\2\2\u00ef\u00f0\7\"" +
                    "\2\2\u00f0\u0105\5$\23\t\u00f1\u00f2\f\7\2\2\u00f2\u00f3\7\t\2\2\u00f3" +
                    "\u0105\5$\23\7\u00f4\u00f5\f\32\2\2\u00f5\u0105\t\2\2\2\u00f6\u00f7\f" +
                    "\30\2\2\u00f7\u00f9\7\3\2\2\u00f8\u00fa\5&\24\2\u00f9\u00f8\3\2\2\2\u00f9" +
                    "\u00fa\3\2\2\2\u00fa\u00fb\3\2\2\2\u00fb\u0105\7\4\2\2\u00fc\u00fd\f\27" +
                    "\2\2\u00fd\u00fe\7\n\2\2\u00fe\u00ff\5$\23\2\u00ff\u0100\7\13\2\2\u0100" +
                    "\u0105\3\2\2\2\u0101\u0102\f\26\2\2\u0102\u0103\7\16\2\2\u0103\u0105\7" +
                    "\65\2\2\u0104\u00d0\3\2\2\2\u0104\u00d3\3\2\2\2\u0104\u00d6\3\2\2\2\u0104" +
                    "\u00d9\3\2\2\2\u0104\u00dc\3\2\2\2\u0104\u00df\3\2\2\2\u0104\u00e2\3\2" +
                    "\2\2\u0104\u00e5\3\2\2\2\u0104\u00e8\3\2\2\2\u0104\u00eb\3\2\2\2\u0104" +
                    "\u00ee\3\2\2\2\u0104\u00f1\3\2\2\2\u0104\u00f4\3\2\2\2\u0104\u00f6\3\2" +
                    "\2\2\u0104\u00fc\3\2\2\2\u0104\u0101\3\2\2\2\u0105\u0108\3\2\2\2\u0106" +
                    "\u0104\3\2\2\2\u0106\u0107\3\2\2\2\u0107%\3\2\2\2\u0108\u0106\3\2\2\2" +
                    "\u0109\u010e\5$\23\2\u010a\u010b\7\b\2\2\u010b\u010d\5$\23\2\u010c\u010a" +
                    "\3\2\2\2\u010d\u0110\3\2\2\2\u010e\u010c\3\2\2\2\u010e\u010f\3\2\2\2\u010f" +
                    "\'\3\2\2\2\u0110\u010e\3\2\2\2\u0111\u0116\5\30\r\2\u0112\u0113\7\n\2" +
                    "\2\u0113\u0114\5$\23\2\u0114\u0115\7\13\2\2\u0115\u0117\3\2\2\2\u0116" +
                    "\u0112\3\2\2\2\u0117\u0118\3\2\2\2\u0118\u0116\3\2\2\2\u0118\u0119\3\2" +
                    "\2\2\u0119\u011c\3\2\2\2\u011a\u011b\7\n\2\2\u011b\u011d\7\13\2\2\u011c" +
                    "\u011a\3\2\2\2\u011d\u011e\3\2\2\2\u011e\u011c\3\2\2\2\u011e\u011f\3\2" +
                    "\2\2\u011f\u0124\3\2\2\2\u0120\u0121\7\n\2\2\u0121\u0122\5$\23\2\u0122" +
                    "\u0123\7\13\2\2\u0123\u0125\3\2\2\2\u0124\u0120\3\2\2\2\u0125\u0126\3" +
                    "\2\2\2\u0126\u0124\3\2\2\2\u0126\u0127\3\2\2\2\u0127\u013e\3\2\2\2\u0128" +
                    "\u012d\5\30\r\2\u0129\u012a\7\n\2\2\u012a\u012b\5$\23\2\u012b\u012c\7" +
                    "\13\2\2\u012c\u012e\3\2\2\2\u012d\u0129\3\2\2\2\u012e\u012f\3\2\2\2\u012f" +
                    "\u012d\3\2\2\2\u012f\u0130\3\2\2\2\u0130\u0135\3\2\2\2\u0131\u0132\7\n" +
                    "\2\2\u0132\u0134\7\13\2\2\u0133\u0131\3\2\2\2\u0134\u0137\3\2\2\2\u0135" +
                    "\u0133\3\2\2\2\u0135\u0136\3\2\2\2\u0136\u013e\3\2\2\2\u0137\u0135\3\2" +
                    "\2\2\u0138\u0139\5\30\r\2\u0139\u013a\7\3\2\2\u013a\u013b\7\4\2\2\u013b" +
                    "\u013e\3\2\2\2\u013c\u013e\5\30\r\2\u013d\u0111\3\2\2\2\u013d\u0128\3" +
                    "\2\2\2\u013d\u0138\3\2\2\2\u013d\u013c\3\2\2\2\u013e)\3\2\2\2\u013f\u0144" +
                    "\7\61\2\2\u0140\u0144\7\62\2\2\u0141\u0144\7\63\2\2\u0142\u0144\7\64\2" +
                    "\2\u0143\u013f\3\2\2\2\u0143\u0140\3\2\2\2\u0143\u0141\3\2\2\2\u0143\u0142" +
                    "\3\2\2\2\u0144+\3\2\2\2#/\658=GIW]drw}\u0088\u008e\u009a\u00a5\u00a9\u00ad" +
                    "\u00b1\u00b5\u00bc\u00ce\u00f9\u0104\u0106\u010e\u0118\u011e\u0126\u012f" +
                    "\u0135\u013d\u0143";
    public static final ATN _ATN =
            new ATNDeserializer().deserialize(_serializedATN.toCharArray());
    protected static final DFA[] _decisionToDFA;
    protected static final PredictionContextCache _sharedContextCache =
            new PredictionContextCache();
    private static final String[] _LITERAL_NAMES = {
            null, "'('", "')'", "'{'", "'}'", "';'", "','", "'='", "'['", "']'", "'++'",
            "'--'", "'.'", "'+'", "'-'", "'!'", "'~'", "'*'", "'/'", "'%'", "'<<'",
            "'>>'", "'<'", "'>'", "'<='", "'>='", "'=='", "'!='", "'&'", "'^'", "'|'",
            "'&&'", "'||'", "'bool'", "'int'", "'string'", "'void'", "'if'", "'else'",
            "'for'", "'while'", "'break'", "'continue'", "'return'", "'new'", "'class'",
            "'this'"
    };
    private static final String[] _SYMBOLIC_NAMES = {
            null, null, null, null, null, null, null, null, null, null, null, null,
            null, null, null, null, null, null, null, null, null, null, null, null,
            null, null, null, null, null, null, null, null, null, "Bool", "Int", "String",
            "Void", "If", "Else", "For", "While", "Break", "Continue", "Return", "New",
            "Class", "This", "IntegerConstant", "StringConstant", "NullLiteral", "BoolConstant",
            "Identifier", "WhiteSpace", "LineComment", "BlockComment"
    };
    public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

    static {
        RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION);
    }

    static {
        tokenNames = new String[_SYMBOLIC_NAMES.length];
        for (int i = 0; i < tokenNames.length; i++) {
            tokenNames[i] = VOCABULARY.getLiteralName(i);
            if (tokenNames[i] == null) {
                tokenNames[i] = VOCABULARY.getSymbolicName(i);
            }

            if (tokenNames[i] == null) {
                tokenNames[i] = "<INVALID>";
            }
        }
    }

    static {
        _decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
        for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
            _decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
        }
    }

    public MxstarParser(TokenStream input) {
        super(input);
        _interp = new ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
    }

    @Override
    @Deprecated
    public String[] getTokenNames() {
        return tokenNames;
    }

    @Override

    public Vocabulary getVocabulary() {
        return VOCABULARY;
    }

    @Override
    public String getGrammarFileName() {
        return "Mxstar.g4";
    }

    @Override
    public String[] getRuleNames() {
        return ruleNames;
    }

    @Override
    public String getSerializedATN() {
        return _serializedATN;
    }

    @Override
    public ATN getATN() {
        return _ATN;
    }

    public final ProgramContext program() throws RecognitionException {
        ProgramContext _localctx = new ProgramContext(_ctx, getState());
        enterRule(_localctx, 0, RULE_program);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(45);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Bool) | (1L << Int) | (1L << String) | (1L << Void) | (1L << Class) | (1L << Identifier))) != 0)) {
                    {
                        {
                            setState(42);
                            programSection();
                        }
                    }
                    setState(47);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ProgramSectionContext programSection() throws RecognitionException {
        ProgramSectionContext _localctx = new ProgramSectionContext(_ctx, getState());
        enterRule(_localctx, 2, RULE_programSection);
        try {
            setState(51);
            _errHandler.sync(this);
            switch (getInterpreter().adaptivePredict(_input, 1, _ctx)) {
                case 1:
                    enterOuterAlt(_localctx, 1);
                {
                    setState(48);
                    functionDecl();
                }
                break;
                case 2:
                    enterOuterAlt(_localctx, 2);
                {
                    setState(49);
                    classDecl();
                }
                break;
                case 3:
                    enterOuterAlt(_localctx, 3);
                {
                    setState(50);
                    variableDecl();
                }
                break;
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final FunctionDeclContext functionDecl() throws RecognitionException {
        FunctionDeclContext _localctx = new FunctionDeclContext(_ctx, getState());
        enterRule(_localctx, 4, RULE_functionDecl);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(54);
                _errHandler.sync(this);
                switch (getInterpreter().adaptivePredict(_input, 2, _ctx)) {
                    case 1: {
                        setState(53);
                        typeForFunc();
                    }
                    break;
                }
                setState(56);
                match(Identifier);
                setState(57);
                match(T__0);
                setState(59);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Bool) | (1L << Int) | (1L << String) | (1L << Identifier))) != 0)) {
                    {
                        setState(58);
                        parameterDeclarationList();
                    }
                }

                setState(61);
                match(T__1);
                setState(62);
                block();
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ClassDeclContext classDecl() throws RecognitionException {
        ClassDeclContext _localctx = new ClassDeclContext(_ctx, getState());
        enterRule(_localctx, 6, RULE_classDecl);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(64);
                match(Class);
                setState(65);
                match(Identifier);
                setState(66);
                match(T__2);
                setState(71);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Bool) | (1L << Int) | (1L << String) | (1L << Void) | (1L << Identifier))) != 0)) {
                    {
                        setState(69);
                        _errHandler.sync(this);
                        switch (getInterpreter().adaptivePredict(_input, 4, _ctx)) {
                            case 1: {
                                setState(67);
                                functionDecl();
                            }
                            break;
                            case 2: {
                                setState(68);
                                variableDecl();
                            }
                            break;
                        }
                    }
                    setState(73);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
                setState(74);
                match(T__3);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final VariableDeclContext variableDecl() throws RecognitionException {
        VariableDeclContext _localctx = new VariableDeclContext(_ctx, getState());
        enterRule(_localctx, 8, RULE_variableDecl);
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(76);
                type(0);
                setState(77);
                variableList();
                setState(78);
                match(T__4);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final VariableListContext variableList() throws RecognitionException {
        VariableListContext _localctx = new VariableListContext(_ctx, getState());
        enterRule(_localctx, 10, RULE_variableList);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(80);
                singleVariableDecl();
                setState(85);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while (_la == T__5) {
                    {
                        {
                            setState(81);
                            match(T__5);
                            setState(82);
                            singleVariableDecl();
                        }
                    }
                    setState(87);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final SingleVariableDeclContext singleVariableDecl() throws RecognitionException {
        SingleVariableDeclContext _localctx = new SingleVariableDeclContext(_ctx, getState());
        enterRule(_localctx, 12, RULE_singleVariableDecl);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(88);
                match(Identifier);
                setState(91);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la == T__6) {
                    {
                        setState(89);
                        match(T__6);
                        setState(90);
                        expression(0);
                    }
                }

            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ParameterDeclarationListContext parameterDeclarationList() throws RecognitionException {
        ParameterDeclarationListContext _localctx = new ParameterDeclarationListContext(_ctx, getState());
        enterRule(_localctx, 14, RULE_parameterDeclarationList);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(93);
                parameterDeclaration();
                setState(98);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while (_la == T__5) {
                    {
                        {
                            setState(94);
                            match(T__5);
                            setState(95);
                            parameterDeclaration();
                        }
                    }
                    setState(100);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ParameterDeclarationContext parameterDeclaration() throws RecognitionException {
        ParameterDeclarationContext _localctx = new ParameterDeclarationContext(_ctx, getState());
        enterRule(_localctx, 16, RULE_parameterDeclaration);
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(101);
                type(0);
                setState(102);
                match(Identifier);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final TypeContext type() throws RecognitionException {
        return type(0);
    }

    private TypeContext type(int _p) throws RecognitionException {
        ParserRuleContext _parentctx = _ctx;
        int _parentState = getState();
        TypeContext _localctx = new TypeContext(_ctx, _parentState);
        TypeContext _prevctx = _localctx;
        int _startState = 18;
        enterRecursionRule(_localctx, 18, RULE_type, _p);
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
                {
                    _localctx = new NarrayTypeContext(_localctx);
                    _ctx = _localctx;
                    _prevctx = _localctx;

                    setState(105);
                    nonArrayType();
                }
                _ctx.stop = _input.LT(-1);
                setState(112);
                _errHandler.sync(this);
                _alt = getInterpreter().adaptivePredict(_input, 9, _ctx);
                while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER) {
                    if (_alt == 1) {
                        if (_parseListeners != null) triggerExitRuleEvent();
                        _prevctx = _localctx;
                        {
                            {
                                _localctx = new ArrayTypeContext(new TypeContext(_parentctx, _parentState));
                                pushNewRecursionContext(_localctx, _startState, RULE_type);
                                setState(107);
                                if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
                                setState(108);
                                match(T__7);
                                setState(109);
                                match(T__8);
                            }
                        }
                    }
                    setState(114);
                    _errHandler.sync(this);
                    _alt = getInterpreter().adaptivePredict(_input, 9, _ctx);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            unrollRecursionContexts(_parentctx);
        }
        return _localctx;
    }

    public final TypeForFuncContext typeForFunc() throws RecognitionException {
        TypeForFuncContext _localctx = new TypeForFuncContext(_ctx, getState());
        enterRule(_localctx, 20, RULE_typeForFunc);
        try {
            setState(117);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
                case Bool:
                case Int:
                case String:
                case Identifier:
                    enterOuterAlt(_localctx, 1);
                {
                    setState(115);
                    type(0);
                }
                break;
                case Void:
                    enterOuterAlt(_localctx, 2);
                {
                    setState(116);
                    match(Void);
                }
                break;
                default:
                    throw new NoViableAltException(this);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final NonArrayTypeContext nonArrayType() throws RecognitionException {
        NonArrayTypeContext _localctx = new NonArrayTypeContext(_ctx, getState());
        enterRule(_localctx, 22, RULE_nonArrayType);
        try {
            setState(123);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
                case Int:
                    _localctx = new NarrayTypeIntContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(119);
                    match(Int);
                }
                break;
                case Bool:
                    _localctx = new NarrayTypeBoolContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(120);
                    match(Bool);
                }
                break;
                case String:
                    _localctx = new NarrayTypeStringContext(_localctx);
                    enterOuterAlt(_localctx, 3);
                {
                    setState(121);
                    match(String);
                }
                break;
                case Identifier:
                    _localctx = new NarrayTypeIdentifierContext(_localctx);
                    enterOuterAlt(_localctx, 4);
                {
                    setState(122);
                    match(Identifier);
                }
                break;
                default:
                    throw new NoViableAltException(this);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final StatementContext statement() throws RecognitionException {
        StatementContext _localctx = new StatementContext(_ctx, getState());
        enterRule(_localctx, 24, RULE_statement);
        try {
            setState(134);
            _errHandler.sync(this);
            switch (getInterpreter().adaptivePredict(_input, 12, _ctx)) {
                case 1:
                    _localctx = new BlockStmtContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(125);
                    block();
                }
                break;
                case 2:
                    _localctx = new VarDeclStmtContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(126);
                    variableDecl();
                }
                break;
                case 3:
                    _localctx = new ExprStmtContext(_localctx);
                    enterOuterAlt(_localctx, 3);
                {
                    setState(127);
                    expression(0);
                    setState(128);
                    match(T__4);
                }
                break;
                case 4:
                    _localctx = new ConditionStmtContext(_localctx);
                    enterOuterAlt(_localctx, 4);
                {
                    setState(130);
                    conditionStatement();
                }
                break;
                case 5:
                    _localctx = new LoopStmtContext(_localctx);
                    enterOuterAlt(_localctx, 5);
                {
                    setState(131);
                    loopStatement();
                }
                break;
                case 6:
                    _localctx = new JumpStmtContext(_localctx);
                    enterOuterAlt(_localctx, 6);
                {
                    setState(132);
                    jumpStatement();
                }
                break;
                case 7:
                    _localctx = new BlankStmtContext(_localctx);
                    enterOuterAlt(_localctx, 7);
                {
                    setState(133);
                    match(T__4);
                }
                break;
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final BlockContext block() throws RecognitionException {
        BlockContext _localctx = new BlockContext(_ctx, getState());
        enterRule(_localctx, 26, RULE_block);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(136);
                match(T__2);
                setState(140);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__2) | (1L << T__4) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << Bool) | (1L << Int) | (1L << String) | (1L << If) | (1L << For) | (1L << While) | (1L << Break) | (1L << Continue) | (1L << Return) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                    {
                        {
                            setState(137);
                            statement();
                        }
                    }
                    setState(142);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
                setState(143);
                match(T__3);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ConditionStatementContext conditionStatement() throws RecognitionException {
        ConditionStatementContext _localctx = new ConditionStatementContext(_ctx, getState());
        enterRule(_localctx, 28, RULE_conditionStatement);
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(145);
                match(If);
                setState(146);
                match(T__0);
                setState(147);
                expression(0);
                setState(148);
                match(T__1);
                setState(149);
                ((ConditionStatementContext) _localctx).thenStmt = statement();
                setState(152);
                _errHandler.sync(this);
                switch (getInterpreter().adaptivePredict(_input, 14, _ctx)) {
                    case 1: {
                        setState(150);
                        match(Else);
                        setState(151);
                        ((ConditionStatementContext) _localctx).elseStmt = statement();
                    }
                    break;
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final LoopStatementContext loopStatement() throws RecognitionException {
        LoopStatementContext _localctx = new LoopStatementContext(_ctx, getState());
        enterRule(_localctx, 30, RULE_loopStatement);
        int _la;
        try {
            setState(175);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
                case While:
                    _localctx = new WhileStmtContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(154);
                    match(While);
                    setState(155);
                    match(T__0);
                    setState(156);
                    expression(0);
                    setState(157);
                    match(T__1);
                    setState(158);
                    statement();
                }
                break;
                case For:
                    _localctx = new ForStmtContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(160);
                    match(For);
                    setState(161);
                    match(T__0);
                    setState(163);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                    if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                        {
                            setState(162);
                            ((ForStmtContext) _localctx).init = expression(0);
                        }
                    }

                    setState(165);
                    match(T__4);
                    setState(167);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                    if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                        {
                            setState(166);
                            ((ForStmtContext) _localctx).cond = expression(0);
                        }
                    }

                    setState(169);
                    match(T__4);
                    setState(171);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                    if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                        {
                            setState(170);
                            ((ForStmtContext) _localctx).step = expression(0);
                        }
                    }

                    setState(173);
                    match(T__1);
                    setState(174);
                    statement();
                }
                break;
                default:
                    throw new NoViableAltException(this);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final JumpStatementContext jumpStatement() throws RecognitionException {
        JumpStatementContext _localctx = new JumpStatementContext(_ctx, getState());
        enterRule(_localctx, 32, RULE_jumpStatement);
        int _la;
        try {
            setState(186);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
                case Return:
                    _localctx = new ReturnStmtContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(177);
                    match(Return);
                    setState(179);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                    if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                        {
                            setState(178);
                            expression(0);
                        }
                    }

                    setState(181);
                    match(T__4);
                }
                break;
                case Break:
                    _localctx = new BreakStmtContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(182);
                    match(Break);
                    setState(183);
                    match(T__4);
                }
                break;
                case Continue:
                    _localctx = new ContinueStmtContext(_localctx);
                    enterOuterAlt(_localctx, 3);
                {
                    setState(184);
                    match(Continue);
                    setState(185);
                    match(T__4);
                }
                break;
                default:
                    throw new NoViableAltException(this);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ExpressionContext expression() throws RecognitionException {
        return expression(0);
    }

    private ExpressionContext expression(int _p) throws RecognitionException {
        ParserRuleContext _parentctx = _ctx;
        int _parentState = getState();
        ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
        ExpressionContext _prevctx = _localctx;
        int _startState = 34;
        enterRecursionRule(_localctx, 34, RULE_expression, _p);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
                setState(204);
                _errHandler.sync(this);
                switch (_input.LA(1)) {
                    case New: {
                        _localctx = new NewExprContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;

                        setState(189);
                        match(New);
                        setState(190);
                        creator();
                    }
                    break;
                    case T__9:
                    case T__10: {
                        _localctx = new UnaryExprContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(191);
                        ((UnaryExprContext) _localctx).op = _input.LT(1);
                        _la = _input.LA(1);
                        if (!(_la == T__9 || _la == T__10)) {
                            ((UnaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                        } else {
                            if (_input.LA(1) == Token.EOF) matchedEOF = true;
                            _errHandler.reportMatch(this);
                            consume();
                        }
                        setState(192);
                        expression(19);
                    }
                    break;
                    case T__12:
                    case T__13: {
                        _localctx = new UnaryExprContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(193);
                        ((UnaryExprContext) _localctx).op = _input.LT(1);
                        _la = _input.LA(1);
                        if (!(_la == T__12 || _la == T__13)) {
                            ((UnaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                        } else {
                            if (_input.LA(1) == Token.EOF) matchedEOF = true;
                            _errHandler.reportMatch(this);
                            consume();
                        }
                        setState(194);
                        expression(18);
                    }
                    break;
                    case T__14:
                    case T__15: {
                        _localctx = new UnaryExprContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(195);
                        ((UnaryExprContext) _localctx).op = _input.LT(1);
                        _la = _input.LA(1);
                        if (!(_la == T__14 || _la == T__15)) {
                            ((UnaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                        } else {
                            if (_input.LA(1) == Token.EOF) matchedEOF = true;
                            _errHandler.reportMatch(this);
                            consume();
                        }
                        setState(196);
                        expression(17);
                    }
                    break;
                    case Identifier: {
                        _localctx = new IdentifierContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(197);
                        match(Identifier);
                    }
                    break;
                    case This: {
                        _localctx = new ThisExprContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(198);
                        match(This);
                    }
                    break;
                    case IntegerConstant:
                    case StringConstant:
                    case NullLiteral:
                    case BoolConstant: {
                        _localctx = new LiteralContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(199);
                        constant();
                    }
                    break;
                    case T__0: {
                        _localctx = new SubExpressionContext(_localctx);
                        _ctx = _localctx;
                        _prevctx = _localctx;
                        setState(200);
                        match(T__0);
                        setState(201);
                        expression(0);
                        setState(202);
                        match(T__1);
                    }
                    break;
                    default:
                        throw new NoViableAltException(this);
                }
                _ctx.stop = _input.LT(-1);
                setState(260);
                _errHandler.sync(this);
                _alt = getInterpreter().adaptivePredict(_input, 24, _ctx);
                while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER) {
                    if (_alt == 1) {
                        if (_parseListeners != null) triggerExitRuleEvent();
                        _prevctx = _localctx;
                        {
                            setState(258);
                            _errHandler.sync(this);
                            switch (getInterpreter().adaptivePredict(_input, 23, _ctx)) {
                                case 1: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(206);
                                    if (!(precpred(_ctx, 16)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 16)");
                                    setState(207);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__16) | (1L << T__17) | (1L << T__18))) != 0))) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(208);
                                    ((BinaryExprContext) _localctx).rhs = expression(17);
                                }
                                break;
                                case 2: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(209);
                                    if (!(precpred(_ctx, 15)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 15)");
                                    setState(210);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__12 || _la == T__13)) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(211);
                                    ((BinaryExprContext) _localctx).rhs = expression(16);
                                }
                                break;
                                case 3: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(212);
                                    if (!(precpred(_ctx, 14)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 14)");
                                    setState(213);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__19 || _la == T__20)) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(214);
                                    ((BinaryExprContext) _localctx).rhs = expression(15);
                                }
                                break;
                                case 4: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(215);
                                    if (!(precpred(_ctx, 13)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 13)");
                                    setState(216);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__21 || _la == T__22)) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(217);
                                    ((BinaryExprContext) _localctx).rhs = expression(14);
                                }
                                break;
                                case 5: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(218);
                                    if (!(precpred(_ctx, 12)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 12)");
                                    setState(219);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__23 || _la == T__24)) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(220);
                                    ((BinaryExprContext) _localctx).rhs = expression(13);
                                }
                                break;
                                case 6: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(221);
                                    if (!(precpred(_ctx, 11)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 11)");
                                    setState(222);
                                    ((BinaryExprContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__25 || _la == T__26)) {
                                        ((BinaryExprContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                    setState(223);
                                    ((BinaryExprContext) _localctx).rhs = expression(12);
                                }
                                break;
                                case 7: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(224);
                                    if (!(precpred(_ctx, 10)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 10)");
                                    setState(225);
                                    ((BinaryExprContext) _localctx).op = match(T__27);
                                    setState(226);
                                    ((BinaryExprContext) _localctx).rhs = expression(11);
                                }
                                break;
                                case 8: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(227);
                                    if (!(precpred(_ctx, 9)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 9)");
                                    setState(228);
                                    ((BinaryExprContext) _localctx).op = match(T__28);
                                    setState(229);
                                    ((BinaryExprContext) _localctx).rhs = expression(10);
                                }
                                break;
                                case 9: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(230);
                                    if (!(precpred(_ctx, 8)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 8)");
                                    setState(231);
                                    ((BinaryExprContext) _localctx).op = match(T__29);
                                    setState(232);
                                    ((BinaryExprContext) _localctx).rhs = expression(9);
                                }
                                break;
                                case 10: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(233);
                                    if (!(precpred(_ctx, 7)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 7)");
                                    setState(234);
                                    ((BinaryExprContext) _localctx).op = match(T__30);
                                    setState(235);
                                    ((BinaryExprContext) _localctx).rhs = expression(8);
                                }
                                break;
                                case 11: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(236);
                                    if (!(precpred(_ctx, 6)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 6)");
                                    setState(237);
                                    ((BinaryExprContext) _localctx).op = match(T__31);
                                    setState(238);
                                    ((BinaryExprContext) _localctx).rhs = expression(7);
                                }
                                break;
                                case 12: {
                                    _localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
                                    ((BinaryExprContext) _localctx).lhs = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(239);
                                    if (!(precpred(_ctx, 5)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 5)");
                                    setState(240);
                                    ((BinaryExprContext) _localctx).op = match(T__6);
                                    setState(241);
                                    ((BinaryExprContext) _localctx).rhs = expression(5);
                                }
                                break;
                                case 13: {
                                    _localctx = new PostfixIncDecContext(new ExpressionContext(_parentctx, _parentState));
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(242);
                                    if (!(precpred(_ctx, 24)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 24)");
                                    setState(243);
                                    ((PostfixIncDecContext) _localctx).op = _input.LT(1);
                                    _la = _input.LA(1);
                                    if (!(_la == T__9 || _la == T__10)) {
                                        ((PostfixIncDecContext) _localctx).op = (Token) _errHandler.recoverInline(this);
                                    } else {
                                        if (_input.LA(1) == Token.EOF) matchedEOF = true;
                                        _errHandler.reportMatch(this);
                                        consume();
                                    }
                                }
                                break;
                                case 14: {
                                    _localctx = new FunctionCallContext(new ExpressionContext(_parentctx, _parentState));
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(244);
                                    if (!(precpred(_ctx, 22)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 22)");
                                    setState(245);
                                    match(T__0);
                                    setState(247);
                                    _errHandler.sync(this);
                                    _la = _input.LA(1);
                                    if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__9) | (1L << T__10) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << New) | (1L << This) | (1L << IntegerConstant) | (1L << StringConstant) | (1L << NullLiteral) | (1L << BoolConstant) | (1L << Identifier))) != 0)) {
                                        {
                                            setState(246);
                                            parameterList();
                                        }
                                    }

                                    setState(249);
                                    match(T__1);
                                }
                                break;
                                case 15: {
                                    _localctx = new SubscriptContext(new ExpressionContext(_parentctx, _parentState));
                                    ((SubscriptContext) _localctx).array = _prevctx;
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(250);
                                    if (!(precpred(_ctx, 21)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 21)");
                                    setState(251);
                                    match(T__7);
                                    setState(252);
                                    ((SubscriptContext) _localctx).index = expression(0);
                                    setState(253);
                                    match(T__8);
                                }
                                break;
                                case 16: {
                                    _localctx = new MemberAccessContext(new ExpressionContext(_parentctx, _parentState));
                                    pushNewRecursionContext(_localctx, _startState, RULE_expression);
                                    setState(255);
                                    if (!(precpred(_ctx, 20)))
                                        throw new FailedPredicateException(this, "precpred(_ctx, 20)");
                                    setState(256);
                                    match(T__11);
                                    setState(257);
                                    match(Identifier);
                                }
                                break;
                            }
                        }
                    }
                    setState(262);
                    _errHandler.sync(this);
                    _alt = getInterpreter().adaptivePredict(_input, 24, _ctx);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            unrollRecursionContexts(_parentctx);
        }
        return _localctx;
    }

    public final ParameterListContext parameterList() throws RecognitionException {
        ParameterListContext _localctx = new ParameterListContext(_ctx, getState());
        enterRule(_localctx, 36, RULE_parameterList);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
                setState(263);
                expression(0);
                setState(268);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while (_la == T__5) {
                    {
                        {
                            setState(264);
                            match(T__5);
                            setState(265);
                            expression(0);
                        }
                    }
                    setState(270);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final CreatorContext creator() throws RecognitionException {
        CreatorContext _localctx = new CreatorContext(_ctx, getState());
        enterRule(_localctx, 38, RULE_creator);
        try {
            int _alt;
            setState(315);
            _errHandler.sync(this);
            switch (getInterpreter().adaptivePredict(_input, 31, _ctx)) {
                case 1:
                    _localctx = new ErrorCreatorContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(271);
                    nonArrayType();
                    setState(276);
                    _errHandler.sync(this);
                    _alt = 1;
                    do {
                        switch (_alt) {
                            case 1: {
                                {
                                    setState(272);
                                    match(T__7);
                                    setState(273);
                                    expression(0);
                                    setState(274);
                                    match(T__8);
                                }
                            }
                            break;
                            default:
                                throw new NoViableAltException(this);
                        }
                        setState(278);
                        _errHandler.sync(this);
                        _alt = getInterpreter().adaptivePredict(_input, 26, _ctx);
                    } while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER);
                    setState(282);
                    _errHandler.sync(this);
                    _alt = 1;
                    do {
                        switch (_alt) {
                            case 1: {
                                {
                                    setState(280);
                                    match(T__7);
                                    setState(281);
                                    match(T__8);
                                }
                            }
                            break;
                            default:
                                throw new NoViableAltException(this);
                        }
                        setState(284);
                        _errHandler.sync(this);
                        _alt = getInterpreter().adaptivePredict(_input, 27, _ctx);
                    } while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER);
                    setState(290);
                    _errHandler.sync(this);
                    _alt = 1;
                    do {
                        switch (_alt) {
                            case 1: {
                                {
                                    setState(286);
                                    match(T__7);
                                    setState(287);
                                    expression(0);
                                    setState(288);
                                    match(T__8);
                                }
                            }
                            break;
                            default:
                                throw new NoViableAltException(this);
                        }
                        setState(292);
                        _errHandler.sync(this);
                        _alt = getInterpreter().adaptivePredict(_input, 28, _ctx);
                    } while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER);
                }
                break;
                case 2:
                    _localctx = new ArrayCreatorContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(294);
                    nonArrayType();
                    setState(299);
                    _errHandler.sync(this);
                    _alt = 1;
                    do {
                        switch (_alt) {
                            case 1: {
                                {
                                    setState(295);
                                    match(T__7);
                                    setState(296);
                                    expression(0);
                                    setState(297);
                                    match(T__8);
                                }
                            }
                            break;
                            default:
                                throw new NoViableAltException(this);
                        }
                        setState(301);
                        _errHandler.sync(this);
                        _alt = getInterpreter().adaptivePredict(_input, 29, _ctx);
                    } while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER);
                    setState(307);
                    _errHandler.sync(this);
                    _alt = getInterpreter().adaptivePredict(_input, 30, _ctx);
                    while (_alt != 2 && _alt != org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER) {
                        if (_alt == 1) {
                            {
                                {
                                    setState(303);
                                    match(T__7);
                                    setState(304);
                                    match(T__8);
                                }
                            }
                        }
                        setState(309);
                        _errHandler.sync(this);
                        _alt = getInterpreter().adaptivePredict(_input, 30, _ctx);
                    }
                }
                break;
                case 3:
                    _localctx = new ClassCreatorContext(_localctx);
                    enterOuterAlt(_localctx, 3);
                {
                    setState(310);
                    nonArrayType();
                    setState(311);
                    match(T__0);
                    setState(312);
                    match(T__1);
                }
                break;
                case 4:
                    _localctx = new NarrayCreatorContext(_localctx);
                    enterOuterAlt(_localctx, 4);
                {
                    setState(314);
                    nonArrayType();
                }
                break;
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public final ConstantContext constant() throws RecognitionException {
        ConstantContext _localctx = new ConstantContext(_ctx, getState());
        enterRule(_localctx, 40, RULE_constant);
        try {
            setState(321);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
                case IntegerConstant:
                    _localctx = new IntegerLiteralContext(_localctx);
                    enterOuterAlt(_localctx, 1);
                {
                    setState(317);
                    match(IntegerConstant);
                }
                break;
                case StringConstant:
                    _localctx = new StringLiteralContext(_localctx);
                    enterOuterAlt(_localctx, 2);
                {
                    setState(318);
                    match(StringConstant);
                }
                break;
                case NullLiteral:
                    _localctx = new NullLiteralContext(_localctx);
                    enterOuterAlt(_localctx, 3);
                {
                    setState(319);
                    match(NullLiteral);
                }
                break;
                case BoolConstant:
                    _localctx = new BoolLiteralContext(_localctx);
                    enterOuterAlt(_localctx, 4);
                {
                    setState(320);
                    match(BoolConstant);
                }
                break;
                default:
                    throw new NoViableAltException(this);
            }
        } catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        } finally {
            exitRule();
        }
        return _localctx;
    }

    public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
        switch (ruleIndex) {
            case 9:
                return type_sempred((TypeContext) _localctx, predIndex);
            case 17:
                return expression_sempred((ExpressionContext) _localctx, predIndex);
        }
        return true;
    }

    private boolean type_sempred(TypeContext _localctx, int predIndex) {
        switch (predIndex) {
            case 0:
                return precpred(_ctx, 2);
        }
        return true;
    }

    private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
        switch (predIndex) {
            case 1:
                return precpred(_ctx, 16);
            case 2:
                return precpred(_ctx, 15);
            case 3:
                return precpred(_ctx, 14);
            case 4:
                return precpred(_ctx, 13);
            case 5:
                return precpred(_ctx, 12);
            case 6:
                return precpred(_ctx, 11);
            case 7:
                return precpred(_ctx, 10);
            case 8:
                return precpred(_ctx, 9);
            case 9:
                return precpred(_ctx, 8);
            case 10:
                return precpred(_ctx, 7);
            case 11:
                return precpred(_ctx, 6);
            case 12:
                return precpred(_ctx, 5);
            case 13:
                return precpred(_ctx, 24);
            case 14:
                return precpred(_ctx, 22);
            case 15:
                return precpred(_ctx, 21);
            case 16:
                return precpred(_ctx, 20);
        }
        return true;
    }

    public static class ProgramContext extends ParserRuleContext {
        public ProgramContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public List<ProgramSectionContext> programSection() {
            return getRuleContexts(ProgramSectionContext.class);
        }

        public ProgramSectionContext programSection(int i) {
            return getRuleContext(ProgramSectionContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_program;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitProgram(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ProgramSectionContext extends ParserRuleContext {
        public ProgramSectionContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public FunctionDeclContext functionDecl() {
            return getRuleContext(FunctionDeclContext.class, 0);
        }

        public ClassDeclContext classDecl() {
            return getRuleContext(ClassDeclContext.class, 0);
        }

        public VariableDeclContext variableDecl() {
            return getRuleContext(VariableDeclContext.class, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_programSection;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitProgramSection(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class FunctionDeclContext extends ParserRuleContext {
        public FunctionDeclContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        public BlockContext block() {
            return getRuleContext(BlockContext.class, 0);
        }

        public TypeForFuncContext typeForFunc() {
            return getRuleContext(TypeForFuncContext.class, 0);
        }

        public ParameterDeclarationListContext parameterDeclarationList() {
            return getRuleContext(ParameterDeclarationListContext.class, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_functionDecl;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitFunctionDecl(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ClassDeclContext extends ParserRuleContext {
        public ClassDeclContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TerminalNode Class() {
            return getToken(MxstarParser.Class, 0);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        public List<FunctionDeclContext> functionDecl() {
            return getRuleContexts(FunctionDeclContext.class);
        }

        public FunctionDeclContext functionDecl(int i) {
            return getRuleContext(FunctionDeclContext.class, i);
        }

        public List<VariableDeclContext> variableDecl() {
            return getRuleContexts(VariableDeclContext.class);
        }

        public VariableDeclContext variableDecl(int i) {
            return getRuleContext(VariableDeclContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_classDecl;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitClassDecl(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class VariableDeclContext extends ParserRuleContext {
        public VariableDeclContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TypeContext type() {
            return getRuleContext(TypeContext.class, 0);
        }

        public VariableListContext variableList() {
            return getRuleContext(VariableListContext.class, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_variableDecl;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitVariableDecl(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class VariableListContext extends ParserRuleContext {
        public VariableListContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public List<SingleVariableDeclContext> singleVariableDecl() {
            return getRuleContexts(SingleVariableDeclContext.class);
        }

        public SingleVariableDeclContext singleVariableDecl(int i) {
            return getRuleContext(SingleVariableDeclContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_variableList;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitVariableList(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class SingleVariableDeclContext extends ParserRuleContext {
        public SingleVariableDeclContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_singleVariableDecl;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitSingleVariableDecl(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ParameterDeclarationListContext extends ParserRuleContext {
        public ParameterDeclarationListContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public List<ParameterDeclarationContext> parameterDeclaration() {
            return getRuleContexts(ParameterDeclarationContext.class);
        }

        public ParameterDeclarationContext parameterDeclaration(int i) {
            return getRuleContext(ParameterDeclarationContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_parameterDeclarationList;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitParameterDeclarationList(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ParameterDeclarationContext extends ParserRuleContext {
        public ParameterDeclarationContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TypeContext type() {
            return getRuleContext(TypeContext.class, 0);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_parameterDeclaration;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitParameterDeclaration(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class TypeContext extends ParserRuleContext {
        public TypeContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TypeContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_type;
        }

        public void copyFrom(TypeContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class ArrayTypeContext extends TypeContext {
        public ArrayTypeContext(TypeContext ctx) {
            copyFrom(ctx);
        }

        public TypeContext type() {
            return getRuleContext(TypeContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitArrayType(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NarrayTypeContext extends TypeContext {
        public NarrayTypeContext(TypeContext ctx) {
            copyFrom(ctx);
        }

        public NonArrayTypeContext nonArrayType() {
            return getRuleContext(NonArrayTypeContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitNarrayType(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class TypeForFuncContext extends ParserRuleContext {
        public TypeForFuncContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TypeContext type() {
            return getRuleContext(TypeContext.class, 0);
        }

        public TerminalNode Void() {
            return getToken(MxstarParser.Void, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_typeForFunc;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitTypeForFunc(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NonArrayTypeContext extends ParserRuleContext {
        public NonArrayTypeContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public NonArrayTypeContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_nonArrayType;
        }

        public void copyFrom(NonArrayTypeContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class NarrayTypeIntContext extends NonArrayTypeContext {
        public NarrayTypeIntContext(NonArrayTypeContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Int() {
            return getToken(MxstarParser.Int, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitNarrayTypeInt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NarrayTypeBoolContext extends NonArrayTypeContext {
        public NarrayTypeBoolContext(NonArrayTypeContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Bool() {
            return getToken(MxstarParser.Bool, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitNarrayTypeBool(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NarrayTypeStringContext extends NonArrayTypeContext {
        public NarrayTypeStringContext(NonArrayTypeContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode String() {
            return getToken(MxstarParser.String, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitNarrayTypeString(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NarrayTypeIdentifierContext extends NonArrayTypeContext {
        public NarrayTypeIdentifierContext(NonArrayTypeContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitNarrayTypeIdentifier(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class StatementContext extends ParserRuleContext {
        public StatementContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public StatementContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_statement;
        }

        public void copyFrom(StatementContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class JumpStmtContext extends StatementContext {
        public JumpStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public JumpStatementContext jumpStatement() {
            return getRuleContext(JumpStatementContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitJumpStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ExprStmtContext extends StatementContext {
        public ExprStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitExprStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class LoopStmtContext extends StatementContext {
        public LoopStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public LoopStatementContext loopStatement() {
            return getRuleContext(LoopStatementContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitLoopStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class BlankStmtContext extends StatementContext {
        public BlankStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBlankStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class BlockStmtContext extends StatementContext {
        public BlockStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public BlockContext block() {
            return getRuleContext(BlockContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBlockStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ConditionStmtContext extends StatementContext {
        public ConditionStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public ConditionStatementContext conditionStatement() {
            return getRuleContext(ConditionStatementContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitConditionStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class VarDeclStmtContext extends StatementContext {
        public VarDeclStmtContext(StatementContext ctx) {
            copyFrom(ctx);
        }

        public VariableDeclContext variableDecl() {
            return getRuleContext(VariableDeclContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitVarDeclStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class BlockContext extends ParserRuleContext {
        public BlockContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public List<StatementContext> statement() {
            return getRuleContexts(StatementContext.class);
        }

        public StatementContext statement(int i) {
            return getRuleContext(StatementContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_block;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBlock(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ConditionStatementContext extends ParserRuleContext {
        public StatementContext thenStmt;
        public StatementContext elseStmt;

        public ConditionStatementContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public TerminalNode If() {
            return getToken(MxstarParser.If, 0);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        public List<StatementContext> statement() {
            return getRuleContexts(StatementContext.class);
        }

        public StatementContext statement(int i) {
            return getRuleContext(StatementContext.class, i);
        }

        public TerminalNode Else() {
            return getToken(MxstarParser.Else, 0);
        }

        @Override
        public int getRuleIndex() {
            return RULE_conditionStatement;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitConditionStatement(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class LoopStatementContext extends ParserRuleContext {
        public LoopStatementContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public LoopStatementContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_loopStatement;
        }

        public void copyFrom(LoopStatementContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class ForStmtContext extends LoopStatementContext {
        public ExpressionContext init;
        public ExpressionContext cond;
        public ExpressionContext step;

        public ForStmtContext(LoopStatementContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode For() {
            return getToken(MxstarParser.For, 0);
        }

        public StatementContext statement() {
            return getRuleContext(StatementContext.class, 0);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitForStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class WhileStmtContext extends LoopStatementContext {
        public WhileStmtContext(LoopStatementContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode While() {
            return getToken(MxstarParser.While, 0);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        public StatementContext statement() {
            return getRuleContext(StatementContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitWhileStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class JumpStatementContext extends ParserRuleContext {
        public JumpStatementContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public JumpStatementContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_jumpStatement;
        }

        public void copyFrom(JumpStatementContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class BreakStmtContext extends JumpStatementContext {
        public BreakStmtContext(JumpStatementContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Break() {
            return getToken(MxstarParser.Break, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBreakStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ReturnStmtContext extends JumpStatementContext {
        public ReturnStmtContext(JumpStatementContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Return() {
            return getToken(MxstarParser.Return, 0);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitReturnStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ContinueStmtContext extends JumpStatementContext {
        public ContinueStmtContext(JumpStatementContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Continue() {
            return getToken(MxstarParser.Continue, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitContinueStmt(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ExpressionContext extends ParserRuleContext {
        public ExpressionContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public ExpressionContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_expression;
        }

        public void copyFrom(ExpressionContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class IdentifierContext extends ExpressionContext {
        public IdentifierContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitIdentifier(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class MemberAccessContext extends ExpressionContext {
        public MemberAccessContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        public TerminalNode Identifier() {
            return getToken(MxstarParser.Identifier, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitMemberAccess(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class LiteralContext extends ExpressionContext {
        public LiteralContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ConstantContext constant() {
            return getRuleContext(ConstantContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitLiteral(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class BinaryExprContext extends ExpressionContext {
        public ExpressionContext lhs;
        public Token op;
        public ExpressionContext rhs;

        public BinaryExprContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBinaryExpr(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NewExprContext extends ExpressionContext {
        public NewExprContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public CreatorContext creator() {
            return getRuleContext(CreatorContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitNewExpr(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class SubscriptContext extends ExpressionContext {
        public ExpressionContext array;
        public ExpressionContext index;

        public SubscriptContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitSubscript(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class FunctionCallContext extends ExpressionContext {
        public FunctionCallContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        public ParameterListContext parameterList() {
            return getRuleContext(ParameterListContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitFunctionCall(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class PostfixIncDecContext extends ExpressionContext {
        public Token op;

        public PostfixIncDecContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitPostfixIncDec(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class UnaryExprContext extends ExpressionContext {
        public Token op;

        public UnaryExprContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitUnaryExpr(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class SubExpressionContext extends ExpressionContext {
        public SubExpressionContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public ExpressionContext expression() {
            return getRuleContext(ExpressionContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitSubExpression(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ThisExprContext extends ExpressionContext {
        public ThisExprContext(ExpressionContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode This() {
            return getToken(MxstarParser.This, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitThisExpr(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ParameterListContext extends ParserRuleContext {
        public ParameterListContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public int getRuleIndex() {
            return RULE_parameterList;
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitParameterList(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class CreatorContext extends ParserRuleContext {
        public CreatorContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public CreatorContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_creator;
        }

        public void copyFrom(CreatorContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class ClassCreatorContext extends CreatorContext {
        public ClassCreatorContext(CreatorContext ctx) {
            copyFrom(ctx);
        }

        public NonArrayTypeContext nonArrayType() {
            return getRuleContext(NonArrayTypeContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitClassCreator(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class NarrayCreatorContext extends CreatorContext {
        public NarrayCreatorContext(CreatorContext ctx) {
            copyFrom(ctx);
        }

        public NonArrayTypeContext nonArrayType() {
            return getRuleContext(NonArrayTypeContext.class, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitNarrayCreator(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ArrayCreatorContext extends CreatorContext {
        public ArrayCreatorContext(CreatorContext ctx) {
            copyFrom(ctx);
        }

        public NonArrayTypeContext nonArrayType() {
            return getRuleContext(NonArrayTypeContext.class, 0);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitArrayCreator(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ErrorCreatorContext extends CreatorContext {
        public ErrorCreatorContext(CreatorContext ctx) {
            copyFrom(ctx);
        }

        public NonArrayTypeContext nonArrayType() {
            return getRuleContext(NonArrayTypeContext.class, 0);
        }

        public List<ExpressionContext> expression() {
            return getRuleContexts(ExpressionContext.class);
        }

        public ExpressionContext expression(int i) {
            return getRuleContext(ExpressionContext.class, i);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitErrorCreator(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class ConstantContext extends ParserRuleContext {
        public ConstantContext(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }

        public ConstantContext() {
        }

        @Override
        public int getRuleIndex() {
            return RULE_constant;
        }

        public void copyFrom(ConstantContext ctx) {
            super.copyFrom(ctx);
        }
    }

    public static class NullLiteralContext extends ConstantContext {
        public NullLiteralContext(ConstantContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode NullLiteral() {
            return getToken(MxstarParser.NullLiteral, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitNullLiteral(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class StringLiteralContext extends ConstantContext {
        public StringLiteralContext(ConstantContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode StringConstant() {
            return getToken(MxstarParser.StringConstant, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitStringLiteral(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class IntegerLiteralContext extends ConstantContext {
        public IntegerLiteralContext(ConstantContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode IntegerConstant() {
            return getToken(MxstarParser.IntegerConstant, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor)
                return ((MxstarVisitor<? extends T>) visitor).visitIntegerLiteral(this);
            else return visitor.visitChildren(this);
        }
    }

    public static class BoolLiteralContext extends ConstantContext {
        public BoolLiteralContext(ConstantContext ctx) {
            copyFrom(ctx);
        }

        public TerminalNode BoolConstant() {
            return getToken(MxstarParser.BoolConstant, 0);
        }

        @Override
        public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
            if (visitor instanceof MxstarVisitor) return ((MxstarVisitor<? extends T>) visitor).visitBoolLiteral(this);
            else return visitor.visitChildren(this);
        }
    }
}
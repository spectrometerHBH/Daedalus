package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Frontend.*;
import Compiler.Parser.MxstarErrorListener;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;
import Compiler.Symbol.ClassSymbol;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.PrimitiveTypeSymbol;
import Compiler.Utils.Position;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

public class Main {
    private static ProgramNode buildAST(InputStream in) throws Exception {
        MxstarParser parser = new MxstarParser(new CommonTokenStream(new MxstarLexer(CharStreams.fromStream(in))));
        parser.removeErrorListeners();
        parser.addErrorListener(new MxstarErrorListener());
        ParseTree tree = parser.program();
        System.out.println(tree.toStringTree(parser));
        ASTBuilder astBuilder = new ASTBuilder();
        return (ProgramNode) astBuilder.visit(tree);
    }

    public static void main(String... args) throws Exception {
        InputStream in = new FileInputStream("test.txt");
        try {
            //Parser & Lexer
            ProgramNode ast = buildAST(in);
            //Semantic Analysis
            GlobalScope globalScope = (new BuiltinSymbolsInitializer()).getGlobalScope();
            new ClassDeclarationScanner(globalScope).visit(ast);
            new GlobalFunctionDeclarationScanner(globalScope).visit(ast);
            new ClassMemberScanner(globalScope).visit(ast);
            new SymbolTableBuilder(globalScope).visit(ast);
            new SemanticChecker(globalScope,
                    (PrimitiveTypeSymbol) globalScope.resolveType("int",  new Position(0, 0)),
                    (PrimitiveTypeSymbol) globalScope.resolveType("bool", new Position(0, 0)),
                    (ClassSymbol)         globalScope.resolveType("string", new Position(0, 0)),
                    (PrimitiveTypeSymbol) globalScope.resolveType("void", new Position(0, 0))).visit(ast);
            //IR transform

            //Control Flow Analysis

            //Data Flow Analysis
        }catch (Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
            throw new RuntimeException();
        }
    }
}
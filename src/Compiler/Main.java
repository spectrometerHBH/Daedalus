package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Frontend.ASTBuilder;
import Compiler.Frontend.BuiltinSymbolsInitializer;
import Compiler.Frontend.ClassDeclarationScanner;
import Compiler.Parser.MxstarErrorListener;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;
import Compiler.Symbol.GlobalScope;
import Compiler.Utils.SyntaxError;
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
        //System.out.println(tree.toStringTree(parser));
        ASTBuilder astBuilder = new ASTBuilder();
        return (ProgramNode) astBuilder.visit(tree);
    }

    public static void main(String... args) throws Exception {
        InputStream in = new FileInputStream("test.txt");
        try {
            ProgramNode ast = buildAST(in);
            GlobalScope globalScope = (new BuiltinSymbolsInitializer()).getGlobalScope();
            new ClassDeclarationScanner(globalScope).visit(ast);
        }catch (SyntaxError e){
            System.out.println(e.getMessage());
        }
    }
}
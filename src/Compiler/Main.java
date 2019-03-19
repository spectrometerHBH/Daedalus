package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Backend.IRBuilder;
import Compiler.Backend.IRPrinter;
import Compiler.Frontend.*;
import Compiler.IR.IRRoot;
import Compiler.Parser.MxstarErrorListener;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;
import Compiler.Symbol.GlobalScope;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;

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
        //for program to be compiled
        InputStream in = new FileInputStream("test.txt");
        //for text-ir output
        //PrintStream ir_out = new PrintStream(System.out);
        PrintStream ir_out = new PrintStream("ir_out.txt");
        //for IR interpreter test use
        FileInputStream ir_test_in = new FileInputStream("ir_out.txt");
        DataInputStream ir_data_in = new DataInputStream(System.in);
        PrintStream ir_data_out = new PrintStream(new FileOutputStream("ir_test_out.txt"));

        try {
            //Parser & Lexer
            ProgramNode ast = buildAST(in);

            //Semantic Analysis
            GlobalScope globalScope = (new BuiltinSymbolsInitializer(ast)).getGlobalScope();
            new ClassDeclarationScanner(globalScope).visit(ast);
            new GlobalFunctionDeclarationScanner(globalScope).visit(ast);
            new ClassMemberScanner(globalScope).visit(ast);
            new SymbolTableBuilder(globalScope).visit(ast);
            new SemanticChecker(globalScope).visit(ast);

            //IR Construction(Explicit CFG with Quad & Explicit Variables without SSA form)
            IRBuilder irBuilder = new IRBuilder(globalScope);
            irBuilder.visit(ast);
            IRRoot irRoot = irBuilder.getIrRoot();

            //IR test
            new IRPrinter(ir_out).visit(irRoot);
            //new IRInterpreter(ir_test_in, false, ir_data_in, ir_data_out).run();

            //Codegen


        }catch (Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
            throw new RuntimeException();
        }
    }
}
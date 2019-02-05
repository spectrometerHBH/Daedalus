package Compiler;

import java.io.*;

import Compiler.Parser.MxstarErrorListener;
import Compiler.Utils.SyntaxError;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;

import Compiler.AST.*;
import Compiler.Frontend.ASTBuilder;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;

public class Main {

    private static void buildAST(InputStream in) throws Exception {
        MxstarParser parser = new MxstarParser(new CommonTokenStream(new MxstarLexer(new ANTLRInputStream(in))));
        parser.removeErrorListeners();
        parser.addErrorListener(new MxstarErrorListener());
        ParseTree tree = parser.program();
        //System.out.println(tree.toStringTree());
        ASTBuilder astBuilder = new ASTBuilder();
        ProgramNode ast = (ProgramNode) astBuilder.visit(tree);
    }

    public static void main(String args[]) throws Exception {
        InputStream in = new FileInputStream("test.txt");
        try {
            buildAST(in);
        }catch (SyntaxError e){
            System.out.println(e.getMessage());
        }
    }
}
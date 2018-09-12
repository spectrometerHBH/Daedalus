package Compiler;

import java.io.*;

import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;

public class Main{

    private static void buildAST(InputStream in) throws IOException {
        MxstarParser parser =
                new MxstarParser(
                    new CommonTokenStream(
                            new MxstarLexer(
                                new ANTLRInputStream(in))));
        ParseTree tree = parser.program();
        System.out.println(tree.toStringTree(parser));
    }

    public static void main(String args[]) throws IOException {
        InputStream in = new FileInputStream("test.txt");
        buildAST(in);
    }
}
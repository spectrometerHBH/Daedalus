package Compiler;

import Compiler.AST.ProgramNode;
import Compiler.Backend.*;
import Compiler.Frontend.*;
import Compiler.IR.IRRoot;
import Compiler.Optim.Optimizer;
import Compiler.Parser.MxstarErrorListener;
import Compiler.Parser.MxstarLexer;
import Compiler.Parser.MxstarParser;
import Compiler.Symbol.GlobalScope;
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
        ASTBuilder astBuilder = new ASTBuilder();
        return (ProgramNode) astBuilder.visit(tree);
    }

    public static void main(String... args) throws Exception {
        //for program to be compiled
        InputStream in = new FileInputStream("test.txt");

        try {
            //Syntax Analysis
            ProgramNode ast = buildAST(in);

            //Semantic Analysis
            GlobalScope globalScope = (new BuiltinSymbolsInitializer(ast)).getGlobalScope();
            new ClassDeclarationScanner(globalScope).visit(ast);
            new GlobalFunctionDeclarationScanner(globalScope).visit(ast);
            new ClassMemberScanner(globalScope).visit(ast);
            new SymbolTableBuilder(globalScope).visit(ast);
            new SemanticChecker(globalScope).visit(ast);

            //HIR optimization
            new BoolExpressionTransformer().visit(ast);
            new SideEffectSolver(globalScope).visit(ast);
            new OutputIrrelevantCodeEliminator(globalScope).visit(ast);

            //LIR Construction (Explicit CFG with Quad & Explicit Variables without SSA form )
            IRBuilder irBuilder = new IRBuilder(globalScope);
            irBuilder.visit(ast);
            IRRoot irRoot = irBuilder.getIrRoot();
            new FunctionInliner(irRoot).run();
            new MemorizationSeeker(irRoot).run();
            new GlobalVariableResolver(irRoot).run();

            //LIR Optimization based on SSA
            Optimizer optimizer = new Optimizer(irRoot);
            optimizer.CFGSimplification();
            optimizer.SSAConstruction();
            for (boolean changed = true; changed; ) {
                changed = optimizer.CommonSubexpressionElimination();
                changed |= optimizer.ConstantAndCopyPropagation();
                changed |= optimizer.CFGSimplification();
                changed |= optimizer.DeadCodeElimination();
                changed |= optimizer.CFGSimplification();
            }
            optimizer.InstructionCombination();
            optimizer.SSADestruction();
            optimizer.CFGSimplification(true);

            //Codegen
            optimizer.ArithmeticTransformation();
            new X86ConstraintResolver(irRoot).run();
            optimizer.SpillPriorityCalculation();
            new RegisterAllocator(irRoot).run();
            optimizer.CFGSimplification(true);
            new X86CodeEmitter(irRoot, System.out).run();

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            throw new RuntimeException();
        }
    }
}
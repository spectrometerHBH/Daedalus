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

import java.io.*;

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

        //compile config
        boolean test_ir = false;
        boolean test_nasm = true;
        boolean DEBUG_IR = false;

        //for text-ir output
        PrintStream ir_out_raw = new PrintStream("ir_raw.ll");
        PrintStream ir_out_after_inline = new PrintStream("ir_after_inlining.ll");
        PrintStream ir_out_after_memorize = new PrintStream("ir_after_memorization.ll");
        PrintStream ir_out_after_globalVariableResolve = new PrintStream("ir_after_gvResolve.ll");
        PrintStream ir_out_afterSSAConstruction = new PrintStream("ir_out_ssa_construct.ll");
        PrintStream ir_out_afterOptimization = new PrintStream("ir_out_after_optim.ll");
        PrintStream ir_out_afterX86Transform = new PrintStream("ir_out_after_X86.ll");
        PrintStream ir_codegen_without_color = new PrintStream("ir_out_after_codegen_no_color.ll");
        PrintStream ir_codegen = test_ir ? new PrintStream(System.out) : new PrintStream("ir_out_after_codegen.ll");
        PrintStream nasm = test_nasm ? new PrintStream(System.out) : new PrintStream("out.asm");

        //for IR interpreter test use
        FileInputStream ir_test_in = new FileInputStream("ir_raw.ll");
        DataInputStream ir_data_in = new DataInputStream(System.in);
        PrintStream ir_data_out = new PrintStream(new FileOutputStream("ir_test_out.txt"));

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
            if (DEBUG_IR) new IRPrinter(ir_out_raw).visit(irRoot);
            new FunctionInliner(irRoot).run();
            if (DEBUG_IR) new IRPrinter(ir_out_after_inline).visit(irRoot);
            new MemorizationSeeker(irRoot).run();
            if (DEBUG_IR) new IRPrinter(ir_out_after_memorize).visit(irRoot);
            new GlobalVariableResolver(irRoot).run();
            if (DEBUG_IR) new IRPrinter(ir_out_after_globalVariableResolve).visit(irRoot);

            //LIR Optimization based on SSA
            Optimizer optimizer = new Optimizer(irRoot);
            optimizer.CFGSimplification();
            optimizer.SSAConstruction();
            if (DEBUG_IR) new IRPrinter(ir_out_afterSSAConstruction).visit(irRoot);
            for (boolean changed = true; changed; ) {
                changed = optimizer.CommonSubexpressionElimination();
                changed |= optimizer.ConstantAndCopyPropagation();
                changed |= optimizer.CFGSimplification();
                changed |= optimizer.DeadCodeElimination();
                changed |= optimizer.CFGSimplification();
            }
            optimizer.InstructionCombination();
            if (DEBUG_IR) new IRPrinter(ir_out_afterOptimization).visit(irRoot);
            optimizer.SSADestruction();
            optimizer.CFGSimplification(true);

            //Codegen
            optimizer.ArithmeticTransformation();
            new X86ConstraintResolver(irRoot).run();
            if (DEBUG_IR) new IRPrinter(ir_out_afterX86Transform).visit(irRoot);
            optimizer.SpillPriorityCalculation();
            new RegisterAllocator(irRoot).run();
            optimizer.CFGSimplification(true);
            if (DEBUG_IR) new IRPrinter(ir_codegen_without_color).visit(irRoot);
            if (DEBUG_IR) new IRPrinter(ir_codegen, true).visit(irRoot);
            new X86CodeEmitter(irRoot, nasm).run();

            //new IRInterpreter_codegen(ir_test_in, false, ir_data_in, ir_data_out).run();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            throw new RuntimeException();
        }
    }
}
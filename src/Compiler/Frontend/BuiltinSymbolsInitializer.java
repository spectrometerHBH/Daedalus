package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.*;

import java.util.ArrayList;
import java.util.List;

public class BuiltinSymbolsInitializer {
    private final static GlobalScope globalScope = new GlobalScope("Global Scope");
    private final static ClassSymbol string = new ClassSymbol("string", null, globalScope);
    private final static PrimitiveTypeSymbol IntTypeSymbol = new PrimitiveTypeSymbol("int");
    private final static PrimitiveTypeSymbol BoolTypeSymbol = new PrimitiveTypeSymbol("bool");
    private final static PrimitiveTypeSymbol VoidTypeSymbol = new PrimitiveTypeSymbol("void");

    public BuiltinSymbolsInitializer(ProgramNode ast) {
        //PrimitiveTypes
        globalScope.definePrimitiveType(IntTypeSymbol);
        globalScope.definePrimitiveType(BoolTypeSymbol);
        globalScope.definePrimitiveType(VoidTypeSymbol);

        //class string initialization
        string.defineFunction(new FunctionSymbol("length", IntTypeSymbol, null, string));
        string.defineFunction(new FunctionSymbol("substring", string, null, string) {{
            defineVariable(new VariableSymbol("left", IntTypeSymbol, null));
            defineVariable(new VariableSymbol("right", IntTypeSymbol, null));
        }});
        string.defineFunction(new FunctionSymbol("parseInt", IntTypeSymbol, null, string));
        string.defineFunction(new FunctionSymbol("ord", IntTypeSymbol, null, string) {{
            defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        }});
        globalScope.defineClass(string);

        globalScope.setIntTypeSymbol(IntTypeSymbol);
        globalScope.setBoolTypeSymbol(BoolTypeSymbol);
        globalScope.setVoidTypeSymbol(VoidTypeSymbol);
        globalScope.setString(string);

        //BuiltinFunctions
        globalScope.defineFunction(new FunctionSymbol("print", VoidTypeSymbol, null, globalScope){{
            defineVariable(new VariableSymbol("str", string, null));
        }});
        globalScope.defineFunction(new FunctionSymbol("println", VoidTypeSymbol, null, globalScope){{
            defineVariable(new VariableSymbol("str", string, null));
        }});
        globalScope.defineFunction(new FunctionSymbol("getString", string,null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("getInt", IntTypeSymbol, null, globalScope));
        globalScope.defineFunction(new FunctionSymbol("toString", string, null, globalScope){{
            defineVariable(new VariableSymbol("i", IntTypeSymbol, null));
        }});
        globalScope.setArraySizeFunctionSymbol(new FunctionSymbol("array.size", IntTypeSymbol, null, globalScope));

        initFunctionHacker(ast);
    }

    public GlobalScope getGlobalScope(){
        return globalScope;
    }

    private void initFunctionHacker(ProgramNode ast) {
        List<StmtNode> stmtNodeList = new ArrayList<>();
        ast.getDeclNodeList().forEach(x -> {
            if (x instanceof VarDeclNode) {
                if (((VarDeclNode) x).getExpr() != null)
                    stmtNodeList.add(new ExprStmtNode(new BinaryExprNode(new IDExprNode(((VarDeclNode) x).getIdentifier(), x.getPosition()), ((VarDeclNode) x).getExpr(), BinaryExprNode.Op.ASSIGN, x.getPosition()), x.getPosition()));
            }
        });
        stmtNodeList.add(new ReturnNode(new FuncallExprNode(new IDExprNode("main", null), new ArrayList<>(), null), null));
        BlockStmtNode blockStmtNode = new BlockStmtNode(stmtNodeList, null);
        FuncDeclNode initFunction = new FuncDeclNode(new IntTypeNode(null), "__init", new ArrayList<>(), blockStmtNode, null);
        ast.getDeclNodeList().add(initFunction);
    }
}

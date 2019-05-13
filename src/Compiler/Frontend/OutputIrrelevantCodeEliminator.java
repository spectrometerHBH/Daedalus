package Compiler.Frontend;

import Compiler.AST.*;
import Compiler.Symbol.ArrayType;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.VariableSymbol;

import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.*;

public class OutputIrrelevantCodeEliminator implements ASTVisitor {
    private GlobalScope globalScope;
    private Map<ASTNode, Set<VariableSymbol>> defs = new HashMap<>();
    private Map<ASTNode, Set<VariableSymbol>> uses = new HashMap<>();
    private Set<VariableSymbol> outputRelevantSymbols = new HashSet<>();
    private Stack<Boolean> isAssign = new Stack<>();

    private boolean DEBUG = false;
    private boolean collectMode;
    private boolean solveMode;
    private boolean cleanMode;
    private boolean debugMode;
    private PrintStream debug_out = new PrintStream("ast_debug.txt");
    private String indent = "";

    private VariableSymbol callNotifier = new VariableSymbol("callNotifier", null, null);
    private VariableSymbol globalVariableNotifier = new VariableSymbol("gvNotifier", null, null);
    private VariableSymbol controlTransferNotifier = new VariableSymbol("ctNotifier", null, null);

    public OutputIrrelevantCodeEliminator(GlobalScope globalScope) throws FileNotFoundException {
        this.globalScope = globalScope;
    }

    private void addIndent() {
        indent += "\t\t\t";
    }

    private void decIndent() {
        indent = indent.substring(0, indent.length() - 3);
    }

    private void debug(String msg) {
        debug_out.print(msg);
    }

    private void debugln(String msg) {
        debug_out.println(indent + msg);
    }

    private void showDef(ASTNode node) {
        debug(indent + "defs : ");
        defs.get(node).forEach(variableSymbol -> debug(variableSymbol.getSymbolName() + " "));
        debugln("");
    }

    private void showUse(ASTNode node) {
        debug(indent + "uses : ");
        uses.get(node).forEach(variableSymbol -> debug(variableSymbol.getSymbolName() + " "));
        debugln("");
    }

    @Override
    public void visit(ProgramNode node) {
        if (node.hasClassDeclNode) return;
        outputRelevantSymbols.add(callNotifier);
        outputRelevantSymbols.add(globalVariableNotifier);
        outputRelevantSymbols.add(controlTransferNotifier);

        collectMode = true;
        node.getDeclNodeList().forEach(x -> {
            if (x instanceof FuncDeclNode) x.accept(this);
        });
        collectMode = false;
        solveMode = true;
        int size;
        do {
            size = outputRelevantSymbols.size();
            node.getDeclNodeList().forEach(x -> {
                if (x instanceof FuncDeclNode) x.accept(this);
            });
        } while (size != outputRelevantSymbols.size());
        if (DEBUG) {
            debugln("Output Relevant Symbols");
            outputRelevantSymbols.forEach(variableSymbol -> debug(variableSymbol.getSymbolName() + " "));
            debugln("\n");
        }
        solveMode = false;
        cleanMode = true;
        node.getDeclNodeList().forEach(x -> {
            if (x instanceof FuncDeclNode) x.accept(this);
        });
        cleanMode = false;
        if (DEBUG) {
            debugMode = true;
            node.getDeclNodeList().forEach(x -> {
                if (x instanceof FuncDeclNode) x.accept(this);
            });
            debugMode = false;
        }
    }

    @Override
    public void visit(VarDeclNode node) {
        if (collectMode) {
            init(node);
            if (node.getExpr() != null) {
                isAssign.push(false);
                node.getExpr().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getExpr());
            }
            defs.get(node).add(node.getVariableSymbol());
        } else if (solveMode) {
            propagate(node, node.getExpr());
            if (node.getExpr() != null) node.getExpr().accept(this);
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("VarDeclNode");
            showDef(node);
            showUse(node);
            addIndent();
            debugln("var_name : " + node.getIdentifier());
            if (node.getExpr() != null) node.getExpr().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(FuncDeclNode node) {
        if (collectMode) {
            isAssign.push(false);
            node.getBlock().accept(this);
            isAssign.pop();
        } else if (solveMode) {
            node.getBlock().accept(this);
        } else if (cleanMode) {
            instructionElimination(node.getBlock().getStmtList());
        } else if (debugMode) {
            debugln("FuncDeclNode : " + node.getIdentifier());
            addIndent();
            node.getBlock().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(ClassDeclNode node) {
        assert false;
    }

    @Override
    public void visit(ArrayTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(ClassTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BoolTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(IntTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(VoidTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(StringTypeNode node) {
        //need doing nothing
    }

    @Override
    public void visit(BlockStmtNode node) {
        if (collectMode) {
            init(node);
            node.getStmtList().forEach(x -> {
                x.accept(this);
                updateDefAndUse(node, x);
            });
        } else if (solveMode) {
            node.getStmtList().forEach(x -> {
                x.accept(this);
            });
        } else if (cleanMode) {
            instructionElimination(node.getStmtList());
        } else if (debugMode) {
            debugln("BlockStmtNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getStmtList().forEach(x -> x.accept(this));
            decIndent();
        }
    }

    @Override
    public void visit(VarDeclStmtNode node) {
        if (collectMode) {
            init(node);
            node.getVarDeclList().getList().forEach(x -> {
                x.accept(this);
                updateDefAndUse(node, x);
            });
        } else if (solveMode) {
            node.getVarDeclList().getList().forEach(x -> {
                x.accept(this);
            });
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("VarDeclStmtNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getVarDeclList().getList().forEach(x -> x.accept(this));
            decIndent();
        }
    }

    @Override
    public void visit(ExprStmtNode node) {
        if (collectMode) {
            init(node);
            node.getExpr().accept(this);
            updateDefAndUse(node, node.getExpr());
        } else if (solveMode) {
            propagate(node, node.getExpr());
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("ExprStmtNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExpr().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(IfStmtNode node) {
        if (collectMode) {
            init(node);
            isAssign.push(false);
            node.getExpression().accept(this);
            isAssign.pop();
            updateDefAndUse(node, node.getExpression());
            node.getThenStmt().accept(this);
            updateDefAndUse(node, node.getThenStmt());
            if (node.getElseStmt() != null) {
                node.getElseStmt().accept(this);
                updateDefAndUse(node, node.getElseStmt());
            }
        } else if (solveMode) {
            propagate(node, node.getExpression());
            node.getExpression().accept(this);
            node.getThenStmt().accept(this);
            if (node.getElseStmt() != null) node.getElseStmt().accept(this);
        } else if (cleanMode) {
            node.getThenStmt().accept(this);
            if (node.getElseStmt() != null) node.getElseStmt().accept(this);
        } else if (debugMode) {
            debugln("IfStmtNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExpression().accept(this);
            node.getThenStmt().accept(this);
            if (node.getElseStmt() != null) node.getElseStmt().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(WhileStmtNode node) {
        if (collectMode) {
            init(node);
            isAssign.push(false);
            node.getExpression().accept(this);
            isAssign.pop();
            updateDefAndUse(node, node.getExpression());
            node.getStatement().accept(this);
            updateDefAndUse(node, node.getStatement());
        } else if (solveMode) {
            propagate(node, node.getExpression());
            node.getExpression().accept(this);
            node.getStatement().accept(this);
        } else if (cleanMode) {
            node.getStatement().accept(this);
        } else if (debugMode) {
            debugln("WhileStmtNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExpression().accept(this);
            node.getStatement().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(ForStmtNode node) {
        if (collectMode) {
            init(node);
            if (node.getInit() != null) {
                isAssign.push(false);
                node.getInit().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getInit());
            }
            if (node.getCond() != null) {
                isAssign.push(false);
                node.getCond().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getCond());
            }
            if (node.getStep() != null) {
                isAssign.push(false);
                node.getStep().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getStep());
            }
            node.getStatement().accept(this);
            updateDefAndUse(node, node.getStatement());
        } else if (solveMode) {
            propagate(node, node.getInit(), node.getCond(), node.getStep());
            if (node.getInit() != null) node.getInit().accept(this);
            if (node.getCond() != null) node.getCond().accept(this);
            if (node.getStep() != null) node.getStep().accept(this);
            node.getStatement().accept(this);
        } else if (cleanMode) {
            node.getStatement().accept(this);
        } else if (debugMode) {
            debugln("ForStmtNode");
            showDef(node);
            showUse(node);
            debugln("init");
            addIndent();
            if (node.getInit() != null) node.getInit().accept(this);
            decIndent();
            debugln("cond");
            addIndent();
            if (node.getCond() != null) node.getCond().accept(this);
            decIndent();
            debugln("step");
            addIndent();
            if (node.getStep() != null) node.getStep().accept(this);
            decIndent();
            node.getStatement().accept(this);
        }
    }

    @Override
    public void visit(ReturnNode node) {
        if (collectMode) {
            init(node);
            if (node.getExpression() != null) {
                isAssign.push(false);
                node.getExpression().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getExpression());
                outputRelevantSymbols.addAll(uses.get(node.getExpression()));
            }
            defs.get(node).add(globalVariableNotifier);
        } else if (solveMode) {
            if (node.getExpression() != null) node.getExpression().accept(this);
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("ReturnNode");
            showDef(node);
            showUse(node);
            addIndent();
            if (node.getExpression() != null) node.getExpression().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(BreakNode node) {
        if (collectMode) {
            init(node);
            defs.get(node).add(controlTransferNotifier);
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("BreakNode");
            showDef(node);
            showUse(node);
        }
    }

    @Override
    public void visit(ContinueNode node) {
        if (collectMode) {
            init(node);
            defs.get(node).add(controlTransferNotifier);
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("ContinueNode");
            showDef(node);
            showUse(node);
        }
    }

    @Override
    public void visit(ArrayIndexNode node) {
        if (collectMode) {
            init(node);
            node.getArray().accept(this);
            updateDefAndUse(node, node.getArray());
            isAssign.push(false);
            node.getIndex().accept(this);
            isAssign.pop();
            updateDefAndUse(node, node.getIndex());
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("ArrayIndexNode");
            showDef(node);
            showUse(node);
            debugln("array");
            addIndent();
            node.getArray().accept(this);
            decIndent();
            debugln("index");
            addIndent();
            node.getIndex().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(BinaryExprNode node) {
        if (collectMode) {
            init(node);
            if (node.getOp() == BinaryExprNode.Op.ASSIGN) {
                isAssign.push(true);
                node.getLhs().accept(this);
                isAssign.pop();
                updateDefAndUse(node, node.getLhs());
                node.getRhs().accept(this);
                updateDefAndUse(node, node.getRhs());
                if (defs.get(node.getRhs()) != null) {
                    uses.get(node).addAll(defs.get(node.getLhs()));
                }
                if (node.getRhs().getType() instanceof ArrayType) {
                    //Alias of array
                    defs.get(node).addAll(uses.get(node.getRhs()));
                }
            } else {
                node.getLhs().accept(this);
                updateDefAndUse(node, node.getLhs());
                node.getRhs().accept(this);
                updateDefAndUse(node, node.getRhs());
            }
        } else if (solveMode) {
            propagate(node, node.getLhs(), node.getRhs());
            node.getLhs().accept(this);
            node.getRhs().accept(this);
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("BinaryExprNode");
            showDef(node);
            showUse(node);
            debugln("lhs");
            addIndent();
            node.getLhs().accept(this);
            decIndent();
            debugln("rhs");
            addIndent();
            node.getRhs().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(ClassMemberNode node) {
        if (collectMode) {
            init(node);
            node.getExpression().accept(this);
            updateDefAndUse(node, node.getExpression());
        } else if (solveMode) {
            node.getExpression().accept(this);
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("ClassMemberNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExpression().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(FuncCallExprNode node) {
        if (collectMode) {
            init(node);
            node.getFunction().accept(this);
            updateDefAndUse(node, node.getFunction());
            node.getParameterList().forEach(parameter -> {
                parameter.accept(this);
                updateDefAndUse(node, parameter);
            });
            if (node.getFunction().getFunctionSymbol().hasSideEffect) {
                defs.get(node).add(callNotifier);
                outputRelevantSymbols.addAll(uses.get(node));
            }
        } else if (solveMode) {
            propagate(node, node.getParameterList());
            node.getParameterList().forEach(parameter -> parameter.accept(this));
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("FuncCallExprNode");
            showDef(node);
            showUse(node);
            debugln("parameters");
            addIndent();
            node.getParameterList().forEach(x -> x.accept(this));
            decIndent();
            debugln("function");
            addIndent();
            node.getFunction().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(IDExprNode node) {
        if (collectMode) {
            init(node);
            if (node.getSymbol() instanceof VariableSymbol) {
                if (node.getSymbol().getScope() == globalScope) {
                    defs.get(node).add(globalVariableNotifier);
                } else if (isAssign.peek()) {
                    defs.get(node).add((VariableSymbol) node.getSymbol());
                } else {
                    uses.get(node).add((VariableSymbol) node.getSymbol());
                }
            }
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("IDExprNode");
            showDef(node);
            showUse(node);
            addIndent();
            debugln(node.getSymbol().getSymbolName());
            decIndent();
        }
    }

    @Override
    public void visit(NewExprNode node) {
        if (collectMode) {
            init(node);
            node.getExprNodeList().forEach(exprNode -> {
                exprNode.accept(this);
                updateDefAndUse(node, exprNode);
            });
        } else if (solveMode) {
            propagate(node, node.getExprNodeList());
            node.getExprNodeList().forEach(exprNode -> exprNode.accept(this));
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("NewExprNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExprNodeList().forEach(x -> x.accept(this));
            decIndent();
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        if (collectMode) {
            init(node);
        } else if (solveMode) {

        } else if (cleanMode) {

        }
    }

    @Override
    public void visit(UnaryExprNode node) {
        if (collectMode) {
            init(node);
            node.getExpression().accept(this);
            updateDefAndUse(node, node.getExpression());
            if (node.getOp() == UnaryExprNode.Op.PRE_INC || node.getOp() == UnaryExprNode.Op.PRE_DEC
                    || node.getOp() == UnaryExprNode.Op.SUF_INC || node.getOp() == UnaryExprNode.Op.SUF_DEC) {
                defs.get(node).addAll(uses.get(node.getExpression()));
            }
        } else if (solveMode) {
            propagate(node, node.getExpression());
            node.getExpression().accept(this);
        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("UnaryExprNode");
            showDef(node);
            showUse(node);
            addIndent();
            node.getExpression().accept(this);
            decIndent();
        }
    }

    @Override
    public void visit(IntLiteralNode node) {
        if (collectMode) {
            init(node);
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("IntLiteral");
            addIndent();
            debugln(String.valueOf(node.getVal()));
            decIndent();
        }
    }

    @Override
    public void visit(BoolLiteralNode node) {
        if (collectMode) {
            init(node);
        } else if (solveMode) {

        } else if (cleanMode) {

        } else if (debugMode) {
            debugln("BoolLiteral");
            addIndent();
            debugln(String.valueOf(node.getVal()));
            decIndent();
        }
    }

    @Override
    public void visit(NullLiteralNode node) {
        if (collectMode) {
            init(node);
        } else if (solveMode) {

        } else if (debugMode) {
            debugln("NullLiteral");
        }
    }

    @Override
    public void visit(StringLiteralNode node) {
        if (collectMode) {
            init(node);
        } else if (solveMode) {

        } else if (debugMode) {
            debugln("StringLiteral");
            addIndent();
            debugln(node.getVal());
            decIndent();
        }
    }

    private void init(ASTNode node) {
        defs.put(node, new HashSet<>());
        uses.put(node, new HashSet<>());
    }

    private void updateDefAndUse(ASTNode parent, ASTNode child) {
        defs.get(parent).addAll(defs.get(child));
        uses.get(parent).addAll(uses.get(child));
    }

    private boolean irrelevant(ASTNode node) {
        Set<VariableSymbol> defined = new HashSet<>(defs.get(node));
        defined.retainAll(outputRelevantSymbols);
        return defined.isEmpty();
    }

    private void propagate(ASTNode parent, ASTNode... children) {
        propagate(parent, Arrays.asList(children));
    }

    private void propagate(ASTNode parent, List<? extends ASTNode> children) {
        if (!irrelevant(parent)) {
            children.forEach(child -> {
                if (child != null)
                    outputRelevantSymbols.addAll(uses.get(child));
            });
        }
    }

    private void instructionElimination(List<StmtNode> stmtNodes) {
        Set<StmtNode> deadNode = new HashSet<>();
        stmtNodes.forEach(stmtNode -> {
            if (irrelevant(stmtNode)) deadNode.add(stmtNode);
            else stmtNode.accept(this);
        });
        stmtNodes.removeAll(deadNode);
    }
}

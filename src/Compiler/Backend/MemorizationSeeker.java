package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.*;
import Compiler.IR.Operand.*;

//This optimization makes me wander how smart future compilers will be?
//Actually modern compilers are more 'AI' like than so called ML models in my opinion
//Maybe you write a Floyed Algorithm and compiler will replace it with Dijkstra

public class MemorizationSeeker {
    private IRRoot irRoot;
    private int memorizeParameterLim = 100;

    public MemorizationSeeker(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(function -> {
            if (worthMemorization(function)) doMemorization(function);
        });
    }

    private boolean worthMemorization(Function function) {
        if (function.getReferenceForClassMethod() != null
                || function.getParameterList().size() != 1
                || function.getReturnInstList().get(0).getReturnValue() == null) return false;
        for (BasicBlock basicBlock : function.getReversePostOrderDFSBBList()) {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                if (irInstruction instanceof Call) {
                    if (((Call) irInstruction).getCallee() != function) return false;
                }
                for (Register register : irInstruction.getUseRegisters()) {
                    if (register instanceof GlobalVariable) return false;
                }
                if (irInstruction.getDefRegister() != null) {
                    if (irInstruction.getDefRegister() instanceof GlobalVariable) return false;
                }
            }
        }
        return true;
    }

    private void doMemorization(Function function) {
        GlobalI64Value tableBase = new GlobalI64Value("__" + function.getName() + "_mem_table_base");
        irRoot.addGlobalVariable(tableBase);
        BasicBlock initEntryBlock = irRoot.getFunctionMap().get("__init").getEntryBlock();
        initEntryBlock.head.prependInstruction(new Alloc(initEntryBlock, new Immediate(memorizeParameterLim * 8), tableBase));
        //TODO : initialize

        BasicBlock checkParaBB = new BasicBlock(function, "__" + function.getName() + "_mem_para_check");
        BasicBlock tableFetchBB = new BasicBlock(function, "__" + function.getName() + "_mem_table_fetch");
        BasicBlock tableStoreBB = new BasicBlock(function, "__" + function.getName() + "_mem_table_store");
        BasicBlock newExitBB = new BasicBlock(function, "__" + function.getName() + "_mem_new_exit");
        BasicBlock oldEntryBB = function.getEntryBlock(), oldExitBB = function.getExitBlock();

        function.setEntryBlock(checkParaBB);
        Operand parameter = function.getAllParameterList().get(0);
        I64Value cmpResult_1 = new I64Value("__mem_cmp1");
        checkParaBB.appendInst(new Cmp(checkParaBB, Cmp.Op.LT, parameter, new Immediate(memorizeParameterLim), cmpResult_1));
        checkParaBB.terminate(new Branch(checkParaBB, cmpResult_1, tableFetchBB, oldEntryBB));

        I64Value offset_1 = new I64Value();
        I64Value offset_2 = new I64Value();
        I64Value cmpResult_2 = new I64Value("__mem_cmp2");
        Operand returnValue = function.getReturnInstList().get(0).getReturnValue();
        tableFetchBB.appendInst(new Binary(tableFetchBB, Binary.Op.MUL, parameter, new Immediate(8), offset_1));
        tableFetchBB.appendInst(new Binary(tableFetchBB, Binary.Op.ADD, tableBase, offset_1, offset_2));
        tableFetchBB.appendInst(new Load(tableFetchBB, offset_2, returnValue));
        tableFetchBB.appendInst(new Cmp(tableFetchBB, Cmp.Op.NEQ, returnValue, new Immediate(0), cmpResult_2));
        tableFetchBB.terminate(new Branch(tableFetchBB, cmpResult_2, newExitBB, oldEntryBB));

        Return oldReturn = function.getReturnInstList().get(0);
        oldExitBB.removeInst();
        I64Value cmpResult_3 = new I64Value("__mem_cmp3");
        oldExitBB.appendInst(new Cmp(oldExitBB, Cmp.Op.LT, parameter, new Immediate(memorizeParameterLim), cmpResult_3));
        oldExitBB.terminate(new Branch(oldExitBB, cmpResult_3, tableStoreBB, newExitBB));

        I64Value offset_3 = new I64Value();
        I64Value offset_4 = new I64Value();
        tableStoreBB.appendInst(new Binary(tableStoreBB, Binary.Op.MUL, parameter, new Immediate(8), offset_3));
        tableStoreBB.appendInst(new Binary(tableStoreBB, Binary.Op.ADD, tableBase, offset_3, offset_4));
        tableStoreBB.appendInst(new Store(tableStoreBB, returnValue, offset_4));
        tableStoreBB.terminate(new Jump(tableStoreBB, newExitBB));

        oldReturn.setCurrentBB(newExitBB);
        function.setExitBlock(newExitBB);
        newExitBB.terminate(oldReturn);

        function.recalcReversePostOrderDFSBBList();
    }
}

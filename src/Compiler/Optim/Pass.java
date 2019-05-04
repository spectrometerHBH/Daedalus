package Compiler.Optim;

import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Operand.Register;

import java.util.*;

public abstract class Pass {
    protected IRRoot irRoot;
    protected Map<Register, IRInstruction> def;
    protected Map<Register, Set<IRInstruction>> use;
    protected LinkedList<IRInstruction> allStatements;
    protected boolean changed;

    Pass(IRRoot irRoot) {
        this.irRoot = irRoot;
    }

    abstract boolean run();

    void calcDefUseChain(Function function) {
        def = new HashMap<>();
        use = new HashMap<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                Register defRegister = irInstruction.getDefRegister();
                if (defRegister != null) {
                    def.put(defRegister, irInstruction);
                    use.computeIfAbsent(defRegister, k -> new HashSet<>());
                }
                for (Register useRegister : irInstruction.getUseRegisters()) {
                    use.computeIfAbsent(useRegister, k -> new HashSet<>());
                    use.get(useRegister).add(irInstruction);
                }
            }
        });
    }

    LinkedList<IRInstruction> getAllStatements(Function function) {
        allStatements = new LinkedList<>();
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                allStatements.add(irInstruction);
        });
        return allStatements;
    }

    void calcControlDependeceGraph(Function function) {

    }
}

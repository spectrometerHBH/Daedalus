package Compiler.Optim;

import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.Alloc;
import Compiler.IR.Instruction.Call;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Operand.Register;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

//Dead Code Elimination
//          Dead instruction elimination performs a single pass over the function, removing instructions that are obviously dead.
//          Dead code elimination is similar to dead instruction elimination, but it rechecks instructions that were used by removed instructions to see if they are newly dead.
//LLVM Pass

//TODO aggressive DCE with control dependence graph

class DeadCodeEliminator extends Pass {
    DeadCodeEliminator(IRRoot irRoot) {
        super(irRoot);
    }

    @Override
    boolean run() {
        changed = false;
        irRoot.getFunctionMap().values().forEach(function -> {
            calcDefUseChain(function);
            naiveDeadCodeElimination();
        });
        return changed;
    }

    private boolean hasSideEffects(IRInstruction irInstruction) {
        return irInstruction instanceof Call || irInstruction instanceof Alloc;
    }

    private void naiveDeadCodeElimination() {
        LinkedList<Register> workList = new LinkedList<>(def.keySet());
        Set<Register> inQueue = new HashSet<>(def.keySet());
        while (!workList.isEmpty()) {
            Register v = workList.poll();
            inQueue.remove(v);
            if (use.get(v).isEmpty()) {
                IRInstruction S = def.get(v);
                if (S != null && !hasSideEffects(S)) {
                    changed = true;
                    S.removeSelf();
                    for (Register useRegister : S.getUseRegisters()) {
                        use.get(useRegister).remove(S);
                        if (!inQueue.contains(useRegister)) {
                            workList.add(useRegister);
                            inQueue.add(useRegister);
                        }
                    }
                }
            }
        }
    }
}

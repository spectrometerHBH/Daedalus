package Compiler.IR.Operand;

import Compiler.IR.BasicBlock;
import Compiler.IR.IRVisitor;
import Compiler.IR.Instruction.Move;

import java.util.*;

public abstract class VirtualRegister extends Register {
    public RegisterInformation info;
    private Map<Integer, VirtualRegister> aliases = null;
    private VirtualRegister origin = null;
    private int SSAID = -1;

    //for Register Allocation use
    public PhysicalRegister color = null;
    public StackData spillAddr = null;
    public Set<VirtualRegister> adjList = new HashSet<>();
    public int degree;
    public Set<Move> moveList = new HashSet<>();
    public VirtualRegister alias;
    public boolean addForSpill = false;
    public int spillPriority = 0;

    public VirtualRegister() {
    }

    public VirtualRegister(String name) {
        super(name);
    }

    public VirtualRegister(int SSAID, VirtualRegister origin) {
        super(origin.name);
        this.origin = origin;
        this.SSAID = SSAID;
    }

    public int getSSAID() {
        return SSAID;
    }

    public VirtualRegister getOrigin() {
        return origin == null ? this : origin;
    }

    public VirtualRegister getSSARenameRegister(int id) {
        if (aliases == null) aliases = new HashMap<>();
        VirtualRegister alias = aliases.get(id);
        if (alias == null) {
            alias = new VirtualRegister(id, this) {
                @Override
                public void accept(IRVisitor irVisitor) {
                    irVisitor.visit(this);
                }
            };
            aliases.put(id, alias);
        }
        return alias;
    }

    public int getNewId() {
        int newId = info.counter++;
        info.stack.push(newId);
        return newId;
    }

    public void clearAllocationInfo() {
        spillAddr = null;
        adjList.clear();
        moveList.clear();
        alias = null;
    }

    public static class RegisterInformation {
        public Set<BasicBlock> defBB = new HashSet<>();
        public Stack<Integer> stack = new Stack<>();
        public int counter = 0;
    }
}

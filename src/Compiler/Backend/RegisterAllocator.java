package Compiler.Backend;

import Compiler.IR.BasicBlock;
import Compiler.IR.Function;
import Compiler.IR.IRRoot;
import Compiler.IR.Instruction.IRInstruction;
import Compiler.IR.Instruction.Load;
import Compiler.IR.Instruction.Move;
import Compiler.IR.Instruction.Store;
import Compiler.IR.Operand.*;

import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Stack;

import static Compiler.IR.Operand.PhysicalRegister.*;

//Graph Coloring
//Build -> Simplify -> Coalesce -> Freeze -> Spill -> Select
public class RegisterAllocator {
    private IRRoot irRoot;
    private IRPrinter irPrinter;
    private PrintStream debug_out;
    private boolean DEBUG = false;

    private int iteration;
    private int K = 14;
    private Set<PhysicalRegister> colors = new HashSet<>();

    private Set<VirtualRegister> precolored = new HashSet<>();
    private Set<VirtualRegister> initial = new HashSet<>();
    private Set<VirtualRegister> simplifyWorklist = new HashSet<>();
    private Set<VirtualRegister> freezeWorklist = new HashSet<>();
    private Set<VirtualRegister> spillWorklist = new HashSet<>();
    private Set<VirtualRegister> spilledNodes = new HashSet<>();
    private Set<VirtualRegister> coalescedNodes = new HashSet<>();
    private Set<VirtualRegister> coloredNodes = new HashSet<>();
    private Stack<VirtualRegister> selectStack = new Stack<>();
    private Set<VirtualRegister> selectStackNodes = new HashSet<>();

    private Set<Move> coalescedMoves = new HashSet<>();
    private Set<Move> constrainedMoves = new HashSet<>();
    private Set<Move> frozenMoves = new HashSet<>();
    private Set<Move> worklistMoves = new HashSet<>();
    private Set<Move> activeMoves = new HashSet<>();

    private Set<Edge> adjSet = new HashSet<>();

    public RegisterAllocator(IRRoot irRoot) {
        this.irRoot = irRoot;
        precolored.addAll(allVRegisters);

        colors.addAll(allRegisters);
        colors.remove(rsp);
        colors.remove(rbp);

        try {
            debug_out = new PrintStream("ir_debug.ll");
            irPrinter = new IRPrinter(debug_out, false, false);
            if (DEBUG) irPrinter.visit(irRoot);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void dumpMove(Move move) {
        debug_out.print(irPrinter.getName((Storage) move.getDst()));
        debug_out.print(" = move ");
        debug_out.println(irPrinter.getName((Storage) move.getSrc()));
    }

    private void dumpNode(VirtualRegister virtualRegister) {
        debug_out.print(irPrinter.getName(virtualRegister) + " ");
    }

    private void dumpDebugInfo(Function function) {
        if (DEBUG) {
            debug_out.println("========" + function.getName() + " Graph Info ========");
            initial.forEach(u -> {
                debug_out.println(irPrinter.getName(u) + ":");
                debug_out.print("AdjList : ");
                u.adjList.forEach(v -> debug_out.print(" " + irPrinter.getName(v)));
                debug_out.println();
                debug_out.print("degree : " + u.degree);
                debug_out.println();
                debug_out.print("Alias ：" + irPrinter.getName(u.alias));
                debug_out.println();
                debug_out.print("Color : " + (u.color == null ? "null" : irPrinter.getName(u.color)));
                debug_out.println();
                debug_out.println("------");
            });
            debug_out.println("========" + function.getName() + " Move List Info ========");
            debug_out.println("coalesced Moves:");
            coalescedMoves.forEach(this::dumpMove);
            debug_out.println("------");
            debug_out.println("constrained Moves:");
            constrainedMoves.forEach(this::dumpMove);
            debug_out.println("------");
            debug_out.println("fronzen Moves:");
            frozenMoves.forEach(this::dumpMove);
            debug_out.println("------");
            debug_out.println("workList Moves:");
            worklistMoves.forEach(this::dumpMove);
            debug_out.println("------");
            debug_out.println("active Moves:");
            activeMoves.forEach(this::dumpMove);
            debug_out.println("========" + function.getName() + " Node List Info ========");
            debug_out.println("simplify Nodes(low degree non move related):");
            simplifyWorklist.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("freeze Nodes(low degree move related):");
            freezeWorklist.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("spill Nodes(high degree):");
            spillWorklist.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("spilled Nodes:");
            spilledNodes.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("coalesced Nodes:");
            coalescedNodes.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("colored Nodes:");
            coloredNodes.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println("selected Stack:");
            selectStackNodes.forEach(this::dumpNode);
            debug_out.println("\n------");
            debug_out.println();
        }
    }

    public void run() {
        irRoot.getFunctionMap().values().forEach(this::allocate);
        cleanMove();
    }

    private void cleanMove() {
        irRoot.getFunctionMap().values().forEach(function -> function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction())
                if (irInstruction instanceof Move && ((Move) irInstruction).getSrc() instanceof Register && ((Move) irInstruction).getDst() instanceof Register) {
                    PhysicalRegister color1 = null, color2 = null;
                    if (((Move) irInstruction).getSrc() instanceof VirtualRegister)
                        color1 = ((VirtualRegister) ((Move) irInstruction).getSrc()).color;
                    else if (((Move) irInstruction).getSrc() instanceof PhysicalRegister)
                        color1 = (PhysicalRegister) ((Move) irInstruction).getSrc();
                    if (((Move) irInstruction).getDst() instanceof VirtualRegister)
                        color2 = ((VirtualRegister) ((Move) irInstruction).getDst()).color;
                    else if (((Move) irInstruction).getDst() instanceof PhysicalRegister)
                        color2 = (PhysicalRegister) ((Move) irInstruction).getDst();
                    assert color1 != null;
                    assert color2 != null;
                    if (color1 == color2)
                        irInstruction.removeSelf();
                }
        }));
    }

    private void init() {
        initial.clear();
        simplifyWorklist.clear();
        freezeWorklist.clear();
        spillWorklist.clear();
        spilledNodes.clear();
        coalescedNodes.clear();
        coloredNodes.clear();
        selectStack.clear();
        selectStackNodes.clear();

        coalescedMoves.clear();
        constrainedMoves.clear();
        frozenMoves.clear();
        worklistMoves.clear();
        activeMoves.clear();

        adjSet.clear();
    }

    private void allocate(Function function) {
        boolean finish;
        iteration = 0;
        do {
            if (DEBUG)
                debug_out.println("=====================" + function.getName() + " Iteration " + iteration + "=====================");
            init();
            livenessAnalysis(function);
            build(function);
            makeWorklist();
            if (DEBUG) {
                dumpDebugInfo(function);
                irPrinter.visit(irRoot);
            }
            do {
                if (!simplifyWorklist.isEmpty()) {
                    if (DEBUG) debug_out.println("===================== Simplify =====================");
                    simplify();
                } else if (!worklistMoves.isEmpty()) {
                    if (DEBUG) debug_out.println("===================== Coalesce =====================");
                    coalesce();
                } else if (!freezeWorklist.isEmpty()) {
                    if (DEBUG) debug_out.println("===================== Freeze =====================");
                    freeze();
                } else if (!spillWorklist.isEmpty()) {
                    if (DEBUG) debug_out.println("===================== SelectSpill =====================");
                    selectSpill();
                }
                if (DEBUG) dumpDebugInfo(function);
            } while (!(simplifyWorklist.isEmpty() && worklistMoves.isEmpty() && freezeWorklist.isEmpty() && spillWorklist.isEmpty()));
            assignColors();
            if (DEBUG) {
                debug_out.println("===================== after ASSIGN =====================");
                dumpDebugInfo(function);
            }
            if (!spilledNodes.isEmpty()) {
                finish = false;
                rewriteProgram(function);
                if (DEBUG) {
                    debug_out.println("===================== IR after Rewrite =====================");
                    irPrinter.visit(irRoot);
                }
            } else finish = true;
            iteration++;
        } while (!finish);
    }

    private void livenessAnalysis(Function function) {
        //initialize def & use
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            basicBlock.getDef().clear();
            basicBlock.getUse().clear();
            basicBlock.getLiveIn().clear();
            basicBlock.getLiveOut().clear();
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                irInstruction.calcUseAndDef();
                irInstruction.getUse().forEach(virtualRegister -> {
                    if (!basicBlock.getDef().contains(virtualRegister))
                        basicBlock.getUse().add(virtualRegister);
                });
                irInstruction.getDef().forEach(virtualRegister -> basicBlock.getDef().add(virtualRegister));
                initial.addAll(irInstruction.getDef());
                initial.addAll(irInstruction.getUse());
            }
        });
        initial.removeAll(precolored);
        initial.remove(vrsp);
        initial.remove(vrbp);
        //solve
        boolean changed = true;
        for (; changed; ) {
            changed = false;
            for (BasicBlock basicBlock : function.getPostOrderDFSBBList()) {
                Set<VirtualRegister> newOut = new HashSet<>();
                Set<VirtualRegister> newIn = new HashSet<>(basicBlock.getUse());
                Set<VirtualRegister> tmp = new HashSet<>(basicBlock.getLiveOut());
                tmp.removeAll(basicBlock.getDef());
                newIn.addAll(tmp);
                basicBlock.getSuccessors().forEach(successor -> newOut.addAll(successor.getLiveIn()));
                if (!basicBlock.getLiveIn().equals(newIn) || !basicBlock.getLiveOut().equals(newOut)) {
                    changed = true;
                    basicBlock.setLiveIn(newIn);
                    basicBlock.setLiveOut(newOut);
                }
            }
        }
    }

    private void build(Function function) {
        initial.forEach(virtualRegister -> {
            virtualRegister.clearAllocationInfo();
            virtualRegister.degree = 0;
            virtualRegister.color = null;
        });
        precolored.forEach(virtualRegister -> {
            virtualRegister.clearAllocationInfo();
            virtualRegister.degree = Integer.MAX_VALUE;
        });
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            Set<VirtualRegister> live = new HashSet<>(basicBlock.getLiveOut());
            if (basicBlock == function.getExitBlock()) {
                live.addAll(calleeSaveVRegisters);
                live.remove(vrbp);
                live.remove(vrsp);
            }
            for (IRInstruction irInstruction = basicBlock.tail; irInstruction != null; irInstruction = irInstruction.getLastInstruction()) {
                if (irInstruction instanceof Move && ((Move) irInstruction).getDst() instanceof VirtualRegister && !(((Move) irInstruction).getSrc() instanceof PhysicalRegister)) {
                    //Dead Move Elimination
                    if (((Move) irInstruction).getDst() == ((Move) irInstruction).getSrc()) {
                        irInstruction.removeSelf();
                        continue;
                    }
                    Set<VirtualRegister> tmp = new HashSet<>(live);
                    tmp.retainAll(irInstruction.getDef());
                    if (tmp.isEmpty()) {
                        irInstruction.removeSelf();
                        continue;
                    }
                }
                if (irInstruction instanceof Move
                        && ((Move) irInstruction).getDst() instanceof VirtualRegister && ((Move) irInstruction).getSrc() instanceof VirtualRegister
                        && !(((Move) irInstruction).getDst() instanceof GlobalVariable) && !(((Move) irInstruction).getSrc() instanceof GlobalVariable)) {
                    live.removeAll(irInstruction.getUse());
                    for (VirtualRegister def : irInstruction.getDef())
                        def.moveList.add((Move) irInstruction);
                    for (VirtualRegister use : irInstruction.getUse())
                        use.moveList.add((Move) irInstruction);
                    worklistMoves.add((Move) irInstruction);
                }
                live.addAll(irInstruction.getDef());
                for (VirtualRegister def : irInstruction.getDef())
                    for (VirtualRegister liveVR : live)
                        addEdge(def, liveVR);
                live.removeAll(irInstruction.getDef());
                live.addAll(irInstruction.getUse());
            }
        });
    }

    private void makeWorklist() {
        for (VirtualRegister n : initial) {
            if (n.degree >= K) spillWorklist.add(n);
            else if (moveRelated(n)) freezeWorklist.add(n);
            else simplifyWorklist.add(n);
        }
    }

    private Set<VirtualRegister> adjacent(VirtualRegister n) {
        Set<VirtualRegister> res = new HashSet<>(n.adjList);
        res.removeAll(selectStackNodes);
        res.removeAll(coalescedNodes);
        return res;
    }

    private Set<Move> nodeMoves(VirtualRegister n) {
        Set<Move> res = new HashSet<>(n.moveList);
        Set<Move> tmp = new HashSet<>(activeMoves);
        tmp.addAll(worklistMoves);
        res.retainAll(tmp);
        return res;
    }

    private boolean moveRelated(VirtualRegister n) {
        return !nodeMoves(n).isEmpty();
    }

    private void simplify() {
        VirtualRegister n = simplifyWorklist.iterator().next();
        simplifyWorklist.remove(n);
        selectStack.push(n);
        selectStackNodes.add(n);
        for (VirtualRegister m : adjacent(n))
            decrementDegree(m);
    }

    private void decrementDegree(VirtualRegister m) {
        int d = m.degree;
        m.degree = d - 1;
        if (d == K) {
            Set<VirtualRegister> tmp = new HashSet<>(adjacent(m));
            tmp.add(m);
            enableMoves(tmp);
            spillWorklist.remove(m);
            if (moveRelated(m)) freezeWorklist.add(m);
            else simplifyWorklist.add(m);
        }
    }

    private void enableMoves(Set<VirtualRegister> nodes) {
        for (VirtualRegister n : nodes)
            for (Move m : nodeMoves(n))
                if (activeMoves.contains(m)) {
                    activeMoves.remove(m);
                    worklistMoves.add(m);
                }
    }

    private void addWorklist(VirtualRegister u) {
        if (!precolored.contains(u) && !moveRelated(u) && u.degree < K) {
            freezeWorklist.remove(u);
            simplifyWorklist.add(u);
        }
    }

    private boolean ok(VirtualRegister t, VirtualRegister r) {
        return t.degree < K || precolored.contains(t) || adjSet.contains(new Edge(t, r));
    }

    private boolean conservative(Set<VirtualRegister> nodes) {
        int k = 0;
        for (VirtualRegister n : nodes)
            if (n.degree >= K) {
                k++;
            }
        return k < K;
    }

    private void coalesce() {
        Move m = worklistMoves.iterator().next();
        VirtualRegister x = getAlias((VirtualRegister) m.getDst());
        VirtualRegister y = getAlias((VirtualRegister) m.getSrc());
        VirtualRegister u, v;
        if (precolored.contains(y)) {
            u = y;
            v = x;
        } else {
            u = x;
            v = y;
        }
        worklistMoves.remove(m);
        if (u == v) {
            coalescedMoves.add(m);
            addWorklist(u);
        } else if (precolored.contains(v) || adjSet.contains(new Edge(u, v))) {
            constrainedMoves.add(m);
            addWorklist(u);
            addWorklist(v);
        } else {
            boolean cond1 = precolored.contains(u);
            for (VirtualRegister t : adjacent(v)) cond1 &= ok(t, u);
            boolean cond2 = !precolored.contains(u);
            Set<VirtualRegister> tmp = adjacent(u);
            tmp.addAll(adjacent(v));
            cond2 &= conservative(tmp);
            if (cond1 || cond2) {
                coalescedMoves.add(m);
                combine(u, v);
                addWorklist(u);
            } else activeMoves.add(m);
        }
    }

    private void combine(VirtualRegister u, VirtualRegister v) {
        if (freezeWorklist.contains(v)) freezeWorklist.remove(v);
        else spillWorklist.remove(v);
        coalescedNodes.add(v);
        v.alias = u;
        u.moveList.addAll(v.moveList);
        Set<VirtualRegister> tmp = new HashSet<>();
        tmp.add(v);
        enableMoves(tmp);
        for (VirtualRegister t : adjacent(v)) {
            addEdge(t, u);
            decrementDegree(t);
        }
        if (u.degree >= K && freezeWorklist.contains(u)) {
            freezeWorklist.remove(u);
            spillWorklist.add(u);
        }
    }

    private VirtualRegister getAlias(VirtualRegister n) {
        if (coalescedNodes.contains(n)) return n.alias = getAlias(n.alias);
        else return n;
    }

    private void freeze() {
        VirtualRegister u = freezeWorklist.iterator().next();
        freezeWorklist.remove(u);
        simplifyWorklist.add(u);
        freezeMoves(u);
    }

    private void freezeMoves(VirtualRegister u) {
        for (Move m : nodeMoves(u)) {
            VirtualRegister x = getAlias((VirtualRegister) m.getDst());
            VirtualRegister y = getAlias((VirtualRegister) m.getSrc());
            VirtualRegister v = y == getAlias(u) ? x : y;
            activeMoves.remove(m);
            frozenMoves.add(m);
            if (freezeWorklist.contains(v) && nodeMoves(v).isEmpty()) {
                freezeWorklist.remove(v);
                simplifyWorklist.add(v);
            }
        }
    }

    private void selectSpill() {
        Iterator<VirtualRegister> iterator = spillWorklist.iterator();
        VirtualRegister m = iterator.next(), now;
        for (; m.addForSpill && iterator.hasNext(); m = iterator.next()) ;
        spillWorklist.remove(m);
        simplifyWorklist.add(m);
        freezeMoves(m);
    }

    private void assignColors() {
        while (!selectStack.isEmpty()) {
            VirtualRegister n = selectStack.pop();
            selectStackNodes.remove(n);
            if (n.degree == 0) continue;
            Set<PhysicalRegister> okColors = new HashSet<>(colors);
            for (VirtualRegister w : n.adjList)
                if (coloredNodes.contains(getAlias(w)) || precolored.contains(getAlias(w))) {
                    okColors.remove(getAlias(w).color);
                }
            if (okColors.isEmpty()) {
                spilledNodes.add(n);
            } else {
                coloredNodes.add(n);
                n.color = okColors.iterator().next();
            }
        }
        for (VirtualRegister n : coalescedNodes)
            n.color = getAlias(n).color;
    }

    private void rewriteProgram(Function function) {
        for (VirtualRegister virtualRegister : spilledNodes)
            virtualRegister.spillAddr = new StackData(vrbp, null, new Immediate(0), new Immediate(-(++function.temporaryCnt) * 8));
        for (VirtualRegister virtualRegister : coalescedNodes)
            getAlias(virtualRegister);
        function.getReversePostOrderDFSBBList().forEach(basicBlock -> {
            for (IRInstruction irInstruction = basicBlock.head; irInstruction != null; irInstruction = irInstruction.getNextInstruction()) {
                for (VirtualRegister use : irInstruction.getUse())
                    if (use.spillAddr != null) {
                        if (irInstruction.getDef().contains(use)) {
                            I64Value tmp = new I64Value("spill_tmp");
                            tmp.addForSpill = true;
                            irInstruction.prependInstruction(new Load(basicBlock, use.spillAddr, tmp));
                            irInstruction.postpendInstruction(new Store(basicBlock, tmp, use.spillAddr));
                            irInstruction.replaceUse(use, tmp);
                            irInstruction.replaceDef(use, tmp);
                        } else {
                            //TODO : peephole optimization for Move, Binary(add, sub, mul, and, or, xor)
                            if (irInstruction instanceof Move && ((Move) irInstruction).getSrc() == use && ((VirtualRegister) ((Move) irInstruction).getDst()).spillAddr == null)
                                irInstruction.replaceInstruction(new Load(basicBlock, use.spillAddr, ((Move) irInstruction).getDst()));
                            else {
                                I64Value tmp = new I64Value("spill_tmp");
                                tmp.addForSpill = true;
                                irInstruction.prependInstruction(new Load(basicBlock, use.spillAddr, tmp));
                                irInstruction.replaceUse(use, tmp);
                            }
                        }
                    }
                for (VirtualRegister def : irInstruction.getDef()) {
                    if (def.spillAddr != null) {
                        if (!irInstruction.getUse().contains(def)) {
                            if (irInstruction instanceof Move && ((Move) irInstruction).getSrc() instanceof VirtualRegister && ((VirtualRegister) ((Move) irInstruction).getSrc()).spillAddr == null)
                                irInstruction.replaceInstruction(new Store(basicBlock, ((Move) irInstruction).getSrc(), def.spillAddr));
                            else {
                                I64Value tmp = new I64Value("spill_tmp");
                                tmp.addForSpill = true;
                                irInstruction.postpendInstruction(new Store(basicBlock, tmp, def.spillAddr));
                                irInstruction.replaceDef(def, tmp);
                            }
                        }
                    }
                }
                irInstruction.calcUseAndDef();
            }
        });
    }

    private void addEdge(VirtualRegister u, VirtualRegister v) {
        if (u != v && !adjSet.contains(new Edge(u, v))) {
            adjSet.add(new Edge(u, v));
            adjSet.add(new Edge(v, u));
            if (!precolored.contains(u)) {
                u.adjList.add(v);
                u.degree++;
            }
            if (!precolored.contains(v)) {
                v.adjList.add(u);
                v.degree++;
            }
        }
    }

    private class Edge {
        VirtualRegister u;
        VirtualRegister v;

        Edge(VirtualRegister u, VirtualRegister v) {
            this.u = u;
            this.v = v;
        }

        @Override
        public boolean equals(Object object) {
            if (object instanceof Edge)
                return u == ((Edge) object).u && v == ((Edge) object).v;
            else
                return false;
        }

        @Override
        public int hashCode() {
            return u.hashCode() ^ v.hashCode();
        }
    }
}

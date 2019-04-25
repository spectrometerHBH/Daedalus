package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

public class PhysicalRegister extends Register {
    public static final PhysicalRegister rax = new PhysicalRegister("rax", true);
    public static final PhysicalRegister rcx = new PhysicalRegister("rcx", true);
    public static final PhysicalRegister rdx = new PhysicalRegister("rdx", true);
    public static final PhysicalRegister rbx = new PhysicalRegister("rbx", false);
    public static final PhysicalRegister rsi = new PhysicalRegister("rsi", true);
    public static final PhysicalRegister rdi = new PhysicalRegister("rdi", true);
    public static final PhysicalRegister rsp = new PhysicalRegister("rsp", true);
    public static final PhysicalRegister rbp = new PhysicalRegister("rbp", false);
    public static final PhysicalRegister r8 = new PhysicalRegister("r8", true);
    public static final PhysicalRegister r9 = new PhysicalRegister("r9", true);
    public static final PhysicalRegister r10 = new PhysicalRegister("r10", true);
    public static final PhysicalRegister r11 = new PhysicalRegister("r11", true);
    public static final PhysicalRegister r12 = new PhysicalRegister("r12", false);
    public static final PhysicalRegister r13 = new PhysicalRegister("r13", false);
    public static final PhysicalRegister r14 = new PhysicalRegister("r14", false);
    public static final PhysicalRegister r15 = new PhysicalRegister("r15", false);

    public static final Set<PhysicalRegister> callerSaveRegisters = new HashSet<>();
    public static final Set<PhysicalRegister> calleeSaveRegisters = new HashSet<>();
    public static final LinkedList<PhysicalRegister> argumentPassRegisters = new LinkedList<>();
    public static final LinkedList<PhysicalRegister> allRegisters = new LinkedList<>();

    public static final VirtualRegister vrax = new I64Value("rax", rax);
    public static final VirtualRegister vrcx = new I64Value("rcx", rcx);
    public static final VirtualRegister vrdx = new I64Value("rdx", rdx);
    public static final VirtualRegister vrbx = new I64Value("rbx", rbx);
    public static final VirtualRegister vrsi = new I64Value("rsi", rsi);
    public static final VirtualRegister vrdi = new I64Value("rdi", rdi);
    public static final VirtualRegister vrsp = new I64Value("rsp", rsp);
    public static final VirtualRegister vrbp = new I64Value("rbp", rbp);
    public static final VirtualRegister vr8 = new I64Value("r8", r8);
    public static final VirtualRegister vr9 = new I64Value("r9", r9);
    public static final VirtualRegister vr10 = new I64Value("r10", r10);
    public static final VirtualRegister vr11 = new I64Value("r11", r11);
    public static final VirtualRegister vr12 = new I64Value("r12", r12);
    public static final VirtualRegister vr13 = new I64Value("r13", r13);
    public static final VirtualRegister vr14 = new I64Value("r14", r14);
    public static final VirtualRegister vr15 = new I64Value("r15", r15);

    public static final Set<VirtualRegister> callerSaveVRegisters = new HashSet<>();
    public static final Set<VirtualRegister> calleeSaveVRegisters = new HashSet<>();
    public static final LinkedList<VirtualRegister> argumentPassVRegisters = new LinkedList<>();
    public static final LinkedList<VirtualRegister> allVRegisters = new LinkedList<>();

    static {
        argumentPassVRegisters.add(vrdi);
        argumentPassVRegisters.add(vrsi);
        argumentPassVRegisters.add(vrdx);
        argumentPassVRegisters.add(vrcx);
        argumentPassVRegisters.add(vr8);
        argumentPassVRegisters.add(vr9);
        for (VirtualRegister virtualRegister : argumentPassVRegisters)
            argumentPassRegisters.add(virtualRegister.color);
        allVRegisters.add(vrax);
        allVRegisters.add(vrcx);
        allVRegisters.add(vrdx);
        allVRegisters.add(vrbx);
        allVRegisters.add(vrsi);
        allVRegisters.add(vrdi);
        allVRegisters.add(vrsp);
        allVRegisters.add(vrbp);
        allVRegisters.add(vr8);
        allVRegisters.add(vr9);
        allVRegisters.add(vr10);
        allVRegisters.add(vr11);
        allVRegisters.add(vr12);
        allVRegisters.add(vr13);
        allVRegisters.add(vr14);
        allVRegisters.add(vr15);
        for (VirtualRegister virtualRegister : argumentPassVRegisters) {
            argumentPassRegisters.add(virtualRegister.color);
            if (virtualRegister.color.isCallerSave) {
                callerSaveVRegisters.add(virtualRegister);
                callerSaveRegisters.add(virtualRegister.color);
            } else {
                calleeSaveVRegisters.add(virtualRegister);
                calleeSaveRegisters.add(virtualRegister.color);
            }
        }
    }

    boolean isCallerSave;
    boolean isCalleeSave;

    private PhysicalRegister(String name, boolean callerSave) {
        super(name);
        this.isCallerSave = callerSave;
        this.isCalleeSave = !callerSave;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    public boolean isCalleeSave() {
        return calleeSaveRegisters.contains(this);
    }

    public boolean isCallerSave() {
        return callerSaveRegisters.contains(this);
    }
}

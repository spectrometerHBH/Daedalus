package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

public class PhysicalRegister extends Register {
    public static final PhysicalRegister rax = new PhysicalRegister("rax", "al", true);
    public static final PhysicalRegister rcx = new PhysicalRegister("rcx", "cl", true);
    public static final PhysicalRegister rdx = new PhysicalRegister("rdx", "dl", true);
    public static final PhysicalRegister rbx = new PhysicalRegister("rbx", "bl", false);
    public static final PhysicalRegister rsi = new PhysicalRegister("rsi", "sil", true);
    public static final PhysicalRegister rdi = new PhysicalRegister("rdi", "dil", true);
    public static final PhysicalRegister rsp = new PhysicalRegister("rsp", "spl", true);
    public static final PhysicalRegister rbp = new PhysicalRegister("rbp", "bpl", false);
    public static final PhysicalRegister r8 = new PhysicalRegister("r8", "r8b", true);
    public static final PhysicalRegister r9 = new PhysicalRegister("r9", "r9b", true);
    public static final PhysicalRegister r10 = new PhysicalRegister("r10", "r10b", true);
    public static final PhysicalRegister r11 = new PhysicalRegister("r11", "r11b", true);
    public static final PhysicalRegister r12 = new PhysicalRegister("r12", "r12b", false);
    public static final PhysicalRegister r13 = new PhysicalRegister("r13", "r13b", false);
    public static final PhysicalRegister r14 = new PhysicalRegister("r14", "r14b", false);
    public static final PhysicalRegister r15 = new PhysicalRegister("r15", "r15b", false);

    public static final Set<PhysicalRegister> callerSaveRegisters = new HashSet<>();
    public static final Set<PhysicalRegister> calleeSaveRegisters = new HashSet<>();
    public static final LinkedList<PhysicalRegister> argumentPassRegisters = new LinkedList<>();
    public static final LinkedList<PhysicalRegister> allRegisters = new LinkedList<>();

    public static final VirtualRegister vrax = new I64Value("vrax", rax);
    public static final VirtualRegister vrcx = new I64Value("vrcx", rcx);
    public static final VirtualRegister vrdx = new I64Value("vrdx", rdx);
    public static final VirtualRegister vrbx = new I64Value("vrbx", rbx);
    public static final VirtualRegister vrsi = new I64Value("vrsi", rsi);
    public static final VirtualRegister vrdi = new I64Value("vrdi", rdi);
    public static final VirtualRegister vrsp = new I64Value("vrsp", rsp);
    public static final VirtualRegister vrbp = new I64Value("vrbp", rbp);
    public static final VirtualRegister vr8 = new I64Value("vr8", r8);
    public static final VirtualRegister vr9 = new I64Value("vr9", r9);
    public static final VirtualRegister vr10 = new I64Value("vr10", r10);
    public static final VirtualRegister vr11 = new I64Value("vr11", r11);
    public static final VirtualRegister vr12 = new I64Value("vr12", r12);
    public static final VirtualRegister vr13 = new I64Value("vr13", r13);
    public static final VirtualRegister vr14 = new I64Value("vr14", r14);
    public static final VirtualRegister vr15 = new I64Value("vr15", r15);

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
        for (VirtualRegister virtualRegister : allVRegisters) {
            allRegisters.add(virtualRegister.color);
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
    public String lowByteName;

    private PhysicalRegister(String name, String lowByteName, boolean callerSave) {
        super(name);
        this.lowByteName = lowByteName;
        this.isCallerSave = callerSave;
        this.isCalleeSave = !callerSave;
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }

    public boolean isCalleeSave() {
        return isCalleeSave;
    }

    public boolean isCallerSave() {
        return isCallerSave;
    }

    public String getLowByteName() {
        return lowByteName;
    }
}

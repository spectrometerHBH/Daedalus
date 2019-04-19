package Compiler.IR.Operand;

import Compiler.IR.IRVisitor;

import java.util.HashSet;
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
    public static final Set<PhysicalRegister> argumentPassRegisters = new HashSet<>();

    static {
        argumentPassRegisters.add(rdi);
        argumentPassRegisters.add(rsi);
        argumentPassRegisters.add(rdx);
        argumentPassRegisters.add(rcx);
        argumentPassRegisters.add(r8);
        argumentPassRegisters.add(r9);
    }

    private PhysicalRegister(String name, boolean callerSave) {
        super(name);
        if (callerSave) callerSaveRegisters.add(this);
        else calleeSaveRegisters.add(this);
    }

    @Override
    public void accept(IRVisitor irVisitor) {
        irVisitor.visit(this);
    }
}

package Compiler.IR.Operand;

import Compiler.IR.BasicBlock;

import java.util.HashSet;
import java.util.Set;

public abstract class VirtualRegister extends Register {
    public RegisterInformation info;

    public VirtualRegister() {
    }

    public VirtualRegister(String name) {
        super(name);
    }

    public void initRegisterInformation() {
        info = new RegisterInformation();
    }

    public void appendDefBB(BasicBlock basicBlock) {
        info.defBB.add(basicBlock);
    }

    public Set<BasicBlock> getDefBB() {
        return info.defBB;
    }
}

class RegisterInformation {
    Set<BasicBlock> defBB = new HashSet<>();
}
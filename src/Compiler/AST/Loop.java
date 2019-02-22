package Compiler.AST;

import Compiler.IR.BasicBlock;

public interface Loop {
    BasicBlock getStepBB();
    BasicBlock getMergeBB();
}

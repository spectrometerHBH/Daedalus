# IRInterpreter
Single file interpreter (or naive virtual machine) for my intermediate representation. SSA support has been added.

This project is inherited from Lequn Chen(abcdabcd987) and is modified by Bohan Hou(spectrometer). 

Compared to last version, this version implemented global variables, static strings and builtin function calls, which is nearly fully compatible with LLVM-like IR. 

## API

#### `public IRInterpreter(InputStream in, boolean isSSAMode, DataInputStream data_in, DataOutputStream data_out) throws IOException`
Read IR from `in` and build internal data structures. Enable SSA mode if `isSSAMode` is true. If nothing goes wrong, mark `isReady()` true.
`data_in` and `data_out` are streams for print and read use in IR test.

#### `void run()`
Run the virtual machine.

#### `void setInstructionLimit(int instLimit)`
Set the maximum instructions that the virtual machine can operate.

#### `boolean isReady()`
Check if the virtual machine is ready to run.

#### `int getExitcode()`
Get the exitcode of the virtual machine.

#### `boolean exitException()`
Return true if the virtual machine is terminated by an exception.

## Brief Introduction to IR
//Modified to be more LLVM-like

- Infinite number of registers.
- Registers are writable if not in SSA Mode.
- Global Registers' name start with `@`. e.g. `@N_1`, `@M_1`, `@str_1`, ...
- Static Strings' : `@str = "aaaaaaa"` ...
- Local Registers' name start with `%`. e.g. `%t1`, `%arr_addr`, `%arr.addr`, ...
- Blocks' name starts without indent and ends with `:`. e.g. `entry:`, `if_true:`, `if.true:`, ...
- A block must end with a jump instruction, i.e., fall-through is not allowed.
- Function call: `%dest = call name %arg1 %arg2 ...`.
--Builtin Function Name : s
- Use `define i64/void @name %arg1 %arg2 ... {` to start a function definition. `func` can be replaced with `void` if no return value.
- The entry block of a function is the first block in it.
- Heap allocation: `%dest = alloc %size` will acquire `%size` bytes from heap.

## Brief Introduction to SSA Mode
In SSA Mode,

- A register can only be defined once statically (not dynamically).
- A `phi` node must have source register for all possible incoming blocks.
- A source register in a `phi` node can take a special value `undef`, which says any value is acceptable in that context.
- All `phi` nodes should be placed in the front of a block, i.e., `phi` nodes are forbidden in the middle of a block.

## Brief Introduction to VM

- All registers are 64-bit integer register.
- All integers are signed integer.
- Functions do not share any register except global registers.
- Will terminate if memory access violation occurs.
- Will terminate if arithmetic error occurs.
- Will terminate if you try to read a register that has no value.
- Execution starts at `__init` function.
- A random padding `(< 4KB)` is added after `alloc` in order to help detect memory access violation.

## Instruction Set

You can guess the meaning from their names. All register except `%dest` and `%reg*` can be replaced by immediate number. `%reg*` can also be replaced by `undef`.

```
Jump Instruction:
    ret %src
    jump target
    br %cond ifTrue ifFalse

Memory Access Instruction:
    store %src %dest        // M[%dest] <- %src
    %dest = load %addr      // %dest <- M[%addr] (I believe simplicity favours regularity)
    %dest = alloc %size     // Allocate %size byte memory in heap space and return top pointer

Function Call Instruction:
    call funcname %op1 %op2 %op3 ...
    %dest = call funcname %op1 %op2 %op3 ...

Register Transfer Instruction:
    %dest = move %src

Phi Instruction:
    %dest = phi block1 %reg1 block2 %reg2 ...

Binary Instruction:
Arithmetic:
    %dest = add %src1 %src2
    %dest = sub %src1 %src2
    %dest = mul %src1 %src2
    %dest = div %src1 %src2
    %dest = mod %src1 %src2
    %dest = shl %src1 %src2
    %dest = shr %src1 %src2
    %dest = and %src1 %src2
    %dest = or  %src1 %src2
    %dest = xor %src1 %src2
Logical:
    %dest = slt %src1 %src2
    %dest = sle %src1 %src2
    %dest = seq %src1 %src2
    %dest = sne %src1 %src2
    %dest = sge %src1 %src2
    %dest = sgt %src1 %src2

Unary Instruction:
    %dest = neg %src
    %dest = not %src
    
```

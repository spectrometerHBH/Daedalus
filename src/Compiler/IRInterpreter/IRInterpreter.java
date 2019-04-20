package Compiler.IRInterpreter;

import org.apache.commons.text.StringEscapeUtils;

import java.io.*;
import java.util.*;

/**
 * Created by abcdabcd987 on 2016-04-23.
 * <p>
 * Modified by spectrometer on 2019-03-03.
 * Modified for adaption for My IR
 * Support global variables, static strings and builtin function call
 * Special thanks to Lequn Chen for his fundamental work
 */

public class IRInterpreter {
    // instructions that have no destination
    static private final Set<String> opnames1 = new HashSet<>(Arrays.asList(
            "store", "br", "jump", "ret", "call"
    ));
    // instructions that have destination
    static private final Set<String> opnames2 = new HashSet<>(Arrays.asList(
            "load", "move", "alloc", "phi", "lea",
            "add", "sub", "mul", "div", "mod", "shl", "shr", "and", "or", "xor", "neg", "not",
            "slt", "sgt", "sle", "sge", "seq", "sne", "call"
    ));
    // instructions that have exactly 1 operand
    static private final Set<String> opnum1 = new HashSet<>(Arrays.asList(
            "ret", "jump", "move", "neg", "not", "alloc"
    ));
    private final Set<String> opjump = new HashSet<>(Arrays.asList(
            "br", "jump", "ret"
    ));
    private Map<String, Function> functions = new HashMap<>();
    private BasicBlock curBB = null;
    private Function curFunc = null;
    private Instruction curInst = null;
    private boolean isSSAMode = true;
    private int lineno = 0;

    //====== read text IR
    private String line;
    private BufferedReader br;
    private boolean allowPhi;
    private Map<String, Register> registers;
    private Map<String, Register> globalRegisters = new HashMap<>();
    private Map<Long, String> stringObjects = new HashMap<>();
    private Map<String, Long> tmpRegister = new HashMap<>(); // for phi node
    private Map<Long, Byte> memory = new HashMap<>();
    private long heapTop = (int) (Math.random() * 4096);
    private long retValue;
    private boolean ret;
    private int cntInst = 0;
    private BasicBlock lastBB = null;
    private long staticStringCnt = 0;
    //====== SSA check
    private boolean isReady = false;

    //====== run IR
    private long exitcode = -1;
    private boolean exception = false;
    private int instLimit = Integer.MAX_VALUE;

    private DataInputStream data_in;
    private PrintStream data_out;
    private Scanner scanner;

    public IRInterpreter(InputStream in, boolean isSSAMode, DataInputStream data_in, PrintStream data_out) throws IOException {
        this.isSSAMode = isSSAMode;
        this.data_in = data_in;
        this.data_out = data_out;
        this.scanner = new Scanner(data_in);

        try {
            br = new BufferedReader(new InputStreamReader(in));
            while (readLine() != null) {
                if (line.startsWith("define")) {
                    readFunction();
                } else {
                    readGlobalVariable();
                }
            }
            br.close();
            if (isSSAMode) perfromSSACheck();
            isReady = true;
        } catch (SemanticError e) {
            System.err.println("Semantic Error");
            System.err.println("    " + e.getMessage());
            exitcode = -1;
            exception = true;
        } catch (RuntimeError runtimeError) {
            runtimeError.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        boolean ssa = args.length > 0 && args[0].trim().equals("+ssa");
        InputStream in = new FileInputStream("ir_out.txt");
        IRInterpreter vm = new IRInterpreter(in, ssa, new DataInputStream(System.in), new PrintStream(System.out));
        //if (ssa)
        //    System.out.println("running with SSA mode");
        //else
        //    System.out.println("running without SSA mode");
        //vm.setInstructionLimit(1 << 26);
        vm.run();
        System.exit((int) vm.getExitcode());
        //System.out.println("exitcode:  " + vm.getExitcode());
        //System.out.println("exception: " + vm.exitException());
    }

    private String readLine() throws IOException {
        do {
            line = br.readLine();
            if (line == null) break;
            ++lineno;
            line = line.trim();
        } while (line.equals(""));
        return line;
    }

    private List<String> splitBySpaces(String line) {
        return Arrays.asList(line.trim().split(" +"));
    }

    private void readInstruction() throws SemanticError {
        // basic block
        if (line.endsWith(":")) {
            curBB = new BasicBlock();
            curBB.name = line.substring(0, line.length() - 1);
            if (curFunc.blocks.containsKey(curBB.name))
                throw new SemanticError("label `" + curBB.name + "` has already been defined");
            curFunc.blocks.put(curBB.name, curBB);
            if (curFunc.entry == null) curFunc.entry = curBB;
            allowPhi = isSSAMode;
            return;
        }

        // instruction
        String[] split = line.split("=");
        Instruction inst = new Instruction();
        List<String> words = splitBySpaces(split[split.length - 1]);
        inst.operator = words.get(0);
        if (split.length == 1) {
            if (!opnames1.contains(inst.operator)) throw new SemanticError("illegal operator " + inst.operator);
        } else if (split.length == 2) {
            if (!opnames2.contains(inst.operator)) throw new SemanticError("illegal operator " + inst.operator);
        } else {
            throw new SemanticError("illegal operator " + inst.operator);
        }
        inst.lineno = lineno;
        inst.text = line;

        if (!inst.operator.equals("phi")) {
            allowPhi = false;
            curBB.instructions.add(inst);
        }

        // save operands to variables
        switch (inst.operator) {
            case "lea":
                inst.dest = split[0].trim();
                inst.op1 = words.get(1).equals("null") ? null : words.get(1);
                inst.op2 = words.get(2).equals("null") ? null : words.get(2);
                inst.scale = Integer.valueOf(words.get(3));
                inst.offset = Integer.valueOf(words.get(4));
                return;
            case "store":
                inst.op1 = words.get(2);
                inst.op2 = words.get(1);
                //inst.scale = Integer.valueOf(words.get(1));
                //inst.offset = Integer.valueOf(words.get(4));
                return;
            case "load":
            case "alloc":
                inst.dest = split[0].trim();
                inst.op1 = words.get(1);
                //inst.scale = Integer.valueOf(words.get(1));
                //inst.offset = Integer.valueOf(words.get(3));
                return;
            case "call":
                if (split.length == 2) inst.dest = split[0].trim();
                inst.op1 = words.get(1);
                inst.args = words.subList(2, words.size());
                return;
            case "br":
                inst.dest = words.get(1);
                inst.op1 = words.get(2);
                inst.op2 = words.get(3);
                return;
            case "phi":
                if (!allowPhi) throw new SemanticError("`phi` is not allowed here");
                if ((words.size() & 1) == 0) throw new SemanticError("the number of `phi` argument should be even");
                PhiNode phi = new PhiNode(inst);
                phi.dest = split[0].trim();
                for (int i = 1; i < words.size(); i += 2) {
                    String label = words.get(i);
                    String reg = words.get(i + 1);
                    if (!reg.startsWith("%") && !reg.startsWith("@") && !reg.equals("undef"))
                        throw new SemanticError("source of a phi node should be a register or `undef`");
                    phi.paths.put(label, reg);
                }
                curBB.phi.add(phi);
                return;
            default:
                if (split.length == 2) inst.dest = split[0].trim();
                if (inst.operator.equals("ret") && words.size() == 1) return;
                inst.op1 = words.get(1);
                if (opnum1.contains(inst.operator)) return;
                inst.op2 = words.get(2);
        }
    }

    private void readFunction() throws IOException, SemanticError {
        List<String> words = splitBySpaces(line);
        if (!words.get(words.size() - 1).equals("{")) throw new SemanticError("expected a `{`");
        curFunc = new Function();
        curFunc.hasReturnValue = line.startsWith("define i64 ");
        curFunc.name = words.get(2).substring(1);
        curFunc.args = words.subList(3, words.size() - 1);
        if (functions.containsKey(curFunc.name))
            throw new SemanticError("function `" + curFunc.name + "` has already been defined");
        functions.put(curFunc.name, curFunc);

        allowPhi = isSSAMode;
        while (!readLine().equals("}")) {
            readInstruction();
        }

    }

    private void readGlobalVariable() throws RuntimeError {
        if (!line.startsWith("@")) throw new RuntimeException("global variable should start with '@'");
        if (line.contains("=")) {
            //string
            String[] words = line.split("=", 2);
            String name = words[0].trim();
            words[1] = words[1].trim();
            String tmp = words[1].substring(1, words[1].length() - 1);
            String val = StringEscapeUtils.unescapeJava(tmp);
            Register reg = new Register();
            reg.value = staticStringCnt;
            reg.timestamp = 0;
            globalRegisters.put(name, reg);
            stringObjects.put(staticStringCnt++, val);
        } else {
            //other, just alloc some space on heap for convenience
            String name = line.trim();
            Register reg = new Register();
            reg.value = 0;
            reg.timestamp = 0;
            globalRegisters.put(name, reg);

            long size = 8;
            registerWrite(name, heapTop);
            for (int i = 0; i < size; ++i) memory.put(heapTop + i, (byte) (0));
            heapTop += size;
            heapTop += (int) (Math.random() * 4096);
        }
    }

    private void perfromSSACheck() throws SemanticError {
        Set<String> regDef = new HashSet<>();
        for (Function func : functions.values()) {
            regDef.clear();
            for (BasicBlock BB : func.blocks.values())
                for (Instruction inst : BB.instructions)
                    if (inst.dest != null && !inst.operator.equals("br"))
                        if (regDef.contains(inst.dest)) {
                            lineno = inst.lineno;
                            line = inst.text;
                            throw new SemanticError("a register should only be defined once");
                        } else {
                            regDef.add(inst.dest);
                        }
        }
    }

    private int memoryRead(long addr) throws RuntimeError {
        Byte data = memory.get(addr);
        if (data == null) throw new RuntimeError("memory read violation");
        return data & 0xFF;
    }

    private void memoryWrite(long addr, Byte value) throws RuntimeError {
        if (!memory.containsKey(addr))
            throw new RuntimeError("memory write violation");
        memory.put(addr, value);
    }

    private long registerRead(String name) throws RuntimeError {
        Register reg = registers.get(name);
        if (reg == null) throw new RuntimeError("register `" + name + "` haven't been defined yet");
        return reg.value;
    }

    private long globalRegistersRead(String name) throws RuntimeError {
        Register reg = globalRegisters.get(name);
        if (reg == null) throw new RuntimeError("global register `" + name + "` haven't been defined yet");
        return reg.value;
    }

    private void registerWrite(String name, long value) throws RuntimeError {
        if (!name.startsWith("@") && !name.startsWith("%")) throw new RuntimeError("not a register");
        if (name.startsWith("@")) {
            Register reg = globalRegisters.get(name);
            if (reg == null) {
                reg = new Register();
                globalRegisters.put(name, reg);
            }
            reg.value = value;
            reg.timestamp = cntInst;
        } else {
            Register reg = registers.get(name);
            if (reg == null) {
                reg = new Register();
                registers.put(name, reg);
            }
            reg.value = value;
            reg.timestamp = cntInst;
        }
    }

    private long readSrc(String name) throws RuntimeError {
        if (name.startsWith("%")) return registerRead(name);
        else if (name.startsWith("@")) return globalRegistersRead(name);
        else return Long.valueOf(name);
    }

    private void jump(String name) throws RuntimeError {
        BasicBlock BB = curFunc.blocks.get(name);
        if (BB == null)
            throw new RuntimeError("cannot resolve block `" + name + "` in function `" + curFunc.name + "`");
        lastBB = curBB;
        curBB = BB;
    }

    private void runInstruction() throws RuntimeError, IOException {
        //if (curInst.lineno == 14){
        //    System.err.print("break point");
        // }
        if (++cntInst >= instLimit) throw new RuntimeError("instruction limit exceeded");
        switch (curInst.operator) {
            case "lea":
                long base_ = curInst.op1 == null ? 0 : readSrc(curInst.op1);
                long index_ = curInst.op2 == null ? 0 : readSrc(curInst.op2);
                registerWrite(curInst.dest, base_ + index_ * curInst.scale + curInst.offset);
                return;

            case "load":
                long addr = readSrc(curInst.op1); //+ curInst.offset;
                curInst.scale = 8;
                long res = 0;
                for (int i = 0; i < curInst.scale; ++i) res = (res << 8) | memoryRead(addr + i);
                registerWrite(curInst.dest, res);
                return;

            case "store":
                long address = readSrc(curInst.op1); // + curInst.offset;
                long data = readSrc(curInst.op2);
                curInst.scale = 8;
                for (long i = curInst.scale - 1; i >= 0; --i) {
                    memoryWrite(address + i, (byte) (data & 0xFF));
                    data >>= 8;
                }
                return;

            case "alloc":
                long size = readSrc(curInst.op1);
                registerWrite(curInst.dest, heapTop);
                for (int i = 0; i < size; ++i) memory.put(heapTop + i, (byte) (0));
                heapTop += size;
                heapTop += (int) (Math.random() * 4096);
                return;

            case "ret":
                if (curInst.op1 != null) retValue = readSrc(curInst.op1);
                ret = true;
                return;

            case "br":
                long cond = readSrc(curInst.dest);
                jump(cond == 0 ? curInst.op2 : curInst.op1);
                return;

            case "jump":
                jump(curInst.op1);
                return;

            case "call":
                Function func = functions.get(curInst.op1);
                switch (curInst.op1) {
                    case "string.length": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        registerWrite(curInst.dest, str.length());
                        return;
                    }
                    case "string.substring": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        long left = readSrc(curInst.args.get(1));
                        long right = readSrc(curInst.args.get(2));
                        String resStr = str.substring((int) left, (int) right);
                        registerWrite(curInst.dest, staticStringCnt);
                        stringObjects.put(staticStringCnt++, resStr);
                        return;
                    }
                    case "string.parseInt": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        char[] charArray = str.toCharArray();
                        long result = 0;
                        for (char ch : charArray) {
                            if (ch < '0' || ch > '9') break;
                            result = result * 10 + ch - '0';
                        }
                        registerWrite(curInst.dest, result);
                        return;
                    }
                    case "string.ord": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        long pos = readSrc(curInst.args.get(1));
                        registerWrite(curInst.dest, (int) str.charAt((int) pos));
                        return;
                    }
                    case "string.add": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        String resStr = str1 + str2;
                        registerWrite(curInst.dest, staticStringCnt);
                        stringObjects.put(staticStringCnt++, resStr);
                        return;
                    }
                    case "string.lt": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) < 0 ? 1 : 0);
                        return;
                    }
                    case "string.leq": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) <= 0 ? 1 : 0);
                        return;
                    }
                    case "string.eq": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) == 0 ? 1 : 0);
                        return;
                    }
                    case "string.geq": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) >= 0 ? 1 : 0);
                        return;
                    }
                    case "string.gt": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) > 0 ? 1 : 0);
                        return;
                    }
                    case "string.neq": {
                        String str1 = stringObjects.get(readSrc(curInst.args.get(0)));
                        String str2 = stringObjects.get(readSrc(curInst.args.get(1)));
                        registerWrite(curInst.dest, str1.compareTo(str2) != 0 ? 1 : 0);
                        return;
                    }
                    case "print": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        data_out.print(str);
                        return;
                    }
                    case "println": {
                        String str = stringObjects.get(readSrc(curInst.args.get(0)));
                        data_out.print(str);
                        data_out.print('\n');
                        return;
                    }
                    case "getString": {
                        String resStr = scanner.next();
                        registerWrite(curInst.dest, staticStringCnt);
                        stringObjects.put(staticStringCnt++, resStr);
                        return;
                    }
                    case "getInt": {
                        registerWrite(curInst.dest, scanner.nextInt());
                        //if (scanner.hasNextLine()) scanner.nextLine();
                        return;
                    }
                    case "toString": {
                        long i = readSrc(curInst.args.get(0));
                        String resStr = String.valueOf(i);
                        registerWrite(curInst.dest, staticStringCnt);
                        stringObjects.put(staticStringCnt++, resStr);
                        return;
                    }
                    default:
                        break;
                }
                if (func == null) throw new RuntimeError("cannot resolve function `" + curInst.op1 + "`");
                if (curInst.dest != null && !func.hasReturnValue)
                    throw new RuntimeError("function `" + func.name + "` has not return value");
                Map<String, Register> regs = new HashMap<>();
                if (curInst.args.size() != func.args.size()) throw new RuntimeError("argument scale cannot match");
                //This loop passes reg values in this function to correspondent function values & build new register table
                for (int i = 0; i < curInst.args.size(); ++i) {
                    String name = func.args.get(i);
                    Register reg = regs.get(name);
                    if (reg == null) {
                        reg = new Register();
                        regs.put(name, reg);
                    }
                    reg.value = readSrc(curInst.args.get(i));
                    reg.timestamp = cntInst;
                }

                Map<String, Register> bakRegisters = registers;
                BasicBlock bakCurBB = curBB;
                BasicBlock bakLastBB = lastBB;
                Instruction bakCurInst = curInst;
                Function bakCurFunc = curFunc;
                registers = regs; // 'registers' is used as the only register table for a function

                runFunction(func);

                ret = false;
                curFunc = bakCurFunc;
                curInst = bakCurInst;
                lastBB = bakLastBB;
                curBB = bakCurBB;
                registers = bakRegisters;
                if (curInst.dest != null) registerWrite(curInst.dest, retValue);
                return;

            case "div":
                if (readSrc(curInst.op2) == 0) throw new RuntimeError("divide by zero");
                registerWrite(curInst.dest, readSrc(curInst.op1) / readSrc(curInst.op2));
                return;

            case "mod":
                if (readSrc(curInst.op2) == 0) throw new RuntimeError("mod by zero");
                registerWrite(curInst.dest, readSrc(curInst.op1) % readSrc(curInst.op2));
                return;

            case "move":
                registerWrite(curInst.dest, readSrc(curInst.op1));
                return;
            case "neg":
                registerWrite(curInst.dest, -readSrc(curInst.op1));
                return;
            case "not":
                registerWrite(curInst.dest, ~readSrc(curInst.op1));
                return;
            case "add":
                registerWrite(curInst.dest, readSrc(curInst.op1) + readSrc(curInst.op2));
                return;
            case "sub":
                registerWrite(curInst.dest, readSrc(curInst.op1) - readSrc(curInst.op2));
                return;
            case "mul":
                registerWrite(curInst.dest, readSrc(curInst.op1) * readSrc(curInst.op2));
                return;
            case "shl":
                registerWrite(curInst.dest, readSrc(curInst.op1) << readSrc(curInst.op2));
                return;
            case "shr":
                registerWrite(curInst.dest, readSrc(curInst.op1) >> readSrc(curInst.op2));
                return;
            case "and":
                registerWrite(curInst.dest, readSrc(curInst.op1) & readSrc(curInst.op2));
                return;
            case "or":
                registerWrite(curInst.dest, readSrc(curInst.op1) | readSrc(curInst.op2));
                return;
            case "xor":
                registerWrite(curInst.dest, readSrc(curInst.op1) ^ readSrc(curInst.op2));
                return;
            case "slt":
                registerWrite(curInst.dest, readSrc(curInst.op1) < readSrc(curInst.op2) ? 1 : 0);
                return;
            case "sgt":
                registerWrite(curInst.dest, readSrc(curInst.op1) > readSrc(curInst.op2) ? 1 : 0);
                return;
            case "sle":
                registerWrite(curInst.dest, readSrc(curInst.op1) <= readSrc(curInst.op2) ? 1 : 0);
                return;
            case "sge":
                registerWrite(curInst.dest, readSrc(curInst.op1) >= readSrc(curInst.op2) ? 1 : 0);
                return;
            case "seq":
                registerWrite(curInst.dest, readSrc(curInst.op1) == readSrc(curInst.op2) ? 1 : 0);
                return;
            case "sne":
                registerWrite(curInst.dest, readSrc(curInst.op1) != readSrc(curInst.op2) ? 1 : 0);
                return;

            default:
                throw new RuntimeError("unknown operation `" + curInst.operator + "`");
        }
    }

    //====== Exceptions

    private void runFunction(Function func) throws RuntimeError, IOException {
        curFunc = func;
        curBB = func.entry;
        if (curBB == null) throw new RuntimeError("no entry block for function `" + func.name + "`");

        while (true) {
            BasicBlock BB = curBB;
            if (!opjump.contains(BB.instructions.get(BB.instructions.size() - 1).operator))
                throw new RuntimeError("block " + BB.name + " has no end instruction");

            // run phi nodes concurrently
            if (!curBB.phi.isEmpty()) {
                ++cntInst;
                tmpRegister.clear();
                for (PhiNode phi : curBB.phi) {
                    curInst = phi;
                    String regName = phi.paths.get(lastBB.name);
                    if (regName == null) {
                        throw new RuntimeError("this phi node has no value from incoming block `" + lastBB.name + "`");
                    } else {
                        long value = regName.equals("undef") ? (int) (Math.random() * Integer.MAX_VALUE) : readSrc(regName);
                        tmpRegister.put(phi.dest, value);
                    }
                }
                for (Map.Entry<String, Long> e : tmpRegister.entrySet()) {
                    registerWrite(e.getKey(), e.getValue());
                }
            }

            for (Instruction inst : BB.instructions) {
                curInst = inst;
                runInstruction();
                if (ret) return;
                if (curBB != BB) break; // jumped
            }
        }
    }

    //====== public methods

    public void run() {
        try {
            if (!isReady) throw new RuntimeException("not ready");
            Function init = functions.get("__init");
            if (init == null) throw new RuntimeError("cannot find `__init` function");
            registers = new HashMap<>();
            runFunction(init);
            exitcode = retValue;
            exception = false;
        } catch (RuntimeError e) {
            System.err.println("Runtime Error");
            System.err.println("    " + e.getMessage());
            exitcode = -1;
            exception = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.err.println("exitcode:  " + exitcode);
        System.err.println("exception: " + retValue);
        isReady = false;
    }

    public void setInstructionLimit(int instLimit) {
        this.instLimit = instLimit;
    }

    public boolean isReady() {
        return isReady;
    }

    public long getExitcode() {
        return exitcode;
    }

    public boolean exitException() {
        return exception;
    }

    private static class Instruction {
        String operator;
        String dest;        // used as `cond` for `br`
        String op1;
        String op2;
        long scale;           // for `load` / `store`
        long offset;         // for `load` / `store`
        List<String> args;  // for `call` / `phi`

        int lineno;
        String text;
    }

    private static class PhiNode extends Instruction {
        HashMap<String, String> paths = new HashMap<>();

        PhiNode(Instruction inst) {
            this.operator = inst.operator;
            this.dest = inst.dest;
            this.op1 = inst.op1;
            this.op2 = inst.op2;
            this.scale = inst.scale;
            this.offset = inst.offset;
            this.args = inst.args;
            this.lineno = inst.lineno;
            this.text = inst.text;
        }
    }

    private static class BasicBlock {
        String name;
        List<Instruction> instructions = new ArrayList<>();
        List<PhiNode> phi = new ArrayList<>();
    }

    private static class Function {
        boolean hasReturnValue;
        String name;
        BasicBlock entry;
        List<String> args;
        Map<String, BasicBlock> blocks = new HashMap<>();
    }

    private static class Register {
        long value;
        int timestamp;
    }

    private class SemanticError extends Exception {
        SemanticError(String reason) {
            super(reason + " | line " + lineno + ": " + line);
        }
    }

    private class RuntimeError extends Exception {
        RuntimeError(String reason) {
            super(curInst != null ? reason + " | line " + curInst.lineno + ": " + curInst.text : reason);
        }
    }
}


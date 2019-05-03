package Compiler.IRInterpreter;

import org.apache.commons.text.StringEscapeUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * Created by abcdabcd987 on 2016-04-23.
 * <p>
 * Modified by spectrometer on 2019-03-03.
 * Modified for adaption for My IR
 * Support global variables, static strings and builtin function call
 * Special thanks to Lequn Chen for his fundamental work
 */

public class IRInterpreter_codegen {
    // instructions that have no destination
    static private final Set<String> opnames1 = new HashSet<>(Arrays.asList(
            "store", "br", "jump", "ret", "call", "cmp", "push", "pop"
    ));
    // instructions that have destination
    static private final Set<String> opnames2 = new HashSet<>(Arrays.asList(
            "load", "move", "alloc", "phi", "lea",
            "add", "sub", "mul", "div", "mod", "shl", "shr", "and", "or", "xor", "neg", "not",
            "call"
    ));
    // instructions that have exactly 1 operand
    static private final Set<String> opnum1 = new HashSet<>(Arrays.asList(
            "ret", "jump", "move", "neg", "not", "alloc", "push", "pop"
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
    private Map<String, Register> registers = new HashMap<>();
    private Map<String, Register> globalRegisters = new HashMap<>();
    private Map<String, Long> tmpRegister = new HashMap<>(); // for phi node
    private Map<Long, Byte> memory = new HashMap<>();
    private Map<Long, Byte> stackMemory = new HashMap<>();
    private Map<String, Boolean> cmpResult = new HashMap<>();

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

    public IRInterpreter_codegen(InputStream in, boolean isSSAMode, DataInputStream data_in, PrintStream data_out) throws IOException {
        this.isSSAMode = false;
        this.data_in = data_in;
        this.data_out = data_out;
        this.scanner = new Scanner(data_in);
        registers.put("%rax", new Register());
        registers.put("%rbx", new Register());
        registers.put("%rcx", new Register());
        registers.put("%rdx", new Register());
        registers.put("%rsp", new Register());
        registers.put("%rbp", new Register());
        registers.put("%rdi", new Register());
        registers.put("%rsi", new Register());
        registers.put("%r8", new Register());
        registers.put("%r9", new Register());
        registers.put("%r10", new Register());
        registers.put("%r11", new Register());
        registers.put("%r12", new Register());
        registers.put("%r13", new Register());
        registers.put("%r14", new Register());
        registers.put("%r15", new Register());

        registers.get("%rbp").value = Integer.MAX_VALUE;
        registers.get("%rbp").timestamp = 0;
        registers.get("%rsp").value = Integer.MAX_VALUE;
        registers.get("%rsp").timestamp = 0;

        cmpResult.put("slt", false);
        cmpResult.put("sle", false);
        cmpResult.put("seq", false);
        cmpResult.put("sge", false);
        cmpResult.put("sgt", false);
        cmpResult.put("sne", false);

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
        IRInterpreter_codegen vm = new IRInterpreter_codegen(in, ssa, new DataInputStream(System.in), new PrintStream(System.out));
        vm.run();
        System.exit((int) vm.getExitcode());
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
            case "cmp":
                inst.op1 = words.get(1);
                inst.op2 = words.get(2);
                return;

            case "pop":
            case "push":
                inst.op1 = words.get(1);
                return;

            case "lea":
            case "load":
                inst.dest = split[0].trim();
                inst.op1 = words.get(1).equals("null") ? null : words.get(1);
                inst.op2 = words.get(2).equals("null") ? null : words.get(2);
                inst.scale = Integer.valueOf(words.get(3));
                inst.offset = Integer.valueOf(words.get(4));
                return;

            case "store":
                inst.dest = words.get(1);
                inst.op1 = words.get(2).equals("null") ? null : words.get(2);
                inst.op2 = words.get(3).equals("null") ? null : words.get(3);
                inst.scale = Integer.valueOf(words.get(4));
                inst.offset = Integer.valueOf(words.get(5));
                return;

            case "alloc":
                inst.dest = split[0].trim();
                inst.op1 = words.get(1);
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
            reg.value = heapTop;
            reg.timestamp = 0;
            globalRegisters.put(name, reg);
            new StringPair(val.length(), val);
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

    private int stackRead(long addr) throws RuntimeError {
        if (addr < registerRead("%rsp")) throw new RuntimeError("stack read violation");
        Byte data = stackMemory.get(addr);
        if (data == null) {
            stackMemory.put(addr, (byte) 0);
            return 0;
        } else return data & 0xFF;
    }

    private void stackWrite(long addr, Byte value) throws RuntimeError {
        if (addr < registerRead("%rsp")) throw new RuntimeError("stack write violation");
        stackMemory.put(addr, value);
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
            if (reg == null) throw new RuntimeError("not a legal register");
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
            case "pop":
                long addr_pop = registerRead("%rsp");
                long res_pop = 0;
                for (int i = 0; i < 8; ++i) res_pop = (res_pop << 8) | stackRead(addr_pop + i);
                registerWrite(curInst.op1, res_pop);
                registerWrite("%rsp", registerRead("%rsp") + 8);
                return;

            case "push":
                registerWrite("%rsp", registerRead("%rsp") - 8);
                long addr_push = registerRead("%rsp");
                long data_push = readSrc(curInst.op1);
                for (long i = 8 - 1; i >= 0; --i) {
                    stackWrite(addr_push + i, (byte) (data_push & 0xFF));
                    data_push >>= 8;
                }
                return;

            case "cmp":
                long op1 = readSrc(curInst.op1);
                long op2 = readSrc(curInst.op2);
                cmpResult.put("slt", op1 < op2);
                cmpResult.put("sle", op1 <= op2);
                cmpResult.put("seq", op1 == op2);
                cmpResult.put("sge", op1 >= op2);
                cmpResult.put("sgt", op1 > op2);
                cmpResult.put("sne", op1 != op2);
                return;

            case "lea":
                long base_lea = curInst.op1 == null ? 0 : readSrc(curInst.op1);
                long index_lea = curInst.op2 == null ? 0 : readSrc(curInst.op2);
                registerWrite(curInst.dest, base_lea + index_lea * curInst.scale + curInst.offset);
                return;

            case "load":
                long base_load = curInst.op1 == null ? 0 : readSrc(curInst.op1);
                long index_load = curInst.op2 == null ? 0 : readSrc(curInst.op2);
                long addr_load = base_load + index_load * curInst.scale + curInst.offset;
                long res = 0;
                if (curInst.op1.equals("%rbp") || curInst.op1.equals("%rsp")) {
                    for (int i = 0; i < 8; ++i) res = (res << 8) | stackRead(addr_load + i);
                } else {
                    for (int i = 0; i < 8; ++i) res = (res << 8) | memoryRead(addr_load + i);
                }
                registerWrite(curInst.dest, res);
                return;

            case "store":
                long base_store = curInst.op1 == null ? 0 : readSrc(curInst.op1);
                long index_store = curInst.op2 == null ? 0 : readSrc(curInst.op2);
                long addr_store = base_store + index_store * curInst.scale + curInst.offset;
                long data = readSrc(curInst.dest);
                if (curInst.op1.equals("%rbp") || curInst.op1.equals("%rsp")) {
                    for (long i = 8 - 1; i >= 0; --i) {
                        stackWrite(addr_store + i, (byte) (data & 0xFF));
                        data >>= 8;
                    }
                } else {
                    for (long i = 8 - 1; i >= 0; --i) {
                        memoryWrite(addr_store + i, (byte) (data & 0xFF));
                        data >>= 8;
                    }
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
                jump(cmpResult.get(curInst.dest) ? curInst.op1 : curInst.op2);
                return;

            case "jump":
                jump(curInst.op1);
                return;

            case "call":
                Function func = functions.get(curInst.op1);
                switch (curInst.op1) {
                    case "string.length": {
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
                        registerWrite(curInst.dest, str.length());
                        return;
                    }
                    case "string.substring": {
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
                        long left = readSrc(curInst.args.get(1));
                        long right = readSrc(curInst.args.get(2));
                        String resStr = str.substring((int) left, (int) right);
                        registerWrite(curInst.dest, heapTop);
                        new StringPair(resStr.length(), resStr);
                        return;
                    }
                    case "string.parseInt": {
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
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
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
                        long pos = readSrc(curInst.args.get(1));
                        registerWrite(curInst.dest, (int) str.charAt((int) pos));
                        return;
                    }
                    case "string.add": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        String resStr = str1 + str2;
                        registerWrite(curInst.dest, heapTop);
                        new StringPair(resStr.length(), resStr);
                        return;
                    }
                    case "string.lt": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) < 0 ? 1 : 0);
                        return;
                    }
                    case "string.leq": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) <= 0 ? 1 : 0);
                        return;
                    }
                    case "string.eq": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) == 0 ? 1 : 0);
                        return;
                    }
                    case "string.geq": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) >= 0 ? 1 : 0);
                        return;
                    }
                    case "string.gt": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) > 0 ? 1 : 0);
                        return;
                    }
                    case "string.neq": {
                        StringPair stringPair0 = new StringPair(readSrc(curInst.args.get(0)));
                        StringPair stringPair1 = new StringPair(readSrc(curInst.args.get(1)));
                        String str1 = stringPair0.val;
                        String str2 = stringPair1.val;
                        registerWrite(curInst.dest, str1.compareTo(str2) != 0 ? 1 : 0);
                        return;
                    }
                    case "print": {
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
                        data_out.print(str);
                        return;
                    }
                    case "println": {
                        StringPair stringPair = new StringPair(readSrc(curInst.args.get(0)));
                        String str = stringPair.val;
                        data_out.print(str);
                        data_out.print('\n');
                        return;
                    }
                    case "getString": {
                        String resStr = scanner.next();
                        registerWrite(curInst.dest, heapTop);
                        new StringPair(resStr.length(), resStr);
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
                        registerWrite(curInst.dest, heapTop);
                        new StringPair(resStr.length(), resStr);
                        return;
                    }
                    default:
                        break;
                }
                if (func == null) throw new RuntimeError("cannot resolve function `" + curInst.op1 + "`");
                BasicBlock bakCurBB = curBB;
                BasicBlock bakLastBB = lastBB;
                Instruction bakCurInst = curInst;
                Function bakCurFunc = curFunc;

                long rsp = registers.get("%rsp").value;
                registers.get("%rsp").value = rsp - 8;
                runFunction(func);
                if (registers.get("%rsp").value != rsp - 8) throw new RuntimeError("stack frame error");
                rsp = registers.get("%rsp").value;
                registers.get("%rsp").value = rsp + 8;

                ret = false;
                curFunc = bakCurFunc;
                curInst = bakCurInst;
                lastBB = bakLastBB;
                curBB = bakCurBB;
                return;

            case "div":
                if (readSrc(curInst.op2) == 0) throw new RuntimeError("divide by zero");
                long src1_div = readSrc(curInst.op1), src2_div = readSrc(curInst.op2);
                registerWrite("%rax", src1_div / src2_div);
                registerWrite("%rdx", src1_div % src2_div);
                return;

            case "mod":
                if (readSrc(curInst.op2) == 0) throw new RuntimeError("mod by zero");
                long src1_mod = readSrc(curInst.op1), src2_mod = readSrc(curInst.op2);
                registerWrite("%rax", src1_mod / src2_mod);
                registerWrite("%rdx", src1_mod % src2_mod);
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

    private class StringPair {
        long length;
        String val;

        StringPair(long addr) throws RuntimeError {
            for (int i = 0; i < 8; ++i) length = (length << 8) | memoryRead(addr + i);
            byte[] bytes = new byte[(int) length];
            for (int i = 0; i < length; ++i) bytes[i] = (byte) memoryRead(addr + 8 + i);
            val = new String(bytes, StandardCharsets.ISO_8859_1);
        }

        StringPair(long length, String val) throws RuntimeError {
            this.length = length;
            this.val = val;
            long size = 8 + length;
            for (long i = 8 - 1; i >= 0; --i) {
                memory.put(heapTop + i, (byte) (length & 0xFF));
                length >>= 8;
            }
            byte[] bytes = val.getBytes(StandardCharsets.ISO_8859_1);
            for (long i = 0; i < this.length; i++) {
                memory.put(heapTop + 8 + i, bytes[(int) i]);
            }
            heapTop += size;
            heapTop += (int) (Math.random() * 4096);
        }
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


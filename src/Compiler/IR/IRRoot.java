package Compiler.IR;

import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.StaticString;

import java.util.*;

public class IRRoot {
    public Function builtinStringLength = new Function("string.length", null);
    public Function builtinSubstring = new Function("string.substring", "__builtin_string_substring");
    public Function builtinParseInt = new Function("string.parseInt", "__builtin_string_parseInt");
    public Function builtinOrd = new Function("string.ord", "__builtin_string_ord");
    public Function builtinPrint = new Function("print", "__builtin_print");
    public Function builtinPrintln = new Function("println", "__builtin_println");
    public Function builtinGetString = new Function("getString", "__builtin_getString");
    public Function builtinGetInt = new Function("getInt", "__builtin_getInt");
    public Function builtinToString = new Function("toString", "__builtin_toString");
    public Function builtinStringAdd = new Function("string.add", "__builtin_string_add");
    public Function builtinStringLT = new Function("string.lt", "__builtin_string_less");
    public Function builtinStringLEQ = new Function("string.leq", "__builtin_string_less_equal");
    public Function builtinStringEQ = new Function("string.eq", "__builtin_string_equal");
    public Function builtinStringGEQ = new Function("string.geq", "__builtin_string_great_equal");
    public Function builtinStringGT = new Function("string.gt", "__builtin_string_great");
    public Function builtinStringNEQ = new Function("string.neq", "__builtin_string_inequal");

    private Map<String, Function> functionMap = new LinkedHashMap<>();
    private List<StaticString> staticStringList = new ArrayList<>();
    private List<GlobalVariable> globalVariableList = new ArrayList<>();

    public Map<GlobalVariable, String> staticStringValMap = new HashMap<>();
    public Set<Function> stringConstantFunctions = new HashSet<>();
    public Set<Function> builtinFunctions = new HashSet<>();

    public IRRoot() {
        stringConstantFunctions.add(builtinStringLength);
        stringConstantFunctions.add(builtinSubstring);
        stringConstantFunctions.add(builtinParseInt);
        stringConstantFunctions.add(builtinOrd);
        stringConstantFunctions.add(builtinToString);
        stringConstantFunctions.add(builtinStringAdd);
        stringConstantFunctions.add(builtinStringLT);
        stringConstantFunctions.add(builtinStringLEQ);
        stringConstantFunctions.add(builtinStringEQ);
        stringConstantFunctions.add(builtinStringGEQ);
        stringConstantFunctions.add(builtinStringGT);
        stringConstantFunctions.add(builtinStringNEQ);

        builtinFunctions.add(builtinStringLength);
        builtinFunctions.add(builtinSubstring);
        builtinFunctions.add(builtinParseInt);
        builtinFunctions.add(builtinOrd);
        builtinFunctions.add(builtinToString);
        builtinFunctions.add(builtinStringAdd);
        builtinFunctions.add(builtinStringLT);
        builtinFunctions.add(builtinStringLEQ);
        builtinFunctions.add(builtinStringEQ);
        builtinFunctions.add(builtinStringGEQ);
        builtinFunctions.add(builtinStringGT);
        builtinFunctions.add(builtinStringNEQ);
        builtinFunctions.add(builtinGetInt);
        builtinFunctions.add(builtinGetString);
        builtinFunctions.add(builtinPrint);
        builtinFunctions.add(builtinPrintln);
    }

    public void addFunction(Function function) {
        functionMap.put(function.getName(), function);
    }

    public void removeFunction(Function function) {
        functionMap.remove(function.getName());
    }

    public void addStaticString(StaticString staticString) {
        staticStringList.add(staticString);
        staticStringValMap.put((GlobalVariable) staticString.getBase(), staticString.getVal());
    }

    public void addGlobalVariable(GlobalVariable globalVariable) {
        globalVariableList.add(globalVariable);
    }

    public Map<String, Function> getFunctionMap() {
        return functionMap;
    }

    public List<StaticString> getStaticStringList() {
        return staticStringList;
    }

    public List<GlobalVariable> getGlobalVariableList() {
        return globalVariableList;
    }

    public void calcRecursiveCalleeSet() {
        functionMap.values().forEach(function -> function.recursiveCalleeSet.clear());
        Set<Function> newRecursiveCalleeSet = new HashSet<>();
        boolean changed = true;
        while (changed) {
            changed = false;
            for (Function function : functionMap.values()) {
                newRecursiveCalleeSet.clear();
                newRecursiveCalleeSet.addAll(function.calleeSet);
                function.calleeSet.forEach(callee -> newRecursiveCalleeSet.addAll(callee.recursiveCalleeSet));
                if (!newRecursiveCalleeSet.equals(function.recursiveCalleeSet)) {
                    function.recursiveCalleeSet.clear();
                    function.recursiveCalleeSet.addAll(newRecursiveCalleeSet);
                    changed = true;
                }
            }
        }
    }
}

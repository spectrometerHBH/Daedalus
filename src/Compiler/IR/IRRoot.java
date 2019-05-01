package Compiler.IR;

import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.StaticString;

import java.util.*;

public class IRRoot {
    public Function builtinStringLength = new Function("string.length");
    public Function builtinSubstring = new Function("string.substring");
    public Function builtinParseInt = new Function("string.parseInt");
    public Function builtinOrd = new Function("string.ord");
    public Function builtinPrint = new Function("print");
    public Function builtinPrintln = new Function("println");
    public Function builtinGetString = new Function("getString");
    public Function builtinGetInt = new Function("getInt");
    public Function builtinToString = new Function("toString");
    public Function builtinStringAdd = new Function("string.add");
    public Function builtinStringLT = new Function("string.lt");
    public Function builtinStringLEQ = new Function("string.leq");
    public Function builtinStringEQ = new Function("string.eq");
    public Function builtinStringGEQ = new Function("string.geq");
    public Function builtinStringGT = new Function("string.gt");
    public Function builtinStringNEQ = new Function("string.neq");

    private Map<String, Function> functionMap = new LinkedHashMap<>();
    private List<StaticString> staticStringList = new ArrayList<>();
    private List<GlobalVariable> globalVariableList = new ArrayList<>();

    public Map<GlobalVariable, String> staticStringMap = new HashMap<>();
    public Set<Function> stringConstantFunctions = new HashSet<>();

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
    }

    public void addFunction(Function function) {
        functionMap.put(function.getName(), function);
    }

    public void addStaticString(StaticString staticString) {
        staticStringList.add(staticString);
        staticStringMap.put((GlobalVariable) staticString.getBase(), staticString.getVal());
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

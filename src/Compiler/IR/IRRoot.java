package Compiler.IR;

import Compiler.IR.Operand.GlobalVariable;
import Compiler.IR.Operand.StaticString;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class IRRoot {
    private Map<String, Function> functionMap = new LinkedHashMap<>();
    private List<StaticString> staticStringList = new ArrayList<>();
    private List<GlobalVariable> globalVariableList = new ArrayList<>();

    public IRRoot(){

    }

    public void addFunction(Function function){
        functionMap.put(function.getName(), function);
    }

    public void addStaticString(StaticString staticString){
        staticStringList.add(staticString);
    }

    public void addGlobalVariable(GlobalVariable globalVariable){
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

    public Function builtinSubstring;
    public Function builtinParseInt;
    public Function builtinOrd;
    public Function builtinPrint;
    public Function builtinPrintln;
    public Function builtinGetString;
    public Function builtinGetInt;
    public Function builtinToString;
    public Function builtinStringAdd;
    public Function builtinStringLT;
    public Function builtinStringLEQ;
    public Function builtinStringEQ;
    public Function builtinStringGEQ;
    public Function builtinStringGT;
    public Function builtinStringNEQ;
}

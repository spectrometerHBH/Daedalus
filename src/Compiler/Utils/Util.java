package Compiler.Utils;

import Compiler.AST.ArrayTypeNode;
import Compiler.AST.TypeNode;
import Compiler.Symbol.ArrayType;
import Compiler.Symbol.GlobalScope;
import Compiler.Symbol.Type;

public class Util {
    public static Type TypeNode2Type(TypeNode typeNode, GlobalScope globalScope) {
        Type type = globalScope.resolveType(typeNode);
        if (typeNode instanceof ArrayTypeNode)
            return new ArrayType(type, ((ArrayTypeNode) typeNode).getDims());
        else return type;
    }
}

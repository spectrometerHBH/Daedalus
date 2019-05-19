# Daedalus
ACM Class Compiler project 

Additionally, I implemented an interpreter for IR inherited from Lequn Chen(abcdabcd987) for debug use.

## Feature
- Dead code elimination on AST
- Inline expansion
- Control flow optimization
  - Removing unreachable code
  - Removing single branch basic block
  - Converting target clear branch to jump
  - Merge basic block
- Data flow optimization based on static single assignment form
  - Construction
  - Extended local value numbering
  - Aggressive dead code elimination
  - Copy propagation
  - Constant propagation
  - Instruction combining, especially adressing mode combining
  - Destruction
- Graph coloring register allocator
  - Iterated coalescing
  - Spill heuristic based on loop level calculation

- Small optimization
  - Fast division and modular by compile time constants

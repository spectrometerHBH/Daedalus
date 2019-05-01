@__str_const_1 = "aaa"
@__str_const_2 = "bbbbb"

define i64 @main  {
main_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 24
    store %r14 %rbp null 0 -16
    store %r15 %rbp null 0 -24
    %rdi = move @__str_const_1
    %rsi = move @__str_const_2
    %rax = call string.add %rdi %rsi 
    store %rax %rbp null 0 -8
    %rdi = load %rbp null 0 -8
    %rax = call string.length %rdi 
    %r15 = move %rax
    %rdi = load %rbp null 0 -8
    %rsi = move 5
    %rax = call string.ord %rdi %rsi 
    %r15 = add %r15 %rax
    %rax = move %r15
    %r14 = load %rbp null 0 -16
    %r15 = load %rbp null 0 -24
    %rsp = add %rsp 24
    pop %rbp
    ret %rax

}

define i64 @__init  {
__init_entry_1:
    push %rbp
    %rbp = move %rsp
    %rax = call main 
    pop %rbp
    ret %rax

}


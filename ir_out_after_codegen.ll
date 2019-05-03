define i64 @__init  {
__init_entry_1:
    push %rbp
    %rbp = move %rsp
    %rax = call getString 
    %rdi = load %rax null 0 0
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rax = move 0
    pop %rbp
    ret %rax

}


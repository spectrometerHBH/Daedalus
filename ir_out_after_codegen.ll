define i64 @main  {
main_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 24
    store %rbx %rbp null 0 -16
    store %r14 %rbp null 0 -24
    %rdi = move 88
    %rax = alloc %rdi
    store %rax %rbp null 0 -8
    %r8 = load %rbp null 0 -8
    store 10 %r8 null 0 0
    %rdi = move 24
    %rax = alloc %rdi
    %r14 = move %rax
    store 2 %r14 null 0 0
    %rdi = move 48
    %rax = alloc %rdi
    %r8 = move %rax
    store 5 %r8 null 0 0
    store %r8 %r14 null 0 8
    %rdi = load %rbp null 0 -8
    store %rdi %r14 null 0 16
    %rdx = move 0
    %rdi = move 0
    jump main_for_cond_1

main_for_cond_1:
    cmp %rdx 2
    br slt main_for_body_1 main_for_merge_1

main_for_merge_1:
    %rbx = move 5
    jump main_for_cond_2

main_for_cond_2:
    cmp %rbx 10
    br slt main_for_body_2 main_for_merge_2

main_for_body_2:
    %rdx = load %r14 null 0 16
    %rdi = add %rdi 1
    store %rdi %rdx %rbx 8 8
    %rbx = add %rbx 1
    jump main_for_cond_2

main_for_merge_2:
    %rax = move 0
    %r14 = move 0
    jump main_for_cond_3

main_for_cond_3:
    cmp %r14 5
    br slt main_for_body_3 main_for_merge_3

main_for_merge_3:
    %r8 = move 0
    jump main_for_cond_4

main_for_cond_4:
    cmp %r8 10
    br slt main_for_body_4 main_for_merge_4

main_for_merge_4:
    %rbx = load %rbp null 0 -16
    %r14 = load %rbp null 0 -24
    %rsp = add %rsp 24
    pop %rbp
    ret %rax

main_for_body_4:
    %r14 = load %rbp null 0 -8
    %r14 = load %r14 %r8 8 8
    %rax = add %rax %r14
    %r8 = add %r8 1
    jump main_for_cond_4

main_for_body_3:
    %rdi = load %r8 %r14 8 8
    %rax = add %rax %rdi
    %r14 = add %r14 1
    jump main_for_cond_3

main_for_body_1:
    %rbx = move 0
    jump main_for_cond_5

main_for_cond_5:
    cmp %rbx 5
    br slt main_for_body_5 main_for_step_1

main_for_step_1:
    %rdx = add %rdx 1
    jump main_for_cond_1

main_for_body_5:
    %r11 = load %r14 %rdx 8 8
    %rdi = add %rdi 1
    store %rdi %r11 %rbx 8 8
    %rbx = add %rbx 1
    jump main_for_cond_5

}

define i64 @__init  {
__init_entry_1:
    push %rbp
    %rbp = move %rsp
    %rax = call main 
    pop %rbp
    ret %rax

}


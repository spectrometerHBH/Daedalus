@n_1
@a_1
@__str_const_1 = " "
@__str_const_2 = "\n"

define void @exchange  {
exchange_entry_1:
    push %rbp
    %rbp = move %rsp
    %rcx = load @a_1 null 0 0
    %r8 = lea %rcx %rdi 8 8
    %rdi = load %r8 null 0 0
    %r9 = lea %rcx %rsi 8 8
    %rcx = load %r9 null 0 0
    store %rcx %r8 null 0 0
    store %rdi %r9 null 0 0
    pop %rbp
    ret 

}

define i64 @makeHeap  {
makeHeap_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 32
    store %r13 %rbp null 0 -16
    store %rbx %rbp null 0 -8
    store %r12 %rbp null 0 -32
    %r12 = load @a_1 null 0 0
    %rcx = load @n_1 null 0 0
    store %rcx %rbp null 0 -24
    %r13 = load %rbp null 0 -24
    %r13 = sub %r13 1
    %rax = move %r13
    %rcx = move 2
    %rax = div %rax %rcx
    %r13 = move %rax
    jump makeHeap_while_cond_1

makeHeap_while_cond_1:
    cmp %r13 0
    br sge makeHeap_while_body_1 makeHeap_while_merge_1

makeHeap_while_merge_1:
    %rax = move 0
    %r13 = load %rbp null 0 -16
    %rbx = load %rbp null 0 -8
    %r12 = load %rbp null 0 -32
    %rsp = add %rsp 32
    pop %rbp
    ret %rax

makeHeap_while_body_1:
    %rsi = move %r13
    %rsi = mul %rsi 2
    %rcx = move %rsi
    %rcx = add %rcx 1
    %r8 = load %rbp null 0 -24
    cmp %rcx %r8
    br slt makeHeap_lhs_then_1 makeHeap_if_merge_1

makeHeap_lhs_then_1:
    %rdi = load %r12 %rcx 8 8
    %r8 = load %r12 %rsi 8 8
    cmp %rdi %r8
    br slt makeHeap_if_then_1 makeHeap_if_merge_1

makeHeap_if_then_1:
    %rsi = move %rcx
    jump makeHeap_if_merge_1

makeHeap_if_merge_1:
    %r8 = load %r12 %r13 8 8
    %rcx = load %r12 %rsi 8 8
    cmp %r8 %rcx
    br sgt makeHeap_if_then_2 makeHeap_if_merge_2

makeHeap_if_then_2:
    %rdi = move %r13
    call exchange %rdi %rsi 
    jump makeHeap_if_merge_2

makeHeap_if_merge_2:
    %r13 = sub %r13 1
    jump makeHeap_while_cond_1

}

define i64 @adjustHeap  {
adjustHeap_entry_1:
    push %rbp
    %rbp = move %rsp
    %rax = load @a_1 null 0 0
    %r9 = move 0
    jump adjustHeap_while_cond_1

adjustHeap_while_cond_1:
    %r8 = move %r9
    %r8 = mul %r8 2
    cmp %r8 %rdi
    br slt adjustHeap_while_body_1 adjustHeap_while_merge_1

adjustHeap_while_body_1:
    %rcx = move %r8
    %rcx = add %rcx 1
    cmp %rcx %rdi
    br slt adjustHeap_lhs_then_1 adjustHeap_if_merge_1

adjustHeap_lhs_then_1:
    %r10 = load %rax %rcx 8 8
    %r11 = load %rax %r8 8 8
    cmp %r10 %r11
    br slt adjustHeap_if_then_1 adjustHeap_if_merge_1

adjustHeap_if_then_1:
    %r8 = move %rcx
    jump adjustHeap_if_merge_1

adjustHeap_if_merge_1:
    %r11 = lea %rax %r9 8 8
    %rcx = lea %rax %r8 8 8
    %r9 = load %r11 null 0 0
    %r10 = load %rcx null 0 0
    cmp %r9 %r10
    br sgt adjustHeap_if_then_2 adjustHeap_while_merge_1

adjustHeap_if_then_2:
    %r10 = load %r11 null 0 0
    %r9 = load %rcx null 0 0
    store %r9 %r11 null 0 0
    store %r10 %rcx null 0 0
    %r9 = move %r8
    jump adjustHeap_while_cond_1

adjustHeap_while_merge_1:
    %rax = move 0
    pop %rbp
    ret %rax

}

define i64 @heapSort  {
heapSort_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 24
    store %r13 %rbp null 0 -8
    %rcx = load @a_1 null 0 0
    store %rcx %rbp null 0 -16
    %rcx = load @n_1 null 0 0
    store %rcx %rbp null 0 -24
    %r13 = move 0
    jump heapSort_for_cond_1

heapSort_for_cond_1:
    %rcx = load %rbp null 0 -24
    cmp %r13 %rcx
    br slt heapSort_for_body_1 heapSort_for_merge_1

heapSort_for_body_1:
    %rax = load %rbp null 0 -16
    %rax = add %rax 8
    %r9 = load %rax null 0 0
    %rdi = load %rbp null 0 -24
    %rdi = sub %rdi %r13
    %rdi = sub %rdi 1
    %rcx = load %rbp null 0 -16
    %rcx = lea %rcx %rdi 8 8
    %r8 = load %rcx null 0 0
    store %r8 %rax null 0 0
    store %r9 %rcx null 0 0
    %rax = call adjustHeap %rdi 
    %rcx = move %r13
    %rcx = add %rcx 1
    %r13 = move %rcx
    jump heapSort_for_cond_1

heapSort_for_merge_1:
    %rax = move 0
    %r13 = load %rbp null 0 -8
    %rsp = add %rsp 24
    pop %rbp
    ret %rax

}

define i64 @main  {
main_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 24
    store %r12 %rbp null 0 -24
    %rax = call getString 
    %rdi = move %rax
    %rax = call string.parseInt %rdi 
    %r12 = move %rax
    %rdi = lea null %r12 8 8
    %rax = alloc %rdi
    store %rax %rbp null 0 -16
    %rcx = load %rbp null 0 -16
    store %r12 %rcx null 0 0
    %rcx = move 0
    jump main_for_cond_1

main_for_cond_1:
    %r8 = load %rbp null 0 -16
    %r8 = load %r8 null 0 0
    cmp %rcx %r8
    br slt main_for_body_1 main_for_merge_1

main_for_merge_1:
    store %r12 @n_1 null 0 0
    %rcx = load %rbp null 0 -16
    store %rcx @a_1 null 0 0
    %rax = call makeHeap 
    store %r12 @n_1 null 0 0
    %rcx = load %rbp null 0 -16
    store %rcx @a_1 null 0 0
    %rax = call heapSort 
    %rcx = move 0
    store %rcx %rbp null 0 -8
    jump main_for_cond_2

main_for_cond_2:
    %rcx = load %rbp null 0 -16
    %r8 = load %rcx null 0 0
    %rcx = load %rbp null 0 -8
    cmp %rcx %r8
    br slt main_for_body_2 main_for_merge_2

main_for_body_2:
    %rcx = load %rbp null 0 -16
    %r8 = load %rbp null 0 -8
    %rdi = load %rcx %r8 8 8
    %rax = call toString %rdi 
    %rdi = move %rax
    %rsi = move @__str_const_1
    %rax = call string.add %rdi %rsi 
    %rdi = move %rax
    call print %rdi 
    %rcx = load %rbp null 0 -8
    %rcx = add %rcx 1
    store %rcx %rbp null 0 -8
    jump main_for_cond_2

main_for_merge_2:
    %rdi = move @__str_const_2
    call print %rdi 
    store %r12 @n_1 null 0 0
    %rcx = load %rbp null 0 -16
    store %rcx @a_1 null 0 0
    %rax = move 0
    %r12 = load %rbp null 0 -24
    %rsp = add %rsp 24
    pop %rbp
    ret %rax

main_for_body_1:
    %r8 = load %rbp null 0 -16
    store %rcx %r8 %rcx 8 8
    %rcx = add %rcx 1
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    push %rbp
    %rbp = move %rsp
    %rax = call main 
    pop %rbp
    ret %rax

}


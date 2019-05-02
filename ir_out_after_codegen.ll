@__str_const_1 = "no solution!\n"

define i64 @main  {
main_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 480
    store %r14 %rbp null 0 -352
    store %r12 %rbp null 0 -264
    store %r15 %rbp null 0 -208
    store %r13 %rbp null 0 -152
    store %rbx %rbp null 0 -8
    %rax = call getInt 
    store %rax %rbp null 0 -472
    %rax = load %rbp null 0 -472
    store %rax %rbp null 0 -272
    %rax = load %rbp null 0 -272
    %rax = sub %rax 1
    store %rax %rbp null 0 -272
    %rbx = load %rbp null 0 -472
    %rax = load %rbp null 0 -472
    %rbx = mul %rbx %rax
    %rdi = lea null %rbx 8 8
    %rax = alloc %rdi
    %r14 = move %rax
    store %rbx %r14 null 0 0
    %rax = move 0
    jump main_for_cond_1

main_for_cond_1:
    %rbx = load %rbp null 0 -472
    %r11 = load %rbp null 0 -472
    %rbx = mul %rbx %r11
    cmp %rax %rbx
    br slt main_for_body_1 main_for_merge_1

main_for_merge_1:
    %rdi = lea null %rbx 8 8
    %rax = alloc %rdi
    store %rax %rbp null 0 -408
    %rax = load %rbp null 0 -408
    store %rbx %rax null 0 0
    %rax = move 0
    jump main_for_cond_2

main_for_cond_2:
    %r11 = load %rbp null 0 -472
    %r9 = load %rbp null 0 -472
    %r11 = mul %r11 %r9
    cmp %rax %r11
    br slt main_for_body_2 main_for_merge_2

main_for_merge_2:
    %rax = load %rbp null 0 -472
    %rdi = lea null %rax 8 8
    %rax = alloc %rdi
    store %rax %rbp null 0 -56
    %rax = load %rbp null 0 -56
    %r11 = load %rbp null 0 -472
    store %r11 %rax null 0 0
    %rbx = move 0
    jump main_for_cond_3

main_for_cond_3:
    %rax = load %rbp null 0 -472
    cmp %rbx %rax
    br slt main_for_body_3 main_for_merge_3

main_for_merge_3:
    store 0 %r14 null 0 8
    %rax = load %rbp null 0 -408
    store 0 %rax null 0 8
    %rax = load %rbp null 0 -56
    %rax = load %rax null 0 8
    store 0 %rax null 0 8
    %rax = move 0
    store %rax %rbp null 0 -24
    %rax = move 0
    store %rax %rbp null 0 -120
    %rax = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -432
    %r9 = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -72
    %r15 = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -32
    %r8 = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -320
    %r11 = move 0
    store %r11 %rbp null 0 -448
    %r11 = move 0
    store %r11 %rbp null 0 -248
    %rcx = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -128
    %r13 = move 0
    %r11 = move 0
    store %r11 %rbp null 0 -360
    %r11 = move 0
    store %r11 %rbp null 0 -312
    %rbx = move 0
    %r10 = move 0
    jump main_while_cond_1

main_while_cond_1:
    cmp %r13 %rbx
    br sle main_while_body_1 main_parallel_copy_1

main_parallel_copy_1:
    %rax = load %rbp null 0 -432
    jump main_while_merge_1

main_while_body_1:
    %rdi = lea null %r13 8 8
    store %r14 %rbp null 0 -40
    %r11 = load %rbp null 0 -40
    %r11 = add %r11 %rdi
    store %r11 %rbp null 0 -40
    %r11 = load %rbp null 0 -40
    %r11 = load %r11 null 0 0
    %r12 = load %rbp null 0 -408
    %r12 = add %r12 %rdi
    %rdi = load %rbp null 0 -56
    %rdi = load %rdi %r11 8 8
    %r11 = load %r12 null 0 0
    %r11 = load %rdi %r11 8 8
    store %r11 %rbp null 0 -368
    %r11 = load %rbp null 0 -40
    %r11 = load %r11 null 0 0
    store %r11 %rbp null 0 -328
    %r11 = load %rbp null 0 -328
    %r11 = sub %r11 1
    store %r11 %rbp null 0 -328
    %r11 = load %r12 null 0 0
    store %r11 %rbp null 0 -416
    %r11 = load %rbp null 0 -416
    %r11 = sub %r11 2
    store %r11 %rbp null 0 -416
    %r11 = load %rbp null 0 -328
    %r12 = load %rbp null 0 -472
    cmp %r11 %r12
    br slt main_faker_check_lhs_then_1 main_faker_check_elseBB_1

main_faker_check_lhs_then_1:
    %r11 = load %rbp null 0 -328
    cmp %r11 0
    br sge main_faker_check_thenBB_1 main_faker_check_elseBB_1

main_faker_check_thenBB_1:
    %r11 = move 1
    jump main_splitter_1

main_faker_check_elseBB_1:
    %r11 = move 0
    jump main_splitter_1

main_splitter_1:
    cmp %r11 1
    br seq main_lhs_then_1 main_parallel_copy_2

main_lhs_then_1:
    %r11 = load %rbp null 0 -416
    %r9 = load %rbp null 0 -472
    cmp %r11 %r9
    br slt main_faker_check_lhs_then_2 main_faker_check_elseBB_2

main_faker_check_lhs_then_2:
    %r11 = load %rbp null 0 -416
    cmp %r11 0
    br sge main_faker_check_thenBB_2 main_faker_check_elseBB_2

main_faker_check_elseBB_2:
    %rsi = move 0
    jump main_splitter_2

main_faker_check_thenBB_2:
    %rsi = move 1
    jump main_splitter_2

main_splitter_2:
    cmp %rsi 1
    br seq main_lhs_then_2 main_parallel_copy_3

main_parallel_copy_3:
    %r11 = load %rbp null 0 -432
    %r9 = load %rbp null 0 -416
    store %r9 %rbp null 0 -16
    %r12 = move %rbx
    jump main_if_merge_1

main_lhs_then_2:
    %r9 = load %rbp null 0 -328
    %r11 = load %rbp null 0 -56
    %rdi = lea %r11 %r9 8 8
    %r11 = load %rdi null 0 0
    %r9 = load %rbp null 0 -416
    %r12 = lea null %r9 8 8
    %r11 = load %r11 %r12 1 0
    cmp %r11 -1
    br seq main_if_then_1 main_parallel_copy_4

main_if_then_1:
    %rbx = add %rbx 1
    %r9 = lea null %rbx 8 8
    %r11 = load %rbp null 0 -328
    store %r11 %r14 %r9 1 0
    %r11 = load %rbp null 0 -408
    %rdx = load %rbp null 0 -416
    store %rdx %r11 %r9 1 0
    %r9 = load %rdi null 0 0
    %r11 = load %rbp null 0 -368
    %r11 = add %r11 1
    store %r11 %r9 %r12 1 0
    %r9 = load %rbp null 0 -328
    %r11 = load %rbp null 0 -272
    cmp %r9 %r11
    br seq main_lhs_then_3 main_parallel_copy_5

main_lhs_then_3:
    %r9 = load %rbp null 0 -272
    %r11 = load %rbp null 0 -416
    cmp %r11 %r9
    br seq main_if_then_2 main_parallel_copy_6

main_parallel_copy_6:
    %r11 = load %rbp null 0 -432
    %r9 = load %rbp null 0 -416
    store %r9 %rbp null 0 -16
    %r12 = move %rbx
    jump main_if_merge_1

main_if_then_2:
    %r11 = load %rbp null 0 -416
    store %r11 %rbp null 0 -16
    %r12 = move %rbx
    %r11 = move 1
    jump main_if_merge_1

main_parallel_copy_5:
    %r11 = load %rbp null 0 -432
    %r9 = load %rbp null 0 -416
    store %r9 %rbp null 0 -16
    %r12 = move %rbx
    jump main_if_merge_1

main_parallel_copy_4:
    %r11 = load %rbp null 0 -432
    %r9 = load %rbp null 0 -416
    store %r9 %rbp null 0 -16
    %r12 = move %rbx
    jump main_if_merge_1

main_parallel_copy_2:
    %r11 = load %rbp null 0 -432
    store %r9 %rbp null 0 -16
    %rsi = load %rbp null 0 -72
    %r12 = move %rbx
    jump main_if_merge_1

main_if_merge_1:
    %rbx = lea null %r13 8 8
    %r9 = load %r14 %rbx 1 0
    %r9 = sub %r9 1
    %rdi = load %rbp null 0 -408
    %rbx = load %rdi %rbx 1 0
    %rdx = move %rbx
    %rdx = add %rdx 2
    %rbx = load %rbp null 0 -472
    cmp %r9 %rbx
    br slt main_faker_check_lhs_then_3 main_faker_check_elseBB_3

main_faker_check_lhs_then_3:
    cmp %r9 0
    br sge main_faker_check_thenBB_3 main_faker_check_elseBB_3

main_faker_check_thenBB_3:
    %rbx = move 1
    jump main_splitter_3

main_faker_check_elseBB_3:
    %rbx = move 0
    jump main_splitter_3

main_splitter_3:
    cmp %rbx 1
    br seq main_lhs_then_4 main_parallel_copy_7

main_parallel_copy_7:
    %rdi = load %rbp null 0 -248
    store %rcx %rbp null 0 -64
    %r9 = move %r12
    jump main_if_merge_2

main_lhs_then_4:
    %rbx = load %rbp null 0 -472
    cmp %rdx %rbx
    br slt main_faker_check_lhs_then_4 main_faker_check_elseBB_4

main_faker_check_lhs_then_4:
    cmp %rdx 0
    br sge main_faker_check_thenBB_4 main_faker_check_elseBB_4

main_faker_check_elseBB_4:
    %rbx = move 0
    store %rbx %rbp null 0 -336
    jump main_splitter_4

main_faker_check_thenBB_4:
    %rbx = move 1
    store %rbx %rbp null 0 -336
    jump main_splitter_4

main_splitter_4:
    %rbx = load %rbp null 0 -336
    cmp %rbx 1
    br seq main_lhs_then_5 main_parallel_copy_8

main_parallel_copy_8:
    %rdi = move %rdx
    %r9 = load %rbp null 0 -336
    store %r9 %rbp null 0 -64
    %r9 = move %r12
    jump main_if_merge_2

main_lhs_then_5:
    %rbx = load %rbp null 0 -56
    %rdi = lea %rbx %r9 8 8
    %rbx = load %rdi null 0 0
    %rcx = lea null %rdx 8 8
    store %rcx %rbp null 0 -376
    %rcx = load %rbp null 0 -376
    %rbx = load %rbx %rcx 1 0
    cmp %rbx -1
    br seq main_if_then_3 main_parallel_copy_9

main_if_then_3:
    %rbx = move %r12
    %rbx = add %rbx 1
    %rcx = lea null %rbx 8 8
    store %r9 %r14 %rcx 1 0
    %r12 = load %rbp null 0 -408
    store %rdx %r12 %rcx 1 0
    %rcx = load %rdi null 0 0
    %rdi = load %rbp null 0 -368
    %rdi = add %rdi 1
    %r12 = load %rbp null 0 -376
    store %rdi %rcx %r12 1 0
    %r12 = load %rbp null 0 -272
    cmp %r9 %r12
    br seq main_lhs_then_6 main_parallel_copy_10

main_lhs_then_6:
    %r9 = load %rbp null 0 -272
    cmp %rdx %r9
    br seq main_if_then_4 main_parallel_copy_11

main_if_then_4:
    %rdi = move %rdx
    %r11 = load %rbp null 0 -336
    store %r11 %rbp null 0 -64
    %r9 = move %rbx
    %r11 = move 1
    jump main_if_merge_2

main_parallel_copy_11:
    %rdi = move %rdx
    %r9 = load %rbp null 0 -336
    store %r9 %rbp null 0 -64
    %r9 = move %rbx
    jump main_if_merge_2

main_parallel_copy_10:
    %rdi = move %rdx
    %r9 = load %rbp null 0 -336
    store %r9 %rbp null 0 -64
    %r9 = move %rbx
    jump main_if_merge_2

main_parallel_copy_9:
    %rdi = move %rdx
    %r9 = load %rbp null 0 -336
    store %r9 %rbp null 0 -64
    %r9 = move %r12
    jump main_if_merge_2

main_if_merge_2:
    %r12 = lea null %r13 8 8
    %rbx = load %r14 %r12 1 0
    store %rbx %rbp null 0 -104
    %rbx = load %rbp null 0 -104
    %rbx = add %rbx 1
    store %rbx %rbp null 0 -104
    %rbx = load %rbp null 0 -408
    %rbx = load %rbx %r12 1 0
    %rbx = sub %rbx 2
    %rcx = load %rbp null 0 -104
    %r12 = load %rbp null 0 -472
    cmp %rcx %r12
    br slt main_faker_check_lhs_then_5 main_faker_check_elseBB_5

main_faker_check_lhs_then_5:
    %r12 = load %rbp null 0 -104
    cmp %r12 0
    br sge main_faker_check_thenBB_5 main_faker_check_elseBB_5

main_faker_check_thenBB_5:
    %r12 = move 1
    jump main_splitter_5

main_faker_check_elseBB_5:
    %r12 = move 0
    jump main_splitter_5

main_splitter_5:
    cmp %r12 1
    br seq main_lhs_then_7 main_parallel_copy_12

main_lhs_then_7:
    %r12 = load %rbp null 0 -472
    cmp %rbx %r12
    br slt main_faker_check_lhs_then_6 main_faker_check_elseBB_6

main_faker_check_lhs_then_6:
    cmp %rbx 0
    br sge main_faker_check_thenBB_6 main_faker_check_elseBB_6

main_faker_check_elseBB_6:
    %r12 = move 0
    store %r12 %rbp null 0 -48
    jump main_splitter_6

main_faker_check_thenBB_6:
    %r12 = move 1
    store %r12 %rbp null 0 -48
    jump main_splitter_6

main_splitter_6:
    %r12 = load %rbp null 0 -48
    cmp %r12 1
    br seq main_lhs_then_8 main_parallel_copy_13

main_lhs_then_8:
    %rcx = load %rbp null 0 -104
    %r12 = load %rbp null 0 -56
    %r12 = lea %r12 %rcx 8 8
    store %r12 %rbp null 0 -112
    %r12 = load %rbp null 0 -112
    %r12 = load %r12 null 0 0
    %rcx = lea null %rbx 8 8
    %r12 = load %r12 %rcx 1 0
    cmp %r12 -1
    br seq main_if_then_5 main_parallel_copy_14

main_if_then_5:
    %r9 = add %r9 1
    %r10 = lea null %r9 8 8
    %r12 = load %rbp null 0 -104
    store %r12 %r14 %r10 1 0
    %r12 = load %rbp null 0 -408
    store %rbx %r12 %r10 1 0
    %r12 = load %rbp null 0 -112
    %r12 = load %r12 null 0 0
    %r10 = load %rbp null 0 -368
    store %r10 %rbp null 0 -280
    %r10 = load %rbp null 0 -280
    %r10 = add %r10 1
    store %r10 %rbp null 0 -280
    %r10 = load %rbp null 0 -280
    store %r10 %r12 %rcx 1 0
    %rcx = load %rbp null 0 -104
    %r12 = load %rbp null 0 -272
    cmp %rcx %r12
    br seq main_lhs_then_9 main_parallel_copy_15

main_parallel_copy_15:
    %rdx = move %r11
    store %rbx %rbp null 0 -424
    %r11 = load %rbp null 0 -48
    store %r11 %rbp null 0 -200
    jump main_if_merge_3

main_lhs_then_9:
    %r12 = load %rbp null 0 -272
    cmp %rbx %r12
    br seq main_if_then_6 main_parallel_copy_16

main_if_then_6:
    store %rbx %rbp null 0 -424
    %r11 = load %rbp null 0 -48
    store %r11 %rbp null 0 -200
    %rdx = move 1
    jump main_if_merge_3

main_parallel_copy_16:
    %rdx = move %r11
    store %rbx %rbp null 0 -424
    %r11 = load %rbp null 0 -48
    store %r11 %rbp null 0 -200
    jump main_if_merge_3

main_parallel_copy_14:
    %rdx = move %r11
    store %rbx %rbp null 0 -424
    %r11 = load %rbp null 0 -48
    store %r11 %rbp null 0 -200
    jump main_if_merge_3

main_parallel_copy_13:
    %rdx = move %r11
    store %rbx %rbp null 0 -424
    %r11 = load %rbp null 0 -48
    store %r11 %rbp null 0 -200
    jump main_if_merge_3

main_parallel_copy_12:
    %rdx = move %r11
    %r11 = load %rbp null 0 -360
    store %r11 %rbp null 0 -424
    store %r10 %rbp null 0 -200
    jump main_if_merge_3

main_if_merge_3:
    %rbx = lea null %r13 8 8
    %r11 = load %r14 %rbx 1 0
    %r11 = add %r11 1
    %r12 = load %rbp null 0 -408
    %rbx = load %r12 %rbx 1 0
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -176
    %rbx = add %rbx 2
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -472
    cmp %r11 %rbx
    br slt main_faker_check_lhs_then_7 main_faker_check_elseBB_7

main_faker_check_lhs_then_7:
    cmp %r11 0
    br sge main_faker_check_thenBB_7 main_faker_check_elseBB_7

main_faker_check_elseBB_7:
    %rbx = move 0
    jump main_splitter_7

main_faker_check_thenBB_7:
    %rbx = move 1
    jump main_splitter_7

main_splitter_7:
    cmp %rbx 1
    br seq main_lhs_then_10 main_parallel_copy_17

main_lhs_then_10:
    %r12 = load %rbp null 0 -176
    %rbx = load %rbp null 0 -472
    cmp %r12 %rbx
    br slt main_faker_check_lhs_then_8 main_faker_check_elseBB_8

main_faker_check_lhs_then_8:
    %rbx = load %rbp null 0 -176
    cmp %rbx 0
    br sge main_faker_check_thenBB_8 main_faker_check_elseBB_8

main_faker_check_elseBB_8:
    %rbx = move 0
    store %rbx %rbp null 0 -464
    jump main_splitter_8

main_faker_check_thenBB_8:
    %rbx = move 1
    store %rbx %rbp null 0 -464
    jump main_splitter_8

main_splitter_8:
    %rbx = load %rbp null 0 -464
    cmp %rbx 1
    br seq main_lhs_then_11 main_parallel_copy_18

main_lhs_then_11:
    %rbx = load %rbp null 0 -56
    %rbx = lea %rbx %r11 8 8
    store %rbx %rbp null 0 -144
    %rbx = load %rbp null 0 -144
    %r12 = load %rbx null 0 0
    %rbx = load %rbp null 0 -176
    %rbx = lea null %rbx 8 8
    %r12 = load %r12 %rbx 1 0
    cmp %r12 -1
    br seq main_if_then_7 main_parallel_copy_19

main_if_then_7:
    %r9 = add %r9 1
    %r12 = lea null %r9 8 8
    store %r11 %r14 %r12 1 0
    %rcx = load %rbp null 0 -176
    %r10 = load %rbp null 0 -408
    store %rcx %r10 %r12 1 0
    %r12 = load %rbp null 0 -144
    %rcx = load %r12 null 0 0
    %r12 = load %rbp null 0 -368
    store %r12 %rbp null 0 -136
    %r12 = load %rbp null 0 -136
    %r12 = add %r12 1
    store %r12 %rbp null 0 -136
    %r12 = load %rbp null 0 -136
    store %r12 %rcx %rbx 1 0
    %rbx = load %rbp null 0 -272
    cmp %r11 %rbx
    br seq main_lhs_then_12 main_parallel_copy_20

main_parallel_copy_20:
    store %rdx %rbp null 0 -400
    %r11 = load %rbp null 0 -176
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -464
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    jump main_if_merge_4

main_lhs_then_12:
    %r11 = load %rbp null 0 -176
    %rbx = load %rbp null 0 -272
    cmp %r11 %rbx
    br seq main_if_then_8 main_parallel_copy_21

main_if_then_8:
    %r11 = load %rbp null 0 -176
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -464
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    %r11 = move 1
    store %r11 %rbp null 0 -400
    jump main_if_merge_4

main_parallel_copy_21:
    store %rdx %rbp null 0 -400
    %r11 = load %rbp null 0 -176
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -464
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    jump main_if_merge_4

main_parallel_copy_19:
    store %rdx %rbp null 0 -400
    %r11 = load %rbp null 0 -176
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -464
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    jump main_if_merge_4

main_parallel_copy_18:
    store %rdx %rbp null 0 -400
    %r11 = load %rbp null 0 -176
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -464
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    jump main_if_merge_4

main_parallel_copy_17:
    store %rdx %rbp null 0 -400
    %r11 = load %rbp null 0 -320
    store %r11 %rbp null 0 -440
    %r11 = load %rbp null 0 -448
    store %r11 %rbp null 0 -296
    store %r9 %rbp null 0 -184
    jump main_if_merge_4

main_if_merge_4:
    %r9 = lea null %r13 8 8
    %r11 = load %r14 %r9 1 0
    %rcx = move %r11
    %rcx = sub %rcx 2
    %r11 = load %rbp null 0 -408
    %r11 = load %r11 %r9 1 0
    %r9 = move %r11
    %r9 = sub %r9 1
    %r11 = load %rbp null 0 -472
    cmp %rcx %r11
    br slt main_faker_check_lhs_then_9 main_faker_check_elseBB_9

main_faker_check_lhs_then_9:
    cmp %rcx 0
    br sge main_faker_check_thenBB_9 main_faker_check_elseBB_9

main_faker_check_elseBB_9:
    %r11 = move 0
    jump main_splitter_9

main_faker_check_thenBB_9:
    %r11 = move 1
    jump main_splitter_9

main_splitter_9:
    cmp %r11 1
    br seq main_lhs_then_13 main_parallel_copy_22

main_parallel_copy_22:
    %rdx = load %rbp null 0 -400
    %rbx = load %rbp null 0 -312
    %r11 = load %rbp null 0 -184
    store %r11 %rbp null 0 -232
    jump main_if_merge_5

main_lhs_then_13:
    %rax = load %rbp null 0 -472
    cmp %r9 %rax
    br slt main_faker_check_lhs_then_10 main_faker_check_elseBB_10

main_faker_check_lhs_then_10:
    cmp %r9 0
    br sge main_faker_check_thenBB_10 main_faker_check_elseBB_10

main_faker_check_elseBB_10:
    %r11 = move 0
    jump main_splitter_10

main_faker_check_thenBB_10:
    %r11 = move 1
    jump main_splitter_10

main_splitter_10:
    cmp %r11 1
    br seq main_lhs_then_14 main_parallel_copy_23

main_lhs_then_14:
    %rax = load %rbp null 0 -56
    %rdx = lea %rax %rcx 8 8
    %rax = load %rdx null 0 0
    %r10 = lea null %r9 8 8
    %rax = load %rax %r10 1 0
    cmp %rax -1
    br seq main_if_then_9 main_parallel_copy_24

main_if_then_9:
    %r12 = load %rbp null 0 -184
    %r12 = add %r12 1
    %rax = lea null %r12 8 8
    store %rcx %r14 %rax 1 0
    %rbx = load %rbp null 0 -408
    store %r9 %rbx %rax 1 0
    %rbx = load %rdx null 0 0
    %rax = load %rbp null 0 -368
    %rax = add %rax 1
    store %rax %rbx %r10 1 0
    %rax = load %rbp null 0 -272
    cmp %rcx %rax
    br seq main_lhs_then_15 main_parallel_copy_25

main_parallel_copy_25:
    %rax = move %r9
    %rdx = load %rbp null 0 -400
    %rbx = move %r11
    store %r12 %rbp null 0 -232
    jump main_if_merge_5

main_lhs_then_15:
    %rax = load %rbp null 0 -272
    cmp %r9 %rax
    br seq main_if_then_10 main_parallel_copy_26

main_parallel_copy_26:
    %rax = move %r9
    %rdx = load %rbp null 0 -400
    %rbx = move %r11
    store %r12 %rbp null 0 -232
    jump main_if_merge_5

main_if_then_10:
    %rax = move %r9
    %rbx = move %r11
    store %r12 %rbp null 0 -232
    %rdx = move 1
    jump main_if_merge_5

main_parallel_copy_24:
    %rax = move %r9
    %rdx = load %rbp null 0 -400
    %rbx = move %r11
    %r11 = load %rbp null 0 -184
    store %r11 %rbp null 0 -232
    jump main_if_merge_5

main_parallel_copy_23:
    %rax = move %r9
    %rdx = load %rbp null 0 -400
    %rbx = move %r11
    %r11 = load %rbp null 0 -184
    store %r11 %rbp null 0 -232
    jump main_if_merge_5

main_if_merge_5:
    %r9 = lea null %r13 8 8
    %r11 = load %r14 %r9 1 0
    store %r11 %rbp null 0 -96
    %r11 = load %rbp null 0 -96
    %r11 = sub %r11 2
    store %r11 %rbp null 0 -96
    %r11 = load %rbp null 0 -408
    %r11 = load %r11 %r9 1 0
    %r11 = add %r11 1
    %r12 = load %rbp null 0 -96
    %r9 = load %rbp null 0 -472
    cmp %r12 %r9
    br slt main_faker_check_lhs_then_11 main_faker_check_elseBB_11

main_faker_check_lhs_then_11:
    %r9 = load %rbp null 0 -96
    cmp %r9 0
    br sge main_faker_check_thenBB_11 main_faker_check_elseBB_11

main_faker_check_elseBB_11:
    %r9 = move 0
    jump main_splitter_11

main_faker_check_thenBB_11:
    %r9 = move 1
    jump main_splitter_11

main_splitter_11:
    cmp %r9 1
    br seq main_lhs_then_16 main_parallel_copy_27

main_parallel_copy_27:
    %r11 = load %rbp null 0 -24
    %r9 = move %rdx
    store %r15 %rbp null 0 -480
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -160
    jump main_if_merge_6

main_lhs_then_16:
    %r9 = load %rbp null 0 -472
    cmp %r11 %r9
    br slt main_faker_check_lhs_then_12 main_faker_check_elseBB_12

main_faker_check_lhs_then_12:
    cmp %r11 0
    br sge main_faker_check_thenBB_12 main_faker_check_elseBB_12

main_faker_check_thenBB_12:
    %rcx = move 1
    jump main_splitter_12

main_faker_check_elseBB_12:
    %rcx = move 0
    jump main_splitter_12

main_splitter_12:
    cmp %rcx 1
    br seq main_lhs_then_17 main_parallel_copy_28

main_lhs_then_17:
    %r9 = load %rbp null 0 -96
    %r15 = load %rbp null 0 -56
    %r12 = lea %r15 %r9 8 8
    %r15 = load %r12 null 0 0
    %r9 = lea null %r11 8 8
    %r15 = load %r15 %r9 1 0
    cmp %r15 -1
    br seq main_if_then_11 main_parallel_copy_29

main_parallel_copy_29:
    %r9 = move %rdx
    store %rcx %rbp null 0 -480
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -160
    jump main_if_merge_6

main_if_then_11:
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -256
    %r15 = load %rbp null 0 -256
    %r15 = add %r15 1
    store %r15 %rbp null 0 -256
    %r15 = load %rbp null 0 -256
    %r10 = lea null %r15 8 8
    %r15 = load %rbp null 0 -96
    store %r15 %r14 %r10 1 0
    %r15 = load %rbp null 0 -408
    store %r11 %r15 %r10 1 0
    %r15 = load %r12 null 0 0
    %r12 = load %rbp null 0 -368
    %r12 = add %r12 1
    store %r12 %r15 %r9 1 0
    %r9 = load %rbp null 0 -96
    %r15 = load %rbp null 0 -272
    cmp %r9 %r15
    br seq main_lhs_then_18 main_parallel_copy_30

main_parallel_copy_30:
    %r9 = move %rdx
    store %rcx %rbp null 0 -480
    %r15 = load %rbp null 0 -256
    store %r15 %rbp null 0 -160
    jump main_if_merge_6

main_lhs_then_18:
    %r9 = load %rbp null 0 -272
    cmp %r11 %r9
    br seq main_if_then_12 main_parallel_copy_31

main_if_then_12:
    store %rcx %rbp null 0 -480
    %r9 = load %rbp null 0 -256
    store %r9 %rbp null 0 -160
    %r9 = move 1
    jump main_if_merge_6

main_parallel_copy_31:
    %r9 = move %rdx
    store %rcx %rbp null 0 -480
    %r15 = load %rbp null 0 -256
    store %r15 %rbp null 0 -160
    jump main_if_merge_6

main_parallel_copy_28:
    %r9 = move %rdx
    store %rcx %rbp null 0 -480
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -160
    jump main_if_merge_6

main_if_merge_6:
    %rcx = lea null %r13 8 8
    %r15 = load %r14 %rcx 1 0
    %r12 = move %r15
    %r12 = add %r12 2
    %r15 = load %rbp null 0 -408
    %r15 = load %r15 %rcx 1 0
    store %r15 %rbp null 0 -168
    %r15 = load %rbp null 0 -168
    %r15 = sub %r15 1
    store %r15 %rbp null 0 -168
    %r15 = load %rbp null 0 -472
    cmp %r12 %r15
    br slt main_faker_check_lhs_then_13 main_faker_check_elseBB_13

main_faker_check_lhs_then_13:
    cmp %r12 0
    br sge main_faker_check_thenBB_13 main_faker_check_elseBB_13

main_faker_check_thenBB_13:
    %r15 = move 1
    jump main_splitter_13

main_faker_check_elseBB_13:
    %r15 = move 0
    jump main_splitter_13

main_splitter_13:
    cmp %r15 1
    br seq main_lhs_then_19 main_parallel_copy_32

main_parallel_copy_32:
    store %r9 %rbp null 0 -88
    %r9 = load %rbp null 0 -32
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -128
    %r9 = load %rbp null 0 -160
    store %r9 %rbp null 0 -192
    jump main_if_merge_7

main_lhs_then_19:
    %rcx = load %rbp null 0 -168
    %r15 = load %rbp null 0 -472
    cmp %rcx %r15
    br slt main_faker_check_lhs_then_14 main_faker_check_elseBB_14

main_faker_check_lhs_then_14:
    %r15 = load %rbp null 0 -168
    cmp %r15 0
    br sge main_faker_check_thenBB_14 main_faker_check_elseBB_14

main_faker_check_elseBB_14:
    %r15 = move 0
    store %r15 %rbp null 0 -216
    jump main_splitter_14

main_faker_check_thenBB_14:
    %r15 = move 1
    store %r15 %rbp null 0 -216
    jump main_splitter_14

main_splitter_14:
    %r15 = load %rbp null 0 -216
    cmp %r15 1
    br seq main_lhs_then_20 main_parallel_copy_33

main_parallel_copy_33:
    store %r9 %rbp null 0 -88
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -168
    %r9 = load %rbp null 0 -160
    store %r9 %rbp null 0 -192
    jump main_if_merge_7

main_lhs_then_20:
    %r15 = load %rbp null 0 -56
    %rcx = lea %r15 %r12 8 8
    %r10 = load %rcx null 0 0
    %r15 = load %rbp null 0 -168
    %r15 = lea null %r15 8 8
    store %r15 %rbp null 0 -304
    %r15 = load %rbp null 0 -304
    %r15 = load %r10 %r15 1 0
    cmp %r15 -1
    br seq main_if_then_13 main_parallel_copy_34

main_parallel_copy_34:
    store %r9 %rbp null 0 -88
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -168
    %r9 = load %rbp null 0 -160
    store %r9 %rbp null 0 -192
    jump main_if_merge_7

main_if_then_13:
    %r15 = load %rbp null 0 -160
    store %r15 %rbp null 0 -240
    %r15 = load %rbp null 0 -240
    %r15 = add %r15 1
    store %r15 %rbp null 0 -240
    %r15 = load %rbp null 0 -240
    %rdx = lea null %r15 8 8
    store %r12 %r14 %rdx 1 0
    %r10 = load %rbp null 0 -168
    %r15 = load %rbp null 0 -408
    store %r10 %r15 %rdx 1 0
    %r15 = load %rcx null 0 0
    %r10 = load %rbp null 0 -368
    %r10 = add %r10 1
    %rcx = load %rbp null 0 -304
    store %r10 %r15 %rcx 1 0
    %r15 = load %rbp null 0 -272
    cmp %r12 %r15
    br seq main_lhs_then_21 main_parallel_copy_35

main_parallel_copy_35:
    store %r9 %rbp null 0 -88
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -168
    %r9 = load %rbp null 0 -240
    store %r9 %rbp null 0 -192
    jump main_if_merge_7

main_lhs_then_21:
    %r15 = load %rbp null 0 -168
    %r12 = load %rbp null 0 -272
    cmp %r15 %r12
    br seq main_if_then_14 main_parallel_copy_36

main_parallel_copy_36:
    store %r9 %rbp null 0 -88
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -168
    %r9 = load %rbp null 0 -240
    store %r9 %rbp null 0 -192
    jump main_if_merge_7

main_if_then_14:
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -392
    %r10 = load %rbp null 0 -168
    %r9 = load %rbp null 0 -240
    store %r9 %rbp null 0 -192
    %r9 = move 1
    store %r9 %rbp null 0 -88
    jump main_if_merge_7

main_if_merge_7:
    %r12 = lea null %r13 8 8
    %r9 = load %r14 %r12 1 0
    %r9 = add %r9 2
    %r15 = load %rbp null 0 -408
    %r15 = load %r15 %r12 1 0
    store %r15 %rbp null 0 -80
    %r15 = load %rbp null 0 -80
    %r15 = add %r15 1
    store %r15 %rbp null 0 -80
    %r15 = load %rbp null 0 -472
    cmp %r9 %r15
    br slt main_faker_check_lhs_then_15 main_faker_check_elseBB_15

main_faker_check_lhs_then_15:
    cmp %r9 0
    br sge main_faker_check_thenBB_15 main_faker_check_elseBB_15

main_faker_check_elseBB_15:
    %r15 = move 0
    jump main_splitter_15

main_faker_check_thenBB_15:
    %r15 = move 1
    jump main_splitter_15

main_splitter_15:
    cmp %r15 1
    br seq main_lhs_then_22 main_parallel_copy_37

main_parallel_copy_37:
    %r15 = load %rbp null 0 -120
    %r9 = load %rbp null 0 -88
    %r12 = load %rbp null 0 -192
    store %r12 %rbp null 0 -344
    jump main_if_merge_8

main_lhs_then_22:
    %r15 = load %rbp null 0 -80
    %r8 = load %rbp null 0 -472
    cmp %r15 %r8
    br slt main_faker_check_lhs_then_16 main_faker_check_elseBB_16

main_faker_check_lhs_then_16:
    %r8 = load %rbp null 0 -80
    cmp %r8 0
    br sge main_faker_check_thenBB_16 main_faker_check_elseBB_16

main_faker_check_thenBB_16:
    %r8 = move 1
    store %r8 %rbp null 0 -288
    jump main_splitter_16

main_faker_check_elseBB_16:
    %r8 = move 0
    store %r8 %rbp null 0 -288
    jump main_splitter_16

main_splitter_16:
    %r8 = load %rbp null 0 -288
    cmp %r8 1
    br seq main_lhs_then_23 main_parallel_copy_38

main_lhs_then_23:
    %r8 = load %rbp null 0 -56
    %r8 = lea %r8 %r9 8 8
    %r12 = load %r8 null 0 0
    %r15 = load %rbp null 0 -80
    %r15 = lea null %r15 8 8
    store %r15 %rbp null 0 -456
    %r15 = load %rbp null 0 -456
    %r15 = load %r12 %r15 1 0
    cmp %r15 -1
    br seq main_if_then_15 main_parallel_copy_39

main_if_then_15:
    %rcx = load %rbp null 0 -192
    %rcx = add %rcx 1
    %r15 = lea null %rcx 8 8
    store %r15 %rbp null 0 -384
    %r15 = load %rbp null 0 -384
    store %r9 %r14 %r15 1 0
    %r15 = load %rbp null 0 -384
    %r12 = load %rbp null 0 -80
    %rdx = load %rbp null 0 -408
    store %r12 %rdx %r15 1 0
    %r8 = load %r8 null 0 0
    store %r8 %rbp null 0 -224
    %r8 = load %rbp null 0 -368
    %r8 = add %r8 1
    %r12 = load %rbp null 0 -224
    %r15 = load %rbp null 0 -456
    store %r8 %r12 %r15 1 0
    %r8 = load %rbp null 0 -272
    cmp %r9 %r8
    br seq main_lhs_then_24 main_parallel_copy_40

main_parallel_copy_40:
    %r15 = load %rbp null 0 -80
    %r9 = load %rbp null 0 -88
    %r8 = load %rbp null 0 -288
    store %rcx %rbp null 0 -344
    jump main_if_merge_8

main_lhs_then_24:
    %r9 = load %rbp null 0 -80
    %r8 = load %rbp null 0 -272
    cmp %r9 %r8
    br seq main_if_then_16 main_parallel_copy_41

main_if_then_16:
    %r15 = load %rbp null 0 -80
    %r8 = load %rbp null 0 -288
    store %rcx %rbp null 0 -344
    %r9 = move 1
    jump main_if_merge_8

main_parallel_copy_41:
    %r15 = load %rbp null 0 -80
    %r9 = load %rbp null 0 -88
    %r8 = load %rbp null 0 -288
    store %rcx %rbp null 0 -344
    jump main_if_merge_8

main_parallel_copy_39:
    %r15 = load %rbp null 0 -80
    %r9 = load %rbp null 0 -88
    %r8 = load %rbp null 0 -288
    %r12 = load %rbp null 0 -192
    store %r12 %rbp null 0 -344
    jump main_if_merge_8

main_parallel_copy_38:
    %r15 = load %rbp null 0 -80
    %r9 = load %rbp null 0 -88
    %r8 = load %rbp null 0 -288
    %r12 = load %rbp null 0 -192
    store %r12 %rbp null 0 -344
    jump main_if_merge_8

main_if_merge_8:
    cmp %r9 1
    br seq main_parallel_copy_42 main_if_merge_9

main_if_merge_9:
    %r13 = add %r13 1
    store %r11 %rbp null 0 -24
    store %r15 %rbp null 0 -120
    store %r9 %rbp null 0 -432
    %r9 = load %rbp null 0 -16
    store %rsi %rbp null 0 -72
    %r15 = load %rbp null 0 -480
    %r11 = load %rbp null 0 -392
    store %r11 %rbp null 0 -32
    %r11 = load %rbp null 0 -440
    store %r11 %rbp null 0 -320
    %r11 = load %rbp null 0 -296
    store %r11 %rbp null 0 -448
    store %rdi %rbp null 0 -248
    %rcx = load %rbp null 0 -64
    store %r10 %rbp null 0 -128
    %r11 = load %rbp null 0 -424
    store %r11 %rbp null 0 -360
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -344
    %r10 = load %rbp null 0 -200
    jump main_while_cond_1

main_parallel_copy_42:
    %rax = move %r9
    jump main_while_merge_1

main_while_merge_1:
    cmp %rax 1
    br seq main_if_then_17 main_if_else_1

main_if_else_1:
    %rdi = move @__str_const_1
    call print %rdi 
    jump main_if_merge_10

main_if_then_17:
    %rax = load %rbp null 0 -272
    %rax = lea null %rax 8 8
    %r11 = load %rbp null 0 -56
    %r11 = load %r11 %rax 1 0
    %rdi = load %r11 %rax 1 0
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    jump main_if_merge_10

main_if_merge_10:
    %rax = move 0
    %r14 = load %rbp null 0 -352
    %r12 = load %rbp null 0 -264
    %r15 = load %rbp null 0 -208
    %r13 = load %rbp null 0 -152
    %rbx = load %rbp null 0 -8
    %rsp = add %rsp 480
    pop %rbp
    ret %rax

main_for_body_3:
    %rax = load %rbp null 0 -472
    %rdi = lea null %rax 8 8
    %rax = alloc %rdi
    %r11 = load %rbp null 0 -472
    store %r11 %rax null 0 0
    %r11 = load %rbp null 0 -56
    store %rax %r11 %rbx 8 8
    %rax = move 0
    jump main_for_cond_4

main_for_cond_4:
    %r11 = load %rbp null 0 -472
    cmp %rax %r11
    br slt main_for_body_4 main_for_step_1

main_for_step_1:
    %rbx = add %rbx 1
    jump main_for_cond_3

main_for_body_4:
    %r11 = load %rbp null 0 -56
    %r11 = load %r11 %rbx 8 8
    store -1 %r11 %rax 8 8
    %rax = add %rax 1
    jump main_for_cond_4

main_for_body_2:
    %r11 = load %rbp null 0 -408
    store 0 %r11 %rax 8 8
    %rax = add %rax 1
    jump main_for_cond_2

main_for_body_1:
    store 0 %r14 %rax 8 8
    %rax = add %rax 1
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


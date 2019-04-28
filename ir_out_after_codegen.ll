@i_1
@a0_1
@a1_1
@a2_1
@a3_1
@a4_1
@a5_1
@a6_1
@a7_1
@a8_1
@a9_1
@a10_1
@b0_1
@b1_1
@b2_1
@b3_1
@b4_1
@b5_1
@b6_1
@b7_1
@b8_1
@b9_1
@b10_1

define i64 @main  {
main_entry_1:
    store %r12 %r14 null 0 -168
    store %r13 %r14 null 0 -208
    store %r15 %r14 null 0 -240
    store %rbx %r14 null 0 -64
    %r15 = load @b8_1 null 0 0
    %rdi = load @a10_1 null 0 0
    store %rdi %r14 null 0 -88
    %rdi = load @b2_1 null 0 0
    store %rdi %r14 null 0 -264
    %rdi = load @b9_1 null 0 0
    store %rdi %r14 null 0 -32
    %rbx = load @b6_1 null 0 0
    %rdi = load @b1_1 null 0 0
    %rsi = load @b5_1 null 0 0
    %r8 = load @a0_1 null 0 0
    %r9 = load @a3_1 null 0 0
    %r12 = load @a8_1 null 0 0
    store %r12 %r14 null 0 -224
    %r13 = load @a2_1 null 0 0
    %r11 = load @b7_1 null 0 0
    %rdx = load @b0_1 null 0 0
    %r12 = load @b10_1 null 0 0
    store %r12 %r14 null 0 -136
    %r12 = load @b3_1 null 0 0
    store %r12 %r14 null 0 -56
    %r12 = load @a9_1 null 0 0
    store %r12 %r14 null 0 -160
    %r12 = load @a6_1 null 0 0
    %r10 = load @b4_1 null 0 0
    store %r10 %r14 null 0 -96
    %r10 = load @a7_1 null 0 0
    %r14 = load @a1_1 null 0 0
    store %r14 %r14 null 0 -192
    %r14 = load @a5_1 null 0 0
    store %r14 %r14 null 0 -80
    %r14 = load @a4_1 null 0 0
    store %r11 %r14 null 0 -16
    %r11 = load %r14 null 0 -160
    store %r11 %r14 null 0 -216
    %r11 = load %r14 null 0 -80
    store %r11 %r14 null 0 -120
    %r11 = load %r14 null 0 -264
    store %r11 %r14 null 0 -152
    %r11 = load %r14 null 0 -224
    store %r11 %r14 null 0 -128
    %r11 = load %r14 null 0 -32
    store %r11 %r14 null 0 -24
    store %rdx %r14 null 0 -72
    %r11 = load %r14 null 0 -96
    store %r11 %r14 null 0 -104
    store %r9 %r14 null 0 -256
    %r9 = load %r14 null 0 -136
    store %r9 %r14 null 0 -184
    store %r8 %r14 null 0 -8
    store %rsi %r14 null 0 -176
    %r9 = load %r14 null 0 -56
    store %r9 %r14 null 0 -232
    store %rbx %r14 null 0 -40
    %r9 = load %r14 null 0 -88
    store %r9 %r14 null 0 -144
    store %rdi %r14 null 0 -200
    %rdi = load %r14 null 0 -192
    store %rdi %r14 null 0 -48
    store %r10 %r14 null 0 -112
    %rdi = move 0
    store %rdi %r14 null 0 -248
    %rdi = move 0
    jump main_for_cond_1

main_for_cond_1:
    %r9 = load %r14 null 0 -248
    cmp %r9 1000000000
    br slt main_for_body_1 main_for_merge_1

main_for_merge_1:
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = load %r14 null 0 -248
    store %rdi @i_1 null 0 0
    store %r14 @a4_1 null 0 0
    %rdi = load %r14 null 0 -120
    store %rdi @a5_1 null 0 0
    %rdi = load %r14 null 0 -48
    store %rdi @a1_1 null 0 0
    %rdi = load %r14 null 0 -112
    store %rdi @a7_1 null 0 0
    %rdi = load %r14 null 0 -104
    store %rdi @b4_1 null 0 0
    store %r12 @a6_1 null 0 0
    %rdi = load %r14 null 0 -216
    store %rdi @a9_1 null 0 0
    %rdi = load %r14 null 0 -232
    store %rdi @b3_1 null 0 0
    %rdi = load %r14 null 0 -184
    store %rdi @b10_1 null 0 0
    %rdi = load %r14 null 0 -72
    store %rdi @b0_1 null 0 0
    %rdi = load %r14 null 0 -16
    store %rdi @b7_1 null 0 0
    store %r13 @a2_1 null 0 0
    %rdi = load %r14 null 0 -128
    store %rdi @a8_1 null 0 0
    %rdi = load %r14 null 0 -256
    store %rdi @a3_1 null 0 0
    %rdi = load %r14 null 0 -8
    store %rdi @a0_1 null 0 0
    %rdi = load %r14 null 0 -176
    store %rdi @b5_1 null 0 0
    %rdi = load %r14 null 0 -200
    store %rdi @b1_1 null 0 0
    %rdi = load %r14 null 0 -40
    store %rdi @b6_1 null 0 0
    %rdi = load %r14 null 0 -24
    store %rdi @b9_1 null 0 0
    %rdi = load %r14 null 0 -152
    store %rdi @b2_1 null 0 0
    %rdi = load %r14 null 0 -144
    store %rdi @a10_1 null 0 0
    store %r15 @b8_1 null 0 0
    %rax = move 0
    %r12 = load %r14 null 0 -168
    %r13 = load %r14 null 0 -208
    %r15 = load %r14 null 0 -240
    %rbx = load %r14 null 0 -64
    ret %rax

main_for_body_1:
    %r11 = load %r14 null 0 -8
    %r11 = add %r11 1
    %rsi = load %r14 null 0 -48
    %rsi = add %rsi 1
    %r13 = add %r13 1
    %r12 = move %r11
    %r12 = add %r12 1
    %r10 = move %rsi
    %r10 = add %r10 1
    %r9 = move %r13
    %r9 = add %r9 1
    %r14 = move %rsi
    %r14 = add %r14 0
    %r15 = load %r14 null 0 -248
    %rcx = move 10000000
    %rax = mod %rax %rcx
    %rax = move %rdx
    cmp %rax 0
    br seq main_if_then_1 main_for_step_1

main_if_then_1:
    %rdi = add %rdi %r11
    %rdi = add %rdi %rsi
    %rdi = add %rdi %r13
    %rdi = add %rdi %r12
    %rdi = add %rdi %r10
    %rdi = add %rdi %r9
    %rdi = add %rdi %r12
    %rdi = add %rdi %r10
    %rdi = add %rdi %r9
    %rdi = add %rdi %r12
    %rdi = add %rdi %r14
    %rdi = add %rdi %r11
    %rdi = add %rdi %rsi
    %rdi = add %rdi %r13
    %rdi = add %rdi %r12
    %rdi = add %rdi %r10
    %rdi = add %rdi %r9
    %rdi = add %rdi %r12
    %rdi = add %rdi %r10
    %rdi = add %rdi %r9
    %rdi = add %rdi %r12
    %rdi = add %rdi %r14
    jump main_for_step_1

main_for_step_1:
    %r8 = load %r14 null 0 -248
    %r8 = add %r8 1
    store %r10 %r14 null 0 -16
    store %r12 %r14 null 0 -216
    %r15 = move %r9
    store %r15 %r14 null 0 -120
    store %r13 %r14 null 0 -152
    %r9 = load %r14 null 0 -120
    store %r9 %r14 null 0 -128
    %r9 = load %r14 null 0 -216
    store %r9 %r14 null 0 -24
    store %r11 %r14 null 0 -72
    store %r8 %r14 null 0 -248
    %r9 = load %r14 null 0 -16
    store %r9 %r14 null 0 -104
    %r9 = load %r14 null 0 -24
    store %r9 %r14 null 0 -256
    store %r14 %r14 null 0 -184
    %r9 = load %r14 null 0 -72
    store %r9 %r14 null 0 -8
    %r9 = load %r14 null 0 -128
    store %r9 %r14 null 0 -176
    %r13 = load %r14 null 0 -152
    %r9 = load %r14 null 0 -256
    store %r9 %r14 null 0 -232
    %r9 = load %r14 null 0 -232
    store %r9 %r14 null 0 -40
    %r14 = load %r14 null 0 -104
    %r9 = load %r14 null 0 -184
    store %r9 %r14 null 0 -144
    store %rsi %r14 null 0 -200
    %r9 = load %r14 null 0 -200
    store %r9 %r14 null 0 -48
    store %r14 %r14 null 0 -112
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    store %r14 %r14 null 0 -88
    store 0 @i_1 null 0 0
    store 0 @a4_1 null 0 0
    store 0 @a5_1 null 0 0
    store 0 @a1_1 null 0 0
    store 0 @a7_1 null 0 0
    store 0 @b4_1 null 0 0
    store 0 @a6_1 null 0 0
    store 0 @a9_1 null 0 0
    store 0 @b3_1 null 0 0
    store 0 @b10_1 null 0 0
    store 0 @b0_1 null 0 0
    store 0 @b7_1 null 0 0
    store 0 @a2_1 null 0 0
    store 0 @a8_1 null 0 0
    store 0 @a3_1 null 0 0
    store 0 @a0_1 null 0 0
    store 0 @b5_1 null 0 0
    store 0 @b1_1 null 0 0
    store 0 @b6_1 null 0 0
    store 0 @b9_1 null 0 0
    store 0 @b2_1 null 0 0
    store 0 @a10_1 null 0 0
    store 0 @b8_1 null 0 0
    %rax = call main 
    store %rax %r14 null 0 -104
    %rdi = load @b8_1 null 0 0
    store %rdi %r14 null 0 -120
    %rdi = load @a10_1 null 0 0
    store %rdi %r14 null 0 -80
    %rdi = load @b2_1 null 0 0
    store %rdi %r14 null 0 -96
    %rsi = load @b9_1 null 0 0
    %rdi = load @b6_1 null 0 0
    store %rdi %r14 null 0 -40
    %r10 = load @b1_1 null 0 0
    %rdi = load @b5_1 null 0 0
    store %rdi %r14 null 0 -72
    %rax = load @a0_1 null 0 0
    %rdx = load @a3_1 null 0 0
    %rdi = load @a8_1 null 0 0
    store %rdi %r14 null 0 -32
    %rdi = load @a2_1 null 0 0
    %r9 = load @b7_1 null 0 0
    store %r9 %r14 null 0 -8
    %r9 = load @b0_1 null 0 0
    store %r9 %r14 null 0 -48
    %r9 = load @b10_1 null 0 0
    store %r9 %r14 null 0 -128
    %rcx = load @b3_1 null 0 0
    %r9 = load @a9_1 null 0 0
    store %r9 %r14 null 0 -64
    %r14 = load @a6_1 null 0 0
    %r9 = load @b4_1 null 0 0
    store %r9 %r14 null 0 -24
    %r9 = load @a7_1 null 0 0
    store %r9 %r14 null 0 -56
    %r9 = load @a1_1 null 0 0
    %r8 = load @a5_1 null 0 0
    %r11 = load @a4_1 null 0 0
    store %r11 %r14 null 0 -16
    %r11 = load @i_1 null 0 0
    store %r11 %r14 null 0 -112
    %r11 = load %r14 null 0 -112
    store %r11 @i_1 null 0 0
    %r11 = load %r14 null 0 -16
    store %r11 @a4_1 null 0 0
    store %r8 @a5_1 null 0 0
    store %r9 @a1_1 null 0 0
    %r9 = load %r14 null 0 -56
    store %r9 @a7_1 null 0 0
    %r9 = load %r14 null 0 -24
    store %r9 @b4_1 null 0 0
    store %r14 @a6_1 null 0 0
    %r9 = load %r14 null 0 -64
    store %r9 @a9_1 null 0 0
    store %rcx @b3_1 null 0 0
    %r9 = load %r14 null 0 -128
    store %r9 @b10_1 null 0 0
    %r9 = load %r14 null 0 -48
    store %r9 @b0_1 null 0 0
    %r9 = load %r14 null 0 -8
    store %r9 @b7_1 null 0 0
    store %rdi @a2_1 null 0 0
    %rdi = load %r14 null 0 -32
    store %rdi @a8_1 null 0 0
    store %rdx @a3_1 null 0 0
    store %rax @a0_1 null 0 0
    %rdi = load %r14 null 0 -72
    store %rdi @b5_1 null 0 0
    store %r10 @b1_1 null 0 0
    %rdi = load %r14 null 0 -40
    store %rdi @b6_1 null 0 0
    store %rsi @b9_1 null 0 0
    %rdi = load %r14 null 0 -96
    store %rdi @b2_1 null 0 0
    %rdi = load %r14 null 0 -80
    store %rdi @a10_1 null 0 0
    %rdi = load %r14 null 0 -120
    store %rdi @b8_1 null 0 0
    %rax = load %r14 null 0 -104
    %r14 = load %r14 null 0 -88
    ret %rax

}


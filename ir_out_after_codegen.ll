@N_1
@n_1
@a_1
@bak_1
@a_left_1
@a_right_1
@heap_1
@i1_1
@i2_1
@i3_1
@i4_1
@i5_1
@i6_1
@i7_1
@i8_1
@i9_1
@i10_1
@i11_1
@i12_1
@i13_1
@i14_1

define void @A_Optimizer  {
A_Optimizer_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 520
    store %r15 %rbp null 0 -320
    store %r12 %rbp null 0 -368
    store %r14 %rbp null 0 -240
    store %r13 %rbp null 0 -496
    store %rbx %rbp null 0 -400
    %rdi = move 24
    %rax = alloc %rdi
    store %rax %rbp null 0 -376
    %r15 = load %rbp null 0 -376
    store 2 %r15 null 0 0
    %r15 = load %rbp null 0 -376
    %r15 = add %r15 8
    %rbx = load %rbp null 0 -376
    %rbx = add %rbx 24
    store %r15 %rbp null 0 -480
    %r15 = move 0
    store %r15 %rbp null 0 -200
    %r15 = move 0
    store %r15 %rbp null 0 -136
    %r15 = move 0
    %rax = move 0
    store %rax %rbp null 0 -472
    %rax = move 0
    store %rax %rbp null 0 -360
    %rax = move 0
    store %rax %rbp null 0 -344
    %rax = move 0
    store %rax %rbp null 0 -336
    %rax = move 0
    store %rax %rbp null 0 -160
    %r12 = move 0
    %rax = move 0
    store %rax %rbp null 0 -32
    %r14 = move 0
    %rax = move 0
    store %rax %rbp null 0 -408
    %rax = move 0
    store %rax %rbp null 0 -72
    %rax = move 0
    store %rax %rbp null 0 -232
    jump A_Optimizer_for_cond_1

A_Optimizer_for_cond_1:
    %rax = load %rbp null 0 -480
    cmp %rax %rbx
    br slt A_Optimizer_for_body_1 A_Optimizer_for_merge_1

A_Optimizer_for_body_1:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %rdx = load %rbp null 0 -480
    store %rax %rdx null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    %r13 = move %rax
    %r13 = add %r13 24
    %rax = load %rbp null 0 -200
    store %rax %rbp null 0 -288
    %rax = load %rbp null 0 -136
    store %rax %rbp null 0 -112
    store %rdx %rbp null 0 -80
    store %r15 %rbp null 0 -56
    %r15 = load %rbp null 0 -472
    store %r15 %rbp null 0 -128
    %r15 = load %rbp null 0 -360
    store %r15 %rbp null 0 -352
    %r15 = load %rbp null 0 -344
    store %r15 %rbp null 0 -280
    %r15 = load %rbp null 0 -336
    store %r15 %rbp null 0 -104
    %r15 = load %rbp null 0 -160
    store %r15 %rbp null 0 -456
    %r15 = load %rbp null 0 -32
    store %r15 %rbp null 0 -208
    %rax = move %r14
    %r15 = load %rbp null 0 -408
    store %r15 %rbp null 0 -488
    %r15 = load %rbp null 0 -72
    store %r15 %rbp null 0 -248
    %rdx = load %rbp null 0 -232
    jump A_Optimizer_for_cond_2

A_Optimizer_for_cond_2:
    %r15 = load %rbp null 0 -80
    cmp %r15 %r13
    br slt A_Optimizer_for_body_2 A_Optimizer_for_step_1

A_Optimizer_for_body_2:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r15 = load %rbp null 0 -80
    store %rax %r15 null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    store %rax %rbp null 0 -416
    %r15 = load %rbp null 0 -416
    %r15 = add %r15 24
    store %r15 %rbp null 0 -416
    %r15 = load %rbp null 0 -288
    %r9 = load %rbp null 0 -112
    %rax = load %rbp null 0 -56
    store %rax %rbp null 0 -144
    %rax = load %rbp null 0 -128
    store %rax %rbp null 0 -96
    %r10 = load %rbp null 0 -352
    %rax = load %rbp null 0 -280
    store %rax %rbp null 0 -328
    %rax = load %rbp null 0 -104
    store %rax %rbp null 0 -64
    %rax = load %rbp null 0 -456
    store %rax %rbp null 0 -264
    store %r12 %rbp null 0 -504
    %r14 = load %rbp null 0 -208
    store %rdx %rbp null 0 -168
    %rax = load %rbp null 0 -488
    store %rax %rbp null 0 -224
    %rax = load %rbp null 0 -248
    store %rax %rbp null 0 -24
    jump A_Optimizer_for_cond_3

A_Optimizer_for_cond_3:
    %rax = load %rbp null 0 -168
    %rdx = load %rbp null 0 -416
    cmp %rax %rdx
    br slt A_Optimizer_for_body_3 A_Optimizer_for_step_2

A_Optimizer_for_body_3:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %rdx = load %rbp null 0 -168
    store %rax %rdx null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    store %rax %rbp null 0 -8
    %rax = load %rbp null 0 -8
    %rax = add %rax 24
    store %rax %rbp null 0 -8
    store %r15 %rbp null 0 -16
    %r15 = load %rbp null 0 -144
    store %r15 %rbp null 0 -448
    %r12 = load %rbp null 0 -96
    store %rdx %rbp null 0 -440
    %r15 = load %rbp null 0 -328
    store %r15 %rbp null 0 -432
    %r15 = load %rbp null 0 -64
    store %r15 %rbp null 0 -272
    %rdx = load %rbp null 0 -264
    %r15 = load %rbp null 0 -504
    store %r15 %rbp null 0 -152
    store %r14 %rbp null 0 -424
    %r15 = load %rbp null 0 -224
    store %r15 %rbp null 0 -256
    %rsi = load %rbp null 0 -24
    jump A_Optimizer_for_cond_4

A_Optimizer_for_cond_4:
    %rax = load %rbp null 0 -8
    %r15 = load %rbp null 0 -440
    cmp %r15 %rax
    br slt A_Optimizer_for_body_4 A_Optimizer_for_step_3

A_Optimizer_for_step_3:
    %r8 = load %rbp null 0 -168
    %r8 = add %r8 8
    %r15 = load %rbp null 0 -16
    %r9 = load %rbp null 0 -8
    %rax = load %rbp null 0 -448
    store %rax %rbp null 0 -144
    store %r12 %rbp null 0 -96
    %r10 = load %rbp null 0 -440
    %rax = load %rbp null 0 -432
    store %rax %rbp null 0 -328
    %rax = load %rbp null 0 -272
    store %rax %rbp null 0 -64
    store %rdx %rbp null 0 -264
    %rax = load %rbp null 0 -152
    store %rax %rbp null 0 -504
    %r14 = load %rbp null 0 -424
    store %r8 %rbp null 0 -168
    %rax = load %rbp null 0 -256
    store %rax %rbp null 0 -224
    store %rsi %rbp null 0 -24
    jump A_Optimizer_for_cond_3

A_Optimizer_for_body_4:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r15 = load %rbp null 0 -440
    store %rax %r15 null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    store %rax %rbp null 0 -392
    %r15 = load %rbp null 0 -392
    %r15 = add %r15 24
    store %r15 %rbp null 0 -392
    %r15 = load %rbp null 0 -16
    store %r15 %rbp null 0 -88
    %r15 = load %rbp null 0 -448
    store %r15 %rbp null 0 -296
    store %r12 %rbp null 0 -304
    %r9 = load %rbp null 0 -432
    %r14 = load %rbp null 0 -272
    %r15 = load %rbp null 0 -152
    store %r15 %rbp null 0 -464
    %r15 = load %rbp null 0 -424
    store %r15 %rbp null 0 -184
    %r15 = load %rbp null 0 -256
    store %rdx %rbp null 0 -512
    jump A_Optimizer_for_cond_5

A_Optimizer_for_cond_5:
    %rax = load %rbp null 0 -512
    %rdx = load %rbp null 0 -392
    cmp %rax %rdx
    br slt A_Optimizer_for_body_5 A_Optimizer_for_step_4

A_Optimizer_for_body_5:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r15 = load %rbp null 0 -512
    store %rax %r15 null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    %r15 = move %rax
    %r15 = add %r15 24
    %r12 = load %rbp null 0 -88
    %r9 = load %rbp null 0 -296
    %rax = load %rbp null 0 -304
    store %rax %rbp null 0 -192
    store %rdx %rbp null 0 -48
    store %r14 %rbp null 0 -520
    %rax = load %rbp null 0 -464
    store %rax %rbp null 0 -40
    %rax = load %rbp null 0 -184
    jump A_Optimizer_for_cond_6

A_Optimizer_for_cond_6:
    %r14 = load %rbp null 0 -48
    cmp %r14 %r15
    br slt A_Optimizer_for_body_6 A_Optimizer_for_step_5

A_Optimizer_for_step_5:
    %r10 = load %rbp null 0 -512
    %r10 = add %r10 8
    store %r12 %rbp null 0 -88
    store %r9 %rbp null 0 -296
    %r14 = load %rbp null 0 -192
    store %r14 %rbp null 0 -304
    %r9 = load %rbp null 0 -48
    %r14 = load %rbp null 0 -520
    %rdx = load %rbp null 0 -40
    store %rdx %rbp null 0 -464
    store %rax %rbp null 0 -184
    store %r10 %rbp null 0 -512
    jump A_Optimizer_for_cond_5

A_Optimizer_for_body_6:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r14 = load %rbp null 0 -48
    store %rax %r14 null 0 0
    %r14 = move %rax
    %r14 = add %r14 8
    store %rax %rbp null 0 -384
    %rax = load %rbp null 0 -384
    %rax = add %rax 24
    store %rax %rbp null 0 -384
    %rdx = load %rbp null 0 -192
    %rax = load %rbp null 0 -520
    store %rax %rbp null 0 -216
    %r10 = load %rbp null 0 -40
    jump A_Optimizer_for_cond_7

A_Optimizer_for_cond_7:
    %rax = load %rbp null 0 -384
    cmp %r14 %rax
    br slt A_Optimizer_for_body_7 A_Optimizer_for_step_6

A_Optimizer_for_step_6:
    %rax = load %rbp null 0 -48
    %rax = add %rax 8
    %r9 = load %rbp null 0 -384
    store %rdx %rbp null 0 -192
    store %rax %rbp null 0 -48
    %rax = load %rbp null 0 -216
    store %rax %rbp null 0 -520
    store %r10 %rbp null 0 -40
    %rax = move %r14
    jump A_Optimizer_for_cond_6

A_Optimizer_for_body_7:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    store %rax %r14 null 0 0
    %r9 = move %rax
    %r9 = add %r9 8
    store %rax %rbp null 0 -312
    %rax = load %rbp null 0 -312
    %rax = add %rax 24
    store %rax %rbp null 0 -312
    %rdx = move %r12
    %rax = load %rbp null 0 -216
    store %r9 %rbp null 0 -176
    jump A_Optimizer_for_cond_8

A_Optimizer_for_cond_8:
    %r9 = load %rbp null 0 -176
    %r12 = load %rbp null 0 -312
    cmp %r9 %r12
    br slt A_Optimizer_for_body_8 A_Optimizer_for_step_7

A_Optimizer_for_step_7:
    %r14 = add %r14 8
    %r12 = move %rdx
    %rdx = load %rbp null 0 -312
    store %rax %rbp null 0 -216
    %r10 = load %rbp null 0 -176
    jump A_Optimizer_for_cond_7

A_Optimizer_for_body_8:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %rdx = load %rbp null 0 -176
    store %rax %rdx null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    %r12 = move %rax
    %r12 = add %r12 24
    store %rdx %rbp null 0 -120
    jump A_Optimizer_for_cond_9

A_Optimizer_for_cond_9:
    %rax = load %rbp null 0 -120
    cmp %rax %r12
    br slt A_Optimizer_for_body_9 A_Optimizer_for_step_8

A_Optimizer_for_step_8:
    %r9 = load %rbp null 0 -176
    %r9 = add %r9 8
    %rdx = load %rbp null 0 -120
    %rax = move %r12
    store %r9 %rbp null 0 -176
    jump A_Optimizer_for_cond_8

A_Optimizer_for_body_9:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %rdx = load %rbp null 0 -120
    store %rax %rdx null 0 0
    %rax = load %rbp null 0 -120
    %rax = add %rax 8
    store %rax %rbp null 0 -120
    jump A_Optimizer_for_cond_9

A_Optimizer_for_step_4:
    %rax = load %rbp null 0 -440
    %rax = add %rax 8
    %rdx = load %rbp null 0 -88
    store %rdx %rbp null 0 -16
    %rdx = load %rbp null 0 -296
    store %rdx %rbp null 0 -448
    %r12 = load %rbp null 0 -304
    store %rax %rbp null 0 -440
    store %r9 %rbp null 0 -432
    store %r14 %rbp null 0 -272
    %rdx = load %rbp null 0 -392
    %rax = load %rbp null 0 -464
    store %rax %rbp null 0 -152
    %rax = load %rbp null 0 -184
    store %rax %rbp null 0 -424
    store %r15 %rbp null 0 -256
    %rsi = load %rbp null 0 -512
    jump A_Optimizer_for_cond_4

A_Optimizer_for_step_2:
    %rax = load %rbp null 0 -80
    %rax = add %rax 8
    store %r15 %rbp null 0 -288
    store %r9 %rbp null 0 -112
    store %rax %rbp null 0 -80
    %r15 = load %rbp null 0 -144
    store %r15 %rbp null 0 -56
    %r15 = load %rbp null 0 -96
    store %r15 %rbp null 0 -128
    store %r10 %rbp null 0 -352
    %r15 = load %rbp null 0 -328
    store %r15 %rbp null 0 -280
    %r15 = load %rbp null 0 -64
    store %r15 %rbp null 0 -104
    %r15 = load %rbp null 0 -264
    store %r15 %rbp null 0 -456
    %r12 = load %rbp null 0 -504
    store %r14 %rbp null 0 -208
    %rax = load %rbp null 0 -168
    %r15 = load %rbp null 0 -224
    store %r15 %rbp null 0 -488
    %r15 = load %rbp null 0 -24
    store %r15 %rbp null 0 -248
    %rdx = load %rbp null 0 -416
    jump A_Optimizer_for_cond_2

A_Optimizer_for_step_1:
    %r9 = load %rbp null 0 -480
    %r9 = add %r9 8
    %r15 = load %rbp null 0 -288
    store %r15 %rbp null 0 -200
    %r15 = load %rbp null 0 -112
    store %r15 %rbp null 0 -136
    %r15 = load %rbp null 0 -56
    %r14 = load %rbp null 0 -128
    store %r14 %rbp null 0 -472
    %r14 = load %rbp null 0 -352
    store %r14 %rbp null 0 -360
    %r14 = load %rbp null 0 -280
    store %r14 %rbp null 0 -344
    %r14 = load %rbp null 0 -104
    store %r14 %rbp null 0 -336
    %r14 = load %rbp null 0 -456
    store %r14 %rbp null 0 -160
    %r14 = load %rbp null 0 -208
    store %r14 %rbp null 0 -32
    %r14 = move %rax
    %rax = load %rbp null 0 -488
    store %rax %rbp null 0 -408
    %rax = load %rbp null 0 -248
    store %rax %rbp null 0 -72
    store %rdx %rbp null 0 -232
    store %r9 %rbp null 0 -480
    jump A_Optimizer_for_cond_1

A_Optimizer_for_merge_1:
    %rax = move 1
    %r15 = move 0
    jump A_Optimizer_for_cond_10

A_Optimizer_for_cond_10:
    cmp %rax 1000
    br sle A_Optimizer_for_body_10 A_Optimizer_for_merge_2

A_Optimizer_for_merge_2:
    %rdi = move %r15
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = move %r15
    %r15 = move 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_cond_11:
    cmp %r15 1000000
    br sle A_Optimizer_for_body_11 A_Optimizer_for_merge_3

A_Optimizer_for_body_11:
    %rdi = add %rdi 8
    %r15 = add %r15 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_merge_3:
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %r15 = move 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_cond_12:
    cmp %r15 200000000
    br sle A_Optimizer_for_step_9 A_Optimizer_for_merge_4

A_Optimizer_for_step_9:
    %r15 = add %r15 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_merge_4:
    %r15 = load %rbp null 0 -320
    %r12 = load %rbp null 0 -368
    %r14 = load %rbp null 0 -240
    %r13 = load %rbp null 0 -496
    %rbx = load %rbp null 0 -400
    %rsp = add %rsp 520
    pop %rbp
    ret 

A_Optimizer_for_body_10:
    %rdx = load %rbp null 0 -376
    %rdx = add %rdx 8
    %r14 = load %rdx null 0 0
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r12 = move 123
    %r12 = add %r12 %rax
    store %r12 %r14 null 0 16
    %r14 = load %rdx null 0 0
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r14 = load %r14 null 0 8
    %r14 = load %r14 null 0 16
    %r15 = add %r15 %r14
    %rax = add %rax 1
    jump A_Optimizer_for_cond_10

}

define i64 @A_A  {
A_A_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 456
    store %r15 %rbp null 0 -32
    store %r12 %rbp null 0 -296
    store %r14 %rbp null 0 -360
    store %r13 %rbp null 0 -144
    store %rbx %rbp null 0 -384
    store %rdi %rbp null 0 -344
    %rdi = move 24
    %rax = alloc %rdi
    store %rax %rbp null 0 -184
    %r15 = load %rbp null 0 -184
    store 2 %r15 null 0 0
    %rax = load %rbp null 0 -184
    %rax = add %rax 8
    %r15 = load %rbp null 0 -184
    store %r15 %rbp null 0 -424
    %r15 = load %rbp null 0 -424
    %r15 = add %r15 24
    store %r15 %rbp null 0 -424
    store %rax %rbp null 0 -328
    %r15 = move 0
    store %r15 %rbp null 0 -304
    %r12 = move 0
    %r15 = move 0
    store %r15 %rbp null 0 -208
    %r15 = move 0
    store %r15 %rbp null 0 -128
    %r13 = move 0
    %r15 = move 0
    store %r15 %rbp null 0 -216
    %rbx = move 0
    %r14 = move 0
    %r15 = move 0
    store %r15 %rbp null 0 -56
    %r15 = move 0
    store %r15 %rbp null 0 -352
    %r15 = move 0
    %rax = move 0
    store %rax %rbp null 0 -48
    %rax = move 0
    store %rax %rbp null 0 -288
    %rax = move 0
    store %rax %rbp null 0 -160
    jump A_A_for_cond_1

A_A_for_cond_1:
    %rdx = load %rbp null 0 -328
    %rax = load %rbp null 0 -424
    cmp %rdx %rax
    br slt A_A_for_body_1 A_A_for_merge_1

A_A_for_merge_1:
    %rax = load %rbp null 0 -184
    %r15 = load %rbp null 0 -344
    store %rax %r15 null 0 0
    %rax = move 0
    %r15 = load %rbp null 0 -32
    %r12 = load %rbp null 0 -296
    %r14 = load %rbp null 0 -360
    %r13 = load %rbp null 0 -144
    %rbx = load %rbp null 0 -384
    %rsp = add %rsp 456
    pop %rbp
    ret %rax

A_A_for_body_1:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %rdx = load %rbp null 0 -328
    store %rax %rdx null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    store %rax %rbp null 0 -120
    %rax = load %rbp null 0 -120
    %rax = add %rax 24
    store %rax %rbp null 0 -120
    %rax = load %rbp null 0 -304
    store %rax %rbp null 0 -440
    %rax = load %rbp null 0 -208
    store %rax %rbp null 0 -400
    %rax = load %rbp null 0 -128
    %r9 = load %rbp null 0 -216
    store %r9 %rbp null 0 -232
    store %rbx %rbp null 0 -456
    %r9 = load %rbp null 0 -56
    store %r9 %rbp null 0 -152
    %r9 = load %rbp null 0 -352
    store %r9 %rbp null 0 -136
    store %r15 %rbp null 0 -40
    %r15 = load %rbp null 0 -48
    store %r15 %rbp null 0 -248
    store %rdx %rbp null 0 -416
    %r9 = load %rbp null 0 -288
    %r15 = load %rbp null 0 -160
    store %r15 %rbp null 0 -112
    jump A_A_for_cond_2

A_A_for_cond_2:
    %rdx = load %rbp null 0 -416
    %r15 = load %rbp null 0 -120
    cmp %rdx %r15
    br slt A_A_for_body_2 A_A_for_step_1

A_A_for_body_2:
    %rdi = move 32
    %rax = alloc %rdi
    store 3 %rax null 0 0
    %r15 = load %rbp null 0 -416
    store %rax %r15 null 0 0
    %r15 = move %rax
    %r15 = add %r15 8
    store %rax %rbp null 0 -88
    %rax = load %rbp null 0 -88
    %rax = add %rax 32
    store %rax %rbp null 0 -88
    %rax = load %rbp null 0 -440
    store %rax %rbp null 0 -408
    %rax = load %rbp null 0 -400
    store %rax %rbp null 0 -376
    store %r15 %rbp null 0 -368
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -392
    %r15 = load %rbp null 0 -456
    store %r14 %rbp null 0 -80
    %rbx = load %rbp null 0 -152
    %r9 = load %rbp null 0 -136
    %rdx = load %rbp null 0 -40
    %rax = load %rbp null 0 -248
    store %rax %rbp null 0 -240
    %rax = load %rbp null 0 -112
    store %rax %rbp null 0 -224
    jump A_A_for_cond_3

A_A_for_cond_3:
    %r14 = load %rbp null 0 -88
    %rax = load %rbp null 0 -368
    cmp %rax %r14
    br slt A_A_for_body_3 A_A_for_step_2

A_A_for_body_3:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r14 = load %rbp null 0 -368
    store %rax %r14 null 0 0
    %r9 = move %rax
    %r9 = add %r9 8
    store %rax %rbp null 0 -256
    %rax = load %rbp null 0 -256
    %rax = add %rax 24
    store %rax %rbp null 0 -256
    %rax = load %rbp null 0 -408
    store %rax %rbp null 0 -272
    %rax = load %rbp null 0 -376
    store %rax %rbp null 0 -64
    store %r13 %rbp null 0 -96
    %r14 = load %rbp null 0 -392
    %rax = load %rbp null 0 -80
    store %rax %rbp null 0 -8
    %rdx = move %rbx
    store %r9 %rbp null 0 -104
    %rax = load %rbp null 0 -240
    %r9 = load %rbp null 0 -224
    store %r9 %rbp null 0 -168
    jump A_A_for_cond_4

A_A_for_cond_4:
    %r10 = load %rbp null 0 -256
    %r9 = load %rbp null 0 -104
    cmp %r9 %r10
    br slt A_A_for_body_4 A_A_for_step_3

A_A_for_step_3:
    %r9 = load %rbp null 0 -368
    %r9 = add %r9 8
    %r10 = load %rbp null 0 -272
    store %r10 %rbp null 0 -408
    %r10 = load %rbp null 0 -64
    store %r10 %rbp null 0 -376
    store %r9 %rbp null 0 -368
    %r13 = load %rbp null 0 -96
    store %r14 %rbp null 0 -392
    %r14 = load %rbp null 0 -8
    store %r14 %rbp null 0 -80
    %rbx = move %rdx
    %r9 = load %rbp null 0 -256
    %rdx = load %rbp null 0 -104
    store %rax %rbp null 0 -240
    %rax = load %rbp null 0 -168
    store %rax %rbp null 0 -224
    jump A_A_for_cond_3

A_A_for_body_4:
    %rdi = move 32
    %rax = alloc %rdi
    store 3 %rax null 0 0
    %rdx = load %rbp null 0 -104
    store %rax %rdx null 0 0
    %r9 = move %rax
    %r9 = add %r9 8
    %r13 = move %rax
    %r13 = add %r13 32
    %rax = load %rbp null 0 -272
    store %rax %rbp null 0 -264
    %rax = load %rbp null 0 -64
    store %rax %rbp null 0 -336
    %rbx = load %rbp null 0 -96
    %rax = move %r14
    %rdx = load %rbp null 0 -8
    store %r9 %rbp null 0 -448
    %r14 = load %rbp null 0 -168
    store %r14 %rbp null 0 -176
    jump A_A_for_cond_5

A_A_for_cond_5:
    %r14 = load %rbp null 0 -448
    cmp %r14 %r13
    br slt A_A_for_body_5 A_A_for_step_4

A_A_for_body_5:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r14 = load %rbp null 0 -448
    store %rax %r14 null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    %r14 = move %rax
    %r14 = add %r14 24
    %rax = load %rbp null 0 -264
    store %rax %rbp null 0 -192
    store %r12 %rbp null 0 -200
    %rax = load %rbp null 0 -336
    store %rax %rbp null 0 -432
    store %rdx %rbp null 0 -280
    %r9 = load %rbp null 0 -176
    jump A_A_for_cond_6

A_A_for_cond_6:
    %rax = load %rbp null 0 -280
    cmp %rax %r14
    br slt A_A_for_body_6 A_A_for_step_5

A_A_for_step_5:
    %r10 = load %rbp null 0 -448
    %r10 = add %r10 8
    %rax = load %rbp null 0 -192
    store %rax %rbp null 0 -264
    %r12 = load %rbp null 0 -200
    %rax = load %rbp null 0 -432
    store %rax %rbp null 0 -336
    %rax = load %rbp null 0 -280
    %rdx = move %r14
    store %r10 %rbp null 0 -448
    store %r9 %rbp null 0 -176
    jump A_A_for_cond_5

A_A_for_body_6:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    %r15 = load %rbp null 0 -280
    store %rax %r15 null 0 0
    %r12 = move %rax
    %r12 = add %r12 8
    store %rax %rbp null 0 -320
    %r15 = load %rbp null 0 -320
    %r15 = add %r15 24
    store %r15 %rbp null 0 -320
    %r10 = load %rbp null 0 -192
    %rdx = load %rbp null 0 -200
    %r15 = load %rbp null 0 -432
    store %r15 %rbp null 0 -16
    %r15 = move %rbx
    store %r12 %rbp null 0 -312
    jump A_A_for_cond_7

A_A_for_cond_7:
    %r12 = load %rbp null 0 -320
    %rax = load %rbp null 0 -312
    cmp %rax %r12
    br slt A_A_for_body_7 A_A_for_step_6

A_A_for_step_6:
    %rax = load %rbp null 0 -280
    %rax = add %rax 8
    store %r10 %rbp null 0 -192
    store %rdx %rbp null 0 -200
    %rdx = load %rbp null 0 -16
    store %rdx %rbp null 0 -432
    %rbx = move %r15
    store %rax %rbp null 0 -280
    %r15 = load %rbp null 0 -312
    %r9 = load %rbp null 0 -320
    jump A_A_for_cond_6

A_A_for_body_7:
    %rdi = move 32
    %rax = alloc %rdi
    store 3 %rax null 0 0
    %rdx = load %rbp null 0 -312
    store %rax %rdx null 0 0
    %rdx = move %rax
    %rdx = add %rdx 8
    store %rax %rbp null 0 -24
    %rax = load %rbp null 0 -24
    %rax = add %rax 32
    store %rax %rbp null 0 -24
    %r12 = move %rdx
    %rax = load %rbp null 0 -16
    jump A_A_for_cond_8

A_A_for_cond_8:
    %rdx = load %rbp null 0 -24
    cmp %r12 %rdx
    br slt A_A_for_body_8 A_A_for_step_7

A_A_for_body_8:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    store %rax %r12 null 0 0
    %r15 = move %rax
    %r15 = add %r15 8
    store %rax %rbp null 0 -72
    %rax = load %rbp null 0 -72
    %rax = add %rax 24
    store %rax %rbp null 0 -72
    jump A_A_for_cond_9

A_A_for_cond_9:
    %rax = load %rbp null 0 -72
    cmp %r15 %rax
    br slt A_A_for_body_9 A_A_for_step_8

A_A_for_step_8:
    %rax = move %r12
    %rax = add %rax 8
    %r12 = move %rax
    %rax = move %r15
    %r15 = load %rbp null 0 -72
    jump A_A_for_cond_8

A_A_for_body_9:
    %rdi = move 24
    %rax = alloc %rdi
    store 2 %rax null 0 0
    store %rax %r15 null 0 0
    %r15 = add %r15 8
    jump A_A_for_cond_9

A_A_for_step_7:
    %r9 = load %rbp null 0 -312
    %r9 = add %r9 8
    %r10 = load %rbp null 0 -24
    %rdx = move %r12
    store %rax %rbp null 0 -16
    store %r9 %rbp null 0 -312
    jump A_A_for_cond_7

A_A_for_step_4:
    %r9 = load %rbp null 0 -104
    %r9 = add %r9 8
    %r14 = load %rbp null 0 -264
    store %r14 %rbp null 0 -272
    %r14 = load %rbp null 0 -336
    store %r14 %rbp null 0 -64
    store %rbx %rbp null 0 -96
    %r14 = move %rax
    store %rdx %rbp null 0 -8
    %rdx = load %rbp null 0 -448
    store %r9 %rbp null 0 -104
    %rax = move %r13
    %r9 = load %rbp null 0 -176
    store %r9 %rbp null 0 -168
    jump A_A_for_cond_4

A_A_for_step_2:
    %r10 = load %rbp null 0 -416
    %r10 = add %r10 8
    %rax = load %rbp null 0 -408
    store %rax %rbp null 0 -440
    %rax = load %rbp null 0 -376
    store %rax %rbp null 0 -400
    %rax = load %rbp null 0 -368
    %r14 = load %rbp null 0 -392
    store %r14 %rbp null 0 -232
    store %r15 %rbp null 0 -456
    %r14 = load %rbp null 0 -80
    store %rbx %rbp null 0 -152
    store %r9 %rbp null 0 -136
    store %rdx %rbp null 0 -40
    %r15 = load %rbp null 0 -240
    store %r15 %rbp null 0 -248
    store %r10 %rbp null 0 -416
    %r9 = load %rbp null 0 -88
    %r15 = load %rbp null 0 -224
    store %r15 %rbp null 0 -112
    jump A_A_for_cond_2

A_A_for_step_1:
    %rdx = load %rbp null 0 -328
    %rdx = add %rdx 8
    %r15 = load %rbp null 0 -440
    store %r15 %rbp null 0 -304
    %r15 = load %rbp null 0 -400
    store %r15 %rbp null 0 -208
    store %rax %rbp null 0 -128
    %r15 = load %rbp null 0 -232
    store %r15 %rbp null 0 -216
    store %rdx %rbp null 0 -328
    %rbx = load %rbp null 0 -456
    %r15 = load %rbp null 0 -152
    store %r15 %rbp null 0 -56
    %r15 = load %rbp null 0 -136
    store %r15 %rbp null 0 -352
    %r15 = load %rbp null 0 -40
    %rax = load %rbp null 0 -248
    store %rax %rbp null 0 -48
    store %r9 %rbp null 0 -288
    %rax = load %rbp null 0 -112
    store %rax %rbp null 0 -160
    jump A_A_for_cond_1

}

define i64 @quicksort  {
quicksort_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 40
    store %r15 %rbp null 0 -40
    store %r14 %rbp null 0 -24
    store %r13 %rbp null 0 -16
    store %rbx %rbp null 0 -32
    %r15 = move %rsi
    %r8 = load @a_left_1 null 0 0
    %rax = load @a_right_1 null 0 0
    store %rax %rbp null 0 -8
    %rsi = load @a_1 null 0 0
    %r9 = load %rsi %rdi 8 8
    %r11 = move %rdi
    %r11 = add %r11 1
    %r14 = move 0
    %r13 = move 0
    %r10 = move 0
    jump quicksort_for_cond_1

quicksort_for_cond_1:
    cmp %r11 %r15
    br slt quicksort_for_body_1 quicksort_for_merge_1

quicksort_for_body_1:
    %r14 = add %r14 1
    %rbx = lea %rsi %r11 8 8
    %rax = load %rbx null 0 0
    cmp %rax %r9
    br slt quicksort_if_then_1 quicksort_if_else_1

quicksort_if_else_1:
    %rax = move %r13
    %rax = add %rax 1
    %rdx = load %rbx null 0 0
    %rbx = load %rbp null 0 -8
    store %rdx %rbx %r13 8 8
    jump quicksort_for_step_1

quicksort_if_then_1:
    %rdx = move %r10
    %rdx = add %rdx 1
    %rax = load %rbx null 0 0
    store %rax %r8 %r10 8 8
    %rax = move %r13
    %r10 = move %rdx
    jump quicksort_for_step_1

quicksort_for_step_1:
    %r11 = add %r11 1
    %r13 = move %rax
    jump quicksort_for_cond_1

quicksort_for_merge_1:
    %rax = move %rdi
    %rdx = move 0
    jump quicksort_for_cond_2

quicksort_for_cond_2:
    cmp %rdx %r10
    br slt quicksort_for_body_2 quicksort_for_merge_2

quicksort_for_merge_2:
    %rdx = move %rax
    %rdx = add %rdx 1
    store %r9 %rsi %rax 8 8
    %rax = move 0
    jump quicksort_for_cond_3

quicksort_for_cond_3:
    cmp %rax %r13
    br slt quicksort_for_body_3 quicksort_for_merge_3

quicksort_for_body_3:
    %r9 = move %rdx
    %r9 = add %r9 1
    %r8 = load %rbp null 0 -8
    %r8 = load %r8 %rax 8 8
    store %r8 %rsi %rdx 8 8
    %rax = add %rax 1
    %rdx = move %r9
    jump quicksort_for_cond_3

quicksort_for_merge_3:
    cmp %r10 1
    br sgt quicksort_if_then_2 quicksort_if_merge_1

quicksort_if_then_2:
    %rsi = move %rdi
    %rsi = add %rsi %r10
    %rax = call quicksort %rdi %rsi 
    %r14 = add %r14 %rax
    jump quicksort_if_merge_1

quicksort_if_merge_1:
    cmp %r13 1
    br sgt quicksort_if_then_3 quicksort_if_merge_2

quicksort_if_then_3:
    %rdi = move %r15
    %rdi = sub %rdi %r13
    %rsi = move %r15
    %rax = call quicksort %rdi %rsi 
    %r14 = add %r14 %rax
    jump quicksort_if_merge_2

quicksort_if_merge_2:
    %rax = move %r14
    %r15 = load %rbp null 0 -40
    %r14 = load %rbp null 0 -24
    %r13 = load %rbp null 0 -16
    %rbx = load %rbp null 0 -32
    %rsp = add %rsp 40
    pop %rbp
    ret %rax

quicksort_for_body_2:
    %r11 = move %rax
    %r11 = add %r11 1
    %rbx = load %r8 %rdx 8 8
    store %rbx %rsi %rax 8 8
    %rdx = add %rdx 1
    %rax = move %r11
    jump quicksort_for_cond_2

}

define i64 @calc  {
calc_entry_1:
    push %rbp
    %rbp = move %rsp
    %r10 = load @a_left_1 null 0 0
    %rsi = load @a_right_1 null 0 0
    %r9 = load @a_1 null 0 0
    %rdx = load @n_1 null 0 0
    %rax = move 1
    jump calc_for_cond_1

calc_for_cond_1:
    cmp %rax %rdx
    br sle calc_for_body_1 calc_for_merge_1

calc_for_merge_1:
    %rax = move 0
    jump calc_for_cond_2

calc_for_cond_2:
    cmp %rdx 1
    br sge calc_for_body_2 calc_for_merge_2

calc_for_merge_2:
    pop %rbp
    ret %rax

calc_for_body_2:
    %rcx = lea %r9 %rdx 8 8
    %r8 = load %rcx null 0 0
    %r11 = load %r10 %r8 8 8
    %r8 = load %rcx null 0 0
    %r8 = load %rsi %r8 8 8
    store %r8 %rsi %r11 8 8
    store %r11 %r10 %r8 8 8
    %rax = add %rax %r8
    %rax = sub %rax %r11
    %rax = sub %rax 2
    %rdx = sub %rdx 1
    jump calc_for_cond_2

calc_for_body_1:
    %r11 = lea null %rax 8 8
    %r8 = move %rax
    %r8 = sub %r8 1
    store %r8 %r10 %r11 1 0
    %rax = add %rax 1
    store %rax %rsi %r11 1 0
    jump calc_for_cond_1

}

define i64 @mergesort  {
mergesort_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 56
    store %r15 %rbp null 0 -56
    store %r14 %rbp null 0 -16
    store %rsi %rbp null 0 -48
    %r15 = move %rdi
    %rax = load @a_left_1 null 0 0
    store %rax %rbp null 0 -8
    %rax = load @a_1 null 0 0
    store %rax %rbp null 0 -40
    %rax = load @a_right_1 null 0 0
    store %rax %rbp null 0 -24
    %rax = move %r15
    %rax = add %rax 1
    %r14 = load %rbp null 0 -48
    cmp %rax %r14
    br seq mergesort_if_then_1 mergesort_if_merge_1

mergesort_if_then_1:
    %rax = move 0
    jump mergesort_exit_1

mergesort_if_merge_1:
    %rax = move %r15
    %r14 = load %rbp null 0 -48
    %rax = add %rax %r14
    store %rax %rbp null 0 -32
    %rax = load %rbp null 0 -32
    %rax = shr %rax 1
    store %rax %rbp null 0 -32
    %rdi = move %r15
    %rsi = load %rbp null 0 -32
    %rax = call mergesort %rdi %rsi 
    %r14 = move %rax
    %rdi = load %rbp null 0 -32
    %rsi = load %rbp null 0 -48
    %rax = call mergesort %rdi %rsi 
    %rax = lea %r14 %rax 1 0
    %r14 = move %r15
    %rsi = move 0
    jump mergesort_for_cond_1

mergesort_for_cond_1:
    %rdx = load %rbp null 0 -32
    cmp %r14 %rdx
    br slt mergesort_for_body_1 mergesort_for_merge_1

mergesort_for_body_1:
    %rdx = move %rsi
    %rdx = add %rdx 1
    %r9 = load %rbp null 0 -40
    %r9 = load %r9 %r14 8 8
    %r10 = load %rbp null 0 -8
    store %r9 %r10 %rsi 8 8
    %r14 = add %r14 1
    %rsi = move %rdx
    jump mergesort_for_cond_1

mergesort_for_merge_1:
    %rdx = load %rbp null 0 -32
    %r10 = move 0
    jump mergesort_for_cond_2

mergesort_for_cond_2:
    %r14 = load %rbp null 0 -48
    cmp %rdx %r14
    br slt mergesort_for_body_2 mergesort_for_merge_2

mergesort_for_body_2:
    %r14 = move %r10
    %r14 = add %r14 1
    %r9 = load %rbp null 0 -40
    %r9 = load %r9 %rdx 8 8
    %r8 = load %rbp null 0 -24
    store %r9 %r8 %r10 8 8
    %rdx = add %rdx 1
    %r10 = move %r14
    jump mergesort_for_cond_2

mergesort_for_merge_2:
    %r9 = move 0
    %r14 = move 0
    jump mergesort_while_cond_1

mergesort_while_cond_1:
    cmp %r14 %rsi
    br slt mergesort_lhs_then_1 mergesort_while_cond_2

mergesort_lhs_then_1:
    cmp %r9 %r10
    br slt mergesort_while_body_1 mergesort_while_cond_2

mergesort_while_body_1:
    %rax = add %rax 1
    %rdx = load %rbp null 0 -8
    %r11 = lea %rdx %r14 8 8
    %rdx = load %rbp null 0 -24
    %r8 = lea %rdx %r9 8 8
    %rcx = load %r11 null 0 0
    %rdx = load %r8 null 0 0
    cmp %rcx %rdx
    br slt mergesort_if_then_2 mergesort_if_else_1

mergesort_if_then_2:
    %rdx = move %r15
    %rdx = add %rdx 1
    %r14 = add %r14 1
    %r8 = load %r11 null 0 0
    %r11 = load %rbp null 0 -40
    store %r8 %r11 %r15 8 8
    %r15 = move %rdx
    jump mergesort_while_cond_1

mergesort_if_else_1:
    %rdx = move %r15
    %rdx = add %rdx 1
    %r9 = add %r9 1
    %r8 = load %r8 null 0 0
    %r11 = load %rbp null 0 -40
    store %r8 %r11 %r15 8 8
    %r15 = move %rdx
    jump mergesort_while_cond_1

mergesort_while_cond_2:
    cmp %r14 %rsi
    br slt mergesort_while_body_2 mergesort_while_cond_3

mergesort_while_body_2:
    %rdx = move %r15
    %rdx = add %rdx 1
    %r8 = move %r14
    %r8 = add %r8 1
    %r11 = load %rbp null 0 -8
    %r14 = load %r11 %r14 8 8
    %r11 = load %rbp null 0 -40
    store %r14 %r11 %r15 8 8
    %r14 = move %r8
    %r15 = move %rdx
    jump mergesort_while_cond_2

mergesort_while_cond_3:
    cmp %r9 %r10
    br slt mergesort_while_body_3 mergesort_exit_1

mergesort_while_body_3:
    %r14 = move %r15
    %r14 = add %r14 1
    %rdx = move %r9
    %rdx = add %rdx 1
    %rsi = load %rbp null 0 -24
    %r9 = load %rsi %r9 8 8
    %rsi = load %rbp null 0 -40
    store %r9 %rsi %r15 8 8
    %r9 = move %rdx
    %r15 = move %r14
    jump mergesort_while_cond_3

mergesort_exit_1:
    %r15 = load %rbp null 0 -56
    %r14 = load %rbp null 0 -16
    %rsp = add %rsp 56
    pop %rbp
    ret %rax

}

define i64 @heapsort  {
heapsort_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 40
    %rdi = move %rbx
    %rax = load @heap_1 null 0 0
    store %rax %rbp null 0 -24
    %r8 = load @a_1 null 0 0
    %rax = load @n_1 null 0 0
    store %rax %rbp null 0 -40
    %rax = move 0
    %rdx = move 1
    jump heapsort_for_cond_1

heapsort_for_cond_1:
    %r9 = load %rbp null 0 -40
    cmp %rdx %r9
    br sle heapsort_for_body_1 heapsort_for_merge_1

heapsort_for_merge_1:
    %rbx = load %rbp null 0 -40
    %r11 = move 0
    %r9 = move 0
    %rdx = move 1
    store %rdx %rbp null 0 -16
    %rdx = move 0
    jump heapsort_for_cond_2

heapsort_for_cond_2:
    %rsi = load %rbp null 0 -40
    %r10 = load %rbp null 0 -16
    cmp %r10 %rsi
    br sle heapsort_for_body_2 heapsort_for_merge_2

heapsort_for_body_2:
    %r10 = load %rbp null 0 -24
    %r10 = add %r10 16
    %rsi = load %r10 null 0 0
    %rcx = load %rbp null 0 -16
    store %rsi %r8 %rcx 8 8
    store %rbx %rbp null 0 -8
    %rsi = load %rbp null 0 -8
    %rsi = sub %rsi 1
    store %rsi %rbp null 0 -8
    %rsi = load %rbp null 0 -24
    %rsi = load %rsi %rbx 8 8
    store %rsi %r10 null 0 0
    %r10 = move %r11
    %rbx = move 1
    jump heapsort_while_cond_1

heapsort_while_cond_1:
    %rsi = move %rbx
    %rsi = shl %rsi 1
    %r11 = load %rbp null 0 -8
    cmp %rsi %r11
    br sle heapsort_while_body_1 heapsort_parallel_copy_1

heapsort_parallel_copy_1:
    %rsi = move %r10
    jump heapsort_for_step_1

heapsort_while_body_1:
    store %rsi %rbp null 0 -32
    %rdx = load %rbp null 0 -32
    %rdx = add %rdx 1
    store %rdx %rbp null 0 -32
    %r9 = load %rbp null 0 -32
    %rdx = load %rbp null 0 -8
    cmp %r9 %rdx
    br sle heapsort_if_then_1 heapsort_parallel_copy_2

heapsort_if_then_1:
    %rax = add %rax 1
    %r9 = load %rbp null 0 -32
    %rdx = load %rbp null 0 -24
    %rdx = load %rdx %r9 8 8
    %r9 = load %rbp null 0 -24
    %r9 = load %r9 %rsi 8 8
    cmp %rdx %r9
    br slt heapsort_if_then_2 heapsort_parallel_copy_3

heapsort_parallel_copy_3:
    %r11 = move %rsi
    jump heapsort_if_merge_1

heapsort_if_then_2:
    %r11 = load %rbp null 0 -32
    jump heapsort_if_merge_1

heapsort_parallel_copy_2:
    %r11 = move %rsi
    jump heapsort_if_merge_1

heapsort_if_merge_1:
    %rax = add %rax 1
    %rdx = load %rbp null 0 -24
    %r10 = lea %rdx %rbx 8 8
    %rdx = load %rbp null 0 -24
    %r9 = lea %rdx %r11 8 8
    %rcx = load %r10 null 0 0
    %rdx = load %r9 null 0 0
    cmp %rcx %rdx
    br slt heapsort_parallel_copy_4 heapsort_if_merge_2

heapsort_parallel_copy_4:
    %r9 = move %r11
    %rdx = load %rbp null 0 -32
    jump heapsort_for_step_1

heapsort_for_step_1:
    %r10 = load %rbp null 0 -16
    %r10 = add %r10 1
    %r11 = move %rsi
    %rbx = load %rbp null 0 -8
    store %r10 %rbp null 0 -16
    jump heapsort_for_cond_2

heapsort_if_merge_2:
    %rcx = load %r10 null 0 0
    %rdx = load %r9 null 0 0
    store %rdx %r10 null 0 0
    store %rcx %r9 null 0 0
    %r10 = move %rsi
    %r9 = move %rbx
    %rdx = load %rbp null 0 -32
    %rbx = move %r11
    jump heapsort_while_cond_1

heapsort_for_merge_2:
    %rbx = move %rdi
    %rsp = add %rsp 40
    pop %rbp
    ret %rax

heapsort_for_body_1:
    %r9 = lea null %rdx 8 8
    %rsi = load %r8 %r9 1 0
    %r10 = load %rbp null 0 -24
    store %rsi %r10 %r9 1 0
    %r9 = move %rdx
    jump heapsort_while_cond_2

heapsort_while_cond_2:
    cmp %r9 1
    br sne heapsort_while_body_2 heapsort_for_step_2

heapsort_while_body_2:
    %rax = add %rax 1
    %r10 = load %rbp null 0 -24
    %r11 = lea %r10 %r9 8 8
    %r9 = shr %r9 1
    %r10 = load %rbp null 0 -24
    %rsi = lea %r10 %r9 8 8
    %rbx = load %r11 null 0 0
    %r10 = load %rsi null 0 0
    cmp %rbx %r10
    br sgt heapsort_for_step_2 heapsort_if_merge_3

heapsort_for_step_2:
    %rdx = add %rdx 1
    jump heapsort_for_cond_1

heapsort_if_merge_3:
    %rbx = load %r11 null 0 0
    %r10 = load %rsi null 0 0
    store %r10 %r11 null 0 0
    store %rbx %rsi null 0 0
    jump heapsort_while_cond_2

}

define i64 @main  {
main_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 48
    store %r12 %rbp null 0 -8
    store %r14 %rbp null 0 -24
    %r14 = load @a_1 null 0 0
    %rax = load @bak_1 null 0 0
    store %rax %rbp null 0 -48
    %rax = call getInt 
    store %rax %rbp null 0 -32
    %rax = call getInt 
    %r12 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %rdx = load %rbp null 0 -32
    cmp %r12 %rdx
    br sle main_for_body_1 main_for_merge_1

main_for_body_1:
    %r9 = lea %r14 %r12 8 8
    store %r12 %r9 null 0 0
    cmp %r12 %rax
    br sle main_if_then_1 main_if_merge_1

main_if_then_1:
    %rdx = move %rax
    %rdx = add %rdx 1
    %rdx = sub %rdx %r12
    store %rdx %r9 null 0 0
    jump main_if_merge_1

main_if_merge_1:
    %rdx = lea null %r12 8 8
    %r9 = load %r14 %rdx 1 0
    %r10 = load %rbp null 0 -48
    store %r9 %r10 %rdx 1 0
    %r12 = add %r12 1
    jump main_for_cond_1

main_for_merge_1:
    %rsi = load %rbp null 0 -32
    %rsi = add %rsi 1
    %rdi = move 1
    %rax = call quicksort %rdi %rsi 
    %r12 = move %rax
    %rax = move 1
    jump main_faker_restore_for_cond_1

main_faker_restore_for_cond_1:
    %rdx = load %rbp null 0 -32
    cmp %rax %rdx
    br sle main_faker_restore_for_body_1 main_splitter_1

main_splitter_1:
    %rax = load %rbp null 0 -32
    store %rax @n_1 null 0 0
    %rax = call calc 
    store %rax %rbp null 0 -16
    %rax = move 1
    jump main_faker_restore_for_cond_2

main_faker_restore_for_cond_2:
    %rdx = load %rbp null 0 -32
    cmp %rax %rdx
    br sle main_faker_restore_for_body_2 main_splitter_2

main_faker_restore_for_body_2:
    %r9 = lea null %rax 8 8
    %rdx = load %rbp null 0 -48
    %rdx = load %rdx %r9 1 0
    store %rdx %r14 %r9 1 0
    %rax = add %rax 1
    jump main_faker_restore_for_cond_2

main_splitter_2:
    %rsi = load %rbp null 0 -32
    %rsi = add %rsi 1
    %rdi = move 1
    %rax = call mergesort %rdi %rsi 
    store %rax %rbp null 0 -40
    %rax = move 1
    jump main_faker_restore_for_cond_3

main_faker_restore_for_cond_3:
    %rdx = load %rbp null 0 -32
    cmp %rax %rdx
    br sle main_faker_restore_for_body_3 main_splitter_3

main_faker_restore_for_body_3:
    %rdx = lea null %rax 8 8
    %r9 = load %rbp null 0 -48
    %r9 = load %r9 %rdx 1 0
    store %r9 %r14 %rdx 1 0
    %rax = add %rax 1
    jump main_faker_restore_for_cond_3

main_splitter_3:
    %rax = load %rbp null 0 -32
    store %rax @n_1 null 0 0
    %rax = call heapsort 
    %r14 = move %rax
    %rdi = move %r12
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = load %rbp null 0 -16
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = load %rbp null 0 -40
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = move %r14
    %rax = call toString %rdi 
    %rdi = move %rax
    call println %rdi 
    %rdi = move 8
    %rax = alloc %rdi
    %rdi = move %rax
    call A_A %rdi 
    call A_Optimizer 
    %rax = load %rbp null 0 -32
    store %rax @n_1 null 0 0
    %rax = move 0
    %r12 = load %rbp null 0 -8
    %r14 = load %rbp null 0 -24
    %rsp = add %rsp 48
    pop %rbp
    ret %rax

main_faker_restore_for_body_1:
    %r9 = lea null %rax 8 8
    %rdx = load %rbp null 0 -48
    %rdx = load %rdx %r9 1 0
    store %rdx %r14 %r9 1 0
    %rax = add %rax 1
    jump main_faker_restore_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    push %rbp
    %rbp = move %rsp
    %rsp = sub %rsp 40
    store %r15 %rbp null 0 -16
    store %r12 %rbp null 0 -24
    store %r14 %rbp null 0 -40
    store %r13 %rbp null 0 -32
    %rdi = move 800008
    %rax = alloc %rdi
    %r14 = move %rax
    store 100000 %r14 null 0 0
    %rdi = move 800008
    %rax = alloc %rdi
    %r13 = move %rax
    store 100000 %r13 null 0 0
    %rdi = move 800008
    %rax = alloc %rdi
    store %rax %rbp null 0 -8
    %r15 = load %rbp null 0 -8
    store 100000 %r15 null 0 0
    %rdi = move 800008
    %rax = alloc %rdi
    %r15 = move %rax
    store 100000 %r15 null 0 0
    %rdi = move 800008
    %rax = alloc %rdi
    %r12 = move %rax
    store 100000 %r12 null 0 0
    store %r13 @bak_1 null 0 0
    store %r14 @a_1 null 0 0
    store %r15 @a_right_1 null 0 0
    %rax = load %rbp null 0 -8
    store %rax @a_left_1 null 0 0
    store %r12 @heap_1 null 0 0
    %rax = call main 
    store %r13 @bak_1 null 0 0
    store %r14 @a_1 null 0 0
    store %r15 @a_right_1 null 0 0
    %r15 = load %rbp null 0 -8
    store %r15 @a_left_1 null 0 0
    store %r12 @heap_1 null 0 0
    store 100000 @N_1 null 0 0
    %r15 = load %rbp null 0 -16
    %r12 = load %rbp null 0 -24
    %r14 = load %rbp null 0 -40
    %r13 = load %rbp null 0 -32
    %rsp = add %rsp 40
    pop %rbp
    ret %rax

}


@asciiTable_1
@MAXCHUNK_1
@MAXLENGTH_1
@chunks_1
@inputBuffer_1
@outputBuffer_1
@__str_const_1 = ""
@__str_const_2 = ""
@__str_const_3 = "nChunk > MAXCHUNK!"
@__str_const_4 = ""
@__str_const_5 = "Invalid input"
@__str_const_6 = ""
@__str_const_7 = "Not Found!"
@__str_const_8 = "C"
@__str_const_9 = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

define i64 @sha1  {
sha1_entry_1:
    %rbx = load @outputBuffer_1 null 0 0
    store %rbx %rbp null 0 -208
    %r13 = load @MAXCHUNK_1 null 0 0
    %rbx = load @chunks_1 null 0 0
    store %rbx %rbp null 0 -136
    %rax = lea %rsi null 0 8
    %rcx = move 64
    %rax = div %rax %rcx
    store %rax %rbp null 0 -248
    %rbx = load %rbp null 0 -248
    %rbx = add %rbx 1
    store %rbx %rbp null 0 -248
    %rbx = load %rbp null 0 -248
    cmp %rbx %r13
    br sgt sha1_if_then_1 sha1_if_merge_1

sha1_if_then_1:
    %rdi = move @__str_const_3
    call println %rdi 
    %rax = move 0
    jump sha1_exit_1

sha1_if_merge_1:
    %rbx = move 0
    jump sha1_for_cond_1

sha1_for_cond_1:
    %r13 = load %rbp null 0 -248
    cmp %rbx %r13
    br slt sha1_for_body_1 sha1_for_merge_1

sha1_for_body_1:
    %r13 = move 0
    jump sha1_for_cond_2

sha1_for_cond_2:
    cmp %r13 80
    br slt sha1_for_body_2 sha1_for_step_1

sha1_for_step_1:
    %rbx = add %rbx 1
    jump sha1_for_cond_1

sha1_for_body_2:
    %rcx = load %rbp null 0 -136
    %rcx = load %rcx %rbx 8 8
    store 0 %rcx %r13 8 8
    %r13 = add %r13 1
    jump sha1_for_cond_2

sha1_for_merge_1:
    %rbx = move 0
    jump sha1_for_cond_3

sha1_for_cond_3:
    cmp %rbx %rsi
    br slt sha1_for_body_3 sha1_for_merge_2

sha1_for_merge_2:
    %rax = move %rbx
    %rcx = move 64
    %rax = div %rax %rcx
    %r13 = load %rbp null 0 -136
    %r9 = lea %r13 %rax 8 8
    %rdx = move %rbx
    %rax = move %rdx
    %rcx = move 64
    %rax = mod %rax %rcx
    %rax = move %rdx
    %rcx = move 4
    %rax = div %rax %rcx
    %rdx = move %rax
    %r13 = load %r9 null 0 0
    %rdi = lea null %rdx 8 8
    %r9 = load %r9 null 0 0
    %rdx = move %rbx
    %rax = move %rdx
    %rcx = move 4
    %rax = mod %rax %rcx
    %rcx = move 3
    %rcx = sub %rcx %rdx
    %rcx = mul %rcx 8
    %r12 = move 128
    %r12 = shl %r12 %rcx
    %rbx = load %r9 %rdi 1 0
    %rbx = or %rbx %r12
    store %rbx %r13 %rdi 1 0
    %r13 = load %rbp null 0 -248
    %rbx = load %rbp null 0 -136
    %r13 = lea %rbx %r13 8 0
    %rcx = load %r13 null 0 0
    %rbx = move %rsi
    %rbx = shl %rbx 3
    store %rbx %rcx null 0 128
    %rbx = load %r13 null 0 0
    %rsi = shr %rsi 29
    %rsi = and %rsi 7
    store %rsi %rbx null 0 120
    %r13 = move 0
    %rbx = move 0
    store %rbx %rbp null 0 -152
    %rbx = move -271733879
    store %rbx %rbp null 0 -264
    %r8 = move 0
    %rbx = move 0
    %rcx = move 1732584193
    store %rcx %rbp null 0 -96
    %rcx = move -1009589776
    store %rcx %rbp null 0 -56
    %rcx = move 271733878
    store %rcx %rbp null 0 -8
    %rsi = move 0
    %rcx = move 0
    %r10 = move 0
    %rax = move 0
    %r9 = move 0
    %r15 = move 0
    %rdi = move -1732584194
    store %rdi %rbp null 0 -184
    %rdi = move 0
    %r12 = move 0
    store %r12 %rbp null 0 -176
    %r11 = move 0
    %r12 = move 0
    store %r12 %rbp null 0 -80
    jump sha1_for_cond_4

sha1_for_cond_4:
    %rdx = load %rbp null 0 -176
    %r12 = load %rbp null 0 -248
    cmp %rdx %r12
    br slt sha1_for_body_4 sha1_for_merge_3

sha1_for_body_4:
    %r12 = move %r13
    store %r15 %rbp null 0 -48
    %r15 = move 16
    jump sha1_for_cond_5

sha1_for_cond_5:
    cmp %r15 80
    br slt sha1_for_body_5 sha1_for_merge_4

sha1_for_merge_4:
    %r13 = load %rbp null 0 -152
    store %r13 %rbp null 0 -32
    %r13 = load %rbp null 0 -264
    %rdx = move %rbx
    %rbx = load %rbp null 0 -56
    store %rsi %rbp null 0 -160
    %r15 = move %rcx
    store %rax %rbp null 0 -120
    %rsi = load %rbp null 0 -184
    %rax = load %rbp null 0 -8
    %rcx = load %rbp null 0 -96
    store %rdi %rbp null 0 -280
    %r14 = move %r11
    %rdi = load %rbp null 0 -80
    store %rdi %rbp null 0 -232
    %r11 = move 0
    jump sha1_for_cond_6

sha1_for_cond_6:
    cmp %r11 80
    br slt sha1_for_body_6 sha1_for_merge_5

sha1_for_merge_5:
    %r11 = load %rbp null 0 -96
    %r11 = and %r11 65535
    store %rcx %rbp null 0 -192
    %rdi = load %rbp null 0 -192
    %rdi = and %rdi 65535
    store %rdi %rbp null 0 -192
    %rdi = load %rbp null 0 -192
    %r11 = add %r11 %rdi
    %rdi = load %rbp null 0 -96
    store %rdi %rbp null 0 -272
    %rdi = load %rbp null 0 -272
    %rdi = shr %rdi 16
    store %rdi %rbp null 0 -272
    %rdi = load %rbp null 0 -272
    store %rdi %rbp null 0 -240
    %rdi = load %rbp null 0 -240
    %rdi = and %rdi 65535
    store %rdi %rbp null 0 -240
    %rcx = shr %rcx 16
    store %rcx %rbp null 0 -256
    %rcx = load %rbp null 0 -256
    %rcx = and %rcx 65535
    store %rcx %rbp null 0 -256
    %rdi = load %rbp null 0 -240
    %rcx = load %rbp null 0 -256
    %rdi = add %rdi %rcx
    store %r11 %rbp null 0 -24
    %rcx = load %rbp null 0 -24
    %rcx = shr %rcx 16
    store %rcx %rbp null 0 -24
    %rcx = load %rbp null 0 -24
    %rdi = add %rdi %rcx
    %rcx = move %rdi
    %rcx = and %rcx 65535
    store %rcx %rbp null 0 -40
    %rcx = load %rbp null 0 -40
    %rcx = shl %rcx 16
    store %rcx %rbp null 0 -40
    %rcx = move %r11
    %rcx = and %rcx 65535
    %rdi = load %rbp null 0 -40
    store %rdi %rbp null 0 -104
    %rdi = load %rbp null 0 -104
    %rdi = or %rdi %rcx
    store %rdi %rbp null 0 -104
    %rdi = load %rbp null 0 -264
    %rdi = and %rdi 65535
    %rcx = move %r13
    %rcx = and %rcx 65535
    %rdi = add %rdi %rcx
    %rcx = load %rbp null 0 -264
    %rcx = shr %rcx 16
    %rcx = and %rcx 65535
    %r13 = shr %r13 16
    %r13 = and %r13 65535
    %rcx = add %rcx %r13
    store %rdi %rbp null 0 -216
    %r13 = load %rbp null 0 -216
    %r13 = shr %r13 16
    store %r13 %rbp null 0 -216
    %r13 = load %rbp null 0 -216
    %rcx = add %rcx %r13
    %rcx = and %rcx 65535
    %rcx = shl %rcx 16
    %r13 = move %rdi
    %r13 = and %r13 65535
    %rcx = or %rcx %r13
    %r13 = load %rbp null 0 -184
    %r13 = and %r13 65535
    %rdi = move %rsi
    %rdi = and %rdi 65535
    %r13 = add %r13 %rdi
    %rdi = load %rbp null 0 -184
    %rdi = shr %rdi 16
    store %rdi %rbp null 0 -72
    %rdi = load %rbp null 0 -72
    %rdi = and %rdi 65535
    store %rdi %rbp null 0 -72
    %rsi = shr %rsi 16
    %rsi = and %rsi 65535
    %rdi = load %rbp null 0 -72
    %rdi = add %rdi %rsi
    %rsi = move %r13
    %rsi = shr %rsi 16
    %rdi = add %rdi %rsi
    %rdi = and %rdi 65535
    %rdi = shl %rdi 16
    %r13 = and %r13 65535
    store %rdi %rbp null 0 -144
    %rdi = load %rbp null 0 -144
    %rdi = or %rdi %r13
    store %rdi %rbp null 0 -144
    %rsi = load %rbp null 0 -8
    %rsi = and %rsi 65535
    %r13 = move %rax
    %r13 = and %r13 65535
    %rsi = add %rsi %r13
    %rdi = load %rbp null 0 -8
    %rdi = shr %rdi 16
    %rdi = and %rdi 65535
    %r13 = move %rax
    %r13 = shr %r13 16
    %r13 = and %r13 65535
    %rdi = add %rdi %r13
    %r13 = move %rsi
    %r13 = shr %r13 16
    %rdi = add %rdi %r13
    %rdi = and %rdi 65535
    %rdi = shl %rdi 16
    %rsi = and %rsi 65535
    store %rdi %rbp null 0 -16
    %r13 = load %rbp null 0 -16
    %r13 = or %r13 %rsi
    store %r13 %rbp null 0 -16
    %r13 = load %rbp null 0 -56
    %r13 = and %r13 65535
    %rdi = move %rbx
    %rdi = and %rdi 65535
    %r13 = add %r13 %rdi
    %rdi = load %rbp null 0 -56
    %rdi = shr %rdi 16
    %rdi = and %rdi 65535
    %rbx = shr %rbx 16
    %rbx = and %rbx 65535
    %rdi = add %rdi %rbx
    %rbx = move %r13
    %rbx = shr %rbx 16
    %rdi = add %rdi %rbx
    %rdi = and %rdi 65535
    %rdi = shl %rdi 16
    %r13 = and %r13 65535
    %rdi = or %rdi %r13
    %rbx = load %rbp null 0 -176
    store %rbx %rbp null 0 -88
    %rbx = load %rbp null 0 -88
    %rbx = add %rbx 1
    store %rbx %rbp null 0 -88
    %r13 = move %r12
    %rbx = load %rbp null 0 -32
    store %rbx %rbp null 0 -152
    store %rcx %rbp null 0 -264
    %rbx = move %rdx
    %rcx = load %rbp null 0 -104
    store %rcx %rbp null 0 -96
    store %rdi %rbp null 0 -56
    %rcx = load %rbp null 0 -16
    store %rcx %rbp null 0 -8
    %rsi = load %rbp null 0 -160
    %rcx = move %r15
    %rax = load %rbp null 0 -120
    %r15 = load %rbp null 0 -48
    %rdi = load %rbp null 0 -144
    store %rdi %rbp null 0 -184
    %rdi = load %rbp null 0 -280
    %r12 = load %rbp null 0 -88
    store %r12 %rbp null 0 -176
    %r11 = move %r14
    %r12 = load %rbp null 0 -232
    store %r12 %rbp null 0 -80
    jump sha1_for_cond_4

sha1_for_body_6:
    cmp %r11 20
    br slt sha1_if_then_2 sha1_if_else_1

sha1_if_else_1:
    cmp %r11 40
    br slt sha1_if_then_3 sha1_if_else_2

sha1_if_else_2:
    cmp %r11 60
    br slt sha1_if_then_4 sha1_if_else_3

sha1_if_else_3:
    %rdi = move %r13
    %rdi = xor %rdi %rsi
    %rdi = xor %rdi %rax
    %r10 = move %rdi
    %r15 = move -899497514
    jump sha1_if_merge_2

sha1_if_then_4:
    %rdi = move %r13
    %rdi = and %rdi %rsi
    %r15 = move %r13
    %r15 = and %r15 %rax
    %rdi = or %rdi %r15
    %r15 = move %rsi
    %r15 = and %r15 %rax
    %rdi = or %rdi %r15
    %r10 = move %rdi
    %r15 = move -1894007588
    jump sha1_if_merge_2

sha1_if_then_3:
    %rdi = move %r13
    %rdi = xor %rdi %rsi
    %rdi = xor %rdi %rax
    %r10 = move %rdi
    %r15 = move 1859775393
    jump sha1_if_merge_2

sha1_if_then_2:
    %rdi = move %r13
    %rdi = and %rdi %rsi
    %r15 = not %r13
    %r15 = and %r15 %rax
    %rdi = or %rdi %r15
    %r10 = move %rdi
    %r15 = move 1518500249
    jump sha1_if_merge_2

sha1_if_merge_2:
    %rdi = move %rcx
    %rdi = and %rdi 134217727
    %rdi = shl %rdi 5
    %rdx = move %rcx
    %rdx = shr %rdx 27
    %rdx = and %rdx 31
    %rdi = or %rdi %rdx
    %rdx = move %rdi
    %rdx = and %rdx 65535
    %r14 = move %rbx
    %r14 = and %r14 65535
    %rdx = add %rdx %r14
    %r14 = move %rdi
    %r14 = shr %r14 16
    %r14 = and %r14 65535
    %rbx = shr %rbx 16
    %rbx = and %rbx 65535
    %r14 = add %r14 %rbx
    %rbx = move %rdx
    %rbx = shr %rbx 16
    %r14 = add %r14 %rbx
    %rbx = move %r14
    %rbx = and %rbx 65535
    %r14 = move %rbx
    %r14 = shl %r14 16
    %rbx = move %rdx
    %rbx = and %rbx 65535
    %r14 = or %r14 %rbx
    %rdx = move %r10
    %rdx = and %rdx 65535
    store %r15 %rbp null 0 -288
    %rbx = load %rbp null 0 -288
    %rbx = and %rbx 65535
    store %rbx %rbp null 0 -288
    store %rdx %rbp null 0 -320
    %rbx = load %rbp null 0 -288
    %rdx = load %rbp null 0 -320
    %rdx = add %rdx %rbx
    store %rdx %rbp null 0 -320
    %rbx = move %r10
    %rbx = shr %rbx 16
    store %rbx %rbp null 0 -200
    %rbx = load %rbp null 0 -200
    %rbx = and %rbx 65535
    store %rbx %rbp null 0 -200
    %rbx = move %r15
    %rbx = shr %rbx 16
    store %rbx %rbp null 0 -296
    %rbx = load %rbp null 0 -296
    %rbx = and %rbx 65535
    store %rbx %rbp null 0 -296
    %rbx = load %rbp null 0 -200
    store %rbx %rbp null 0 -64
    %rbx = load %rbp null 0 -64
    %rdx = load %rbp null 0 -296
    %rbx = add %rbx %rdx
    store %rbx %rbp null 0 -64
    %rbx = load %rbp null 0 -320
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -312
    %rbx = shr %rbx 16
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -64
    store %rbx %rbp null 0 -112
    %rbx = load %rbp null 0 -112
    %rdx = load %rbp null 0 -312
    %rbx = add %rbx %rdx
    store %rbx %rbp null 0 -112
    %rbx = load %rbp null 0 -112
    %rbx = and %rbx 65535
    store %rbx %rbp null 0 -168
    %rbx = load %rbp null 0 -168
    %rbx = shl %rbx 16
    store %rbx %rbp null 0 -168
    %rdx = load %rbp null 0 -320
    %rdx = and %rdx 65535
    %rbx = load %rbp null 0 -168
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -304
    %rbx = or %rbx %rdx
    store %rbx %rbp null 0 -304
    %rdx = move %r14
    %rdx = and %rdx 65535
    %rbx = load %rbp null 0 -304
    store %rbx %rbp null 0 -224
    %rbx = load %rbp null 0 -224
    %rbx = and %rbx 65535
    store %rbx %rbp null 0 -224
    %rbx = load %rbp null 0 -224
    %rdx = add %rdx %rbx
    %rbx = move %r14
    %rbx = shr %rbx 16
    %rbx = and %rbx 65535
    %r14 = load %rbp null 0 -304
    %r14 = shr %r14 16
    %r14 = and %r14 65535
    %rbx = add %rbx %r14
    %r14 = move %rdx
    %r14 = shr %r14 16
    %rbx = add %rbx %r14
    %rbx = and %rbx 65535
    %r14 = move %rbx
    %r14 = shl %r14 16
    %rbx = move %rdx
    %rbx = and %rbx 65535
    %r14 = or %r14 %rbx
    %rbx = load %rbp null 0 -176
    %rdx = load %rbp null 0 -136
    %rbx = load %rdx %rbx 8 8
    %rbx = load %rbx %r11 8 8
    store %rbx %rbp null 0 -128
    %rbx = move %r14
    %rbx = and %rbx 65535
    %rdx = load %rbp null 0 -128
    %rdx = and %rdx 65535
    %rbx = add %rbx %rdx
    %rdx = move %r14
    %rdx = shr %rdx 16
    %rdx = and %rdx 65535
    %r14 = load %rbp null 0 -128
    %r14 = shr %r14 16
    %r14 = and %r14 65535
    %rdx = add %rdx %r14
    %r14 = move %rbx
    %r14 = shr %r14 16
    %rdx = add %rdx %r14
    %rdx = and %rdx 65535
    %rdx = shl %rdx 16
    %rbx = and %rbx 65535
    %r14 = move %rdx
    %r14 = or %r14 %rbx
    %rbx = move %r13
    %rbx = and %rbx 3
    %rdx = move %rbx
    %rdx = shl %rdx 30
    %rbx = move %r13
    %rbx = shr %rbx 2
    %rbx = and %rbx 1073741823
    %rdx = or %rdx %rbx
    %rbx = move %r11
    %rbx = add %rbx 1
    %r11 = move %rbx
    store %rdx %rbp null 0 -32
    %rdx = move %r15
    %rbx = move %rax
    store %r13 %rbp null 0 -160
    %r15 = move %rcx
    store %r14 %rbp null 0 -280
    %r14 = move %rdi
    %rax = move %rsi
    %r13 = move %r15
    %rcx = load %rbp null 0 -280
    %rsi = load %rbp null 0 -32
    %rdi = move 5
    store %rdi %rbp null 0 -120
    %rdi = move 30
    store %rdi %rbp null 0 -232
    jump sha1_for_cond_6

sha1_for_body_5:
    %r9 = load %rbp null 0 -176
    %r13 = load %rbp null 0 -136
    %r13 = lea %r13 %r9 8 8
    %r9 = load %r13 null 0 0
    %r9 = lea %r9 %r15 8 8
    %r12 = load %r13 null 0 0
    %r8 = load %r13 null 0 0
    %rdx = load %r12 %r15 8 -16
    %r12 = load %r8 %r15 8 -56
    %rdx = xor %rdx %r12
    %r12 = load %r13 null 0 0
    %r12 = load %r12 %r15 8 -104
    %rdx = xor %rdx %r12
    %r13 = load %r13 null 0 0
    %r13 = load %r13 %r15 8 -120
    %rdx = xor %rdx %r13
    %r13 = move %rdx
    %r13 = and %r13 2147483647
    %r13 = shl %r13 1
    %r12 = move %rdx
    %r12 = shr %r12 31
    %r12 = and %r12 1
    %r13 = or %r13 %r12
    store %r13 %r9 null 0 0
    %r15 = add %r15 1
    %r12 = move %r9
    %r8 = move %r13
    %r9 = move %rdx
    %r13 = move 1
    store %r13 %rbp null 0 -48
    jump sha1_for_cond_5

sha1_for_merge_3:
    %rbx = load %rbp null 0 -96
    %r13 = load %rbp null 0 -208
    store %rbx %r13 null 0 8
    %r13 = load %rbp null 0 -264
    %rbx = load %rbp null 0 -208
    store %r13 %rbx null 0 16
    %rbx = load %rbp null 0 -184
    %r13 = load %rbp null 0 -208
    store %rbx %r13 null 0 24
    %rbx = load %rbp null 0 -8
    %r13 = load %rbp null 0 -208
    store %rbx %r13 null 0 32
    %rbx = load %rbp null 0 -56
    %r13 = load %rbp null 0 -208
    store %rbx %r13 null 0 40
    %rax = load %rbp null 0 -208
    jump sha1_exit_1

sha1_exit_1:
    ret %rax

sha1_for_body_3:
    %rax = move %rbx
    %rcx = move 64
    %rax = div %rax %rcx
    %r13 = load %rbp null 0 -136
    %r13 = lea %r13 %rax 8 8
    %rax = move %rbx
    %rcx = move 64
    %rax = mod %rax %rcx
    %rax = move %rdx
    %rcx = move 4
    %rax = div %rax %rcx
    %r12 = load %r13 null 0 0
    %r15 = lea null %rax 8 8
    %r9 = load %r13 null 0 0
    %rdx = move %rbx
    %rax = move %rdx
    %rcx = move 4
    %rax = mod %rax %rcx
    %rcx = move 3
    %rcx = sub %rcx %rdx
    %rcx = mul %rcx 8
    %r13 = load %rdi %rbx 8 8
    %r13 = shl %r13 %rcx
    %rcx = load %r9 %r15 1 0
    %rcx = or %rcx %r13
    store %rcx %r12 %r15 1 0
    %rbx = add %rbx 1
    jump sha1_for_cond_3

}

define i64 @main  {
main_entry_1:
    %rbx = load @asciiTable_1 null 0 0
    store %rbx %rbp null 0 -512
    %r12 = load @inputBuffer_1 null 0 0
    %rbx = move 0
    store %rbx %rbp null 0 -480
    %rbx = move 0
    store %rbx %rbp null 0 -328
    %rbx = move 0
    store %rbx %rbp null 0 -344
    %rbx = move 0
    store %rbx %rbp null 0 -56
    %rbx = move 0
    store %rbx %rbp null 0 -152
    %rbx = move 0
    store %rbx %rbp null 0 -608
    %rbx = move 0
    store %rbx %rbp null 0 -552
    %rbx = move 0
    store %rbx %rbp null 0 -592
    %rbx = move 0
    store %rbx %rbp null 0 -144
    %rbx = move 0
    store %rbx %rbp null 0 -544
    %rbx = move 0
    store %rbx %rbp null 0 -640
    %rbx = move 0
    store %rbx %rbp null 0 -80
    %rbx = move 0
    store %rbx %rbp null 0 -352
    %rbx = move 0
    store %rbx %rbp null 0 -440
    %rbx = move 0
    store %rbx %rbp null 0 -528
    %rbx = move 0
    store %rbx %rbp null 0 -48
    %rbx = move 0
    store %rbx %rbp null 0 -176
    %rbx = move 0
    store %rbx %rbp null 0 -616
    %rbx = move 0
    store %rbx %rbp null 0 -160
    %rbx = move 0
    store %rbx %rbp null 0 -312
    %rbx = move 0
    store %rbx %rbp null 0 -256
    %rbx = move 0
    store %rbx %rbp null 0 -304
    %rbx = move 0
    store %rbx %rbp null 0 -88
    %rbx = move 0
    store %rbx %rbp null 0 -400
    %rbx = move 0
    store %rbx %rbp null 0 -504
    %rbx = move 0
    store %rbx %rbp null 0 -208
    %rbx = move 0
    store %rbx %rbp null 0 -8
    %rbx = move 0
    store %rbx %rbp null 0 -336
    %rbx = move 0
    store %rbx %rbp null 0 -448
    %rbx = move 0
    store %rbx %rbp null 0 -456
    %rbx = move 0
    store %rbx %rbp null 0 -272
    %rbx = move 0
    store %rbx %rbp null 0 -264
    %rbx = move 0
    store %rbx %rbp null 0 -248
    %rbx = move 0
    store %rbx %rbp null 0 -96
    %rbx = move 0
    store %rbx %rbp null 0 -488
    jump main_while_body_1

main_while_body_1:
    %rax = call getInt 
    cmp %rax 0
    br seq main_while_merge_1 main_if_merge_1

main_if_merge_1:
    cmp %rax 1
    br seq main_if_then_1 main_if_else_1

main_if_then_1:
    %rax = call getString 
    store %rax %rbp null 0 -368
    %rbx = move 0
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_cond_1:
    %r13 = load %rbp null 0 -368
    %r13 = load %r13 null 0 0
    cmp %rbx %r13
    br slt main_faker_computeSHA1_for_body_1 main_faker_computeSHA1_for_merge_1

main_faker_computeSHA1_for_body_1:
    %rdi = load %rbp null 0 -368
    %rsi = move %rbx
    %rax = call string.ord %rdi %rsi 
    store %rax %r12 %rbx 8 8
    %rbx = add %rbx 1
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_merge_1:
    %rbx = load %rbp null 0 -368
    %rsi = load %rbx null 0 0
    %rdi = move %r12
    %rax = call sha1 %rdi %rsi 
    store %rax %rbp null 0 -72
    %rbx = load %rbp null 0 -328
    store %rbx %rbp null 0 -104
    %rbx = load %rbp null 0 -544
    store %rbx %rbp null 0 -576
    %rbx = load %rbp null 0 -352
    %r13 = load %rbp null 0 -528
    store %r13 %rbp null 0 -16
    %r15 = load %rbp null 0 -48
    %r13 = load %rbp null 0 -208
    %r14 = load %rbp null 0 -248
    %rcx = load %rbp null 0 -96
    store %rcx %rbp null 0 -416
    %rcx = move 0
    store %rcx %rbp null 0 -360
    jump main_faker_computeSHA1_for_cond_2

main_faker_computeSHA1_for_cond_2:
    %rcx = load %rbp null 0 -72
    %rcx = load %rcx null 0 0
    %r9 = load %rbp null 0 -360
    cmp %r9 %rcx
    br slt main_faker_computeSHA1_for_body_2 main_splitter_1

main_splitter_1:
    %rdi = move @__str_const_4
    call println %rdi 
    %rcx = load %rbp null 0 -104
    store %rcx %rbp null 0 -328
    %rcx = load %rbp null 0 -368
    store %rcx %rbp null 0 -56
    %rcx = load %rbp null 0 -576
    store %rcx %rbp null 0 -544
    store %rbx %rbp null 0 -352
    %rbx = load %rbp null 0 -16
    store %rbx %rbp null 0 -528
    store %r15 %rbp null 0 -48
    %rbx = load %rbp null 0 -72
    store %rbx %rbp null 0 -88
    store %r13 %rbp null 0 -208
    store %r14 %rbp null 0 -248
    %rbx = load %rbp null 0 -416
    store %rbx %rbp null 0 -96
    %rbx = load %rbp null 0 -360
    store %rbx %rbp null 0 -488
    %rbx = load %rbp null 0 -480
    store %rbx %rbp null 0 -480
    %rbx = load %rbp null 0 -344
    store %rbx %rbp null 0 -344
    %rbx = load %rbp null 0 -152
    store %rbx %rbp null 0 -152
    %rbx = load %rbp null 0 -608
    store %rbx %rbp null 0 -608
    %rbx = load %rbp null 0 -552
    store %rbx %rbp null 0 -552
    %rbx = load %rbp null 0 -592
    store %rbx %rbp null 0 -592
    %rbx = load %rbp null 0 -144
    store %rbx %rbp null 0 -144
    %rbx = load %rbp null 0 -640
    store %rbx %rbp null 0 -640
    %rbx = load %rbp null 0 -80
    store %rbx %rbp null 0 -80
    %rbx = load %rbp null 0 -440
    store %rbx %rbp null 0 -440
    %rbx = load %rbp null 0 -176
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -616
    store %rbx %rbp null 0 -616
    %rbx = load %rbp null 0 -160
    store %rbx %rbp null 0 -160
    %rbx = load %rbp null 0 -312
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -256
    store %rbx %rbp null 0 -256
    %rbx = load %rbp null 0 -304
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -400
    store %rbx %rbp null 0 -400
    %rbx = load %rbp null 0 -504
    store %rbx %rbp null 0 -504
    %rbx = load %rbp null 0 -8
    store %rbx %rbp null 0 -8
    %rbx = load %rbp null 0 -336
    store %rbx %rbp null 0 -336
    %rbx = load %rbp null 0 -448
    store %rbx %rbp null 0 -448
    %rbx = load %rbp null 0 -456
    store %rbx %rbp null 0 -456
    %rbx = load %rbp null 0 -272
    store %rbx %rbp null 0 -272
    %rbx = load %rbp null 0 -264
    store %rbx %rbp null 0 -264
    jump main_while_body_1

main_faker_computeSHA1_for_body_2:
    %r9 = load %rbp null 0 -360
    %rcx = load %rbp null 0 -72
    %rcx = load %rcx %r9 8 8
    store %rcx %rbp null 0 -168
    %rcx = load %rbp null 0 -576
    store %rcx %rbp null 0 -216
    store %r15 %rbp null 0 -464
    store %r13 %rbp null 0 -24
    %r14 = move @__str_const_2
    %r13 = load %rbp null 0 -416
    store %r13 %rbp null 0 -424
    %r13 = move 28
    store %r13 %rbp null 0 -560
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_faker_toStringHex_for_cond_1:
    %r13 = load %rbp null 0 -560
    cmp %r13 0
    br sge main_faker_computeSHA1_faker_toStringHex_for_body_1 main_faker_computeSHA1_splitter_1

main_faker_computeSHA1_faker_toStringHex_for_body_1:
    %rbx = load %rbp null 0 -168
    %rcx = load %rbp null 0 -560
    %rbx = shr %rbx %rcx
    %rbx = and %rbx 15
    cmp %rbx 10
    br slt main_faker_computeSHA1_faker_toStringHex_if_then_1 main_faker_computeSHA1_faker_toStringHex_if_else_1

main_faker_computeSHA1_faker_toStringHex_if_then_1:
    %r15 = move 48
    %r15 = add %r15 %rbx
    cmp %r15 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1:
    cmp %r15 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1:
    %rsi = move %r15
    %rsi = sub %rsi 32
    %rdi = load %rbp null 0 -512
    %rdx = move %rsi
    %rax = call string.substring %rdi %rsi %rdx 
    %r13 = move %rax
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1:
    %r13 = move @__str_const_1
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_splitter_1:
    %rdi = move %r14
    %rsi = move %r13
    %rax = call string.add %rdi %rsi 
    %rdi = load %rbp null 0 -216
    %rcx = move %r15
    %r9 = move %r13
    %r13 = load %rbp null 0 -424
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_if_else_1:
    %r15 = lea %rbx null 0 55
    cmp %r15 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2:
    cmp %r15 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2:
    %rdx = move %r15
    %rdx = sub %rdx 32
    %rdi = load %rbp null 0 -512
    %rsi = move %rdx
    %rax = call string.substring %rdi %rsi %rdx 
    %r13 = move %rax
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2:
    %r13 = move @__str_const_1
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_splitter_2:
    %rdi = move %r14
    %rsi = move %r13
    %rax = call string.add %rdi %rsi 
    %rdi = move %r15
    %rcx = load %rbp null 0 -464
    %r9 = load %rbp null 0 -24
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_for_step_1:
    %r15 = load %rbp null 0 -560
    %r15 = sub %r15 4
    store %r15 %rbp null 0 -560
    store %rdi %rbp null 0 -216
    store %rcx %rbp null 0 -464
    store %r9 %rbp null 0 -24
    %r14 = move %rax
    store %r13 %rbp null 0 -424
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_splitter_1:
    %rdi = move %r14
    call print %rdi 
    %rcx = load %rbp null 0 -360
    %rcx = add %rcx 1
    %r13 = load %rbp null 0 -560
    store %r13 %rbp null 0 -104
    %r13 = load %rbp null 0 -216
    store %r13 %rbp null 0 -576
    %r13 = load %rbp null 0 -168
    store %r13 %rbp null 0 -16
    %r15 = load %rbp null 0 -464
    %r13 = load %rbp null 0 -24
    %r9 = load %rbp null 0 -424
    store %r9 %rbp null 0 -416
    store %rcx %rbp null 0 -360
    jump main_faker_computeSHA1_for_cond_2

main_if_else_1:
    cmp %rax 2
    br seq main_if_then_2 main_parallel_copy_1

main_parallel_copy_1:
    %rbx = load %rbp null 0 -480
    store %rbx %rbp null 0 -480
    %rbx = load %rbp null 0 -328
    store %rbx %rbp null 0 -328
    %rbx = load %rbp null 0 -344
    store %rbx %rbp null 0 -344
    %rbx = load %rbp null 0 -56
    store %rbx %rbp null 0 -56
    %rbx = load %rbp null 0 -152
    store %rbx %rbp null 0 -152
    %rbx = load %rbp null 0 -608
    store %rbx %rbp null 0 -608
    %rbx = load %rbp null 0 -552
    store %rbx %rbp null 0 -552
    %rbx = load %rbp null 0 -592
    store %rbx %rbp null 0 -592
    %rbx = load %rbp null 0 -144
    store %rbx %rbp null 0 -144
    %rbx = load %rbp null 0 -544
    store %rbx %rbp null 0 -544
    %rbx = load %rbp null 0 -640
    store %rbx %rbp null 0 -640
    %rbx = load %rbp null 0 -80
    store %rbx %rbp null 0 -80
    %rbx = load %rbp null 0 -352
    store %rbx %rbp null 0 -352
    %rbx = load %rbp null 0 -440
    store %rbx %rbp null 0 -440
    %rbx = load %rbp null 0 -528
    store %rbx %rbp null 0 -528
    %rbx = load %rbp null 0 -48
    store %rbx %rbp null 0 -48
    %rbx = load %rbp null 0 -176
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -616
    store %rbx %rbp null 0 -616
    %rbx = load %rbp null 0 -160
    store %rbx %rbp null 0 -160
    %rbx = load %rbp null 0 -312
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -256
    store %rbx %rbp null 0 -256
    %rbx = load %rbp null 0 -304
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -88
    store %rbx %rbp null 0 -88
    %rbx = load %rbp null 0 -400
    store %rbx %rbp null 0 -400
    %rbx = load %rbp null 0 -504
    store %rbx %rbp null 0 -504
    %rbx = load %rbp null 0 -208
    store %rbx %rbp null 0 -208
    %rbx = load %rbp null 0 -8
    store %rbx %rbp null 0 -8
    %rbx = load %rbp null 0 -336
    store %rbx %rbp null 0 -336
    %rbx = load %rbp null 0 -448
    store %rbx %rbp null 0 -448
    %rbx = load %rbp null 0 -456
    store %rbx %rbp null 0 -456
    %rbx = load %rbp null 0 -272
    store %rbx %rbp null 0 -272
    %rbx = load %rbp null 0 -264
    store %rbx %rbp null 0 -264
    %rbx = load %rbp null 0 -248
    store %rbx %rbp null 0 -248
    %rbx = load %rbp null 0 -96
    store %rbx %rbp null 0 -96
    jump main_while_body_1

main_if_then_2:
    %rax = call getString 
    store %rax %rbp null 0 -584
    %rdi = move 48
    %rax = alloc %rdi
    %r15 = move %rax
    store 5 %r15 null 0 0
    %rbx = load %rbp null 0 -584
    %rbx = load %rbx null 0 0
    cmp %rbx 40
    br sne main_faker_crackSHA1_if_then_1 main_faker_crackSHA1_if_merge_1

main_faker_crackSHA1_if_then_1:
    %rdi = move @__str_const_5
    call println %rdi 
    %rbx = load %rbp null 0 -584
    store %rbx %rbp null 0 -616
    store %r15 %rbp null 0 -8
    %rbx = load %rbp null 0 -480
    store %rbx %rbp null 0 -480
    %rbx = load %rbp null 0 -328
    store %rbx %rbp null 0 -328
    %rbx = load %rbp null 0 -344
    store %rbx %rbp null 0 -344
    %rbx = load %rbp null 0 -56
    store %rbx %rbp null 0 -56
    %rbx = load %rbp null 0 -152
    store %rbx %rbp null 0 -152
    %rbx = load %rbp null 0 -608
    store %rbx %rbp null 0 -608
    %rbx = load %rbp null 0 -552
    store %rbx %rbp null 0 -552
    %rbx = load %rbp null 0 -592
    store %rbx %rbp null 0 -592
    %rbx = load %rbp null 0 -144
    store %rbx %rbp null 0 -144
    %rbx = load %rbp null 0 -544
    store %rbx %rbp null 0 -544
    %rbx = load %rbp null 0 -640
    store %rbx %rbp null 0 -640
    %rbx = load %rbp null 0 -80
    store %rbx %rbp null 0 -80
    %rbx = load %rbp null 0 -352
    store %rbx %rbp null 0 -352
    %rbx = load %rbp null 0 -440
    store %rbx %rbp null 0 -440
    %rbx = load %rbp null 0 -528
    store %rbx %rbp null 0 -528
    %rbx = load %rbp null 0 -48
    store %rbx %rbp null 0 -48
    %rbx = load %rbp null 0 -176
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -160
    store %rbx %rbp null 0 -160
    %rbx = load %rbp null 0 -312
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -256
    store %rbx %rbp null 0 -256
    %rbx = load %rbp null 0 -304
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -88
    store %rbx %rbp null 0 -88
    %rbx = load %rbp null 0 -400
    store %rbx %rbp null 0 -400
    %rbx = load %rbp null 0 -504
    store %rbx %rbp null 0 -504
    %rbx = load %rbp null 0 -208
    store %rbx %rbp null 0 -208
    %rbx = load %rbp null 0 -336
    store %rbx %rbp null 0 -336
    %rbx = load %rbp null 0 -448
    store %rbx %rbp null 0 -448
    %rbx = load %rbp null 0 -456
    store %rbx %rbp null 0 -456
    %rbx = load %rbp null 0 -272
    store %rbx %rbp null 0 -272
    %rbx = load %rbp null 0 -264
    store %rbx %rbp null 0 -264
    %rbx = load %rbp null 0 -248
    store %rbx %rbp null 0 -248
    %rbx = load %rbp null 0 -96
    store %rbx %rbp null 0 -96
    jump main_while_body_1

main_faker_crackSHA1_if_merge_1:
    %rbx = move 0
    jump main_faker_crackSHA1_for_cond_1

main_faker_crackSHA1_for_cond_1:
    cmp %rbx 5
    br slt main_faker_crackSHA1_for_body_1 main_faker_crackSHA1_for_merge_1

main_faker_crackSHA1_for_merge_1:
    %rbx = load %rbp null 0 -344
    store %rbx %rbp null 0 -280
    %rbx = load %rbp null 0 -608
    store %rbx %rbp null 0 -296
    %rbx = load %rbp null 0 -592
    store %rbx %rbp null 0 -224
    %rbx = load %rbp null 0 -640
    store %rbx %rbp null 0 -432
    %rbx = load %rbp null 0 -440
    store %rbx %rbp null 0 -384
    %rbx = load %rbp null 0 -176
    store %rbx %rbp null 0 -392
    %rbx = load %rbp null 0 -336
    store %rbx %rbp null 0 -520
    %rbx = move 0
    store %rbx %rbp null 0 -232
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_for_cond_2:
    %rbx = load %rbp null 0 -232
    cmp %rbx 40
    br slt main_faker_crackSHA1_for_body_2 main_faker_crackSHA1_for_merge_2

main_faker_crackSHA1_for_merge_2:
    %rbx = load %rbp null 0 -152
    store %rbx %rbp null 0 -136
    %rbx = load %rbp null 0 -552
    store %rbx %rbp null 0 -32
    %r14 = load %rbp null 0 -144
    %rbx = load %rbp null 0 -80
    %r13 = load %rbp null 0 -160
    store %r13 %rbp null 0 -40
    %r13 = load %rbp null 0 -304
    store %r13 %rbp null 0 -112
    %r13 = load %rbp null 0 -400
    store %r13 %rbp null 0 -320
    %r13 = load %rbp null 0 -232
    store %r13 %rbp null 0 -568
    %r13 = load %rbp null 0 -456
    store %r13 %rbp null 0 -200
    %r13 = load %rbp null 0 -272
    %rcx = load %rbp null 0 -264
    store %rcx %rbp null 0 -496
    %rcx = move 1
    store %rcx %rbp null 0 -536
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_for_cond_3:
    %rcx = load %rbp null 0 -536
    cmp %rcx 4
    br sle main_faker_crackSHA1_for_body_3 main_faker_crackSHA1_for_merge_3

main_faker_crackSHA1_for_merge_3:
    %rdi = move @__str_const_7
    call println %rdi 
    %rcx = load %rbp null 0 -536
    store %rcx %rbp null 0 -480
    %rcx = load %rbp null 0 -280
    store %rcx %rbp null 0 -344
    %rcx = load %rbp null 0 -136
    store %rcx %rbp null 0 -152
    %rcx = load %rbp null 0 -296
    store %rcx %rbp null 0 -608
    %rcx = load %rbp null 0 -32
    store %rcx %rbp null 0 -552
    %rcx = load %rbp null 0 -224
    store %rcx %rbp null 0 -592
    store %r14 %rbp null 0 -144
    %rcx = load %rbp null 0 -432
    store %rcx %rbp null 0 -640
    store %rbx %rbp null 0 -80
    %rbx = load %rbp null 0 -384
    store %rbx %rbp null 0 -440
    %rbx = load %rbp null 0 -392
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -584
    store %rbx %rbp null 0 -616
    %rbx = load %rbp null 0 -40
    store %rbx %rbp null 0 -160
    %rbx = load %rbp null 0 -112
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -320
    store %rbx %rbp null 0 -400
    store %r15 %rbp null 0 -8
    %rbx = load %rbp null 0 -520
    store %rbx %rbp null 0 -336
    %rbx = load %rbp null 0 -568
    store %rbx %rbp null 0 -448
    %rbx = load %rbp null 0 -200
    store %rbx %rbp null 0 -456
    store %r13 %rbp null 0 -272
    %rbx = load %rbp null 0 -496
    store %rbx %rbp null 0 -264
    %rbx = load %rbp null 0 -328
    store %rbx %rbp null 0 -328
    %rbx = load %rbp null 0 -56
    store %rbx %rbp null 0 -56
    %rbx = load %rbp null 0 -544
    store %rbx %rbp null 0 -544
    %rbx = load %rbp null 0 -352
    store %rbx %rbp null 0 -352
    %rbx = load %rbp null 0 -528
    store %rbx %rbp null 0 -528
    %rbx = load %rbp null 0 -48
    store %rbx %rbp null 0 -48
    %rbx = load %rbp null 0 -312
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -256
    store %rbx %rbp null 0 -256
    %rbx = load %rbp null 0 -88
    store %rbx %rbp null 0 -88
    %rbx = load %rbp null 0 -208
    store %rbx %rbp null 0 -208
    %rbx = load %rbp null 0 -248
    store %rbx %rbp null 0 -248
    %rbx = load %rbp null 0 -96
    store %rbx %rbp null 0 -96
    %rbx = move 4
    store %rbx %rbp null 0 -504
    jump main_while_body_1

main_faker_crackSHA1_for_body_3:
    %rcx = move 0
    store %rcx %rbp null 0 -120
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_for_cond_4:
    %rcx = load %rbp null 0 -120
    %r9 = load %rbp null 0 -536
    cmp %rcx %r9
    br slt main_faker_crackSHA1_for_body_4 main_parallel_copy_2

main_faker_crackSHA1_for_body_4:
    %rcx = load %rbp null 0 -120
    store 48 %r12 %rcx 8 8
    %rcx = load %rbp null 0 -120
    %rcx = add %rcx 1
    store %rcx %rbp null 0 -120
    jump main_faker_crackSHA1_for_cond_4

main_parallel_copy_2:
    %rcx = load %rbp null 0 -136
    store %rcx %rbp null 0 -240
    store %r14 %rbp null 0 -472
    %rcx = load %rbp null 0 -40
    store %rcx %rbp null 0 -64
    %rcx = load %rbp null 0 -112
    store %rcx %rbp null 0 -408
    %rcx = load %rbp null 0 -320
    store %rcx %rbp null 0 -600
    store %r13 %rbp null 0 -128
    jump main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_while_body_1:
    %rdi = move %r12
    %rsi = load %rbp null 0 -536
    %rax = call sha1 %rdi %rsi 
    %r13 = move %rax
    %r9 = load %r13 null 0 0
    %rcx = load %r15 null 0 0
    cmp %r9 %rcx
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_1 main_faker_crackSHA1_faker_array_equal_if_merge_1

main_faker_crackSHA1_faker_array_equal_elseBB_1:
    %r14 = move 0
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_array_equal_if_merge_1:
    %rbx = move 0
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_for_cond_1:
    %rcx = load %r13 null 0 0
    cmp %rbx %rcx
    br slt main_faker_crackSHA1_faker_array_equal_for_body_1 main_faker_crackSHA1_faker_array_equal_thenBB_1

main_faker_crackSHA1_faker_array_equal_for_body_1:
    %rcx = lea null %rbx 8 8
    %r9 = load %r13 %rcx 1 0
    %rcx = load %r15 %rcx 1 0
    cmp %r9 %rcx
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_2 main_faker_crackSHA1_faker_array_equal_for_step_1

main_faker_crackSHA1_faker_array_equal_elseBB_2:
    %r14 = move 0
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_array_equal_for_step_1:
    %rbx = add %rbx 1
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_thenBB_1:
    %r14 = move 1
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_splitter_1:
    cmp %r14 1
    br seq main_faker_crackSHA1_if_then_2 main_faker_crackSHA1_if_merge_2

main_faker_crackSHA1_if_merge_2:
    %r9 = load %rbp null 0 -536
    %r9 = sub %r9 1
    %rdi = load %rbp null 0 -240
    %rax = load %rbp null 0 -64
    %rsi = load %rbp null 0 -600
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_faker_nextText_for_cond_1:
    cmp %r9 0
    br sge main_faker_crackSHA1_faker_nextText_for_body_1 main_faker_crackSHA1_faker_nextText_elseBB_1

main_faker_crackSHA1_faker_nextText_elseBB_1:
    %rcx = move 0
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_faker_nextText_for_body_1:
    %rsi = lea %r12 %r9 8 8
    %rax = load %rsi null 0 0
    cmp %rax 122
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1:
    cmp %rax 90
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2:
    cmp %rax 57
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3:
    %rdi = move 65
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3:
    %rdi = move %rax
    %rdi = add %rdi 1
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2:
    %rdi = move 97
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1:
    %rdi = move -1
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_splitter_1:
    store %rdi %rsi null 0 0
    %rcx = lea %r12 %r9 8 8
    %rdx = load %rcx null 0 0
    cmp %rdx -1
    br seq main_faker_crackSHA1_faker_nextText_if_then_1 main_faker_crackSHA1_faker_nextText_thenBB_1

main_faker_crackSHA1_faker_nextText_thenBB_1:
    %rcx = move 1
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_splitter_2:
    cmp %rcx 1
    br seq main_parallel_copy_3 main_faker_crackSHA1_for_step_1

main_parallel_copy_3:
    store %rdi %rbp null 0 -240
    store %r12 %rbp null 0 -472
    store %rax %rbp null 0 -64
    store %r9 %rbp null 0 -408
    store %rsi %rbp null 0 -600
    store %rcx %rbp null 0 -128
    jump main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_for_step_1:
    %rdx = load %rbp null 0 -536
    %rdx = add %rdx 1
    store %rdx %rbp null 0 -536
    store %rdi %rbp null 0 -136
    store %r14 %rbp null 0 -32
    %r14 = move %r12
    store %rax %rbp null 0 -40
    store %r9 %rbp null 0 -112
    store %rsi %rbp null 0 -320
    %r9 = load %rbp null 0 -120
    store %r9 %rbp null 0 -568
    store %r13 %rbp null 0 -200
    %r13 = move %rcx
    store %r15 %rbp null 0 -496
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_faker_nextText_if_then_1:
    store 48 %rcx null 0 0
    %r9 = sub %r9 1
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_if_then_2:
    %rcx = load %rbp null 0 -312
    store %rcx %rbp null 0 -192
    %rcx = load %rbp null 0 -256
    store %rcx %rbp null 0 -288
    %rcx = move 0
    store %rcx %rbp null 0 -376
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_cond_5:
    %r9 = load %rbp null 0 -536
    %rcx = load %rbp null 0 -376
    cmp %rcx %r9
    br slt main_faker_crackSHA1_for_body_5 main_faker_crackSHA1_for_merge_4

main_faker_crackSHA1_for_body_5:
    %rcx = load %rbp null 0 -376
    %rcx = load %r12 %rcx 8 8
    store %rcx %rbp null 0 -184
    %rcx = load %rbp null 0 -184
    cmp %rcx 32
    br sge main_faker_crackSHA1_faker_int2chr_lhs_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_lhs_then_1:
    %rcx = load %rbp null 0 -184
    cmp %rcx 126
    br sle main_faker_crackSHA1_faker_int2chr_if_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_if_then_1:
    %rsi = load %rbp null 0 -184
    %rsi = sub %rsi 32
    %rdi = load %rbp null 0 -512
    %rdx = move %rsi
    %rax = call string.substring %rdi %rsi %rdx 
    store %rax %rbp null 0 -632
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_int2chr_if_merge_1:
    store @__str_const_1 %rbp null 0 -632
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_splitter_3:
    %rdi = load %rbp null 0 -632
    call print %rdi 
    %rcx = load %rbp null 0 -376
    %rcx = add %rcx 1
    %r9 = load %rbp null 0 -184
    store %r9 %rbp null 0 -192
    %r9 = load %rbp null 0 -632
    store %r9 %rbp null 0 -288
    store %rcx %rbp null 0 -376
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_merge_4:
    %rdi = move @__str_const_6
    call println %rdi 
    %rcx = load %rbp null 0 -536
    store %rcx %rbp null 0 -480
    %rcx = load %rbp null 0 -280
    store %rcx %rbp null 0 -344
    %rcx = load %rbp null 0 -240
    store %rcx %rbp null 0 -152
    %rcx = load %rbp null 0 -296
    store %rcx %rbp null 0 -608
    store %r14 %rbp null 0 -552
    %rcx = load %rbp null 0 -224
    store %rcx %rbp null 0 -592
    %rcx = load %rbp null 0 -472
    store %rcx %rbp null 0 -144
    %rcx = load %rbp null 0 -432
    store %rcx %rbp null 0 -640
    store %rbx %rbp null 0 -80
    %rbx = load %rbp null 0 -384
    store %rbx %rbp null 0 -440
    %rbx = load %rbp null 0 -392
    store %rbx %rbp null 0 -176
    %rbx = load %rbp null 0 -584
    store %rbx %rbp null 0 -616
    %rbx = load %rbp null 0 -64
    store %rbx %rbp null 0 -160
    %rbx = load %rbp null 0 -192
    store %rbx %rbp null 0 -312
    %rbx = load %rbp null 0 -288
    store %rbx %rbp null 0 -256
    %rbx = load %rbp null 0 -408
    store %rbx %rbp null 0 -304
    %rbx = load %rbp null 0 -600
    store %rbx %rbp null 0 -400
    store %r15 %rbp null 0 -8
    %rbx = load %rbp null 0 -520
    store %rbx %rbp null 0 -336
    %rbx = load %rbp null 0 -376
    store %rbx %rbp null 0 -448
    store %r13 %rbp null 0 -456
    %rbx = load %rbp null 0 -128
    store %rbx %rbp null 0 -272
    %rbx = load %rbp null 0 -8
    store %rbx %rbp null 0 -264
    %rbx = load %rbp null 0 -328
    store %rbx %rbp null 0 -328
    %rbx = load %rbp null 0 -56
    store %rbx %rbp null 0 -56
    %rbx = load %rbp null 0 -544
    store %rbx %rbp null 0 -544
    %rbx = load %rbp null 0 -352
    store %rbx %rbp null 0 -352
    %rbx = load %rbp null 0 -528
    store %rbx %rbp null 0 -528
    %rbx = load %rbp null 0 -48
    store %rbx %rbp null 0 -48
    %rbx = load %rbp null 0 -88
    store %rbx %rbp null 0 -88
    %rbx = load %rbp null 0 -208
    store %rbx %rbp null 0 -208
    %rbx = load %rbp null 0 -248
    store %rbx %rbp null 0 -248
    %rbx = load %rbp null 0 -96
    store %rbx %rbp null 0 -96
    %rbx = move 4
    store %rbx %rbp null 0 -504
    jump main_while_body_1

main_faker_crackSHA1_for_body_2:
    %rax = load %rbp null 0 -232
    %rcx = move 8
    %rax = div %rax %rcx
    %rbx = lea %r15 %rax 8 8
    store %rbx %rbp null 0 -624
    %rdx = load %rbp null 0 -232
    %rdx = add %rdx 3
    %rdi = load %rbp null 0 -584
    %rsi = load %rbp null 0 -232
    %rax = call string.substring %rdi %rsi %rdx 
    %r14 = move %rax
    %rax = load %rbp null 0 -392
    %r13 = move 0
    %rbx = move 0
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_faker_hex2int_for_cond_1:
    %rcx = load %r14 null 0 0
    cmp %r13 %rcx
    br slt main_faker_crackSHA1_faker_hex2int_for_body_1 main_faker_crackSHA1_faker_hex2int_for_merge_1

main_faker_crackSHA1_faker_hex2int_for_merge_1:
    %rsi = move %rax
    %rdi = move %rbx
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_faker_hex2int_for_body_1:
    %rdi = move %r14
    %rsi = move %r13
    %rax = call string.ord %rdi %rsi 
    cmp %rax 48
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_lhs_then_1:
    cmp %rax 57
    br sle main_faker_crackSHA1_faker_hex2int_if_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_if_else_1:
    cmp %rax 65
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_lhs_then_2:
    cmp %rax 70
    br sle main_faker_crackSHA1_faker_hex2int_if_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_if_then_2:
    %rbx = mul %rbx 16
    %rbx = lea %rbx %rax 1 -55
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_2:
    cmp %rax 97
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_lhs_then_3:
    cmp %rax 102
    br sle main_faker_crackSHA1_faker_hex2int_if_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_if_then_3:
    %rbx = mul %rbx 16
    %rbx = lea %rbx %rax 1 -87
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_3:
    %rsi = move %rax
    %rdi = move 0
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_splitter_4:
    %rax = load %rbp null 0 -232
    %rcx = move 4
    %rax = div %rax %rcx
    %rcx = move 2
    %rax = mod %rax %rcx
    %rax = move %rdx
    %rcx = move 1
    %rcx = sub %rcx %rax
    %rcx = mul %rcx 16
    %r9 = move %rdi
    %r9 = shl %r9 %rcx
    %rcx = load %rbp null 0 -624
    %rcx = load %rcx null 0 0
    %rcx = or %rcx %r9
    %r9 = load %rbp null 0 -624
    store %rcx %r9 null 0 0
    %rcx = load %rbp null 0 -232
    %rcx = add %rcx 4
    store %r13 %rbp null 0 -280
    store %rbx %rbp null 0 -296
    %rbx = load %rbp null 0 -624
    store %rbx %rbp null 0 -224
    %rbx = load %rbp null 0 -224
    store %rbx %rbp null 0 -432
    store %r14 %rbp null 0 -384
    store %rsi %rbp null 0 -392
    store %rdi %rbp null 0 -520
    store %rcx %rbp null 0 -232
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_faker_hex2int_if_then_1:
    %rbx = mul %rbx 16
    %rbx = lea %rbx %rax 1 -48
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_for_step_1:
    %r13 = add %r13 1
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_for_body_1:
    store 0 %r15 %rbx 8 8
    %rbx = add %rbx 1
    jump main_faker_crackSHA1_for_cond_1

main_while_merge_1:
    %rax = move 0
    ret %rax

}

define i64 @__init  {
__init_entry_1:
    %rdi = move 808
    %rax = alloc %rdi
    %r13 = move %rax
    store 100 %r13 null 0 0
    %rbx = move %r13
    %rbx = add %rbx 8
    %r12 = move %r13
    %r12 = add %r12 808
    jump __init_for_cond_1

__init_for_cond_1:
    cmp %rbx %r12
    br slt __init_for_body_1 __init_for_merge_1

__init_for_body_1:
    %rdi = move 648
    %rax = alloc %rdi
    store 80 %rax null 0 0
    store %rax %rbx null 0 0
    %rbx = add %rbx 8
    jump __init_for_cond_1

__init_for_merge_1:
    %rdi = move 50568
    %rax = alloc %rdi
    %rbx = move %rax
    store 6320 %rbx null 0 0
    %rdi = move 48
    %rax = alloc %rdi
    store 5 %rax null 0 0
    store %r13 @chunks_1 null 0 0
    store 100 @MAXCHUNK_1 null 0 0
    store @__str_const_9 @asciiTable_1 null 0 0
    store %rbx @inputBuffer_1 null 0 0
    store %rax @outputBuffer_1 null 0 0
    %rax = call main 
    ret %rax

}


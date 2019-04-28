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
    %b8_2 = load @b8_1
    %a10_2 = load @a10_1
    %b2_2 = load @b2_1
    %b9_2 = load @b9_1
    %b6_2 = load @b6_1
    %b1_2 = load @b1_1
    %b5_2 = load @b5_1
    %a0_2 = load @a0_1
    %a3_2 = load @a3_1
    %a8_2 = load @a8_1
    %a2_2 = load @a2_1
    %b7_2 = load @b7_1
    %b0_2 = load @b0_1
    %b10_2 = load @b10_1
    %b3_2 = load @b3_1
    %a9_2 = load @a9_1
    %a6_2 = load @a6_1
    %b4_2 = load @b4_1
    %a7_2 = load @a7_1
    %a1_2 = load @a1_1
    %a5_2 = load @a5_1
    %a4_2 = load @a4_1
    %i_2 = load @i_1
    %sum_1 = move 0
    %i_2 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %t_1 = slt %i_2 1000000000
    br %t_1 main_for_body_1 main_for_merge_1

main_for_merge_1:
    %t_2 = call toString %sum_1 
    call println %t_2 
    %t_3 = move 0
    store %i_2 @i_1
    store %a4_2 @a4_1
    store %a5_2 @a5_1
    store %a1_2 @a1_1
    store %a7_2 @a7_1
    store %b4_2 @b4_1
    store %a6_2 @a6_1
    store %a9_2 @a9_1
    store %b3_2 @b3_1
    store %b10_2 @b10_1
    store %b0_2 @b0_1
    store %b7_2 @b7_1
    store %a2_2 @a2_1
    store %a8_2 @a8_1
    store %a3_2 @a3_1
    store %a0_2 @a0_1
    store %b5_2 @b5_1
    store %b1_2 @b1_1
    store %b6_2 @b6_1
    store %b9_2 @b9_1
    store %b2_2 @b2_1
    store %a10_2 @a10_1
    store %b8_2 @b8_1
    ret %t_3

main_for_body_1:
    %t_4 = add %a0_2 1
    %a0_2 = move %t_4
    %t_5 = add %a1_2 1
    %a1_2 = move %t_5
    %t_6 = add %a2_2 1
    %a2_2 = move %t_6
    %t_7 = add %a0_2 1
    %a3_2 = move %t_7
    %t_8 = add %a1_2 1
    %a4_2 = move %t_8
    %t_9 = add %a2_2 1
    %a5_2 = move %t_9
    %t_10 = add %a0_2 1
    %a6_2 = move %t_10
    %t_11 = add %a1_2 1
    %a7_2 = move %t_11
    %t_12 = add %a2_2 1
    %a8_2 = move %t_12
    %t_13 = add %a0_2 1
    %a9_2 = move %t_13
    %t_14 = add %a1_2 0
    %a10_2 = move %t_14
    %b0_2 = move %a0_2
    %b1_2 = move %a1_2
    %b2_2 = move %a2_2
    %b3_2 = move %a3_2
    %b4_2 = move %a4_2
    %b5_2 = move %a5_2
    %b6_2 = move %a6_2
    %b7_2 = move %a7_2
    %b8_2 = move %a8_2
    %b9_2 = move %a9_2
    %b10_2 = move %a10_2
    %t_15 = mod %i_2 10000000
    %t_16 = seq %t_15 0
    br %t_16 main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_17 = add %sum_1 %a0_2
    %t_18 = add %t_17 %a1_2
    %t_19 = add %t_18 %a2_2
    %t_20 = add %t_19 %a3_2
    %t_21 = add %t_20 %a4_2
    %t_22 = add %t_21 %a5_2
    %t_23 = add %t_22 %a6_2
    %t_24 = add %t_23 %a7_2
    %t_25 = add %t_24 %a8_2
    %t_26 = add %t_25 %a9_2
    %t_27 = add %t_26 %a10_2
    %t_28 = add %t_27 %b0_2
    %t_29 = add %t_28 %b1_2
    %t_30 = add %t_29 %b2_2
    %t_31 = add %t_30 %b3_2
    %t_32 = add %t_31 %b4_2
    %t_33 = add %t_32 %b5_2
    %t_34 = add %t_33 %b6_2
    %t_35 = add %t_34 %b7_2
    %t_36 = add %t_35 %b8_2
    %t_37 = add %t_36 %b9_2
    %t_38 = add %t_37 %b10_2
    %sum_1 = move %t_38
    jump main_if_merge_1

main_if_merge_1:
    jump main_for_step_1

main_for_step_1:
    %t_39 = add %i_2 1
    %i_2 = move %t_39
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %b8_3 = load @b8_1
    %a10_3 = load @a10_1
    %b2_3 = load @b2_1
    %b9_3 = load @b9_1
    %b6_3 = load @b6_1
    %b1_3 = load @b1_1
    %b5_3 = load @b5_1
    %a0_3 = load @a0_1
    %a3_3 = load @a3_1
    %a8_3 = load @a8_1
    %a2_3 = load @a2_1
    %b7_3 = load @b7_1
    %b0_3 = load @b0_1
    %b10_3 = load @b10_1
    %b3_3 = load @b3_1
    %a9_3 = load @a9_1
    %a6_3 = load @a6_1
    %b4_3 = load @b4_1
    %a7_3 = load @a7_1
    %a1_3 = load @a1_1
    %a5_3 = load @a5_1
    %a4_3 = load @a4_1
    %i_3 = load @i_1
    %i_3 = move 0
    %a0_3 = move 0
    %a1_3 = move 0
    %a2_3 = move 0
    %a3_3 = move 0
    %a4_3 = move 0
    %a5_3 = move 0
    %a6_3 = move 0
    %a7_3 = move 0
    %a8_3 = move 0
    %a9_3 = move 0
    %a10_3 = move 0
    %b0_3 = move 0
    %b1_3 = move 0
    %b2_3 = move 0
    %b3_3 = move 0
    %b4_3 = move 0
    %b5_3 = move 0
    %b6_3 = move 0
    %b7_3 = move 0
    %b8_3 = move 0
    %b9_3 = move 0
    %b10_3 = move 0
    store %i_3 @i_1
    store %a4_3 @a4_1
    store %a5_3 @a5_1
    store %a1_3 @a1_1
    store %a7_3 @a7_1
    store %b4_3 @b4_1
    store %a6_3 @a6_1
    store %a9_3 @a9_1
    store %b3_3 @b3_1
    store %b10_3 @b10_1
    store %b0_3 @b0_1
    store %b7_3 @b7_1
    store %a2_3 @a2_1
    store %a8_3 @a8_1
    store %a3_3 @a3_1
    store %a0_3 @a0_1
    store %b5_3 @b5_1
    store %b1_3 @b1_1
    store %b6_3 @b6_1
    store %b9_3 @b9_1
    store %b2_3 @b2_1
    store %a10_3 @a10_1
    store %b8_3 @b8_1
    %t_40 = call main 
    %b8_3 = load @b8_1
    %a10_3 = load @a10_1
    %b2_3 = load @b2_1
    %b9_3 = load @b9_1
    %b6_3 = load @b6_1
    %b1_3 = load @b1_1
    %b5_3 = load @b5_1
    %a0_3 = load @a0_1
    %a3_3 = load @a3_1
    %a8_3 = load @a8_1
    %a2_3 = load @a2_1
    %b7_3 = load @b7_1
    %b0_3 = load @b0_1
    %b10_3 = load @b10_1
    %b3_3 = load @b3_1
    %a9_3 = load @a9_1
    %a6_3 = load @a6_1
    %b4_3 = load @b4_1
    %a7_3 = load @a7_1
    %a1_3 = load @a1_1
    %a5_3 = load @a5_1
    %a4_3 = load @a4_1
    %i_3 = load @i_1
    %t_41 = move %t_40
    store %i_3 @i_1
    store %a4_3 @a4_1
    store %a5_3 @a5_1
    store %a1_3 @a1_1
    store %a7_3 @a7_1
    store %b4_3 @b4_1
    store %a6_3 @a6_1
    store %a9_3 @a9_1
    store %b3_3 @b3_1
    store %b10_3 @b10_1
    store %b0_3 @b0_1
    store %b7_3 @b7_1
    store %a2_3 @a2_1
    store %a8_3 @a8_1
    store %a3_3 @a3_1
    store %a0_3 @a0_1
    store %b5_3 @b5_1
    store %b1_3 @b1_1
    store %b6_3 @b6_1
    store %b9_3 @b9_1
    store %b2_3 @b2_1
    store %a10_3 @a10_1
    store %b8_3 @b8_1
    ret %t_41

}


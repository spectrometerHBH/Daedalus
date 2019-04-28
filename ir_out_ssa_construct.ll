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
    %i_3 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %a6_3 = phi main_entry_1 %a6_2 main_for_step_1 %a6_4 
    %b7_3 = phi main_entry_1 %b7_2 main_for_step_1 %b7_4 
    %a9_3 = phi main_entry_1 %a9_2 main_for_step_1 %a9_4 
    %b8_3 = phi main_entry_1 %b8_2 main_for_step_1 %b8_4 
    %a5_3 = phi main_entry_1 %a5_2 main_for_step_1 %a5_4 
    %b2_3 = phi main_entry_1 %b2_2 main_for_step_1 %b2_4 
    %a8_3 = phi main_entry_1 %a8_2 main_for_step_1 %a8_4 
    %b9_3 = phi main_entry_1 %b9_2 main_for_step_1 %b9_4 
    %b0_3 = phi main_entry_1 %b0_2 main_for_step_1 %b0_4 
    %i_4 = phi main_entry_1 %i_3 main_for_step_1 %i_5 
    %b4_3 = phi main_entry_1 %b4_2 main_for_step_1 %b4_4 
    %a3_3 = phi main_entry_1 %a3_2 main_for_step_1 %a3_4 
    %b10_3 = phi main_entry_1 %b10_2 main_for_step_1 %b10_4 
    %a0_3 = phi main_entry_1 %a0_2 main_for_step_1 %a0_4 
    %b5_3 = phi main_entry_1 %b5_2 main_for_step_1 %b5_4 
    %a2_3 = phi main_entry_1 %a2_2 main_for_step_1 %a2_4 
    %b3_3 = phi main_entry_1 %b3_2 main_for_step_1 %b3_4 
    %sum_2 = phi main_entry_1 %sum_1 main_for_step_1 %sum_3 
    %b6_3 = phi main_entry_1 %b6_2 main_for_step_1 %b6_4 
    %a4_3 = phi main_entry_1 %a4_2 main_for_step_1 %a4_4 
    %a10_3 = phi main_entry_1 %a10_2 main_for_step_1 %a10_4 
    %b1_3 = phi main_entry_1 %b1_2 main_for_step_1 %b1_4 
    %a1_3 = phi main_entry_1 %a1_2 main_for_step_1 %a1_4 
    %a7_3 = phi main_entry_1 %a7_2 main_for_step_1 %a7_4 
    %t_1 = slt %i_4 1000000000
    br %t_1 main_for_body_1 main_for_merge_1

main_for_merge_1:
    %t_2 = call toString %sum_2 
    call println %t_2 
    %t_3 = move 0
    store %i_4 @i_1
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
    ret %t_3

main_for_body_1:
    %t_4 = add %a0_3 1
    %a0_4 = move %t_4
    %t_5 = add %a1_3 1
    %a1_4 = move %t_5
    %t_6 = add %a2_3 1
    %a2_4 = move %t_6
    %t_7 = add %a0_4 1
    %a3_4 = move %t_7
    %t_8 = add %a1_4 1
    %a4_4 = move %t_8
    %t_9 = add %a2_4 1
    %a5_4 = move %t_9
    %t_10 = add %a0_4 1
    %a6_4 = move %t_10
    %t_11 = add %a1_4 1
    %a7_4 = move %t_11
    %t_12 = add %a2_4 1
    %a8_4 = move %t_12
    %t_13 = add %a0_4 1
    %a9_4 = move %t_13
    %t_14 = add %a1_4 0
    %a10_4 = move %t_14
    %b0_4 = move %a0_4
    %b1_4 = move %a1_4
    %b2_4 = move %a2_4
    %b3_4 = move %a3_4
    %b4_4 = move %a4_4
    %b5_4 = move %a5_4
    %b6_4 = move %a6_4
    %b7_4 = move %a7_4
    %b8_4 = move %a8_4
    %b9_4 = move %a9_4
    %b10_4 = move %a10_4
    %t_15 = mod %i_4 10000000
    %t_16 = seq %t_15 0
    br %t_16 main_if_then_1 main_for_step_1

main_if_then_1:
    %t_17 = add %sum_2 %a0_4
    %t_18 = add %t_17 %a1_4
    %t_19 = add %t_18 %a2_4
    %t_20 = add %t_19 %a3_4
    %t_21 = add %t_20 %a4_4
    %t_22 = add %t_21 %a5_4
    %t_23 = add %t_22 %a6_4
    %t_24 = add %t_23 %a7_4
    %t_25 = add %t_24 %a8_4
    %t_26 = add %t_25 %a9_4
    %t_27 = add %t_26 %a10_4
    %t_28 = add %t_27 %b0_4
    %t_29 = add %t_28 %b1_4
    %t_30 = add %t_29 %b2_4
    %t_31 = add %t_30 %b3_4
    %t_32 = add %t_31 %b4_4
    %t_33 = add %t_32 %b5_4
    %t_34 = add %t_33 %b6_4
    %t_35 = add %t_34 %b7_4
    %t_36 = add %t_35 %b8_4
    %t_37 = add %t_36 %b9_4
    %t_38 = add %t_37 %b10_4
    %sum_4 = move %t_38
    jump main_for_step_1

main_for_step_1:
    %sum_3 = phi main_for_body_1 %sum_2 main_if_then_1 %sum_4 
    %t_39 = add %i_4 1
    %i_5 = move %t_39
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %b8_5 = load @b8_1
    %a10_5 = load @a10_1
    %b2_5 = load @b2_1
    %b9_5 = load @b9_1
    %b6_5 = load @b6_1
    %b1_5 = load @b1_1
    %b5_5 = load @b5_1
    %a0_5 = load @a0_1
    %a3_5 = load @a3_1
    %a8_5 = load @a8_1
    %a2_5 = load @a2_1
    %b7_5 = load @b7_1
    %b0_5 = load @b0_1
    %b10_5 = load @b10_1
    %b3_5 = load @b3_1
    %a9_5 = load @a9_1
    %a6_5 = load @a6_1
    %b4_5 = load @b4_1
    %a7_5 = load @a7_1
    %a1_5 = load @a1_1
    %a5_5 = load @a5_1
    %a4_5 = load @a4_1
    %i_6 = load @i_1
    %i_7 = move 0
    %a0_6 = move 0
    %a1_6 = move 0
    %a2_6 = move 0
    %a3_6 = move 0
    %a4_6 = move 0
    %a5_6 = move 0
    %a6_6 = move 0
    %a7_6 = move 0
    %a8_6 = move 0
    %a9_6 = move 0
    %a10_6 = move 0
    %b0_6 = move 0
    %b1_6 = move 0
    %b2_6 = move 0
    %b3_6 = move 0
    %b4_6 = move 0
    %b5_6 = move 0
    %b6_6 = move 0
    %b7_6 = move 0
    %b8_6 = move 0
    %b9_6 = move 0
    %b10_6 = move 0
    store %i_7 @i_1
    store %a4_6 @a4_1
    store %a5_6 @a5_1
    store %a1_6 @a1_1
    store %a7_6 @a7_1
    store %b4_6 @b4_1
    store %a6_6 @a6_1
    store %a9_6 @a9_1
    store %b3_6 @b3_1
    store %b10_6 @b10_1
    store %b0_6 @b0_1
    store %b7_6 @b7_1
    store %a2_6 @a2_1
    store %a8_6 @a8_1
    store %a3_6 @a3_1
    store %a0_6 @a0_1
    store %b5_6 @b5_1
    store %b1_6 @b1_1
    store %b6_6 @b6_1
    store %b9_6 @b9_1
    store %b2_6 @b2_1
    store %a10_6 @a10_1
    store %b8_6 @b8_1
    %t_40 = call main 
    %b8_7 = load @b8_1
    %a10_7 = load @a10_1
    %b2_7 = load @b2_1
    %b9_7 = load @b9_1
    %b6_7 = load @b6_1
    %b1_7 = load @b1_1
    %b5_7 = load @b5_1
    %a0_7 = load @a0_1
    %a3_7 = load @a3_1
    %a8_7 = load @a8_1
    %a2_7 = load @a2_1
    %b7_7 = load @b7_1
    %b0_7 = load @b0_1
    %b10_7 = load @b10_1
    %b3_7 = load @b3_1
    %a9_7 = load @a9_1
    %a6_7 = load @a6_1
    %b4_7 = load @b4_1
    %a7_7 = load @a7_1
    %a1_7 = load @a1_1
    %a5_7 = load @a5_1
    %a4_7 = load @a4_1
    %i_8 = load @i_1
    %t_41 = move %t_40
    store %i_8 @i_1
    store %a4_7 @a4_1
    store %a5_7 @a5_1
    store %a1_7 @a1_1
    store %a7_7 @a7_1
    store %b4_7 @b4_1
    store %a6_7 @a6_1
    store %a9_7 @a9_1
    store %b3_7 @b3_1
    store %b10_7 @b10_1
    store %b0_7 @b0_1
    store %b7_7 @b7_1
    store %a2_7 @a2_1
    store %a8_7 @a8_1
    store %a3_7 @a3_1
    store %a0_7 @a0_1
    store %b5_7 @b5_1
    store %b1_7 @b1_1
    store %b6_7 @b6_1
    store %b9_7 @b9_1
    store %b2_7 @b2_1
    store %a10_7 @a10_1
    store %b8_7 @b8_1
    ret %t_41

}


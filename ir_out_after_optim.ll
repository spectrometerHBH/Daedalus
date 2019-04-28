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
    %b8_2 = load @b8_1 null 0 0
    %a10_2 = load @a10_1 null 0 0
    %b2_2 = load @b2_1 null 0 0
    %b9_2 = load @b9_1 null 0 0
    %b6_2 = load @b6_1 null 0 0
    %b1_2 = load @b1_1 null 0 0
    %b5_2 = load @b5_1 null 0 0
    %a0_2 = load @a0_1 null 0 0
    %a3_2 = load @a3_1 null 0 0
    %a8_2 = load @a8_1 null 0 0
    %a2_2 = load @a2_1 null 0 0
    %b7_2 = load @b7_1 null 0 0
    %b0_2 = load @b0_1 null 0 0
    %b10_2 = load @b10_1 null 0 0
    %b3_2 = load @b3_1 null 0 0
    %a9_2 = load @a9_1 null 0 0
    %a6_2 = load @a6_1 null 0 0
    %b4_2 = load @b4_1 null 0 0
    %a7_2 = load @a7_1 null 0 0
    %a1_2 = load @a1_1 null 0 0
    %a5_2 = load @a5_1 null 0 0
    %a4_2 = load @a4_1 null 0 0
    jump main_for_cond_1

main_for_cond_1:
    %a6_3 = phi main_entry_1 %a6_2 main_for_step_1 %t_1 
    %b7_3 = phi main_entry_1 %b7_2 main_for_step_1 %t_2 
    %a9_3 = phi main_entry_1 %a9_2 main_for_step_1 %t_1 
    %b8_3 = phi main_entry_1 %b8_2 main_for_step_1 %t_3 
    %a5_3 = phi main_entry_1 %a5_2 main_for_step_1 %t_3 
    %b2_3 = phi main_entry_1 %b2_2 main_for_step_1 %t_4 
    %a8_3 = phi main_entry_1 %a8_2 main_for_step_1 %t_3 
    %b9_3 = phi main_entry_1 %b9_2 main_for_step_1 %t_1 
    %b0_3 = phi main_entry_1 %b0_2 main_for_step_1 %t_5 
    %i_2 = phi main_entry_1 0 main_for_step_1 %t_6 
    %b4_3 = phi main_entry_1 %b4_2 main_for_step_1 %t_2 
    %a3_3 = phi main_entry_1 %a3_2 main_for_step_1 %t_1 
    %b10_3 = phi main_entry_1 %b10_2 main_for_step_1 %t_7 
    %a0_3 = phi main_entry_1 %a0_2 main_for_step_1 %t_5 
    %b5_3 = phi main_entry_1 %b5_2 main_for_step_1 %t_3 
    %a2_3 = phi main_entry_1 %a2_2 main_for_step_1 %t_4 
    %b3_3 = phi main_entry_1 %b3_2 main_for_step_1 %t_1 
    %sum_1 = phi main_entry_1 0 main_for_step_1 %sum_2 
    %b6_3 = phi main_entry_1 %b6_2 main_for_step_1 %t_1 
    %a4_3 = phi main_entry_1 %a4_2 main_for_step_1 %t_2 
    %a10_3 = phi main_entry_1 %a10_2 main_for_step_1 %t_7 
    %b1_3 = phi main_entry_1 %b1_2 main_for_step_1 %t_8 
    %a1_3 = phi main_entry_1 %a1_2 main_for_step_1 %t_8 
    %a7_3 = phi main_entry_1 %a7_2 main_for_step_1 %t_2 
    cmp %i_2 1000000000
    br slt main_for_body_1 main_for_merge_1

main_for_merge_1:
    %t_9 = call toString %sum_1 
    call println %t_9 
    store %i_2 @i_1 null 0 0
    store %a4_3 @a4_1 null 0 0
    store %a5_3 @a5_1 null 0 0
    store %a1_3 @a1_1 null 0 0
    store %a7_3 @a7_1 null 0 0
    store %b4_3 @b4_1 null 0 0
    store %a6_3 @a6_1 null 0 0
    store %a9_3 @a9_1 null 0 0
    store %b3_3 @b3_1 null 0 0
    store %b10_3 @b10_1 null 0 0
    store %b0_3 @b0_1 null 0 0
    store %b7_3 @b7_1 null 0 0
    store %a2_3 @a2_1 null 0 0
    store %a8_3 @a8_1 null 0 0
    store %a3_3 @a3_1 null 0 0
    store %a0_3 @a0_1 null 0 0
    store %b5_3 @b5_1 null 0 0
    store %b1_3 @b1_1 null 0 0
    store %b6_3 @b6_1 null 0 0
    store %b9_3 @b9_1 null 0 0
    store %b2_3 @b2_1 null 0 0
    store %a10_3 @a10_1 null 0 0
    store %b8_3 @b8_1 null 0 0
    ret 0

main_for_body_1:
    %t_5 = add %a0_3 1
    %t_8 = add %a1_3 1
    %t_4 = add %a2_3 1
    %t_1 = add %t_5 1
    %t_2 = add %t_8 1
    %t_3 = add %t_4 1
    %t_7 = add %t_8 0
    %t_10 = mod %i_2 10000000
    cmp %t_10 0
    br seq main_if_then_1 main_for_step_1

main_if_then_1:
    %t_11 = add %sum_1 %t_5
    %t_12 = add %t_11 %t_8
    %t_13 = add %t_12 %t_4
    %t_14 = add %t_13 %t_1
    %t_15 = add %t_14 %t_2
    %t_16 = add %t_15 %t_3
    %t_17 = add %t_16 %t_1
    %t_18 = add %t_17 %t_2
    %t_19 = add %t_18 %t_3
    %t_20 = add %t_19 %t_1
    %t_21 = add %t_20 %t_7
    %t_22 = add %t_21 %t_5
    %t_23 = add %t_22 %t_8
    %t_24 = add %t_23 %t_4
    %t_25 = add %t_24 %t_1
    %t_26 = add %t_25 %t_2
    %t_27 = add %t_26 %t_3
    %t_28 = add %t_27 %t_1
    %t_29 = add %t_28 %t_2
    %t_30 = add %t_29 %t_3
    %t_31 = add %t_30 %t_1
    %t_32 = add %t_31 %t_7
    jump main_for_step_1

main_for_step_1:
    %sum_2 = phi main_for_body_1 %sum_1 main_if_then_1 %t_32 
    %t_6 = add %i_2 1
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
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
    %t_33 = call main 
    %b8_4 = load @b8_1 null 0 0
    %a10_4 = load @a10_1 null 0 0
    %b2_4 = load @b2_1 null 0 0
    %b9_4 = load @b9_1 null 0 0
    %b6_4 = load @b6_1 null 0 0
    %b1_4 = load @b1_1 null 0 0
    %b5_4 = load @b5_1 null 0 0
    %a0_4 = load @a0_1 null 0 0
    %a3_4 = load @a3_1 null 0 0
    %a8_4 = load @a8_1 null 0 0
    %a2_4 = load @a2_1 null 0 0
    %b7_4 = load @b7_1 null 0 0
    %b0_4 = load @b0_1 null 0 0
    %b10_4 = load @b10_1 null 0 0
    %b3_4 = load @b3_1 null 0 0
    %a9_4 = load @a9_1 null 0 0
    %a6_4 = load @a6_1 null 0 0
    %b4_4 = load @b4_1 null 0 0
    %a7_4 = load @a7_1 null 0 0
    %a1_4 = load @a1_1 null 0 0
    %a5_4 = load @a5_1 null 0 0
    %a4_4 = load @a4_1 null 0 0
    %i_3 = load @i_1 null 0 0
    store %i_3 @i_1 null 0 0
    store %a4_4 @a4_1 null 0 0
    store %a5_4 @a5_1 null 0 0
    store %a1_4 @a1_1 null 0 0
    store %a7_4 @a7_1 null 0 0
    store %b4_4 @b4_1 null 0 0
    store %a6_4 @a6_1 null 0 0
    store %a9_4 @a9_1 null 0 0
    store %b3_4 @b3_1 null 0 0
    store %b10_4 @b10_1 null 0 0
    store %b0_4 @b0_1 null 0 0
    store %b7_4 @b7_1 null 0 0
    store %a2_4 @a2_1 null 0 0
    store %a8_4 @a8_1 null 0 0
    store %a3_4 @a3_1 null 0 0
    store %a0_4 @a0_1 null 0 0
    store %b5_4 @b5_1 null 0 0
    store %b1_4 @b1_1 null 0 0
    store %b6_4 @b6_1 null 0 0
    store %b9_4 @b9_1 null 0 0
    store %b2_4 @b2_1 null 0 0
    store %a10_4 @a10_1 null 0 0
    store %b8_4 @b8_1 null 0 0
    ret %t_33

}


@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %temp_vr12_1 = move %vr12_1
    %temp_vr14_1 = move %vr14_1
    %temp_vrbx_1 = move %vrbx_1
    %temp_vr15_1 = move %vr15_1
    %temp_vr13_1 = move %vr13_1
    %M_2 = load @M_1 null 0 0
    %vrax_1 = call getInt 
    %t_1 = move %vrax_1
    %t_2 = move %t_1
    %t_2 = add %t_2 5
    %t_3 = lea null %t_2 8 8
    %vrdi_1 = move %t_3
    %vrax_1 = alloc %vrdi_1
    %t_4 = move %vrax_1
    store %t_2 %t_4 null 0 0
    %i_1 = move 0
    jump main_while_cond_1

main_while_cond_1:
    cmp %i_1 %t_1
    br sle main_while_body_1 main_while_merge_1

main_while_body_1:
    %i_2 = move %i_1
    %i_2 = add %i_2 1
    store 1 %t_4 %i_1 8 8
    %i_1 = move %i_2
    %breaker_1 = move %i_1
    jump main_while_cond_1

main_while_merge_1:
    %t_5 = move %t_1
    %t_5 = add %t_5 5
    %t_6 = lea null %t_5 8 8
    %vrdi_1 = move %t_6
    %vrax_1 = alloc %vrdi_1
    %t_7 = move %vrax_1
    store %t_5 %t_7 null 0 0
    %vrdi_1 = move %t_6
    %vrax_1 = alloc %vrdi_1
    %t_8 = move %vrax_1
    store %t_5 %t_8 null 0 0
    store 1 %t_7 null 0 16
    %M_3 = move %M_2
    %breaker_2 = move %M_3
    %i_3 = move 2
    %tmp_1 = move 0
    jump main_for_body_1

main_for_body_1:
    cmp %i_3 %t_1
    br sgt main_for_merge_1 main_if_merge_1

main_for_merge_1:
    store %M_3 @M_1 null 0 0
    store %t_1 @N_1 null 0 0
    store %t_4 @check_1 null 0 0
    %vrax_1 = move 0
    %vr12_1 = move %temp_vr12_1
    %vr14_1 = move %temp_vr14_1
    %vrbx_1 = move %temp_vrbx_1
    %vr15_1 = move %temp_vr15_1
    %vr13_1 = move %temp_vr13_1
    ret %vrax_1

main_if_merge_1:
    %t_9 = lea null %i_3 8 8
    %t_10 = load %t_4 %t_9 1 0
    cmp %t_10 1
    br seq main_if_then_1 main_parallel_copy_1

main_parallel_copy_1:
    %M_4 = move %M_3
    %breaker_3 = move %M_4
    jump main_if_merge_2

main_if_then_1:
    %M_5 = move %M_3
    %M_5 = add %M_5 1
    store %i_3 %t_8 %M_5 8 8
    %t_11 = move %i_3
    %t_11 = sub %t_11 1
    store %t_11 %t_7 %t_9 1 0
    %M_4 = move %M_5
    %breaker_4 = move %M_4
    jump main_if_merge_2

main_if_merge_2:
    %tmp_2 = move %tmp_1
    %breaker_5 = move %tmp_2
    %i_4 = move 1
    jump main_for_cond_1

main_for_cond_1:
    cmp %i_4 %M_4
    br sle main_lhs_then_1 main_parallel_copy_2

main_lhs_then_1:
    %t_12 = lea %t_8 %i_4 8 8
    %t_13 = load %t_12 null 0 0
    %t_14 = move %i_3
    %t_14 = mul %t_14 %t_13
    cmp %t_14 %t_1
    br sle main_for_body_2 main_parallel_copy_3

main_for_body_2:
    %t_15 = load %t_12 null 0 0
    %t_16 = move %i_3
    %t_16 = mul %t_16 %t_15
    cmp %t_16 %t_1
    br sgt main_for_step_1 main_if_merge_3

main_if_merge_3:
    %t_17 = lea null %t_16 8 8
    store 0 %t_4 %t_17 1 0
    %t_18 = load %t_12 null 0 0
    %t_19 = move %i_3
    %vrax_1 = move %t_19
    %vrdx_1 = move %rdx
    %vrcx_1 = move %t_18
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_19 = move %vrdx_1
    cmp %t_19 0
    br seq main_if_then_2 main_if_else_1

main_if_else_1:
    %t_20 = load %t_12 null 0 0
    %t_21 = move %i_3
    %t_21 = mul %t_21 %t_20
    %t_22 = load %t_12 null 0 0
    %t_23 = move %t_22
    %t_23 = sub %t_23 1
    %t_24 = load %t_7 %i_3 8 8
    %t_25 = move %t_24
    %t_25 = mul %t_25 %t_23
    store %t_25 %t_7 %t_21 8 8
    jump main_for_step_1

main_if_then_2:
    %t_26 = load %t_7 %i_3 8 8
    %t_27 = load %t_12 null 0 0
    %t_28 = move %t_26
    %t_28 = mul %t_28 %t_27
    store %t_28 %t_7 %t_17 1 0
    %tmp_3 = move %t_16
    %breaker_6 = move %tmp_3
    jump main_for_merge_2

main_for_step_1:
    %i_5 = move %i_4
    %i_5 = add %i_5 1
    %tmp_2 = move %t_16
    %i_4 = move %i_5
    %breaker_7 = move %tmp_2
    %tmp_2 = move %tmp_2
    %breaker_7 = move %i_4
    jump main_for_cond_1

main_parallel_copy_3:
    %tmp_3 = move %tmp_2
    %breaker_8 = move %tmp_3
    jump main_for_merge_2

main_parallel_copy_2:
    %tmp_3 = move %tmp_2
    %breaker_9 = move %tmp_3
    jump main_for_merge_2

main_for_merge_2:
    %t_29 = load %t_7 %i_3 8 8
    %vrdi_1 = move %t_29
    %vrax_1 = call toString %vrdi_1 
    %t_30 = move %vrax_1
    %vrdi_1 = move %t_30
    call println %vrdi_1 
    %i_6 = move %i_3
    %i_6 = add %i_6 1
    %i_3 = move %i_6
    %tmp_1 = move %tmp_3
    %M_3 = move %M_4
    %breaker_10 = move %i_3
    %i_3 = move %i_3
    %breaker_10 = move %tmp_1
    %tmp_1 = move %tmp_1
    %breaker_10 = move %M_3
    jump main_for_body_1

}

define i64 @__init  {
__init_entry_1:
    %temp_vr12_2 = move %vr12_1
    %temp_vr14_2 = move %vr14_1
    %temp_vrbx_2 = move %vrbx_1
    %temp_vr15_2 = move %vr15_1
    %temp_vr13_2 = move %vr13_1
    store 0 @M_1 null 0 0
    %vrax_1 = call main 
    %t_31 = move %vrax_1
    %M_6 = load @M_1 null 0 0
    store %M_6 @M_1 null 0 0
    %vrax_1 = move %t_31
    %vr12_1 = move %temp_vr12_2
    %vr14_1 = move %temp_vr14_2
    %vrbx_1 = move %temp_vrbx_2
    %vr15_1 = move %temp_vr15_2
    %vr13_1 = move %temp_vr13_2
    ret %vrax_1

}


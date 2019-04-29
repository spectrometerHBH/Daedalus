@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    store %vrbx_1 %vrbp_1 null 0 -40
    store %vr12_1 %vrbp_1 null 0 -32
    store %vr14_1 %vrbp_1 null 0 -8
    store %vr15_1 %vrbp_1 null 0 -48
    %M_2 = load @M_1 null 0 0
    %vrax_1 = call getInt 
    store %vrax_1 %vrbp_1 null 0 -16
    %t_1 = load %vrbp_1 null 0 -16
    %t_1 = add %t_1 5
    %vrdi_1 = lea null %t_1 8 8
    %vrax_1 = alloc %vrdi_1
    store %vrax_1 %vrbp_1 null 0 -56
    %spill_tmp_1 = load %vrbp_1 null 0 -56
    store %t_1 %spill_tmp_1 null 0 0
    %i_1 = move 0
    jump main_while_cond_1

main_while_cond_1:
    %spill_tmp_2 = load %vrbp_1 null 0 -16
    cmp %i_1 %spill_tmp_2
    br sle main_while_body_1 main_while_merge_1

main_while_body_1:
    %i_2 = move %i_1
    %i_2 = add %i_2 1
    %spill_tmp_3 = load %vrbp_1 null 0 -56
    store 1 %spill_tmp_3 %i_1 8 8
    %i_1 = move %i_2
    jump main_while_cond_1

main_while_merge_1:
    %t_2 = load %vrbp_1 null 0 -16
    %t_2 = add %t_2 5
    %t_3 = lea null %t_2 8 8
    %vrdi_1 = move %t_3
    %vrax_1 = alloc %vrdi_1
    %t_4 = move %vrax_1
    store %t_2 %t_4 null 0 0
    %vrdi_1 = move %t_3
    %vrax_1 = alloc %vrdi_1
    store %vrax_1 %vrbp_1 null 0 -24
    %spill_tmp_4 = load %vrbp_1 null 0 -24
    store %t_2 %spill_tmp_4 null 0 0
    store 1 %t_4 null 0 16
    %tmp_1 = move 0
    %i_3 = move 2
    jump main_for_body_1

main_for_body_1:
    %spill_tmp_5 = load %vrbp_1 null 0 -16
    cmp %i_3 %spill_tmp_5
    br sgt main_for_merge_1 main_if_merge_1

main_if_merge_1:
    %t_5 = lea null %i_3 8 8
    %spill_tmp_6 = load %vrbp_1 null 0 -56
    %t_6 = load %spill_tmp_6 %t_5 1 0
    cmp %t_6 1
    br seq main_if_then_1 main_if_merge_2

main_if_then_1:
    %M_3 = add %M_3 1
    %spill_tmp_7 = load %vrbp_1 null 0 -24
    store %i_3 %spill_tmp_7 %M_3 8 8
    %t_7 = move %i_3
    %t_7 = sub %t_7 1
    store %t_7 %t_4 %t_5 1 0
    jump main_if_merge_2

main_if_merge_2:
    %i_4 = move 1
    jump main_for_cond_1

main_for_cond_1:
    cmp %i_4 %M_4
    br sle main_lhs_then_1 main_for_merge_2

main_lhs_then_1:
    %spill_tmp_8 = load %vrbp_1 null 0 -24
    %t_8 = lea %spill_tmp_8 %i_4 8 8
    %t_9 = load %t_8 null 0 0
    %t_10 = move %i_3
    %t_10 = mul %t_10 %t_9
    %spill_tmp_9 = load %vrbp_1 null 0 -16
    cmp %t_10 %spill_tmp_9
    br sle main_for_body_2 main_for_merge_2

main_for_body_2:
    %t_11 = load %t_8 null 0 0
    %t_12 = move %i_3
    %t_12 = mul %t_12 %t_11
    %spill_tmp_10 = load %vrbp_1 null 0 -16
    cmp %t_12 %spill_tmp_10
    br sgt main_for_step_1 main_if_merge_3

main_if_merge_3:
    %t_13 = lea null %t_12 8 8
    %spill_tmp_11 = load %vrbp_1 null 0 -56
    store 0 %spill_tmp_11 %t_13 1 0
    %vrcx_1 = load %t_8 null 0 0
    %vrax_1 = move %i_3
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %vrdx_1
    cmp %vrax_1 0
    br seq main_if_then_2 main_if_else_1

main_if_then_2:
    %t_14 = load %t_4 %i_3 8 8
    %t_15 = load %t_8 null 0 0
    %t_14 = mul %t_14 %t_15
    store %t_14 %t_4 %t_13 1 0
    jump main_for_merge_2

main_if_else_1:
    %t_16 = load %t_8 null 0 0
    %t_17 = move %i_3
    %t_17 = mul %t_17 %t_16
    %t_18 = load %t_8 null 0 0
    %t_19 = sub %t_19 1
    %t_20 = load %t_4 %i_3 8 8
    %t_20 = mul %t_20 %t_19
    store %t_20 %t_4 %t_17 8 8
    jump main_for_step_1

main_for_step_1:
    %i_5 = add %i_5 1
    jump main_for_cond_1

main_for_merge_2:
    %vrdi_1 = load %t_4 %i_3 8 8
    %vrax_1 = call toString %vrdi_1 
    %vrdi_1 = move %vrax_1
    call println %vrdi_1 
    %i_6 = add %i_6 1
    jump main_for_body_1

main_for_merge_1:
    %spill_tmp_12 = load %vrbp_1 null 0 -16
    store %spill_tmp_12 @N_1 null 0 0
    %spill_tmp_13 = load %vrbp_1 null 0 -56
    store %spill_tmp_13 @check_1 null 0 0
    store %M_3 @M_1 null 0 0
    %vrax_1 = move 0
    %vrbx_1 = load %vrbp_1 null 0 -40
    %vr12_1 = load %vrbp_1 null 0 -32
    %vr14_1 = load %vrbp_1 null 0 -8
    %vr15_1 = load %vrbp_1 null 0 -48
    ret %vrax_1

}

define i64 @__init  {
__init_entry_1:
    store 0 @M_1 null 0 0
    %vrax_1 = call main 
    %M_5 = load @M_1 null 0 0
    store %M_5 @M_1 null 0 0
    ret %vrax_1

}


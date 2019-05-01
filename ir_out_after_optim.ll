@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %M_2 = load @M_1 null 0 0
    %t_1 = call getInt 
    %t_2 = add %t_1 5
    %t_3 = lea null %t_2 8 8
    %t_4 = alloc %t_3
    store %t_2 %t_4 null 0 0
    jump main_while_cond_1

main_while_cond_1:
    %i_1 = phi main_entry_1 0 main_while_body_1 %i_2 
    cmp %i_1 %t_1
    br sle main_while_body_1 main_while_merge_1

main_while_body_1:
    %i_2 = add %i_1 1
    store 1 %t_4 %i_1 8 8
    jump main_while_cond_1

main_while_merge_1:
    %t_5 = add %t_1 5
    %t_6 = lea null %t_5 8 8
    %t_7 = alloc %t_6
    store %t_5 %t_7 null 0 0
    %t_8 = alloc %t_6
    store %t_5 %t_8 null 0 0
    store 1 %t_7 null 0 16
    jump main_for_body_1

main_for_body_1:
    %i_3 = phi main_while_merge_1 2 main_for_merge_1 %i_4 
    %tmp_1 = phi main_while_merge_1 undef main_for_merge_1 %tmp_2 
    %M_3 = phi main_while_merge_1 %M_2 main_for_merge_1 %M_4 
    cmp %i_3 %t_1
    br sgt main_for_merge_2 main_if_merge_1

main_for_merge_2:
    store %M_3 @M_1 null 0 0
    store %t_1 @N_1 null 0 0
    store %t_4 @check_1 null 0 0
    ret 0

main_if_merge_1:
    %t_9 = lea null %i_3 8 8
    %t_10 = load %t_4 %t_9 1 0
    cmp %t_10 1
    br seq main_if_then_1 main_if_merge_2

main_if_then_1:
    %M_5 = add %M_3 1
    store %i_3 %t_8 %M_5 8 8
    %t_11 = sub %i_3 1
    store %t_11 %t_7 %t_9 1 0
    jump main_if_merge_2

main_if_merge_2:
    %M_4 = phi main_if_merge_1 %M_3 main_if_then_1 %M_5 
    jump main_for_cond_1

main_for_cond_1:
    %tmp_3 = phi main_if_merge_2 %tmp_1 main_for_step_1 %t_12 
    %i_5 = phi main_if_merge_2 1 main_for_step_1 %i_6 
    cmp %i_5 %M_4
    br sle main_lhs_then_1 main_for_merge_1

main_lhs_then_1:
    %t_13 = lea %t_8 %i_5 8 8
    %t_14 = load %t_13 null 0 0
    %t_15 = mul %i_3 %t_14
    cmp %t_15 %t_1
    br sle main_for_body_2 main_for_merge_1

main_for_body_2:
    %t_16 = load %t_13 null 0 0
    %t_12 = mul %i_3 %t_16
    cmp %t_12 %t_1
    br sgt main_for_step_1 main_if_merge_3

main_if_merge_3:
    %t_17 = lea null %t_12 8 8
    store 0 %t_4 %t_17 1 0
    %t_18 = load %t_13 null 0 0
    %t_19 = mod %i_3 %t_18
    cmp %t_19 0
    br seq main_if_then_2 main_if_else_1

main_if_else_1:
    %t_20 = load %t_13 null 0 0
    %t_21 = mul %i_3 %t_20
    %t_22 = load %t_13 null 0 0
    %t_23 = sub %t_22 1
    %t_24 = load %t_7 %i_3 8 8
    %t_25 = mul %t_24 %t_23
    store %t_25 %t_7 %t_21 8 8
    jump main_for_step_1

main_if_then_2:
    %t_26 = load %t_7 %i_3 8 8
    %t_27 = load %t_13 null 0 0
    %t_28 = mul %t_26 %t_27
    store %t_28 %t_7 %t_17 1 0
    jump main_for_merge_1

main_for_merge_1:
    %tmp_2 = phi main_for_cond_1 %tmp_3 main_lhs_then_1 %tmp_3 main_if_then_2 %t_12 
    %t_29 = load %t_7 %i_3 8 8
    %t_30 = call toString %t_29 
    call println %t_30 
    %i_4 = add %i_3 1
    jump main_for_body_1

main_for_step_1:
    %i_6 = add %i_5 1
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    store 0 @M_1 null 0 0
    %t_31 = call main 
    %M_6 = load @M_1 null 0 0
    store %M_6 @M_1 null 0 0
    ret %t_31

}


@__str_const_1.-1 = "\n"

define i64 @main  {
main_entry_1:
    %a_1.-1 = move 10000
    %b_1.-1 = move 0
    %c_1.-1 = move 2800
    %d_1.-1 = move 0
    %e_1.-1 = move 0
    %t_1.-1 = mul 2801 8
    %t_1.-1 = add %t_1.-1 8
    %t_2.-1 = alloc %t_1.-1
    store 2801 %t_2.-1
    %f_1.-1 = move %t_2.-1
    %g_1.-1 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %t_3.-1 = sub %b_1.-1 %c_1.-1
    %t_4.-1 = sne %t_3.-1 0
    br %t_4.-1 main_for_body_1 main_for_merge_1

main_for_merge_1:
    jump main_for_body_2

main_for_body_2:
    %d_1.-1 = move 0
    %t_5.-1 = mul %c_1.-1 2
    %g_1.-1 = move %t_5.-1
    %t_6.-1 = seq %g_1.-1 0
    br %t_6.-1 main_if_then_1 main_if_merge_1

main_if_then_1:
    jump main_for_merge_2

main_for_merge_2:
    call print @__str_const_1.-1 
    %t_7.-1 = move 0
    ret %t_7.-1

main_if_merge_1:
    %b_1.-1 = move %c_1.-1
    jump main_for_body_3

main_for_body_3:
    %t_8.-1 = mul %b_1.-1 8
    %t_9.-1 = add %t_8.-1 8
    %t_10.-1 = add %f_1.-1 %t_9.-1
    %t_11.-1 = load %t_10.-1
    %t_12.-1 = mul %t_11.-1 %a_1.-1
    %t_13.-1 = add %d_1.-1 %t_12.-1
    %d_1.-1 = move %t_13.-1
    %t_14.-1 = mul %b_1.-1 8
    %t_15.-1 = add %t_14.-1 8
    %t_16.-1 = add %f_1.-1 %t_15.-1
    %g_1.-1 = sub %g_1.-1 1
    %t_17.-1 = mod %d_1.-1 %g_1.-1
    store %t_17.-1 %t_16.-1
    %t_18.-1 = move %g_1.-1
    %g_1.-1 = sub %g_1.-1 1
    %t_19.-1 = div %d_1.-1 %t_18.-1
    %d_1.-1 = move %t_19.-1
    %b_1.-1 = sub %b_1.-1 1
    %t_20.-1 = seq %b_1.-1 0
    br %t_20.-1 main_if_then_2 main_if_merge_2

main_if_merge_2:
    jump main_for_step_1

main_for_step_1:
    %t_21.-1 = mul %d_1.-1 %b_1.-1
    %d_1.-1 = move %t_21.-1
    jump main_for_body_3

main_if_then_2:
    jump main_for_merge_3

main_for_merge_3:
    %t_22.-1 = sub %c_1.-1 14
    %c_1.-1 = move %t_22.-1
    %t_23.-1 = div %d_1.-1 %a_1.-1
    %t_24.-1 = add %e_1.-1 %t_23.-1
    %t_25.-1 = call toString %t_24.-1 
    call print %t_25.-1 
    jump main_for_step_2

main_for_step_2:
    %t_26.-1 = mod %d_1.-1 %a_1.-1
    %e_1.-1 = move %t_26.-1
    jump main_for_body_2

main_for_body_1:
    %t_27.-1 = move %b_1.-1
    %b_1.-1 = add %b_1.-1 1
    %t_28.-1 = mul %t_27.-1 8
    %t_29.-1 = add %t_28.-1 8
    %t_30.-1 = add %f_1.-1 %t_29.-1
    %t_31.-1 = div %a_1.-1 5
    store %t_31.-1 %t_30.-1
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %t_32.-1 = call main 
    %t_33.-1 = move %t_32.-1
    ret %t_33.-1

}


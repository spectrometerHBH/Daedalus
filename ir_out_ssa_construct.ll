@__str_const_1.-1 = "\n"

define i64 @main  {
main_entry_1:
    %a_1.0 = move 10000
    %b_1.0 = move 0
    %c_1.0 = move 2800
    %d_1.0 = move 0
    %e_1.0 = move 0
    %t_1.0 = mul 2801 8
    %t_1.1 = add %t_1.0 8
    %t_2.0 = alloc %t_1.1
    store 2801 %t_2.0
    %f_1.0 = move %t_2.0
    %g_1.0 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %b_1.1 = phi main_entry_1 %b_1.0 main_for_body_1 %b_1.2 
    %t_3.0 = sub %b_1.1 %c_1.0
    %t_4.0 = sne %t_3.0 0
    br %t_4.0 main_for_body_1 main_for_merge_1

main_for_merge_1:
    jump main_for_body_2

main_for_body_2:
    %b_1.3 = phi main_for_merge_1 %b_1.1 main_if_then_1 %b_1.6 
    %e_1.1 = phi main_for_merge_1 %e_1.0 main_if_then_1 %e_1.2 
    %d_1.1 = phi main_for_merge_1 %d_1.0 main_if_then_1 %d_1.5 
    %g_1.1 = phi main_for_merge_1 %g_1.0 main_if_then_1 %g_1.5 
    %c_1.1 = phi main_for_merge_1 %c_1.0 main_if_then_1 %c_1.2 
    %d_1.2 = move 0
    %t_5.0 = mul %c_1.1 2
    %g_1.2 = move %t_5.0
    %t_6.0 = seq %g_1.2 0
    br %t_6.0 main_if_then_2 main_if_merge_1

main_if_then_2:
    call print @__str_const_1.-1 
    %t_7.0 = move 0
    ret %t_7.0

main_if_merge_1:
    %b_1.4 = move %c_1.1
    jump main_for_body_3

main_for_body_3:
    %b_1.5 = phi main_if_merge_1 %b_1.4 main_if_merge_2 %b_1.6 
    %d_1.3 = phi main_if_merge_1 %d_1.2 main_if_merge_2 %d_1.6 
    %g_1.3 = phi main_if_merge_1 %g_1.2 main_if_merge_2 %g_1.5 
    %t_8.0 = mul %b_1.5 8
    %t_9.0 = add %t_8.0 8
    %t_10.0 = add %f_1.0 %t_9.0
    %t_11.0 = load %t_10.0
    %t_12.0 = mul %t_11.0 %a_1.0
    %t_13.0 = add %d_1.3 %t_12.0
    %d_1.4 = move %t_13.0
    %t_14.0 = mul %b_1.5 8
    %t_15.0 = add %t_14.0 8
    %t_16.0 = add %f_1.0 %t_15.0
    %g_1.4 = sub %g_1.3 1
    %t_17.0 = mod %d_1.4 %g_1.4
    store %t_17.0 %t_16.0
    %t_18.0 = move %g_1.4
    %g_1.5 = sub %g_1.4 1
    %t_19.0 = div %d_1.4 %t_18.0
    %d_1.5 = move %t_19.0
    %b_1.6 = sub %b_1.5 1
    %t_20.0 = seq %b_1.6 0
    br %t_20.0 main_if_then_1 main_if_merge_2

main_if_merge_2:
    %t_21.0 = mul %d_1.5 %b_1.6
    %d_1.6 = move %t_21.0
    jump main_for_body_3

main_if_then_1:
    %t_22.0 = sub %c_1.1 14
    %c_1.2 = move %t_22.0
    %t_23.0 = div %d_1.5 %a_1.0
    %t_24.0 = add %e_1.1 %t_23.0
    %t_25.0 = call toString %t_24.0 
    call print %t_25.0 
    %t_26.0 = mod %d_1.5 %a_1.0
    %e_1.2 = move %t_26.0
    jump main_for_body_2

main_for_body_1:
    %t_27.0 = move %b_1.1
    %b_1.2 = add %b_1.1 1
    %t_28.0 = mul %t_27.0 8
    %t_29.0 = add %t_28.0 8
    %t_30.0 = add %f_1.0 %t_29.0
    %t_31.0 = div %a_1.0 5
    store %t_31.0 %t_30.0
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %t_32.0 = call main 
    %t_33.0 = move %t_32.0
    ret %t_33.0

}


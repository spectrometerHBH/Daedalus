@__str_const_1.-1 = "\n"

define i64 @main  {
main_entry_1:
    %t_1.0 = alloc 22416
    store 2801 %t_1.0
    jump main_for_cond_1

main_for_cond_1:
    %b_1.1 = phi main_entry_1 0 main_for_body_1 %b_1.2 
    %t_2.0 = sub %b_1.1 2800
    %t_3.0 = sne %t_2.0 0
    br %t_3.0 main_for_body_1 main_for_merge_1

main_for_merge_1:
    jump main_for_body_2

main_for_body_2:
    %e_1.1 = phi main_for_merge_1 0 main_if_then_1 %t_4.0 
    %c_1.1 = phi main_for_merge_1 2800 main_if_then_1 %t_5.0 
    %t_6.0 = mul %c_1.1 2
    %t_7.0 = seq %t_6.0 0
    br %t_7.0 main_if_then_2 main_if_merge_1

main_if_then_2:
    call print @__str_const_1.-1 
    ret 0

main_if_merge_1:
    jump main_for_body_3

main_for_body_3:
    %b_1.5 = phi main_if_merge_1 %c_1.1 main_if_merge_2 %b_1.6 
    %d_1.3 = phi main_if_merge_1 0 main_if_merge_2 %t_8.0 
    %g_1.3 = phi main_if_merge_1 %t_6.0 main_if_merge_2 %g_1.5 
    %t_9.0 = mul %b_1.5 8
    %t_10.0 = add %t_9.0 8
    %t_11.0 = add %t_1.0 %t_10.0
    %t_12.0 = load %t_11.0
    %t_13.0 = mul %t_12.0 10000
    %t_14.0 = add %d_1.3 %t_13.0
    %t_15.0 = mul %b_1.5 8
    %t_16.0 = add %t_15.0 8
    %t_17.0 = add %t_1.0 %t_16.0
    %g_1.4 = sub %g_1.3 1
    %t_18.0 = mod %t_14.0 %g_1.4
    store %t_18.0 %t_17.0
    %g_1.5 = sub %g_1.4 1
    %t_19.0 = div %t_14.0 %g_1.4
    %b_1.6 = sub %b_1.5 1
    %t_20.0 = seq %b_1.6 0
    br %t_20.0 main_if_then_1 main_if_merge_2

main_if_merge_2:
    %t_8.0 = mul %t_19.0 %b_1.6
    jump main_for_body_3

main_if_then_1:
    %t_5.0 = sub %c_1.1 14
    %t_21.0 = div %t_19.0 10000
    %t_22.0 = add %e_1.1 %t_21.0
    %t_23.0 = call toString %t_22.0 
    call print %t_23.0 
    %t_4.0 = mod %t_19.0 10000
    jump main_for_body_2

main_for_body_1:
    %b_1.2 = add %b_1.1 1
    %t_24.0 = mul %b_1.1 8
    %t_25.0 = add %t_24.0 8
    %t_26.0 = add %t_1.0 %t_25.0
    store 2000 %t_26.0
    jump main_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %t_27.0 = call main 
    ret %t_27.0

}


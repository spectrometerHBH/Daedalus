@__str_const_1.-1 = "p cnf "
@__str_const_2.-1 = " "
@__str_const_3.-1 = " "
@__str_const_4.-1 = " "

define i64 @main  {
main_entry_1:
    %t_1.-1 = call getInt 
    %k_1.-1 = move %t_1.-1
    call print @__str_const_1.-1 
    %t_2.-1 = mul %k_1.-1 2
    %t_3.-1 = add %t_2.-1 1
    %t_4.-1 = call toString %t_3.-1 
    %t_5.-1 = call string.add %t_4.-1 @__str_const_2.-1 
    %t_6.-1 = call toString %k_1.-1 
    %t_7.-1 = call string.add %t_5.-1 %t_6.-1 
    call println %t_7.-1 
    %last_1.-1 = move 1
    %i_1.-1 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %t_8.-1 = slt %i_1.-1 %k_1.-1
    br %t_8.-1 main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_9.-1 = call toString %last_1.-1 
    %t_10.-1 = call string.add %t_9.-1 @__str_const_3.-1 
    %t_11.-1 = add %last_1.-1 1
    %t_12.-1 = call toString %t_11.-1 
    %t_13.-1 = call string.add %t_10.-1 %t_12.-1 
    %t_14.-1 = call string.add %t_13.-1 @__str_const_4.-1 
    %t_15.-1 = add %last_1.-1 2
    %t_16.-1 = neg %t_15.-1
    %t_17.-1 = call toString %t_16.-1 
    %t_18.-1 = call string.add %t_14.-1 %t_17.-1 
    %t_19.-1 = move %t_18.-1
    %t_20.-1 = mod %i_1.-1 100000
    %t_21.-1 = seq %t_20.-1 0
    br %t_21.-1 main_if_then_1 main_if_merge_1

main_if_then_1:
    call println %t_19.-1 
    jump main_if_merge_1

main_if_merge_1:
    %t_22.-1 = add %last_1.-1 2
    %last_1.-1 = move %t_22.-1
    jump main_for_step_1

main_for_step_1:
    %i_1.-1 = add %i_1.-1 1
    jump main_for_cond_1

main_for_merge_1:
    %t_23.-1 = move 0
    ret %t_23.-1

}

define i64 @__init  {
__init_entry_1:
    %t_24.-1 = call main 
    %t_25.-1 = move %t_24.-1
    ret %t_25.-1

}


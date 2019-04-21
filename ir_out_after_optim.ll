@__str_const_1.-1 = "p cnf "
@__str_const_2.-1 = " "
@__str_const_3.-1 = " "
@__str_const_4.-1 = " "

define i64 @main  {
main_entry_1:
    %t_1.0 = call getInt 
    call print @__str_const_1.-1 
    %t_2.0 = lea null %t_1.0 2 1
    %t_3.0 = call toString %t_2.0 
    %t_4.0 = call string.add %t_3.0 @__str_const_2.-1 
    %t_5.0 = call toString %t_1.0 
    %t_6.0 = call string.add %t_4.0 %t_5.0 
    call println %t_6.0 
    jump main_for_cond_1

main_for_cond_1:
    %last_1.1 = phi main_entry_1 1 main_if_merge_1 %t_7.0 
    %i_1.1 = phi main_entry_1 0 main_if_merge_1 %i_1.2 
    %t_8.0 = slt %i_1.1 %t_1.0
    br %t_8.0 main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_9.0 = call toString %last_1.1 
    %t_10.0 = call string.add %t_9.0 @__str_const_3.-1 
    %t_11.0 = add %last_1.1 1
    %t_12.0 = call toString %t_11.0 
    %t_13.0 = call string.add %t_10.0 %t_12.0 
    %t_14.0 = call string.add %t_13.0 @__str_const_4.-1 
    %t_15.0 = add %last_1.1 2
    %t_16.0 = neg %t_15.0
    %t_17.0 = call toString %t_16.0 
    %t_18.0 = call string.add %t_14.0 %t_17.0 
    %t_19.0 = mod %i_1.1 100000
    %t_20.0 = seq %t_19.0 0
    br %t_20.0 main_if_then_1 main_if_merge_1

main_if_then_1:
    call println %t_18.0 
    jump main_if_merge_1

main_if_merge_1:
    %t_7.0 = add %last_1.1 2
    %i_1.2 = add %i_1.1 1
    jump main_for_cond_1

main_for_merge_1:
    ret 0

}

define i64 @__init  {
__init_entry_1:
    %t_21.0 = call main 
    ret %t_21.0

}


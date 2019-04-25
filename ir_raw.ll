define i64 @f  %a_1.-1 %b_1.-1 %c_1.-1 %d_1.-1 %e_1.-1 %f_1.-1 %g_1.-1 %h_1.-1 {
f_entry_1:
    %t_1.-1 = add %a_1.-1 %b_1.-1
    %t_2.-1 = add %t_1.-1 %c_1.-1
    %t_3.-1 = add %t_2.-1 %d_1.-1
    %t_4.-1 = add %t_3.-1 %e_1.-1
    %t_5.-1 = add %t_4.-1 %f_1.-1
    %t_6.-1 = add %t_5.-1 %g_1.-1
    %t_7.-1 = add %t_6.-1 %h_1.-1
    %t_8.-1 = move %t_7.-1
    ret %t_8.-1

}

define i64 @main  {
main_entry_1:
    %n_1.-1 = move 1
    %t_9.-1 = mul %n_1.-1 2
    %t_10.-1 = call f %n_1.-1 %n_1.-1 %n_1.-1 %n_1.-1 %n_1.-1 %n_1.-1 %n_1.-1 %t_9.-1 
    %n_1.-1 = move %t_10.-1
    %t_11.-1 = move 0
    ret %t_11.-1

}

define i64 @__init  {
__init_entry_1:
    %t_12.-1 = call main 
    %t_13.-1 = move %t_12.-1
    ret %t_13.-1

}


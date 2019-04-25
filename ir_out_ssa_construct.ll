define i64 @f  %a_1.0 %b_1.0 %c_1.0 %d_1.0 %e_1.0 %f_1.0 %g_1.0 %h_1.0 {
f_entry_1:
    %t_1.0 = add %a_1.0 %b_1.0
    %t_2.0 = add %t_1.0 %c_1.0
    %t_3.0 = add %t_2.0 %d_1.0
    %t_4.0 = add %t_3.0 %e_1.0
    %t_5.0 = add %t_4.0 %f_1.0
    %t_6.0 = add %t_5.0 %g_1.0
    %t_7.0 = add %t_6.0 %h_1.0
    %t_8.0 = move %t_7.0
    ret %t_8.0

}

define i64 @main  {
main_entry_1:
    %n_1.0 = move 1
    %t_9.0 = mul %n_1.0 2
    %t_10.0 = call f %n_1.0 %n_1.0 %n_1.0 %n_1.0 %n_1.0 %n_1.0 %n_1.0 %t_9.0 
    %n_1.1 = move %t_10.0
    %t_11.0 = move 0
    ret %t_11.0

}

define i64 @__init  {
__init_entry_1:
    %t_12.0 = call main 
    %t_13.0 = move %t_12.0
    ret %t_13.0

}


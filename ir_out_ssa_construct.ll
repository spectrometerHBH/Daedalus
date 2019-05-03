define i64 @__init  {
__init_entry_1:
    %t_1 = call getString 
    %str_1 = move %t_1
    %t_2 = call string.length %str_1 
    %t_3 = call toString %t_2 
    call println %t_3 
    %t_4 = move 0
    %t_5 = move %t_4
    %t_6 = move %t_5
    ret %t_6

}


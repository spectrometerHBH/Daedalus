define i64 @__init  {
__init_entry_1:
    %t_1 = call getString 
    %t_2 = call string.length %t_1 
    %t_3 = call toString %t_2 
    call println %t_3 
    ret 0

}


define void @exchange  {
exchange_entry_1:
    ret 

}

define i64 @main  {
main_entry_1:
    %t_1.0 = move 0
    ret %t_1.0

}

define i64 @__init  {
__init_entry_1:
    %t_2.0 = call main 
    %t_3.0 = move %t_2.0
    ret %t_3.0

}


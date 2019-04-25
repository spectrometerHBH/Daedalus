define void @exchange  {
exchange_entry_1:
    ret 

}

define i64 @main  {
main_entry_1:
    ret 0

}

define i64 @__init  {
__init_entry_1:
    %t_1.0 = call main 
    ret %t_1.0

}


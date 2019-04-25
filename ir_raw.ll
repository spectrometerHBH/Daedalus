define void @exchange  %x_1.-1 %y_1.-1 {
exchange_entry_1:
    ret 

}

define i64 @main  {
main_entry_1:
    %t_1.-1 = move 0
    ret %t_1.-1

}

define i64 @__init  {
__init_entry_1:
    %t_2.-1 = call main 
    %t_3.-1 = move %t_2.-1
    ret %t_3.-1

}


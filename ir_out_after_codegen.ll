@N_1.-1
@row_1.-1
@col_1.-1
@d_1.-1
@__str_const_1.-1 = " O"
@__str_const_2.-1 = " ."
@__str_const_3.-1 = ""
@__str_const_4.-1 = ""

define void @printBoard  {
printBoard_entry_1:
    %t_1.0 = load @N_1.-1
    %t_2.0 = load @col_1.-1
    %i_1.1 = move 0
    jump printBoard_for_cond_1

printBoard_for_cond_1:
    %t_3.0 = slt %i_1.1 %t_1.0
    br %t_3.0 printBoard_parallel_copy_1 printBoard_parallel_copy_2

printBoard_parallel_copy_2:
    call println @__str_const_4.-1 
    ret 

printBoard_parallel_copy_1:
    %j_1.2 = move 0
    jump printBoard_for_cond_2

printBoard_for_cond_2:
    %t_4.0 = slt %j_1.2 %t_1.0
    br %t_4.0 printBoard_parallel_copy_3 printBoard_parallel_copy_4

printBoard_parallel_copy_3:
    %t_5.0 = lea %t_2.0 %i_1.1 8 8
    %t_6.0 = load %t_5.0
    %t_7.0 = seq %t_6.0 %j_1.2
    br %t_7.0 printBoard_parallel_copy_5 printBoard_parallel_copy_6

printBoard_parallel_copy_6:
    call print @__str_const_2.-1 
    jump printBoard_if_merge_1

printBoard_parallel_copy_5:
    call print @__str_const_1.-1 
    jump printBoard_if_merge_1

printBoard_if_merge_1:
    %j_1.3 = move %j_1.2
    %j_1.3 = add %j_1.3 1
    %j_1.2 = move %j_1.3
    %breaker_1.-1 = move %j_1.2
    jump printBoard_for_cond_2

printBoard_parallel_copy_4:
    call println @__str_const_3.-1 
    %i_1.2 = move %i_1.1
    %i_1.2 = add %i_1.2 1
    %i_1.1 = move %i_1.2
    %breaker_2.-1 = move %i_1.1
    jump printBoard_for_cond_1

}

define void @search  %c_1.0 {
search_entry_1:
    %t_8.0 = load @N_1.-1
    %t_9.0 = load @row_1.-1
    %t_10.0 = load @d_1.-1
    %t_11.0 = load @col_1.-1
    %t_12.0 = seq %c_1.0 %t_8.0
    br %t_12.0 search_parallel_copy_1 search_parallel_copy_2

search_parallel_copy_1:
    call printBoard 
    jump search_if_merge_1

search_parallel_copy_2:
    %r_1.2 = move 0
    jump search_for_cond_1

search_for_cond_1:
    %t_13.0 = slt %r_1.2 %t_8.0
    br %t_13.0 search_parallel_copy_3 search_parallel_copy_4

search_parallel_copy_4:
    jump search_if_merge_1

search_if_merge_1:
    ret 

search_parallel_copy_3:
    %t_14.0 = lea %t_9.0 %r_1.2 8 8
    %t_15.0 = load %t_14.0
    %t_16.0 = seq %t_15.0 0
    br %t_16.0 search_parallel_copy_5 search_parallel_copy_6

search_parallel_copy_5:
    %t_17.0 = move %t_10.0
    %t_17.0 = add %t_17.0 8
    %t_18.0 = move %r_1.2
    %t_18.0 = add %t_18.0 %c_1.0
    %t_19.0 = load %t_17.0
    %t_20.0 = lea null %t_18.0 8 8
    %t_21.0 = move %t_19.0
    %t_21.0 = add %t_21.0 %t_20.0
    %t_22.0 = load %t_21.0
    %t_23.0 = seq %t_22.0 0
    br %t_23.0 search_parallel_copy_7 search_parallel_copy_8

search_parallel_copy_7:
    %t_24.0 = move %t_10.0
    %t_24.0 = add %t_24.0 16
    %t_25.0 = lea %r_1.2 %t_8.0 1 -1
    %t_26.0 = move %t_25.0
    %t_26.0 = sub %t_26.0 %c_1.0
    %t_27.0 = load %t_24.0
    %t_28.0 = lea null %t_26.0 8 8
    %t_29.0 = move %t_27.0
    %t_29.0 = add %t_29.0 %t_28.0
    %t_30.0 = load %t_29.0
    %t_31.0 = seq %t_30.0 0
    br %t_31.0 search_parallel_copy_9 search_parallel_copy_10

search_parallel_copy_10:
    jump search_if_merge_2

search_parallel_copy_9:
    %t_32.0 = load %t_24.0
    %t_33.0 = move %t_32.0
    %t_33.0 = add %t_33.0 %t_28.0
    store 1 %t_33.0
    %t_34.0 = load %t_17.0
    %t_35.0 = move %t_34.0
    %t_35.0 = add %t_35.0 %t_20.0
    store 1 %t_35.0
    store 1 %t_14.0
    %t_36.0 = lea %t_11.0 %c_1.0 8 8
    store %r_1.2 %t_36.0
    %t_37.0 = move %c_1.0
    %t_37.0 = add %t_37.0 1
    call search %t_37.0 
    store 0 %t_14.0
    %t_38.0 = load %t_17.0
    %t_39.0 = move %t_38.0
    %t_39.0 = add %t_39.0 %t_20.0
    store 0 %t_39.0
    %t_40.0 = load %t_24.0
    %t_41.0 = move %t_40.0
    %t_41.0 = add %t_41.0 %t_28.0
    store 0 %t_41.0
    jump search_if_merge_2

search_parallel_copy_8:
    jump search_if_merge_2

search_parallel_copy_6:
    jump search_if_merge_2

search_if_merge_2:
    %r_1.3 = move %r_1.2
    %r_1.3 = add %r_1.3 1
    %r_1.2 = move %r_1.3
    %breaker_3.-1 = move %r_1.2
    jump search_for_cond_1

}

define i64 @main  {
main_entry_1:
    %t_42.0 = load @d_1.-1
    %i_2.1 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %t_43.0 = slt %i_2.1 2
    br %t_43.0 main_parallel_copy_1 main_parallel_copy_2

main_parallel_copy_1:
    %t_44.0 = lea %t_42.0 %i_2.1 8 8
    %t_45.0 = alloc 128
    store 15 %t_45.0
    store %t_45.0 %t_44.0
    %i_2.2 = move %i_2.1
    %i_2.2 = add %i_2.2 1
    %i_2.1 = move %i_2.2
    %breaker_4.-1 = move %i_2.1
    jump main_for_cond_1

main_parallel_copy_2:
    call search 0 
    ret 0

}

define i64 @__init  {
__init_entry_1:
    %t_46.0 = alloc 72
    store 8 %t_46.0
    %t_47.0 = alloc 72
    store 8 %t_47.0
    %t_48.0 = alloc 24
    store 2 %t_48.0
    store %t_47.0 @col_1.-1
    store %t_48.0 @d_1.-1
    store %t_46.0 @row_1.-1
    store 8 @N_1.-1
    %t_49.0 = call main 
    store %t_47.0 @col_1.-1
    store %t_48.0 @d_1.-1
    store %t_46.0 @row_1.-1
    store 8 @N_1.-1
    ret %t_49.0

}


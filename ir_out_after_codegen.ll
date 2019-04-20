@N_1.-1
@head_1.-1
@startx_1.-1
@starty_1.-1
@targetx_1.-1
@targety_1.-1
@x_1.-1
@y_1.-1
@xlist_1.-1
@ylist_1.-1
@tail_1.-1
@ok_1.-1
@now_1.-1
@dx_1.-1
@dy_1.-1
@step_1.-1
@i_1.-1
@j_1.-1
@__str_const_1.-1 = "no solution!\n"

define void @origin  %N_2.0 {
origin_entry_1:
    %t_1.0 = load @j_1.-1
    %t_2.1 = lea null %N_2.0 8 8
    %t_3.0 = alloc %t_2.1
    store %N_2.0 %t_3.0
    %t_1.1 = move %t_1.0
    %breaker_1.-1 = move %t_1.1
    %t_4.2 = move 0
    jump origin_for_cond_1

origin_for_cond_1:
    %t_5.0 = slt %t_4.2 %N_2.0
    br %t_5.0 origin_parallel_copy_1 origin_parallel_copy_2

origin_parallel_copy_1:
    %t_6.0 = lea %t_3.0 %t_4.2 8 8
    %t_7.1 = lea null %N_2.0 8 8
    %t_8.0 = alloc %t_7.1
    store %N_2.0 %t_8.0
    store %t_8.0 %t_6.0
    %t_1.3 = move 0
    jump origin_for_cond_2

origin_for_cond_2:
    %t_9.0 = slt %t_1.3 %N_2.0
    br %t_9.0 origin_parallel_copy_3 origin_parallel_copy_4

origin_parallel_copy_3:
    %t_10.0 = lea %t_3.0 %t_4.2 8 8
    %t_11.0 = load %t_10.0
    %t_12.0 = lea %t_11.0 %t_1.3 8 8
    store 0 %t_12.0
    %t_1.4 = move %t_1.3
    %t_1.4 = add %t_1.4 1
    %t_1.3 = move %t_1.4
    %breaker_2.-1 = move %t_1.3
    jump origin_for_cond_2

origin_parallel_copy_4:
    %t_4.3 = move %t_4.2
    %t_4.3 = add %t_4.3 1
    %t_4.2 = move %t_4.3
    %t_1.1 = move %t_1.3
    %breaker_3.-1 = move %t_4.2
    %t_4.2 = move %t_4.2
    %breaker_3.-1 = move %t_1.1
    jump origin_for_cond_1

origin_parallel_copy_2:
    store 0 @tail_1.-1
    store %t_1.1 @j_1.-1
    store 0 @head_1.-1
    store %t_4.2 @i_1.-1
    store %t_3.0 @step_1.-1
    ret 

}

define i64 @check  %a_1.0 {
check_entry_1:
    %t_13.0 = load @N_1.-1
    %t_14.0 = slt %a_1.0 %t_13.0
    br %t_14.0 check_parallel_copy_1 check_parallel_copy_2

check_parallel_copy_2:
    jump check_elseBB_1

check_parallel_copy_1:
    %t_15.0 = sge %a_1.0 0
    br %t_15.0 check_parallel_copy_3 check_parallel_copy_4

check_parallel_copy_3:
    %t_16.0 = move 1
    jump check_mergeBB_1

check_parallel_copy_4:
    jump check_elseBB_1

check_elseBB_1:
    %t_16.0 = move 0
    jump check_mergeBB_1

check_mergeBB_1:
    ret %t_16.0

}

define void @addList  %x_2.0 %y_2.0 {
addList_entry_1:
    %t_17.0 = load @targety_1.-1
    %t_18.0 = load @xlist_1.-1
    %t_19.0 = load @ok_1.-1
    %t_20.0 = load @ylist_1.-1
    %t_21.0 = load @step_1.-1
    %t_22.0 = load @targetx_1.-1
    %t_23.0 = load @now_1.-1
    %t_24.0 = load @tail_1.-1
    %t_25.0 = call check %x_2.0 
    br %t_25.0 addList_parallel_copy_1 addList_parallel_copy_2

addList_parallel_copy_1:
    %t_26.0 = call check %y_2.0 
    br %t_26.0 addList_parallel_copy_3 addList_parallel_copy_4

addList_parallel_copy_4:
    %t_24.2 = move %t_24.0
    %t_19.3 = move %t_19.0
    %breaker_4.-1 = move %t_24.2
    %t_24.2 = move %t_24.2
    %breaker_4.-1 = move %t_19.3
    jump addList_if_merge_1

addList_parallel_copy_3:
    %t_27.0 = lea %t_21.0 %x_2.0 8 8
    %t_28.0 = load %t_27.0
    %t_29.0 = lea %t_28.0 %y_2.0 8 8
    %t_30.0 = load %t_29.0
    %t_31.0 = seq %t_30.0 -1
    br %t_31.0 addList_parallel_copy_5 addList_parallel_copy_6

addList_parallel_copy_6:
    %t_24.2 = move %t_24.0
    %t_19.3 = move %t_19.0
    %breaker_5.-1 = move %t_24.2
    %t_24.2 = move %t_24.2
    %breaker_5.-1 = move %t_19.3
    jump addList_if_merge_1

addList_parallel_copy_5:
    %t_24.1 = move %t_24.0
    %t_24.1 = add %t_24.1 1
    %t_32.0 = lea %t_18.0 %t_24.1 8 8
    store %x_2.0 %t_32.0
    %t_33.0 = lea %t_20.0 %t_24.1 8 8
    store %y_2.0 %t_33.0
    %t_34.0 = lea %t_21.0 %x_2.0 8 8
    %t_35.0 = load %t_34.0
    %t_36.0 = lea %t_35.0 %y_2.0 8 8
    %t_37.0 = move %t_23.0
    %t_37.0 = add %t_37.0 1
    store %t_37.0 %t_36.0
    %t_38.0 = seq %x_2.0 %t_22.0
    br %t_38.0 addList_parallel_copy_7 addList_parallel_copy_8

addList_parallel_copy_7:
    %t_39.0 = seq %y_2.0 %t_17.0
    br %t_39.0 addList_parallel_copy_9 addList_parallel_copy_10

addList_parallel_copy_9:
    %t_19.1 = move 1
    jump addList_if_merge_2

addList_parallel_copy_10:
    %t_19.1 = move %t_19.0
    %breaker_6.-1 = move %t_19.1
    jump addList_if_merge_2

addList_parallel_copy_8:
    %t_19.1 = move %t_19.0
    %breaker_7.-1 = move %t_19.1
    jump addList_if_merge_2

addList_if_merge_2:
    %t_24.2 = move %t_24.1
    %t_19.3 = move %t_19.1
    %breaker_8.-1 = move %t_24.2
    %t_24.2 = move %t_24.2
    %breaker_8.-1 = move %t_19.3
    jump addList_if_merge_1

addList_parallel_copy_2:
    %t_24.2 = move %t_24.0
    %t_19.3 = move %t_19.0
    %breaker_9.-1 = move %t_24.2
    %t_24.2 = move %t_24.2
    %breaker_9.-1 = move %t_19.3
    jump addList_if_merge_1

addList_if_merge_1:
    store %t_24.2 @tail_1.-1
    store %t_19.3 @ok_1.-1
    ret 

}

define i64 @main  {
main_entry_1:
    %t_40.0 = load @xlist_1.-1
    %t_41.0 = load @i_1.-1
    %t_42.0 = load @head_1.-1
    %t_43.0 = load @y_1.-1
    %t_44.0 = load @ok_1.-1
    %t_45.0 = load @dy_1.-1
    %t_46.0 = load @ylist_1.-1
    %t_47.0 = load @dx_1.-1
    %t_48.0 = load @j_1.-1
    %t_49.0 = load @now_1.-1
    %t_50.0 = load @x_1.-1
    store %t_48.0 @j_1.-1
    store %t_42.0 @head_1.-1
    store %t_41.0 @i_1.-1
    call origin 106 
    %t_51.1 = load @step_1.-1
    %t_42.1 = load @head_1.-1
    %t_48.1 = load @j_1.-1
    %t_52.1 = load @tail_1.-1
    %t_53.0 = call getInt 
    %t_54.0 = move %t_53.0
    %t_54.0 = sub %t_54.0 1
    %t_48.2 = move %t_48.1
    %breaker_10.-1 = move %t_48.2
    %t_41.3 = move 0
    jump main_for_cond_1

main_for_cond_1:
    %t_55.0 = slt %t_41.3 %t_53.0
    br %t_55.0 main_parallel_copy_1 main_parallel_copy_2

main_parallel_copy_1:
    %t_48.4 = move 0
    jump main_for_cond_2

main_for_cond_2:
    %t_56.0 = slt %t_48.4 %t_53.0
    br %t_56.0 main_parallel_copy_3 main_parallel_copy_4

main_parallel_copy_4:
    %t_41.4 = move %t_41.3
    %t_41.4 = add %t_41.4 1
    %t_48.2 = move %t_48.4
    %t_41.3 = move %t_41.4
    %breaker_11.-1 = move %t_48.2
    %t_48.2 = move %t_48.2
    %breaker_11.-1 = move %t_41.3
    jump main_for_cond_1

main_parallel_copy_3:
    %t_57.0 = lea %t_51.1 %t_41.3 8 8
    %t_58.0 = load %t_57.0
    %t_59.0 = lea %t_58.0 %t_48.4 8 8
    store -1 %t_59.0
    %t_48.5 = move %t_48.4
    %t_48.5 = add %t_48.5 1
    %t_48.4 = move %t_48.5
    %breaker_12.-1 = move %t_48.4
    jump main_for_cond_2

main_parallel_copy_2:
    %t_60.0 = move %t_47.0
    %t_60.0 = add %t_60.0 8
    store -2 %t_60.0
    %t_61.0 = move %t_45.0
    %t_61.0 = add %t_61.0 8
    store -1 %t_61.0
    %t_62.0 = move %t_47.0
    %t_62.0 = add %t_62.0 16
    store -2 %t_62.0
    %t_63.0 = move %t_45.0
    %t_63.0 = add %t_63.0 16
    store 1 %t_63.0
    %t_64.0 = move %t_47.0
    %t_64.0 = add %t_64.0 24
    store 2 %t_64.0
    %t_65.0 = move %t_45.0
    %t_65.0 = add %t_65.0 24
    store -1 %t_65.0
    %t_66.0 = move %t_47.0
    %t_66.0 = add %t_66.0 32
    store 2 %t_66.0
    %t_67.0 = move %t_45.0
    %t_67.0 = add %t_67.0 32
    store 1 %t_67.0
    %t_68.0 = move %t_47.0
    %t_68.0 = add %t_68.0 40
    store -1 %t_68.0
    %t_69.0 = move %t_45.0
    %t_69.0 = add %t_69.0 40
    store -2 %t_69.0
    %t_70.0 = move %t_47.0
    %t_70.0 = add %t_70.0 48
    store -1 %t_70.0
    %t_71.0 = move %t_45.0
    %t_71.0 = add %t_71.0 48
    store 2 %t_71.0
    %t_72.0 = move %t_47.0
    %t_72.0 = add %t_72.0 56
    store 1 %t_72.0
    %t_73.0 = move %t_45.0
    %t_73.0 = add %t_73.0 56
    store -2 %t_73.0
    %t_74.0 = move %t_47.0
    %t_74.0 = add %t_74.0 64
    store 1 %t_74.0
    %t_75.0 = move %t_45.0
    %t_75.0 = add %t_75.0 64
    store 2 %t_75.0
    %t_44.1 = move %t_44.0
    %t_48.6 = move %t_48.2
    %t_52.2 = move %t_52.1
    %t_42.2 = move %t_42.1
    %t_49.1 = move %t_49.0
    %t_50.1 = move %t_50.0
    %t_43.1 = move %t_43.0
    %breaker_13.-1 = move %t_44.1
    %t_44.1 = move %t_44.1
    %breaker_13.-1 = move %t_48.6
    %t_48.6 = move %t_48.6
    %breaker_13.-1 = move %t_52.2
    %t_52.2 = move %t_52.2
    %breaker_13.-1 = move %t_42.2
    %t_42.2 = move %t_42.2
    %breaker_13.-1 = move %t_49.1
    %t_49.1 = move %t_49.1
    %breaker_13.-1 = move %t_50.1
    %t_50.1 = move %t_50.1
    %breaker_13.-1 = move %t_43.1
    jump main_while_cond_1

main_while_cond_1:
    %t_76.0 = sle %t_42.2 %t_52.2
    br %t_76.0 main_parallel_copy_5 main_parallel_copy_6

main_parallel_copy_6:
    %t_44.4 = move %t_44.1
    %t_48.10 = move %t_48.6
    %t_49.3 = move %t_49.1
    %t_50.3 = move %t_50.1
    %t_43.3 = move %t_43.1
    %breaker_14.-1 = move %t_44.4
    %t_44.4 = move %t_44.4
    %breaker_14.-1 = move %t_48.10
    %t_48.10 = move %t_48.10
    %breaker_14.-1 = move %t_49.3
    %t_49.3 = move %t_49.3
    %breaker_14.-1 = move %t_50.3
    %t_50.3 = move %t_50.3
    %breaker_14.-1 = move %t_43.3
    jump main_while_merge_1

main_parallel_copy_5:
    %t_77.0 = lea %t_40.0 %t_42.2 8 8
    %t_78.0 = load %t_77.0
    %t_79.0 = lea %t_46.0 %t_42.2 8 8
    %t_80.0 = load %t_79.0
    %t_81.0 = lea %t_51.1 %t_78.0 8 8
    %t_82.0 = load %t_81.0
    %t_83.0 = lea %t_82.0 %t_80.0 8 8
    %t_84.0 = load %t_83.0
    %t_44.2 = move %t_44.1
    %t_52.3 = move %t_52.2
    %breaker_15.-1 = move %t_44.2
    %t_44.2 = move %t_44.2
    %breaker_15.-1 = move %t_52.3
    %t_48.8 = move 0
    jump main_for_cond_3

main_for_cond_3:
    %t_85.0 = slt %t_48.8 8
    br %t_85.0 main_parallel_copy_7 main_parallel_copy_8

main_parallel_copy_7:
    %t_86.0 = lea %t_47.0 %t_48.8 8 8
    %t_87.0 = load %t_86.0
    %t_88.0 = move %t_78.0
    %t_88.0 = add %t_88.0 %t_87.0
    %t_89.0 = lea %t_45.0 %t_48.8 8 8
    %t_90.0 = load %t_89.0
    %t_91.0 = move %t_80.0
    %t_91.0 = add %t_91.0 %t_90.0
    store %t_53.0 @N_1.-1
    store %t_84.0 @now_1.-1
    store %t_54.0 @targetx_1.-1
    store %t_54.0 @targety_1.-1
    call addList %t_88.0 %t_91.0 
    %t_44.3 = load @ok_1.-1
    %t_52.4 = load @tail_1.-1
    %t_48.9 = move %t_48.8
    %t_48.9 = add %t_48.9 1
    %t_44.2 = move %t_44.3
    %t_48.8 = move %t_48.9
    %t_52.3 = move %t_52.4
    %breaker_16.-1 = move %t_44.2
    %t_44.2 = move %t_44.2
    %breaker_16.-1 = move %t_48.8
    %t_48.8 = move %t_48.8
    %breaker_16.-1 = move %t_52.3
    jump main_for_cond_3

main_parallel_copy_8:
    %t_92.0 = seq %t_44.2 1
    br %t_92.0 main_parallel_copy_9 main_parallel_copy_10

main_parallel_copy_10:
    %t_42.3 = move %t_42.2
    %t_42.3 = add %t_42.3 1
    %t_44.1 = move %t_44.2
    %t_48.6 = move %t_48.8
    %t_52.2 = move %t_52.3
    %t_42.2 = move %t_42.3
    %t_49.1 = move %t_84.0
    %t_50.1 = move %t_78.0
    %t_43.1 = move %t_80.0
    %breaker_17.-1 = move %t_44.1
    %t_44.1 = move %t_44.1
    %breaker_17.-1 = move %t_48.6
    %t_48.6 = move %t_48.6
    %breaker_17.-1 = move %t_52.2
    %t_52.2 = move %t_52.2
    %breaker_17.-1 = move %t_42.2
    %t_42.2 = move %t_42.2
    %breaker_17.-1 = move %t_49.1
    %t_49.1 = move %t_49.1
    %breaker_17.-1 = move %t_50.1
    %t_50.1 = move %t_50.1
    %breaker_17.-1 = move %t_43.1
    jump main_while_cond_1

main_parallel_copy_9:
    %t_44.4 = move %t_44.2
    %t_48.10 = move %t_48.8
    %t_49.3 = move %t_84.0
    %t_50.3 = move %t_78.0
    %t_43.3 = move %t_80.0
    %breaker_18.-1 = move %t_44.4
    %t_44.4 = move %t_44.4
    %breaker_18.-1 = move %t_48.10
    %t_48.10 = move %t_48.10
    %breaker_18.-1 = move %t_49.3
    %t_49.3 = move %t_49.3
    %breaker_18.-1 = move %t_50.3
    %t_50.3 = move %t_50.3
    %breaker_18.-1 = move %t_43.3
    jump main_while_merge_1

main_while_merge_1:
    %t_93.0 = seq %t_44.4 1
    br %t_93.0 main_parallel_copy_11 main_parallel_copy_12

main_parallel_copy_12:
    call print @__str_const_1.-1 
    jump main_if_merge_1

main_parallel_copy_11:
    %t_94.0 = lea %t_51.1 %t_54.0 8 8
    %t_95.0 = load %t_94.0
    %t_96.0 = lea %t_95.0 %t_54.0 8 8
    %t_97.0 = load %t_96.0
    %t_98.0 = call toString %t_97.0 
    call println %t_98.0 
    jump main_if_merge_1

main_if_merge_1:
    store %t_50.3 @x_1.-1
    store %t_53.0 @N_1.-1
    store %t_49.3 @now_1.-1
    store %t_48.10 @j_1.-1
    store %t_42.2 @head_1.-1
    store %t_54.0 @targetx_1.-1
    store %t_41.3 @i_1.-1
    store %t_43.3 @y_1.-1
    store %t_54.0 @targety_1.-1
    ret 0

}

define i64 @__init  {
__init_entry_1:
    %t_99.0 = alloc 96008
    store 12000 %t_99.0
    %t_100.0 = alloc 96008
    store 12000 %t_100.0
    %t_101.0 = alloc 72
    store 8 %t_101.0
    %t_102.0 = alloc 80
    store 9 %t_102.0
    store %t_101.0 @dx_1.-1
    store %t_100.0 @ylist_1.-1
    store %t_102.0 @dy_1.-1
    store %t_99.0 @xlist_1.-1
    %t_103.0 = call main 
    store %t_101.0 @dx_1.-1
    store %t_100.0 @ylist_1.-1
    store %t_102.0 @dy_1.-1
    store %t_99.0 @xlist_1.-1
    ret %t_103.0

}


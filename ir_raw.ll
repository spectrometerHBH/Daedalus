@N_1.-1
@h_1.-1
@i_1.-1
@j_1.-1
@k_1.-1
@total_1.-1

define i64 @main  {
main_entry_1:
    %t_1.-1 = load @N_1.-1
    %t_2.-1 = load @k_1.-1
    %t_3.-1 = load @total_1.-1
    %t_4.-1 = load @j_1.-1
    %t_5.-1 = load @i_1.-1
    %t_6.-1 = load @h_1.-1
    %t_7.-1 = call getInt 
    %t_1.-1 = move %t_7.-1
    %a_1.-1 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %t_8.-1 = sle %a_1.-1 %t_1.-1
    br %t_8.-1 main_for_body_1 main_for_merge_1

main_for_body_1:
    %b_1.-1 = move 1
    jump main_for_cond_2

main_for_cond_2:
    %t_9.-1 = sle %b_1.-1 %t_1.-1
    br %t_9.-1 main_for_body_2 main_for_merge_2

main_for_body_2:
    %c_1.-1 = move 1
    jump main_for_cond_3

main_for_cond_3:
    %t_10.-1 = sle %c_1.-1 %t_1.-1
    br %t_10.-1 main_for_body_3 main_for_merge_3

main_for_merge_3:
    jump main_for_step_1

main_for_step_1:
    %t_11.-1 = move %b_1.-1
    %b_1.-1 = add %b_1.-1 1
    jump main_for_cond_2

main_for_body_3:
    %d_1.-1 = move 1
    jump main_for_cond_4

main_for_cond_4:
    %t_12.-1 = sle %d_1.-1 %t_1.-1
    br %t_12.-1 main_for_body_4 main_for_merge_4

main_for_merge_4:
    jump main_for_step_2

main_for_step_2:
    %t_13.-1 = move %c_1.-1
    %c_1.-1 = add %c_1.-1 1
    jump main_for_cond_3

main_for_body_4:
    %e_1.-1 = move 1
    jump main_for_cond_5

main_for_cond_5:
    %t_14.-1 = sle %e_1.-1 %t_1.-1
    br %t_14.-1 main_for_body_5 main_for_merge_5

main_for_merge_5:
    jump main_for_step_3

main_for_step_3:
    %t_15.-1 = move %d_1.-1
    %d_1.-1 = add %d_1.-1 1
    jump main_for_cond_4

main_for_body_5:
    %f_1.-1 = move 1
    jump main_for_cond_6

main_for_cond_6:
    %t_16.-1 = sle %f_1.-1 %t_1.-1
    br %t_16.-1 main_for_body_6 main_for_merge_6

main_for_body_6:
    %t_17.-1 = sne %a_1.-1 %b_1.-1
    br %t_17.-1 main_lhs_then_1 main_if_merge_1

main_lhs_then_1:
    %t_18.-1 = sne %a_1.-1 %c_1.-1
    br %t_18.-1 main_lhs_then_2 main_if_merge_1

main_lhs_then_2:
    %t_19.-1 = sne %a_1.-1 %d_1.-1
    br %t_19.-1 main_lhs_then_3 main_if_merge_1

main_lhs_then_3:
    %t_20.-1 = sne %a_1.-1 %e_1.-1
    br %t_20.-1 main_lhs_then_4 main_if_merge_1

main_lhs_then_4:
    %t_21.-1 = sne %a_1.-1 %f_1.-1
    br %t_21.-1 main_lhs_then_5 main_if_merge_1

main_lhs_then_5:
    %t_22.-1 = sne %a_1.-1 %t_6.-1
    br %t_22.-1 main_lhs_then_6 main_if_merge_1

main_lhs_then_6:
    %t_23.-1 = sne %a_1.-1 %t_5.-1
    br %t_23.-1 main_lhs_then_7 main_if_merge_1

main_lhs_then_7:
    %t_24.-1 = sne %a_1.-1 %t_4.-1
    br %t_24.-1 main_lhs_then_8 main_if_merge_1

main_lhs_then_8:
    %t_25.-1 = sne %a_1.-1 %t_2.-1
    br %t_25.-1 main_lhs_then_9 main_if_merge_1

main_lhs_then_9:
    %t_26.-1 = sne %b_1.-1 %c_1.-1
    br %t_26.-1 main_lhs_then_10 main_if_merge_1

main_lhs_then_10:
    %t_27.-1 = sne %b_1.-1 %d_1.-1
    br %t_27.-1 main_lhs_then_11 main_if_merge_1

main_lhs_then_11:
    %t_28.-1 = sne %b_1.-1 %e_1.-1
    br %t_28.-1 main_lhs_then_12 main_if_merge_1

main_lhs_then_12:
    %t_29.-1 = sne %b_1.-1 %f_1.-1
    br %t_29.-1 main_lhs_then_13 main_if_merge_1

main_lhs_then_13:
    %t_30.-1 = sne %b_1.-1 %t_6.-1
    br %t_30.-1 main_lhs_then_14 main_if_merge_1

main_lhs_then_14:
    %t_31.-1 = sne %b_1.-1 %t_5.-1
    br %t_31.-1 main_lhs_then_15 main_if_merge_1

main_lhs_then_15:
    %t_32.-1 = sne %b_1.-1 %t_4.-1
    br %t_32.-1 main_lhs_then_16 main_if_merge_1

main_lhs_then_16:
    %t_33.-1 = sne %b_1.-1 %t_2.-1
    br %t_33.-1 main_lhs_then_17 main_if_merge_1

main_lhs_then_17:
    %t_34.-1 = sne %c_1.-1 %d_1.-1
    br %t_34.-1 main_lhs_then_18 main_if_merge_1

main_lhs_then_18:
    %t_35.-1 = sne %c_1.-1 %e_1.-1
    br %t_35.-1 main_lhs_then_19 main_if_merge_1

main_lhs_then_19:
    %t_36.-1 = sne %c_1.-1 %f_1.-1
    br %t_36.-1 main_lhs_then_20 main_if_merge_1

main_lhs_then_20:
    %t_37.-1 = sne %c_1.-1 %t_6.-1
    br %t_37.-1 main_lhs_then_21 main_if_merge_1

main_lhs_then_21:
    %t_38.-1 = sne %c_1.-1 %t_5.-1
    br %t_38.-1 main_lhs_then_22 main_if_merge_1

main_lhs_then_22:
    %t_39.-1 = sne %c_1.-1 %t_4.-1
    br %t_39.-1 main_lhs_then_23 main_if_merge_1

main_lhs_then_23:
    %t_40.-1 = sne %c_1.-1 %t_2.-1
    br %t_40.-1 main_lhs_then_24 main_if_merge_1

main_lhs_then_24:
    %t_41.-1 = sne %d_1.-1 %e_1.-1
    br %t_41.-1 main_lhs_then_25 main_if_merge_1

main_lhs_then_25:
    %t_42.-1 = sne %d_1.-1 %f_1.-1
    br %t_42.-1 main_lhs_then_26 main_if_merge_1

main_lhs_then_26:
    %t_43.-1 = sne %d_1.-1 %t_6.-1
    br %t_43.-1 main_lhs_then_27 main_if_merge_1

main_lhs_then_27:
    %t_44.-1 = sne %d_1.-1 %t_5.-1
    br %t_44.-1 main_lhs_then_28 main_if_merge_1

main_lhs_then_28:
    %t_45.-1 = sne %d_1.-1 %t_4.-1
    br %t_45.-1 main_lhs_then_29 main_if_merge_1

main_lhs_then_29:
    %t_46.-1 = sne %d_1.-1 %t_2.-1
    br %t_46.-1 main_lhs_then_30 main_if_merge_1

main_lhs_then_30:
    %t_47.-1 = sne %e_1.-1 %f_1.-1
    br %t_47.-1 main_lhs_then_31 main_if_merge_1

main_lhs_then_31:
    %t_48.-1 = sne %e_1.-1 %t_6.-1
    br %t_48.-1 main_lhs_then_32 main_if_merge_1

main_lhs_then_32:
    %t_49.-1 = sne %e_1.-1 %t_5.-1
    br %t_49.-1 main_lhs_then_33 main_if_merge_1

main_lhs_then_33:
    %t_50.-1 = sne %e_1.-1 %t_4.-1
    br %t_50.-1 main_lhs_then_34 main_if_merge_1

main_lhs_then_34:
    %t_51.-1 = sne %e_1.-1 %t_2.-1
    br %t_51.-1 main_lhs_then_35 main_if_merge_1

main_lhs_then_35:
    %t_52.-1 = sne %f_1.-1 %t_6.-1
    br %t_52.-1 main_lhs_then_36 main_if_merge_1

main_lhs_then_36:
    %t_53.-1 = sne %f_1.-1 %t_5.-1
    br %t_53.-1 main_lhs_then_37 main_if_merge_1

main_lhs_then_37:
    %t_54.-1 = sne %f_1.-1 %t_4.-1
    br %t_54.-1 main_lhs_then_38 main_if_merge_1

main_lhs_then_38:
    %t_55.-1 = sne %f_1.-1 %t_2.-1
    br %t_55.-1 main_lhs_then_39 main_if_merge_1

main_lhs_then_39:
    %t_56.-1 = sne %t_5.-1 %t_4.-1
    br %t_56.-1 main_lhs_then_40 main_if_merge_1

main_lhs_then_40:
    %t_57.-1 = sne %t_6.-1 %t_2.-1
    br %t_57.-1 main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_58.-1 = move %t_3.-1
    %t_3.-1 = add %t_3.-1 1
    jump main_if_merge_1

main_if_merge_1:
    jump main_for_step_4

main_for_step_4:
    %t_59.-1 = move %f_1.-1
    %f_1.-1 = add %f_1.-1 1
    jump main_for_cond_6

main_for_merge_6:
    jump main_for_step_5

main_for_step_5:
    %t_60.-1 = move %e_1.-1
    %e_1.-1 = add %e_1.-1 1
    jump main_for_cond_5

main_for_merge_2:
    jump main_for_step_6

main_for_step_6:
    %t_61.-1 = move %a_1.-1
    %a_1.-1 = add %a_1.-1 1
    jump main_for_cond_1

main_for_merge_1:
    %t_62.-1 = call toString %t_3.-1 
    call println %t_62.-1 
    %t_63.-1 = move 0
    store %t_3.-1 @total_1.-1
    store %t_1.-1 @N_1.-1
    ret %t_63.-1

}

define i64 @__init  {
__init_entry_1:
    %t_64.-1 = load @k_1.-1
    %t_65.-1 = load @total_1.-1
    %t_66.-1 = load @j_1.-1
    %t_67.-1 = load @i_1.-1
    %t_68.-1 = load @h_1.-1
    %t_68.-1 = move 99
    %t_67.-1 = move 100
    %t_66.-1 = move 101
    %t_64.-1 = move 102
    %t_65.-1 = move 0
    store %t_68.-1 @h_1.-1
    store %t_67.-1 @i_1.-1
    store %t_66.-1 @j_1.-1
    store %t_65.-1 @total_1.-1
    store %t_64.-1 @k_1.-1
    %t_69.-1 = call main 
    %t_65.-1 = load @total_1.-1
    %t_70.-1 = move %t_69.-1
    store %t_68.-1 @h_1.-1
    store %t_67.-1 @i_1.-1
    store %t_66.-1 @j_1.-1
    store %t_65.-1 @total_1.-1
    store %t_64.-1 @k_1.-1
    ret %t_70.-1

}


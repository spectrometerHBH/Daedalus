@N_1.-1
@h_1.-1
@i_1.-1
@j_1.-1
@k_1.-1
@total_1.-1

define i64 @main  {
main_entry_1:
    %t_1.0 = load @N_1.-1
    %t_2.0 = load @k_1.-1
    %t_3.0 = load @total_1.-1
    %t_4.0 = load @j_1.-1
    %t_5.0 = load @i_1.-1
    %t_6.0 = load @h_1.-1
    %t_7.0 = call getInt 
    %t_1.1 = move %t_7.0
    %a_1.0 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %e_1.0 = phi main_entry_1 undef main_for_merge_1 %e_1.1 
    %a_1.1 = phi main_entry_1 %a_1.0 main_for_merge_1 %a_1.2 
    %c_1.0 = phi main_entry_1 undef main_for_merge_1 %c_1.1 
    %f_1.0 = phi main_entry_1 undef main_for_merge_1 %f_1.1 
    %d_1.0 = phi main_entry_1 undef main_for_merge_1 %d_1.1 
    %b_1.0 = phi main_entry_1 undef main_for_merge_1 %b_1.2 
    %t_3.1 = phi main_entry_1 %t_3.0 main_for_merge_1 %t_3.2 
    %t_8.0 = sle %a_1.1 %t_1.1
    br %t_8.0 main_for_body_1 main_for_merge_2

main_for_body_1:
    %b_1.1 = move 1
    jump main_for_cond_2

main_for_cond_2:
    %e_1.1 = phi main_for_body_1 %e_1.0 main_for_merge_3 %e_1.2 
    %c_1.1 = phi main_for_body_1 %c_1.0 main_for_merge_3 %c_1.3 
    %f_1.1 = phi main_for_body_1 %f_1.0 main_for_merge_3 %f_1.2 
    %d_1.1 = phi main_for_body_1 %d_1.0 main_for_merge_3 %d_1.2 
    %b_1.2 = phi main_for_body_1 %b_1.1 main_for_merge_3 %b_1.3 
    %t_3.2 = phi main_for_body_1 %t_3.1 main_for_merge_3 %t_3.3 
    %t_9.0 = sle %b_1.2 %t_1.1
    br %t_9.0 main_for_body_2 main_for_merge_1

main_for_body_2:
    %c_1.2 = move 1
    jump main_for_cond_3

main_for_cond_3:
    %e_1.2 = phi main_for_body_2 %e_1.1 main_for_merge_4 %e_1.3 
    %c_1.3 = phi main_for_body_2 %c_1.2 main_for_merge_4 %c_1.4 
    %f_1.2 = phi main_for_body_2 %f_1.1 main_for_merge_4 %f_1.3 
    %d_1.2 = phi main_for_body_2 %d_1.1 main_for_merge_4 %d_1.4 
    %t_3.3 = phi main_for_body_2 %t_3.2 main_for_merge_4 %t_3.4 
    %t_10.0 = sle %c_1.3 %t_1.1
    br %t_10.0 main_for_body_3 main_for_merge_3

main_for_merge_3:
    %t_11.0 = move %b_1.2
    %b_1.3 = add %b_1.2 1
    jump main_for_cond_2

main_for_body_3:
    %d_1.3 = move 1
    jump main_for_cond_4

main_for_cond_4:
    %e_1.3 = phi main_for_body_3 %e_1.2 main_for_merge_5 %e_1.5 
    %f_1.3 = phi main_for_body_3 %f_1.2 main_for_merge_5 %f_1.4 
    %d_1.4 = phi main_for_body_3 %d_1.3 main_for_merge_5 %d_1.5 
    %t_3.4 = phi main_for_body_3 %t_3.3 main_for_merge_5 %t_3.5 
    %t_12.0 = sle %d_1.4 %t_1.1
    br %t_12.0 main_for_body_4 main_for_merge_4

main_for_merge_4:
    %t_13.0 = move %c_1.3
    %c_1.4 = add %c_1.3 1
    jump main_for_cond_3

main_for_body_4:
    %e_1.4 = move 1
    jump main_for_cond_5

main_for_cond_5:
    %e_1.5 = phi main_for_body_4 %e_1.4 main_for_merge_6 %e_1.6 
    %f_1.4 = phi main_for_body_4 %f_1.3 main_for_merge_6 %f_1.6 
    %t_3.5 = phi main_for_body_4 %t_3.4 main_for_merge_6 %t_3.6 
    %t_14.0 = sle %e_1.5 %t_1.1
    br %t_14.0 main_for_body_5 main_for_merge_5

main_for_merge_5:
    %t_15.0 = move %d_1.4
    %d_1.5 = add %d_1.4 1
    jump main_for_cond_4

main_for_body_5:
    %f_1.5 = move 1
    jump main_for_cond_6

main_for_cond_6:
    %f_1.6 = phi main_for_body_5 %f_1.5 main_if_merge_1 %f_1.7 
    %t_3.6 = phi main_for_body_5 %t_3.5 main_if_merge_1 %t_3.7 
    %t_16.0 = sle %f_1.6 %t_1.1
    br %t_16.0 main_for_body_6 main_for_merge_6

main_for_body_6:
    %t_17.0 = sne %a_1.1 %b_1.2
    br %t_17.0 main_lhs_then_1 main_if_merge_1

main_lhs_then_1:
    %t_18.0 = sne %a_1.1 %c_1.3
    br %t_18.0 main_lhs_then_2 main_if_merge_1

main_lhs_then_2:
    %t_19.0 = sne %a_1.1 %d_1.4
    br %t_19.0 main_lhs_then_3 main_if_merge_1

main_lhs_then_3:
    %t_20.0 = sne %a_1.1 %e_1.5
    br %t_20.0 main_lhs_then_4 main_if_merge_1

main_lhs_then_4:
    %t_21.0 = sne %a_1.1 %f_1.6
    br %t_21.0 main_lhs_then_5 main_if_merge_1

main_lhs_then_5:
    %t_22.0 = sne %a_1.1 %t_6.0
    br %t_22.0 main_lhs_then_6 main_if_merge_1

main_lhs_then_6:
    %t_23.0 = sne %a_1.1 %t_5.0
    br %t_23.0 main_lhs_then_7 main_if_merge_1

main_lhs_then_7:
    %t_24.0 = sne %a_1.1 %t_4.0
    br %t_24.0 main_lhs_then_8 main_if_merge_1

main_lhs_then_8:
    %t_25.0 = sne %a_1.1 %t_2.0
    br %t_25.0 main_lhs_then_9 main_if_merge_1

main_lhs_then_9:
    %t_26.0 = sne %b_1.2 %c_1.3
    br %t_26.0 main_lhs_then_10 main_if_merge_1

main_lhs_then_10:
    %t_27.0 = sne %b_1.2 %d_1.4
    br %t_27.0 main_lhs_then_11 main_if_merge_1

main_lhs_then_11:
    %t_28.0 = sne %b_1.2 %e_1.5
    br %t_28.0 main_lhs_then_12 main_if_merge_1

main_lhs_then_12:
    %t_29.0 = sne %b_1.2 %f_1.6
    br %t_29.0 main_lhs_then_13 main_if_merge_1

main_lhs_then_13:
    %t_30.0 = sne %b_1.2 %t_6.0
    br %t_30.0 main_lhs_then_14 main_if_merge_1

main_lhs_then_14:
    %t_31.0 = sne %b_1.2 %t_5.0
    br %t_31.0 main_lhs_then_15 main_if_merge_1

main_lhs_then_15:
    %t_32.0 = sne %b_1.2 %t_4.0
    br %t_32.0 main_lhs_then_16 main_if_merge_1

main_lhs_then_16:
    %t_33.0 = sne %b_1.2 %t_2.0
    br %t_33.0 main_lhs_then_17 main_if_merge_1

main_lhs_then_17:
    %t_34.0 = sne %c_1.3 %d_1.4
    br %t_34.0 main_lhs_then_18 main_if_merge_1

main_lhs_then_18:
    %t_35.0 = sne %c_1.3 %e_1.5
    br %t_35.0 main_lhs_then_19 main_if_merge_1

main_lhs_then_19:
    %t_36.0 = sne %c_1.3 %f_1.6
    br %t_36.0 main_lhs_then_20 main_if_merge_1

main_lhs_then_20:
    %t_37.0 = sne %c_1.3 %t_6.0
    br %t_37.0 main_lhs_then_21 main_if_merge_1

main_lhs_then_21:
    %t_38.0 = sne %c_1.3 %t_5.0
    br %t_38.0 main_lhs_then_22 main_if_merge_1

main_lhs_then_22:
    %t_39.0 = sne %c_1.3 %t_4.0
    br %t_39.0 main_lhs_then_23 main_if_merge_1

main_lhs_then_23:
    %t_40.0 = sne %c_1.3 %t_2.0
    br %t_40.0 main_lhs_then_24 main_if_merge_1

main_lhs_then_24:
    %t_41.0 = sne %d_1.4 %e_1.5
    br %t_41.0 main_lhs_then_25 main_if_merge_1

main_lhs_then_25:
    %t_42.0 = sne %d_1.4 %f_1.6
    br %t_42.0 main_lhs_then_26 main_if_merge_1

main_lhs_then_26:
    %t_43.0 = sne %d_1.4 %t_6.0
    br %t_43.0 main_lhs_then_27 main_if_merge_1

main_lhs_then_27:
    %t_44.0 = sne %d_1.4 %t_5.0
    br %t_44.0 main_lhs_then_28 main_if_merge_1

main_lhs_then_28:
    %t_45.0 = sne %d_1.4 %t_4.0
    br %t_45.0 main_lhs_then_29 main_if_merge_1

main_lhs_then_29:
    %t_46.0 = sne %d_1.4 %t_2.0
    br %t_46.0 main_lhs_then_30 main_if_merge_1

main_lhs_then_30:
    %t_47.0 = sne %e_1.5 %f_1.6
    br %t_47.0 main_lhs_then_31 main_if_merge_1

main_lhs_then_31:
    %t_48.0 = sne %e_1.5 %t_6.0
    br %t_48.0 main_lhs_then_32 main_if_merge_1

main_lhs_then_32:
    %t_49.0 = sne %e_1.5 %t_5.0
    br %t_49.0 main_lhs_then_33 main_if_merge_1

main_lhs_then_33:
    %t_50.0 = sne %e_1.5 %t_4.0
    br %t_50.0 main_lhs_then_34 main_if_merge_1

main_lhs_then_34:
    %t_51.0 = sne %e_1.5 %t_2.0
    br %t_51.0 main_lhs_then_35 main_if_merge_1

main_lhs_then_35:
    %t_52.0 = sne %f_1.6 %t_6.0
    br %t_52.0 main_lhs_then_36 main_if_merge_1

main_lhs_then_36:
    %t_53.0 = sne %f_1.6 %t_5.0
    br %t_53.0 main_lhs_then_37 main_if_merge_1

main_lhs_then_37:
    %t_54.0 = sne %f_1.6 %t_4.0
    br %t_54.0 main_lhs_then_38 main_if_merge_1

main_lhs_then_38:
    %t_55.0 = sne %f_1.6 %t_2.0
    br %t_55.0 main_lhs_then_39 main_if_merge_1

main_lhs_then_39:
    %t_56.0 = sne %t_5.0 %t_4.0
    br %t_56.0 main_lhs_then_40 main_if_merge_1

main_lhs_then_40:
    %t_57.0 = sne %t_6.0 %t_2.0
    br %t_57.0 main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_58.0 = move %t_3.6
    %t_3.8 = add %t_3.6 1
    jump main_if_merge_1

main_if_merge_1:
    %t_3.7 = phi main_for_body_6 %t_3.6 main_lhs_then_1 %t_3.6 main_lhs_then_2 %t_3.6 main_lhs_then_3 %t_3.6 main_lhs_then_4 %t_3.6 main_lhs_then_5 %t_3.6 main_lhs_then_6 %t_3.6 main_lhs_then_7 %t_3.6 main_lhs_then_8 %t_3.6 main_lhs_then_9 %t_3.6 main_lhs_then_10 %t_3.6 main_lhs_then_11 %t_3.6 main_lhs_then_12 %t_3.6 main_lhs_then_13 %t_3.6 main_lhs_then_14 %t_3.6 main_lhs_then_15 %t_3.6 main_lhs_then_16 %t_3.6 main_lhs_then_17 %t_3.6 main_lhs_then_18 %t_3.6 main_lhs_then_19 %t_3.6 main_lhs_then_20 %t_3.6 main_lhs_then_21 %t_3.6 main_lhs_then_22 %t_3.6 main_lhs_then_23 %t_3.6 main_lhs_then_24 %t_3.6 main_lhs_then_25 %t_3.6 main_lhs_then_26 %t_3.6 main_lhs_then_27 %t_3.6 main_lhs_then_28 %t_3.6 main_lhs_then_29 %t_3.6 main_lhs_then_30 %t_3.6 main_lhs_then_31 %t_3.6 main_lhs_then_32 %t_3.6 main_lhs_then_33 %t_3.6 main_lhs_then_34 %t_3.6 main_lhs_then_35 %t_3.6 main_lhs_then_36 %t_3.6 main_lhs_then_37 %t_3.6 main_lhs_then_38 %t_3.6 main_lhs_then_39 %t_3.6 main_lhs_then_40 %t_3.6 main_if_then_1 %t_3.8 
    %t_59.0 = move %f_1.6
    %f_1.7 = add %f_1.6 1
    jump main_for_cond_6

main_for_merge_6:
    %t_60.0 = move %e_1.5
    %e_1.6 = add %e_1.5 1
    jump main_for_cond_5

main_for_merge_1:
    %t_61.0 = move %a_1.1
    %a_1.2 = add %a_1.1 1
    jump main_for_cond_1

main_for_merge_2:
    %t_62.0 = call toString %t_3.1 
    call println %t_62.0 
    %t_63.0 = move 0
    store %t_3.1 @total_1.-1
    store %t_1.1 @N_1.-1
    ret %t_63.0

}

define i64 @__init  {
__init_entry_1:
    %t_64.0 = load @k_1.-1
    %t_65.0 = load @total_1.-1
    %t_66.0 = load @j_1.-1
    %t_67.0 = load @i_1.-1
    %t_68.0 = load @h_1.-1
    %t_68.1 = move 99
    %t_67.1 = move 100
    %t_66.1 = move 101
    %t_64.1 = move 102
    %t_65.1 = move 0
    store %t_68.1 @h_1.-1
    store %t_67.1 @i_1.-1
    store %t_66.1 @j_1.-1
    store %t_65.1 @total_1.-1
    store %t_64.1 @k_1.-1
    %t_69.0 = call main 
    %t_65.2 = load @total_1.-1
    %t_70.0 = move %t_69.0
    store %t_68.1 @h_1.-1
    store %t_67.1 @i_1.-1
    store %t_66.1 @j_1.-1
    store %t_65.2 @total_1.-1
    store %t_64.1 @k_1.-1
    ret %t_70.0

}


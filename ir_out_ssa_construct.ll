@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %M_2 = load @M_1
    %check_2 = load @check_1
    %N_2 = load @N_1
    %t_1 = call getInt 
    %N_3 = move %t_1
    %t_2 = add %N_3 5
    %t_3 = mul %t_2 8
    %t_4 = add %t_3 8
    %t_5 = alloc %t_4
    store %t_2 %t_5
    %check_3 = move %t_5
    %i_1 = move 0
    jump main_while_cond_1

main_while_cond_1:
    %i_2 = phi main_entry_1 %i_1 main_while_body_1 %i_3 
    %t_6 = sle %i_2 %N_3
    br %t_6 main_while_body_1 main_while_merge_1

main_while_merge_1:
    %t_7 = add %N_3 5
    %t_8 = mul %t_7 8
    %t_9 = add %t_8 8
    %t_10 = alloc %t_9
    store %t_7 %t_10
    %phi_1 = move %t_10
    %t_11 = add %N_3 5
    %t_12 = mul %t_11 8
    %t_13 = add %t_12 8
    %t_14 = alloc %t_13
    store %t_11 %t_14
    %P_1 = move %t_14
    %t_15 = mul 1 8
    %t_16 = add %t_15 8
    %t_17 = add %phi_1 %t_16
    store 1 %t_17
    %i_4 = move 2
    jump main_for_body_1

main_for_body_1:
    %M_3 = phi main_while_merge_1 %M_2 main_for_merge_1 %M_4 
    %i_5 = phi main_while_merge_1 undef main_for_merge_1 %i_6 
    %tmp_1 = phi main_while_merge_1 undef main_for_merge_1 %tmp_2 
    %k_1 = phi main_while_merge_1 undef main_for_merge_1 %k_2 
    %i_7 = phi main_while_merge_1 %i_4 main_for_merge_1 %i_8 
    %t_18 = sgt %i_7 %N_3
    br %t_18 main_for_merge_2 main_if_merge_1

main_if_merge_1:
    %t_19 = mul %i_7 8
    %t_20 = add %t_19 8
    %t_21 = add %check_3 %t_20
    %t_22 = load %t_21
    br %t_22 main_if_then_1 main_if_merge_2

main_if_then_1:
    %M_5 = add %M_3 1
    %t_23 = mul %M_5 8
    %t_24 = add %t_23 8
    %t_25 = add %P_1 %t_24
    store %i_7 %t_25
    %t_26 = mul %i_7 8
    %t_27 = add %t_26 8
    %t_28 = add %phi_1 %t_27
    %t_29 = sub %i_7 1
    store %t_29 %t_28
    jump main_if_merge_2

main_if_merge_2:
    %M_4 = phi main_if_merge_1 %M_3 main_if_then_1 %M_5 
    %k_2 = move %i_7
    %i_9 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %i_6 = phi main_if_merge_2 %i_9 main_for_step_1 %i_10 
    %tmp_3 = phi main_if_merge_2 %tmp_1 main_for_step_1 %tmp_4 
    %t_30 = sle %i_6 %M_4
    br %t_30 main_lhs_then_1 main_for_merge_1

main_lhs_then_1:
    %t_31 = mul %i_6 8
    %t_32 = add %t_31 8
    %t_33 = add %P_1 %t_32
    %t_34 = load %t_33
    %t_35 = mul %k_2 %t_34
    %t_36 = sle %t_35 %N_3
    br %t_36 main_for_body_2 main_for_merge_1

main_for_body_2:
    %t_37 = mul %i_6 8
    %t_38 = add %t_37 8
    %t_39 = add %P_1 %t_38
    %t_40 = load %t_39
    %t_41 = mul %k_2 %t_40
    %tmp_4 = move %t_41
    %t_42 = sgt %tmp_4 %N_3
    br %t_42 main_for_step_1 main_if_merge_3

main_if_merge_3:
    %t_43 = mul %tmp_4 8
    %t_44 = add %t_43 8
    %t_45 = add %check_3 %t_44
    store 0 %t_45
    %t_46 = mul %i_6 8
    %t_47 = add %t_46 8
    %t_48 = add %P_1 %t_47
    %t_49 = load %t_48
    %t_50 = mod %k_2 %t_49
    %t_51 = seq %t_50 0
    br %t_51 main_if_then_2 main_if_else_1

main_if_then_2:
    %t_52 = mul %tmp_4 8
    %t_53 = add %t_52 8
    %t_54 = add %phi_1 %t_53
    %t_55 = mul %k_2 8
    %t_56 = add %t_55 8
    %t_57 = add %phi_1 %t_56
    %t_58 = mul %i_6 8
    %t_59 = add %t_58 8
    %t_60 = add %P_1 %t_59
    %t_61 = load %t_57
    %t_62 = load %t_60
    %t_63 = mul %t_61 %t_62
    store %t_63 %t_54
    jump main_for_merge_1

main_if_else_1:
    %t_64 = mul %i_6 8
    %t_65 = add %t_64 8
    %t_66 = add %P_1 %t_65
    %t_67 = load %t_66
    %t_68 = mul %k_2 %t_67
    %t_69 = mul %t_68 8
    %t_70 = add %t_69 8
    %t_71 = add %phi_1 %t_70
    %t_72 = mul %k_2 8
    %t_73 = add %t_72 8
    %t_74 = add %phi_1 %t_73
    %t_75 = mul %i_6 8
    %t_76 = add %t_75 8
    %t_77 = add %P_1 %t_76
    %t_78 = load %t_77
    %t_79 = sub %t_78 1
    %t_80 = load %t_74
    %t_81 = mul %t_80 %t_79
    store %t_81 %t_71
    jump main_for_step_1

main_for_step_1:
    %t_82 = move %i_6
    %i_10 = add %i_6 1
    jump main_for_cond_1

main_for_merge_1:
    %tmp_2 = phi main_for_cond_1 %tmp_3 main_lhs_then_1 %tmp_3 main_if_then_2 %tmp_4 
    %t_83 = mul %k_2 8
    %t_84 = add %t_83 8
    %t_85 = add %phi_1 %t_84
    %t_86 = load %t_85
    %t_87 = call toString %t_86 
    call println %t_87 
    %i_8 = add %i_7 1
    jump main_for_body_1

main_for_merge_2:
    %t_88 = move 0
    store %N_3 @N_1
    store %check_3 @check_1
    store %M_3 @M_1
    ret %t_88

main_while_body_1:
    %t_89 = move %i_2
    %i_3 = add %i_2 1
    %t_90 = mul %t_89 8
    %t_91 = add %t_90 8
    %t_92 = add %check_3 %t_91
    store 1 %t_92
    jump main_while_cond_1

}

define i64 @__init  {
__init_entry_1:
    %M_6 = load @M_1
    %M_7 = move 0
    store %M_7 @M_1
    %t_93 = call main 
    %M_8 = load @M_1
    %t_94 = move %t_93
    store %M_8 @M_1
    ret %t_94

}


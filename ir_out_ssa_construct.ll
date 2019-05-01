@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %check_2 = load @check_1
    %N_2 = load @N_1
    %M_2 = load @M_1
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

main_while_body_1:
    %t_7 = move %i_2
    %i_3 = add %i_2 1
    %t_8 = mul %t_7 8
    %t_9 = add %t_8 8
    %t_10 = add %check_3 %t_9
    store 1 %t_10
    jump main_while_cond_1

main_while_merge_1:
    %t_11 = add %N_3 5
    %t_12 = mul %t_11 8
    %t_13 = add %t_12 8
    %t_14 = alloc %t_13
    store %t_11 %t_14
    %phi_1 = move %t_14
    %t_15 = add %N_3 5
    %t_16 = mul %t_15 8
    %t_17 = add %t_16 8
    %t_18 = alloc %t_17
    store %t_15 %t_18
    %P_1 = move %t_18
    %t_19 = mul 1 8
    %t_20 = add %t_19 8
    %t_21 = add %phi_1 %t_20
    store 1 %t_21
    %i_4 = move 2
    jump main_for_body_1

main_for_body_1:
    %k_1 = phi main_while_merge_1 undef main_for_merge_1 %k_2 
    %i_5 = phi main_while_merge_1 %i_4 main_for_merge_1 %i_6 
    %tmp_1 = phi main_while_merge_1 undef main_for_merge_1 %tmp_2 
    %i_7 = phi main_while_merge_1 undef main_for_merge_1 %i_8 
    %M_3 = phi main_while_merge_1 %M_2 main_for_merge_1 %M_4 
    %t_22 = sgt %i_5 %N_3
    br %t_22 main_for_merge_2 main_if_merge_1

main_for_merge_2:
    %t_23 = move 0
    store %M_3 @M_1
    store %N_3 @N_1
    store %check_3 @check_1
    ret %t_23

main_if_merge_1:
    %t_24 = mul %i_5 8
    %t_25 = add %t_24 8
    %t_26 = add %check_3 %t_25
    %t_27 = load %t_26
    br %t_27 main_if_then_1 main_if_merge_2

main_if_then_1:
    %M_5 = add %M_3 1
    %t_28 = mul %M_5 8
    %t_29 = add %t_28 8
    %t_30 = add %P_1 %t_29
    store %i_5 %t_30
    %t_31 = mul %i_5 8
    %t_32 = add %t_31 8
    %t_33 = add %phi_1 %t_32
    %t_34 = sub %i_5 1
    store %t_34 %t_33
    jump main_if_merge_2

main_if_merge_2:
    %M_4 = phi main_if_merge_1 %M_3 main_if_then_1 %M_5 
    %k_2 = move %i_5
    %i_9 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %tmp_3 = phi main_if_merge_2 %tmp_1 main_for_step_1 %tmp_4 
    %i_8 = phi main_if_merge_2 %i_9 main_for_step_1 %i_10 
    %t_35 = sle %i_8 %M_4
    br %t_35 main_lhs_then_1 main_for_merge_1

main_lhs_then_1:
    %t_36 = mul %i_8 8
    %t_37 = add %t_36 8
    %t_38 = add %P_1 %t_37
    %t_39 = load %t_38
    %t_40 = mul %k_2 %t_39
    %t_41 = sle %t_40 %N_3
    br %t_41 main_for_body_2 main_for_merge_1

main_for_body_2:
    %t_42 = mul %i_8 8
    %t_43 = add %t_42 8
    %t_44 = add %P_1 %t_43
    %t_45 = load %t_44
    %t_46 = mul %k_2 %t_45
    %tmp_4 = move %t_46
    %t_47 = sgt %tmp_4 %N_3
    br %t_47 main_for_step_1 main_if_merge_3

main_if_merge_3:
    %t_48 = mul %tmp_4 8
    %t_49 = add %t_48 8
    %t_50 = add %check_3 %t_49
    store 0 %t_50
    %t_51 = mul %i_8 8
    %t_52 = add %t_51 8
    %t_53 = add %P_1 %t_52
    %t_54 = load %t_53
    %t_55 = mod %k_2 %t_54
    %t_56 = seq %t_55 0
    br %t_56 main_if_then_2 main_if_else_1

main_if_else_1:
    %t_57 = mul %i_8 8
    %t_58 = add %t_57 8
    %t_59 = add %P_1 %t_58
    %t_60 = load %t_59
    %t_61 = mul %k_2 %t_60
    %t_62 = mul %t_61 8
    %t_63 = add %t_62 8
    %t_64 = add %phi_1 %t_63
    %t_65 = mul %k_2 8
    %t_66 = add %t_65 8
    %t_67 = add %phi_1 %t_66
    %t_68 = mul %i_8 8
    %t_69 = add %t_68 8
    %t_70 = add %P_1 %t_69
    %t_71 = load %t_70
    %t_72 = sub %t_71 1
    %t_73 = load %t_67
    %t_74 = mul %t_73 %t_72
    store %t_74 %t_64
    jump main_for_step_1

main_if_then_2:
    %t_75 = mul %tmp_4 8
    %t_76 = add %t_75 8
    %t_77 = add %phi_1 %t_76
    %t_78 = mul %k_2 8
    %t_79 = add %t_78 8
    %t_80 = add %phi_1 %t_79
    %t_81 = mul %i_8 8
    %t_82 = add %t_81 8
    %t_83 = add %P_1 %t_82
    %t_84 = load %t_80
    %t_85 = load %t_83
    %t_86 = mul %t_84 %t_85
    store %t_86 %t_77
    jump main_for_merge_1

main_for_merge_1:
    %tmp_2 = phi main_for_cond_1 %tmp_3 main_lhs_then_1 %tmp_3 main_if_then_2 %tmp_4 
    %t_87 = mul %k_2 8
    %t_88 = add %t_87 8
    %t_89 = add %phi_1 %t_88
    %t_90 = load %t_89
    %t_91 = call toString %t_90 
    call println %t_91 
    %i_6 = add %i_5 1
    jump main_for_body_1

main_for_step_1:
    %t_92 = move %i_8
    %i_10 = add %i_8 1
    jump main_for_cond_1

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


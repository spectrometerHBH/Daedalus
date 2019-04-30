@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %M_2 = load @M_1
    %check_2 = load @check_1
    %N_2 = load @N_1
    %t_1 = call getInt 
    %N_2 = move %t_1
    %t_2 = add %N_2 5
    %t_3 = mul %t_2 8
    %t_3 = add %t_3 8
    %t_4 = alloc %t_3
    store %t_2 %t_4
    %check_2 = move %t_4
    %i_1 = move 0
    jump main_while_cond_1

main_while_cond_1:
    %t_5 = sle %i_1 %N_2
    br %t_5 main_while_body_1 main_while_merge_1

main_while_merge_1:
    %t_6 = add %N_2 5
    %t_7 = mul %t_6 8
    %t_7 = add %t_7 8
    %t_8 = alloc %t_7
    store %t_6 %t_8
    %phi_1 = move %t_8
    %t_9 = add %N_2 5
    %t_10 = mul %t_9 8
    %t_10 = add %t_10 8
    %t_11 = alloc %t_10
    store %t_9 %t_11
    %P_1 = move %t_11
    %t_12 = mul 1 8
    %t_13 = add %t_12 8
    %t_14 = add %phi_1 %t_13
    store 1 %t_14
    %i_1 = move 2
    jump main_for_body_1

main_for_body_1:
    %t_15 = sgt %i_1 %N_2
    br %t_15 main_if_then_1 main_if_merge_1

main_if_merge_1:
    %t_16 = mul %i_1 8
    %t_17 = add %t_16 8
    %t_18 = add %check_2 %t_17
    %t_19 = load %t_18
    br %t_19 main_if_then_2 main_if_merge_2

main_if_then_2:
    %M_2 = add %M_2 1
    %t_20 = mul %M_2 8
    %t_21 = add %t_20 8
    %t_22 = add %P_1 %t_21
    store %i_1 %t_22
    %t_23 = mul %i_1 8
    %t_24 = add %t_23 8
    %t_25 = add %phi_1 %t_24
    %t_26 = sub %i_1 1
    store %t_26 %t_25
    jump main_if_merge_2

main_if_merge_2:
    %k_1 = move %i_1
    %i_2 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %t_27 = sle %i_2 %M_2
    br %t_27 main_lhs_then_1 main_for_merge_1

main_lhs_then_1:
    %t_28 = mul %i_2 8
    %t_29 = add %t_28 8
    %t_30 = add %P_1 %t_29
    %t_31 = load %t_30
    %t_32 = mul %k_1 %t_31
    %t_33 = sle %t_32 %N_2
    br %t_33 main_for_body_2 main_for_merge_1

main_for_body_2:
    %t_34 = mul %i_2 8
    %t_35 = add %t_34 8
    %t_36 = add %P_1 %t_35
    %t_37 = load %t_36
    %t_38 = mul %k_1 %t_37
    %tmp_1 = move %t_38
    %t_39 = sgt %tmp_1 %N_2
    br %t_39 main_if_then_3 main_if_merge_3

main_if_then_3:
    jump main_for_step_1

main_if_merge_3:
    %t_40 = mul %tmp_1 8
    %t_41 = add %t_40 8
    %t_42 = add %check_2 %t_41
    jump main_elseBB_1

main_elseBB_1:
    store 0 %t_42
    jump main_mergeBB_1

main_mergeBB_1:
    %t_43 = mul %i_2 8
    %t_44 = add %t_43 8
    %t_45 = add %P_1 %t_44
    %t_46 = load %t_45
    %t_47 = mod %k_1 %t_46
    %t_48 = seq %t_47 0
    br %t_48 main_if_then_4 main_if_else_1

main_if_then_4:
    %t_49 = mul %tmp_1 8
    %t_50 = add %t_49 8
    %t_51 = add %phi_1 %t_50
    %t_52 = mul %k_1 8
    %t_53 = add %t_52 8
    %t_54 = add %phi_1 %t_53
    %t_55 = mul %i_2 8
    %t_56 = add %t_55 8
    %t_57 = add %P_1 %t_56
    %t_58 = load %t_54
    %t_59 = load %t_57
    %t_60 = mul %t_58 %t_59
    store %t_60 %t_51
    jump main_for_merge_1

main_if_else_1:
    %t_61 = mul %i_2 8
    %t_62 = add %t_61 8
    %t_63 = add %P_1 %t_62
    %t_64 = load %t_63
    %t_65 = mul %k_1 %t_64
    %t_66 = mul %t_65 8
    %t_67 = add %t_66 8
    %t_68 = add %phi_1 %t_67
    %t_69 = mul %k_1 8
    %t_70 = add %t_69 8
    %t_71 = add %phi_1 %t_70
    %t_72 = mul %i_2 8
    %t_73 = add %t_72 8
    %t_74 = add %P_1 %t_73
    %t_75 = load %t_74
    %t_76 = sub %t_75 1
    %t_77 = load %t_71
    %t_78 = mul %t_77 %t_76
    store %t_78 %t_68
    jump main_if_merge_4

main_if_merge_4:
    jump main_for_step_1

main_for_step_1:
    %t_79 = move %i_2
    %i_2 = add %i_2 1
    jump main_for_cond_1

main_for_merge_1:
    %t_80 = mul %k_1 8
    %t_81 = add %t_80 8
    %t_82 = add %phi_1 %t_81
    %t_83 = load %t_82
    %t_84 = call toString %t_83 
    call println %t_84 
    jump main_for_step_2

main_for_step_2:
    %i_1 = add %i_1 1
    jump main_for_body_1

main_if_then_1:
    jump main_for_merge_2

main_for_merge_2:
    %t_85 = move 0
    store %N_2 @N_1
    store %check_2 @check_1
    store %M_2 @M_1
    ret %t_85

main_while_body_1:
    %t_86 = move %i_1
    %i_1 = add %i_1 1
    %t_87 = mul %t_86 8
    %t_88 = add %t_87 8
    %t_89 = add %check_2 %t_88
    jump main_thenBB_1

main_thenBB_1:
    store 1 %t_89
    jump main_mergeBB_2

main_mergeBB_2:
    jump main_while_cond_1

}

define i64 @__init  {
__init_entry_1:
    %M_3 = load @M_1
    %M_3 = move 0
    store %M_3 @M_1
    %t_90 = call main 
    %M_3 = load @M_1
    %t_91 = move %t_90
    store %M_3 @M_1
    ret %t_91

}


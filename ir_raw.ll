@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %check_2 = load @check_1
    %N_2 = load @N_1
    %M_2 = load @M_1
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

main_while_body_1:
    %t_6 = move %i_1
    %i_1 = add %i_1 1
    %t_7 = mul %t_6 8
    %t_8 = add %t_7 8
    %t_9 = add %check_2 %t_8
    jump main_thenBB_1

main_thenBB_1:
    store 1 %t_9
    jump main_mergeBB_1

main_mergeBB_1:
    jump main_while_cond_1

main_while_merge_1:
    %t_10 = add %N_2 5
    %t_11 = mul %t_10 8
    %t_11 = add %t_11 8
    %t_12 = alloc %t_11
    store %t_10 %t_12
    %phi_1 = move %t_12
    %t_13 = add %N_2 5
    %t_14 = mul %t_13 8
    %t_14 = add %t_14 8
    %t_15 = alloc %t_14
    store %t_13 %t_15
    %P_1 = move %t_15
    %t_16 = mul 1 8
    %t_17 = add %t_16 8
    %t_18 = add %phi_1 %t_17
    store 1 %t_18
    %i_1 = move 2
    jump main_for_body_1

main_for_body_1:
    %t_19 = sgt %i_1 %N_2
    br %t_19 main_if_then_1 main_if_merge_1

main_if_then_1:
    jump main_for_merge_1

main_for_merge_1:
    %t_20 = move 0
    store %M_2 @M_1
    store %N_2 @N_1
    store %check_2 @check_1
    ret %t_20

main_if_merge_1:
    %t_21 = mul %i_1 8
    %t_22 = add %t_21 8
    %t_23 = add %check_2 %t_22
    %t_24 = load %t_23
    br %t_24 main_if_then_2 main_if_merge_2

main_if_then_2:
    %M_2 = add %M_2 1
    %t_25 = mul %M_2 8
    %t_26 = add %t_25 8
    %t_27 = add %P_1 %t_26
    store %i_1 %t_27
    %t_28 = mul %i_1 8
    %t_29 = add %t_28 8
    %t_30 = add %phi_1 %t_29
    %t_31 = sub %i_1 1
    store %t_31 %t_30
    jump main_if_merge_2

main_if_merge_2:
    %k_1 = move %i_1
    %i_2 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %t_32 = sle %i_2 %M_2
    br %t_32 main_lhs_then_1 main_for_merge_2

main_lhs_then_1:
    %t_33 = mul %i_2 8
    %t_34 = add %t_33 8
    %t_35 = add %P_1 %t_34
    %t_36 = load %t_35
    %t_37 = mul %k_1 %t_36
    %t_38 = sle %t_37 %N_2
    br %t_38 main_for_body_2 main_for_merge_2

main_for_body_2:
    %t_39 = mul %i_2 8
    %t_40 = add %t_39 8
    %t_41 = add %P_1 %t_40
    %t_42 = load %t_41
    %t_43 = mul %k_1 %t_42
    %tmp_1 = move %t_43
    %t_44 = sgt %tmp_1 %N_2
    br %t_44 main_if_then_3 main_if_merge_3

main_if_merge_3:
    %t_45 = mul %tmp_1 8
    %t_46 = add %t_45 8
    %t_47 = add %check_2 %t_46
    jump main_elseBB_1

main_elseBB_1:
    store 0 %t_47
    jump main_mergeBB_2

main_mergeBB_2:
    %t_48 = mul %i_2 8
    %t_49 = add %t_48 8
    %t_50 = add %P_1 %t_49
    %t_51 = load %t_50
    %t_52 = mod %k_1 %t_51
    %t_53 = seq %t_52 0
    br %t_53 main_if_then_4 main_if_else_1

main_if_else_1:
    %t_54 = mul %i_2 8
    %t_55 = add %t_54 8
    %t_56 = add %P_1 %t_55
    %t_57 = load %t_56
    %t_58 = mul %k_1 %t_57
    %t_59 = mul %t_58 8
    %t_60 = add %t_59 8
    %t_61 = add %phi_1 %t_60
    %t_62 = mul %k_1 8
    %t_63 = add %t_62 8
    %t_64 = add %phi_1 %t_63
    %t_65 = mul %i_2 8
    %t_66 = add %t_65 8
    %t_67 = add %P_1 %t_66
    %t_68 = load %t_67
    %t_69 = sub %t_68 1
    %t_70 = load %t_64
    %t_71 = mul %t_70 %t_69
    store %t_71 %t_61
    jump main_if_merge_4

main_if_merge_4:
    jump main_for_step_1

main_if_then_4:
    %t_72 = mul %tmp_1 8
    %t_73 = add %t_72 8
    %t_74 = add %phi_1 %t_73
    %t_75 = mul %k_1 8
    %t_76 = add %t_75 8
    %t_77 = add %phi_1 %t_76
    %t_78 = mul %i_2 8
    %t_79 = add %t_78 8
    %t_80 = add %P_1 %t_79
    %t_81 = load %t_77
    %t_82 = load %t_80
    %t_83 = mul %t_81 %t_82
    store %t_83 %t_74
    jump main_for_merge_2

main_for_merge_2:
    %t_84 = mul %k_1 8
    %t_85 = add %t_84 8
    %t_86 = add %phi_1 %t_85
    %t_87 = load %t_86
    %t_88 = call toString %t_87 
    call println %t_88 
    jump main_for_step_2

main_for_step_2:
    %i_1 = add %i_1 1
    jump main_for_body_1

main_if_then_3:
    jump main_for_step_1

main_for_step_1:
    %t_89 = move %i_2
    %i_2 = add %i_2 1
    jump main_for_cond_1

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


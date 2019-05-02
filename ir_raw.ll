@N_1
@M_1
@check_1

define i64 @main  {
main_entry_1:
    %t_1 = call getInt 
    @N_1 = move %t_1
    %t_2 = add @N_1 5
    %t_3 = mul %t_2 8
    %t_3 = add %t_3 8
    %t_4 = alloc %t_3
    store %t_2 %t_4
    @check_1 = move %t_4
    %i_1 = move 0
    jump main_while_cond_1

main_while_cond_1:
    %t_5 = sle %i_1 @N_1
    br %t_5 main_while_body_1 main_while_merge_1

main_while_merge_1:
    %t_6 = add @N_1 5
    %t_7 = mul %t_6 8
    %t_7 = add %t_7 8
    %t_8 = alloc %t_7
    store %t_6 %t_8
    %phi_1 = move %t_8
    %t_9 = add @N_1 5
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
    %t_15 = sgt %i_1 @N_1
    br %t_15 main_if_then_1 main_if_merge_1

main_if_then_1:
    jump main_for_merge_1

main_for_merge_1:
    %t_16 = move 0
    ret %t_16

main_if_merge_1:
    %t_17 = mul %i_1 8
    %t_18 = add %t_17 8
    %t_19 = add @check_1 %t_18
    %t_20 = load %t_19
    br %t_20 main_if_then_2 main_if_merge_2

main_if_then_2:
    @M_1 = add @M_1 1
    %t_21 = mul @M_1 8
    %t_22 = add %t_21 8
    %t_23 = add %P_1 %t_22
    store %i_1 %t_23
    %t_24 = mul %i_1 8
    %t_25 = add %t_24 8
    %t_26 = add %phi_1 %t_25
    %t_27 = sub %i_1 1
    store %t_27 %t_26
    jump main_if_merge_2

main_if_merge_2:
    %k_1 = move %i_1
    %i_2 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %t_28 = sle %i_2 @M_1
    br %t_28 main_lhs_then_1 main_for_merge_2

main_lhs_then_1:
    %t_29 = mul %i_2 8
    %t_30 = add %t_29 8
    %t_31 = add %P_1 %t_30
    %t_32 = load %t_31
    %t_33 = mul %k_1 %t_32
    %t_34 = sle %t_33 @N_1
    br %t_34 main_for_body_2 main_for_merge_2

main_for_body_2:
    %t_35 = mul %i_2 8
    %t_36 = add %t_35 8
    %t_37 = add %P_1 %t_36
    %t_38 = load %t_37
    %t_39 = mul %k_1 %t_38
    %tmp_1 = move %t_39
    %t_40 = sgt %tmp_1 @N_1
    br %t_40 main_if_then_3 main_if_merge_3

main_if_merge_3:
    %t_41 = mul %tmp_1 8
    %t_42 = add %t_41 8
    %t_43 = add @check_1 %t_42
    jump main_elseBB_1

main_elseBB_1:
    store 0 %t_43
    jump main_mergeBB_1

main_mergeBB_1:
    %t_44 = mul %i_2 8
    %t_45 = add %t_44 8
    %t_46 = add %P_1 %t_45
    %t_47 = load %t_46
    %t_48 = mod %k_1 %t_47
    %t_49 = seq %t_48 0
    br %t_49 main_if_then_4 main_if_else_1

main_if_then_4:
    %t_50 = mul %tmp_1 8
    %t_51 = add %t_50 8
    %t_52 = add %phi_1 %t_51
    %t_53 = mul %k_1 8
    %t_54 = add %t_53 8
    %t_55 = add %phi_1 %t_54
    %t_56 = mul %i_2 8
    %t_57 = add %t_56 8
    %t_58 = add %P_1 %t_57
    %t_59 = load %t_55
    %t_60 = load %t_58
    %t_61 = mul %t_59 %t_60
    store %t_61 %t_52
    jump main_for_merge_2

main_if_else_1:
    %t_62 = mul %i_2 8
    %t_63 = add %t_62 8
    %t_64 = add %P_1 %t_63
    %t_65 = load %t_64
    %t_66 = mul %k_1 %t_65
    %t_67 = mul %t_66 8
    %t_68 = add %t_67 8
    %t_69 = add %phi_1 %t_68
    %t_70 = mul %k_1 8
    %t_71 = add %t_70 8
    %t_72 = add %phi_1 %t_71
    %t_73 = mul %i_2 8
    %t_74 = add %t_73 8
    %t_75 = add %P_1 %t_74
    %t_76 = load %t_75
    %t_77 = sub %t_76 1
    %t_78 = load %t_72
    %t_79 = mul %t_78 %t_77
    store %t_79 %t_69
    jump main_if_merge_4

main_if_merge_4:
    jump main_for_step_1

main_if_then_3:
    jump main_for_step_1

main_for_step_1:
    %t_80 = move %i_2
    %i_2 = add %i_2 1
    jump main_for_cond_1

main_for_merge_2:
    %t_81 = mul %k_1 8
    %t_82 = add %t_81 8
    %t_83 = add %phi_1 %t_82
    %t_84 = load %t_83
    %t_85 = call toString %t_84 
    call println %t_85 
    jump main_for_step_2

main_for_step_2:
    %i_1 = add %i_1 1
    jump main_for_body_1

main_while_body_1:
    %t_86 = move %i_1
    %i_1 = add %i_1 1
    %t_87 = mul %t_86 8
    %t_88 = add %t_87 8
    %t_89 = add @check_1 %t_88
    jump main_thenBB_1

main_thenBB_1:
    store 1 %t_89
    jump main_mergeBB_2

main_mergeBB_2:
    jump main_while_cond_1

}

define i64 @__init  {
__init_entry_1:
    @M_1 = move 0
    %t_90 = call main 
    %t_91 = move %t_90
    ret %t_91

}


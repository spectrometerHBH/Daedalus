@N_1
@n_1
@a_1
@bak_1
@a_left_1
@a_right_1
@heap_1
@i1_1
@i2_1
@i3_1
@i4_1
@i5_1
@i6_1
@i7_1
@i8_1
@i9_1
@i10_1
@i11_1
@i12_1
@i13_1
@i14_1

define void @A_Optimizer  {
A_Optimizer_entry_1:
    %temp_vr15_1 = move %vr15_1
    %temp_vr12_1 = move %vr12_1
    %temp_vr14_1 = move %vr14_1
    %temp_vr13_1 = move %vr13_1
    %temp_vrbx_1 = move %vrbx_1
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_1 = move %vrax_1
    store 2 %t_1 null 0 0
    %t_2 = move %t_1
    %t_2 = add %t_2 8
    %t_3 = move %t_1
    %t_3 = add %t_3 24
    %t_4 = move %t_2
    %breaker_1 = move %t_4
    %t_5 = move 0
    %t_6 = move 0
    %t_7 = move 0
    %t_8 = move 0
    %t_9 = move 0
    %t_10 = move 0
    %t_11 = move 0
    %t_12 = move 0
    %t_13 = move 0
    %t_14 = move 0
    %t_15 = move 0
    %t_16 = move 0
    %t_17 = move 0
    %t_18 = move 0
    jump A_Optimizer_for_cond_1

A_Optimizer_for_cond_1:
    cmp %t_4 %t_3
    br slt A_Optimizer_for_body_1 A_Optimizer_for_merge_1

A_Optimizer_for_body_1:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_19 = move %vrax_1
    store 2 %t_19 null 0 0
    store %t_19 %t_4 null 0 0
    %t_20 = move %t_19
    %t_20 = add %t_20 8
    %t_21 = move %t_19
    %t_21 = add %t_21 24
    %t_22 = move %t_5
    %t_23 = move %t_6
    %t_24 = move %t_20
    %t_25 = move %t_7
    %t_26 = move %t_8
    %t_27 = move %t_9
    %t_28 = move %t_10
    %t_29 = move %t_11
    %t_30 = move %t_12
    %t_31 = move %t_13
    %t_32 = move %t_14
    %t_33 = move %t_15
    %t_34 = move %t_16
    %t_35 = move %t_17
    %t_36 = move %t_18
    %breaker_2 = move %t_22
    %t_22 = move %t_22
    %breaker_2 = move %t_23
    %t_23 = move %t_23
    %breaker_2 = move %t_24
    %t_24 = move %t_24
    %breaker_2 = move %t_25
    %t_25 = move %t_25
    %breaker_2 = move %t_26
    %t_26 = move %t_26
    %breaker_2 = move %t_27
    %t_27 = move %t_27
    %breaker_2 = move %t_28
    %t_28 = move %t_28
    %breaker_2 = move %t_29
    %t_29 = move %t_29
    %breaker_2 = move %t_30
    %t_30 = move %t_30
    %breaker_2 = move %t_31
    %t_31 = move %t_31
    %breaker_2 = move %t_32
    %t_32 = move %t_32
    %breaker_2 = move %t_33
    %t_33 = move %t_33
    %breaker_2 = move %t_34
    %t_34 = move %t_34
    %breaker_2 = move %t_35
    %t_35 = move %t_35
    %breaker_2 = move %t_36
    jump A_Optimizer_for_cond_2

A_Optimizer_for_cond_2:
    cmp %t_24 %t_21
    br slt A_Optimizer_for_body_2 A_Optimizer_for_step_1

A_Optimizer_for_body_2:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_37 = move %vrax_1
    store 2 %t_37 null 0 0
    store %t_37 %t_24 null 0 0
    %t_38 = move %t_37
    %t_38 = add %t_38 8
    %t_39 = move %t_37
    %t_39 = add %t_39 24
    %t_40 = move %t_22
    %t_41 = move %t_23
    %t_42 = move %t_25
    %t_43 = move %t_26
    %t_44 = move %t_27
    %t_45 = move %t_28
    %t_46 = move %t_29
    %t_47 = move %t_30
    %t_48 = move %t_31
    %t_49 = move %t_32
    %t_50 = move %t_38
    %t_51 = move %t_34
    %t_52 = move %t_35
    %breaker_3 = move %t_40
    %t_40 = move %t_40
    %breaker_3 = move %t_41
    %t_41 = move %t_41
    %breaker_3 = move %t_42
    %t_42 = move %t_42
    %breaker_3 = move %t_43
    %t_43 = move %t_43
    %breaker_3 = move %t_44
    %t_44 = move %t_44
    %breaker_3 = move %t_45
    %t_45 = move %t_45
    %breaker_3 = move %t_46
    %t_46 = move %t_46
    %breaker_3 = move %t_47
    %t_47 = move %t_47
    %breaker_3 = move %t_48
    %t_48 = move %t_48
    %breaker_3 = move %t_49
    %t_49 = move %t_49
    %breaker_3 = move %t_50
    %t_50 = move %t_50
    %breaker_3 = move %t_51
    %t_51 = move %t_51
    %breaker_3 = move %t_52
    jump A_Optimizer_for_cond_3

A_Optimizer_for_cond_3:
    cmp %t_50 %t_39
    br slt A_Optimizer_for_body_3 A_Optimizer_for_step_2

A_Optimizer_for_body_3:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_53 = move %vrax_1
    store 2 %t_53 null 0 0
    store %t_53 %t_50 null 0 0
    %t_54 = move %t_53
    %t_54 = add %t_54 8
    %t_55 = move %t_53
    %t_55 = add %t_55 24
    %t_56 = move %t_40
    %t_57 = move %t_42
    %t_58 = move %t_43
    %t_59 = move %t_54
    %t_60 = move %t_45
    %t_61 = move %t_46
    %t_62 = move %t_47
    %t_63 = move %t_48
    %t_64 = move %t_49
    %t_65 = move %t_51
    %t_66 = move %t_52
    %breaker_4 = move %t_56
    %t_56 = move %t_56
    %breaker_4 = move %t_57
    %t_57 = move %t_57
    %breaker_4 = move %t_58
    %t_58 = move %t_58
    %breaker_4 = move %t_59
    %t_59 = move %t_59
    %breaker_4 = move %t_60
    %t_60 = move %t_60
    %breaker_4 = move %t_61
    %t_61 = move %t_61
    %breaker_4 = move %t_62
    %t_62 = move %t_62
    %breaker_4 = move %t_63
    %t_63 = move %t_63
    %breaker_4 = move %t_64
    %t_64 = move %t_64
    %breaker_4 = move %t_65
    %t_65 = move %t_65
    %breaker_4 = move %t_66
    jump A_Optimizer_for_cond_4

A_Optimizer_for_cond_4:
    cmp %t_59 %t_55
    br slt A_Optimizer_for_body_4 A_Optimizer_for_step_3

A_Optimizer_for_step_3:
    %t_67 = move %t_50
    %t_67 = add %t_67 8
    %t_40 = move %t_56
    %t_41 = move %t_55
    %t_42 = move %t_57
    %t_43 = move %t_58
    %t_44 = move %t_59
    %t_45 = move %t_60
    %t_46 = move %t_61
    %t_47 = move %t_62
    %t_48 = move %t_63
    %t_49 = move %t_64
    %t_50 = move %t_67
    %t_51 = move %t_65
    %t_52 = move %t_66
    %breaker_5 = move %t_40
    %t_40 = move %t_40
    %breaker_5 = move %t_41
    %t_41 = move %t_41
    %breaker_5 = move %t_42
    %t_42 = move %t_42
    %breaker_5 = move %t_43
    %t_43 = move %t_43
    %breaker_5 = move %t_44
    %t_44 = move %t_44
    %breaker_5 = move %t_45
    %t_45 = move %t_45
    %breaker_5 = move %t_46
    %t_46 = move %t_46
    %breaker_5 = move %t_47
    %t_47 = move %t_47
    %breaker_5 = move %t_48
    %t_48 = move %t_48
    %breaker_5 = move %t_49
    %t_49 = move %t_49
    %breaker_5 = move %t_50
    %t_50 = move %t_50
    %breaker_5 = move %t_51
    %t_51 = move %t_51
    %breaker_5 = move %t_52
    jump A_Optimizer_for_cond_3

A_Optimizer_for_body_4:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_68 = move %vrax_1
    store 2 %t_68 null 0 0
    store %t_68 %t_59 null 0 0
    %t_69 = move %t_68
    %t_69 = add %t_69 8
    %t_70 = move %t_68
    %t_70 = add %t_70 24
    %t_71 = move %t_56
    %t_72 = move %t_57
    %t_73 = move %t_58
    %t_74 = move %t_60
    %t_75 = move %t_61
    %t_76 = move %t_63
    %t_77 = move %t_64
    %t_78 = move %t_65
    %t_79 = move %t_69
    %breaker_6 = move %t_71
    %t_71 = move %t_71
    %breaker_6 = move %t_72
    %t_72 = move %t_72
    %breaker_6 = move %t_73
    %t_73 = move %t_73
    %breaker_6 = move %t_74
    %t_74 = move %t_74
    %breaker_6 = move %t_75
    %t_75 = move %t_75
    %breaker_6 = move %t_76
    %t_76 = move %t_76
    %breaker_6 = move %t_77
    %t_77 = move %t_77
    %breaker_6 = move %t_78
    %t_78 = move %t_78
    %breaker_6 = move %t_79
    jump A_Optimizer_for_cond_5

A_Optimizer_for_cond_5:
    cmp %t_79 %t_70
    br slt A_Optimizer_for_body_5 A_Optimizer_for_step_4

A_Optimizer_for_body_5:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_80 = move %vrax_1
    store 2 %t_80 null 0 0
    store %t_80 %t_79 null 0 0
    %t_81 = move %t_80
    %t_81 = add %t_81 8
    %t_82 = move %t_80
    %t_82 = add %t_82 24
    %t_83 = move %t_71
    %t_84 = move %t_72
    %t_85 = move %t_73
    %t_86 = move %t_81
    %t_87 = move %t_75
    %t_88 = move %t_76
    %t_89 = move %t_77
    %breaker_7 = move %t_83
    %t_83 = move %t_83
    %breaker_7 = move %t_84
    %t_84 = move %t_84
    %breaker_7 = move %t_85
    %t_85 = move %t_85
    %breaker_7 = move %t_86
    %t_86 = move %t_86
    %breaker_7 = move %t_87
    %t_87 = move %t_87
    %breaker_7 = move %t_88
    %t_88 = move %t_88
    %breaker_7 = move %t_89
    jump A_Optimizer_for_cond_6

A_Optimizer_for_cond_6:
    cmp %t_86 %t_82
    br slt A_Optimizer_for_body_6 A_Optimizer_for_step_5

A_Optimizer_for_step_5:
    %t_90 = move %t_79
    %t_90 = add %t_90 8
    %t_71 = move %t_83
    %t_72 = move %t_84
    %t_73 = move %t_85
    %t_74 = move %t_86
    %t_75 = move %t_87
    %t_76 = move %t_88
    %t_77 = move %t_89
    %t_78 = move %t_82
    %t_79 = move %t_90
    %breaker_8 = move %t_71
    %t_71 = move %t_71
    %breaker_8 = move %t_72
    %t_72 = move %t_72
    %breaker_8 = move %t_73
    %t_73 = move %t_73
    %breaker_8 = move %t_74
    %t_74 = move %t_74
    %breaker_8 = move %t_75
    %t_75 = move %t_75
    %breaker_8 = move %t_76
    %t_76 = move %t_76
    %breaker_8 = move %t_77
    %t_77 = move %t_77
    %breaker_8 = move %t_78
    %t_78 = move %t_78
    %breaker_8 = move %t_79
    jump A_Optimizer_for_cond_5

A_Optimizer_for_body_6:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_91 = move %vrax_1
    store 2 %t_91 null 0 0
    store %t_91 %t_86 null 0 0
    %t_92 = move %t_91
    %t_92 = add %t_92 8
    %t_93 = move %t_91
    %t_93 = add %t_93 24
    %t_94 = move %t_83
    %t_95 = move %t_85
    %t_96 = move %t_87
    %t_97 = move %t_88
    %t_98 = move %t_92
    %breaker_9 = move %t_94
    %t_94 = move %t_94
    %breaker_9 = move %t_95
    %t_95 = move %t_95
    %breaker_9 = move %t_96
    %t_96 = move %t_96
    %breaker_9 = move %t_97
    %t_97 = move %t_97
    %breaker_9 = move %t_98
    jump A_Optimizer_for_cond_7

A_Optimizer_for_cond_7:
    cmp %t_98 %t_93
    br slt A_Optimizer_for_body_7 A_Optimizer_for_step_6

A_Optimizer_for_step_6:
    %t_99 = move %t_86
    %t_99 = add %t_99 8
    %t_83 = move %t_94
    %t_84 = move %t_93
    %t_85 = move %t_95
    %t_86 = move %t_99
    %t_87 = move %t_96
    %t_88 = move %t_97
    %t_89 = move %t_98
    %breaker_10 = move %t_83
    %t_83 = move %t_83
    %breaker_10 = move %t_84
    %t_84 = move %t_84
    %breaker_10 = move %t_85
    %t_85 = move %t_85
    %breaker_10 = move %t_86
    %t_86 = move %t_86
    %breaker_10 = move %t_87
    %t_87 = move %t_87
    %breaker_10 = move %t_88
    %t_88 = move %t_88
    %breaker_10 = move %t_89
    jump A_Optimizer_for_cond_6

A_Optimizer_for_body_7:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_100 = move %vrax_1
    store 2 %t_100 null 0 0
    store %t_100 %t_98 null 0 0
    %t_101 = move %t_100
    %t_101 = add %t_101 8
    %t_102 = move %t_100
    %t_102 = add %t_102 24
    %t_103 = move %t_94
    %t_104 = move %t_96
    %t_105 = move %t_101
    %breaker_11 = move %t_103
    %t_103 = move %t_103
    %breaker_11 = move %t_104
    %t_104 = move %t_104
    %breaker_11 = move %t_105
    jump A_Optimizer_for_cond_8

A_Optimizer_for_cond_8:
    cmp %t_105 %t_102
    br slt A_Optimizer_for_body_8 A_Optimizer_for_step_7

A_Optimizer_for_step_7:
    %t_106 = move %t_98
    %t_106 = add %t_106 8
    %t_94 = move %t_103
    %t_95 = move %t_102
    %t_96 = move %t_104
    %t_97 = move %t_105
    %t_98 = move %t_106
    %breaker_12 = move %t_94
    %t_94 = move %t_94
    %breaker_12 = move %t_95
    %t_95 = move %t_95
    %breaker_12 = move %t_96
    %t_96 = move %t_96
    %breaker_12 = move %t_97
    %t_97 = move %t_97
    %breaker_12 = move %t_98
    jump A_Optimizer_for_cond_7

A_Optimizer_for_body_8:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_107 = move %vrax_1
    store 2 %t_107 null 0 0
    store %t_107 %t_105 null 0 0
    %t_108 = move %t_107
    %t_108 = add %t_108 8
    %t_109 = move %t_107
    %t_109 = add %t_109 24
    %t_110 = move %t_108
    %breaker_13 = move %t_110
    jump A_Optimizer_for_cond_9

A_Optimizer_for_cond_9:
    cmp %t_110 %t_109
    br slt A_Optimizer_for_body_9 A_Optimizer_for_step_8

A_Optimizer_for_step_8:
    %t_111 = move %t_105
    %t_111 = add %t_111 8
    %t_103 = move %t_110
    %t_104 = move %t_109
    %t_105 = move %t_111
    %breaker_14 = move %t_103
    %t_103 = move %t_103
    %breaker_14 = move %t_104
    %t_104 = move %t_104
    %breaker_14 = move %t_105
    jump A_Optimizer_for_cond_8

A_Optimizer_for_body_9:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_112 = move %vrax_1
    store 2 %t_112 null 0 0
    store %t_112 %t_110 null 0 0
    %t_113 = move %t_110
    %t_113 = add %t_113 8
    %t_110 = move %t_113
    %breaker_15 = move %t_110
    jump A_Optimizer_for_cond_9

A_Optimizer_for_step_4:
    %t_114 = move %t_59
    %t_114 = add %t_114 8
    %t_56 = move %t_71
    %t_57 = move %t_72
    %t_58 = move %t_73
    %t_59 = move %t_114
    %t_60 = move %t_74
    %t_61 = move %t_75
    %t_62 = move %t_70
    %t_63 = move %t_76
    %t_64 = move %t_77
    %t_65 = move %t_78
    %t_66 = move %t_79
    %breaker_16 = move %t_56
    %t_56 = move %t_56
    %breaker_16 = move %t_57
    %t_57 = move %t_57
    %breaker_16 = move %t_58
    %t_58 = move %t_58
    %breaker_16 = move %t_59
    %t_59 = move %t_59
    %breaker_16 = move %t_60
    %t_60 = move %t_60
    %breaker_16 = move %t_61
    %t_61 = move %t_61
    %breaker_16 = move %t_62
    %t_62 = move %t_62
    %breaker_16 = move %t_63
    %t_63 = move %t_63
    %breaker_16 = move %t_64
    %t_64 = move %t_64
    %breaker_16 = move %t_65
    %t_65 = move %t_65
    %breaker_16 = move %t_66
    jump A_Optimizer_for_cond_4

A_Optimizer_for_step_2:
    %t_115 = move %t_24
    %t_115 = add %t_115 8
    %t_22 = move %t_40
    %t_23 = move %t_41
    %t_24 = move %t_115
    %t_25 = move %t_42
    %t_26 = move %t_43
    %t_27 = move %t_44
    %t_28 = move %t_45
    %t_29 = move %t_46
    %t_30 = move %t_47
    %t_31 = move %t_48
    %t_32 = move %t_49
    %t_33 = move %t_50
    %t_34 = move %t_51
    %t_35 = move %t_52
    %t_36 = move %t_39
    %breaker_17 = move %t_22
    %t_22 = move %t_22
    %breaker_17 = move %t_23
    %t_23 = move %t_23
    %breaker_17 = move %t_24
    %t_24 = move %t_24
    %breaker_17 = move %t_25
    %t_25 = move %t_25
    %breaker_17 = move %t_26
    %t_26 = move %t_26
    %breaker_17 = move %t_27
    %t_27 = move %t_27
    %breaker_17 = move %t_28
    %t_28 = move %t_28
    %breaker_17 = move %t_29
    %t_29 = move %t_29
    %breaker_17 = move %t_30
    %t_30 = move %t_30
    %breaker_17 = move %t_31
    %t_31 = move %t_31
    %breaker_17 = move %t_32
    %t_32 = move %t_32
    %breaker_17 = move %t_33
    %t_33 = move %t_33
    %breaker_17 = move %t_34
    %t_34 = move %t_34
    %breaker_17 = move %t_35
    %t_35 = move %t_35
    %breaker_17 = move %t_36
    jump A_Optimizer_for_cond_2

A_Optimizer_for_step_1:
    %t_116 = move %t_4
    %t_116 = add %t_116 8
    %t_5 = move %t_22
    %t_6 = move %t_23
    %t_7 = move %t_25
    %t_8 = move %t_26
    %t_9 = move %t_27
    %t_10 = move %t_28
    %t_11 = move %t_29
    %t_12 = move %t_30
    %t_13 = move %t_31
    %t_14 = move %t_32
    %t_15 = move %t_33
    %t_16 = move %t_34
    %t_17 = move %t_35
    %t_18 = move %t_36
    %t_4 = move %t_116
    %breaker_18 = move %t_5
    %t_5 = move %t_5
    %breaker_18 = move %t_6
    %t_6 = move %t_6
    %breaker_18 = move %t_7
    %t_7 = move %t_7
    %breaker_18 = move %t_8
    %t_8 = move %t_8
    %breaker_18 = move %t_9
    %t_9 = move %t_9
    %breaker_18 = move %t_10
    %t_10 = move %t_10
    %breaker_18 = move %t_11
    %t_11 = move %t_11
    %breaker_18 = move %t_12
    %t_12 = move %t_12
    %breaker_18 = move %t_13
    %t_13 = move %t_13
    %breaker_18 = move %t_14
    %t_14 = move %t_14
    %breaker_18 = move %t_15
    %t_15 = move %t_15
    %breaker_18 = move %t_16
    %t_16 = move %t_16
    %breaker_18 = move %t_17
    %t_17 = move %t_17
    %breaker_18 = move %t_18
    %t_18 = move %t_18
    %breaker_18 = move %t_4
    jump A_Optimizer_for_cond_1

A_Optimizer_for_merge_1:
    %i_1 = move 1
    %sum_1 = move 0
    jump A_Optimizer_for_cond_10

A_Optimizer_for_cond_10:
    cmp %i_1 1000
    br sle A_Optimizer_for_body_10 A_Optimizer_for_merge_2

A_Optimizer_for_merge_2:
    %vrdi_1 = move %sum_1
    %vrax_1 = call toString %vrdi_1 
    %t_117 = move %vrax_1
    %vrdi_1 = move %t_117
    call println %vrdi_1 
    %sum_2 = move %sum_1
    %breaker_19 = move %sum_2
    %i_2 = move 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_cond_11:
    cmp %i_2 1000000
    br sle A_Optimizer_for_body_11 A_Optimizer_for_merge_3

A_Optimizer_for_body_11:
    %t_118 = move %sum_2
    %t_118 = add %t_118 8
    %i_3 = move %i_2
    %i_3 = add %i_3 1
    %i_2 = move %i_3
    %sum_2 = move %t_118
    %breaker_20 = move %i_2
    %i_2 = move %i_2
    %breaker_20 = move %sum_2
    jump A_Optimizer_for_cond_11

A_Optimizer_for_merge_3:
    %vrdi_1 = move %sum_2
    %vrax_1 = call toString %vrdi_1 
    %t_119 = move %vrax_1
    %vrdi_1 = move %t_119
    call println %vrdi_1 
    %i_4 = move 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_cond_12:
    cmp %i_4 200000000
    br sle A_Optimizer_for_step_9 A_Optimizer_for_merge_4

A_Optimizer_for_step_9:
    %i_5 = move %i_4
    %i_5 = add %i_5 1
    %i_4 = move %i_5
    %breaker_21 = move %i_4
    jump A_Optimizer_for_cond_12

A_Optimizer_for_merge_4:
    %vr15_1 = move %temp_vr15_1
    %vr12_1 = move %temp_vr12_1
    %vr14_1 = move %temp_vr14_1
    %vr13_1 = move %temp_vr13_1
    %vrbx_1 = move %temp_vrbx_1
    ret 

A_Optimizer_for_body_10:
    %t_120 = move %t_1
    %t_120 = add %t_120 8
    %t_121 = load %t_120 null 0 0
    %t_122 = load %t_121 null 0 16
    %t_123 = load %t_122 null 0 8
    %t_124 = load %t_123 null 0 16
    %t_125 = load %t_124 null 0 8
    %t_126 = load %t_125 null 0 16
    %t_127 = load %t_126 null 0 8
    %t_128 = load %t_127 null 0 16
    %t_129 = load %t_128 null 0 8
    %t_130 = move 123
    %t_130 = add %t_130 %i_1
    store %t_130 %t_129 null 0 16
    %t_131 = load %t_120 null 0 0
    %t_132 = load %t_131 null 0 16
    %t_133 = load %t_132 null 0 8
    %t_134 = load %t_133 null 0 16
    %t_135 = load %t_134 null 0 8
    %t_136 = load %t_135 null 0 16
    %t_137 = load %t_136 null 0 8
    %t_138 = load %t_137 null 0 16
    %t_139 = load %t_138 null 0 8
    %t_140 = load %t_139 null 0 16
    %t_141 = move %sum_1
    %t_141 = add %t_141 %t_140
    %i_6 = move %i_1
    %i_6 = add %i_6 1
    %i_1 = move %i_6
    %sum_1 = move %t_141
    %breaker_22 = move %i_1
    %i_1 = move %i_1
    %breaker_22 = move %sum_1
    jump A_Optimizer_for_cond_10

}

define i64 @A_A  {
A_A_entry_1:
    %temp_vr15_2 = move %vr15_1
    %temp_vr12_2 = move %vr12_1
    %temp_vr14_2 = move %vr14_1
    %temp_vr13_2 = move %vr13_1
    %temp_vrbx_2 = move %vrbx_1
    %this_1 = move %vrdi_1
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_142 = move %vrax_1
    store 2 %t_142 null 0 0
    %t_143 = move %t_142
    %t_143 = add %t_143 8
    %t_144 = move %t_142
    %t_144 = add %t_144 24
    %t_145 = move %t_143
    %breaker_23 = move %t_145
    %t_146 = move 0
    %t_147 = move 0
    %t_148 = move 0
    %t_149 = move 0
    %t_150 = move 0
    %t_151 = move 0
    %t_152 = move 0
    %t_153 = move 0
    %t_154 = move 0
    %t_155 = move 0
    %t_156 = move 0
    %t_157 = move 0
    %t_158 = move 0
    %t_159 = move 0
    jump A_A_for_cond_1

A_A_for_cond_1:
    cmp %t_145 %t_144
    br slt A_A_for_body_1 A_A_for_merge_1

A_A_for_merge_1:
    store %t_142 %this_1 null 0 0
    %vrax_1 = move 0
    %vr15_1 = move %temp_vr15_2
    %vr12_1 = move %temp_vr12_2
    %vr14_1 = move %temp_vr14_2
    %vr13_1 = move %temp_vr13_2
    %vrbx_1 = move %temp_vrbx_2
    ret %vrax_1

A_A_for_body_1:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_160 = move %vrax_1
    store 2 %t_160 null 0 0
    store %t_160 %t_145 null 0 0
    %t_161 = move %t_160
    %t_161 = add %t_161 8
    %t_162 = move %t_160
    %t_162 = add %t_162 24
    %t_163 = move %t_146
    %t_164 = move %t_147
    %t_165 = move %t_148
    %t_166 = move %t_149
    %t_167 = move %t_150
    %t_168 = move %t_151
    %t_169 = move %t_152
    %t_170 = move %t_153
    %t_171 = move %t_154
    %t_172 = move %t_155
    %t_173 = move %t_156
    %t_174 = move %t_157
    %t_175 = move %t_161
    %t_176 = move %t_158
    %t_177 = move %t_159
    %breaker_24 = move %t_163
    %t_163 = move %t_163
    %breaker_24 = move %t_164
    %t_164 = move %t_164
    %breaker_24 = move %t_165
    %t_165 = move %t_165
    %breaker_24 = move %t_166
    %t_166 = move %t_166
    %breaker_24 = move %t_167
    %t_167 = move %t_167
    %breaker_24 = move %t_168
    %t_168 = move %t_168
    %breaker_24 = move %t_169
    %t_169 = move %t_169
    %breaker_24 = move %t_170
    %t_170 = move %t_170
    %breaker_24 = move %t_171
    %t_171 = move %t_171
    %breaker_24 = move %t_172
    %t_172 = move %t_172
    %breaker_24 = move %t_173
    %t_173 = move %t_173
    %breaker_24 = move %t_174
    %t_174 = move %t_174
    %breaker_24 = move %t_175
    %t_175 = move %t_175
    %breaker_24 = move %t_176
    %t_176 = move %t_176
    %breaker_24 = move %t_177
    jump A_A_for_cond_2

A_A_for_cond_2:
    cmp %t_175 %t_162
    br slt A_A_for_body_2 A_A_for_step_1

A_A_for_body_2:
    %vrdi_1 = move 32
    %vrax_1 = alloc %vrdi_1
    %t_178 = move %vrax_1
    store 3 %t_178 null 0 0
    store %t_178 %t_175 null 0 0
    %t_179 = move %t_178
    %t_179 = add %t_179 8
    %t_180 = move %t_178
    %t_180 = add %t_180 32
    %t_181 = move %t_163
    %t_182 = move %t_164
    %t_183 = move %t_165
    %t_184 = move %t_179
    %t_185 = move %t_167
    %t_186 = move %t_168
    %t_187 = move %t_169
    %t_188 = move %t_170
    %t_189 = move %t_171
    %t_190 = move %t_172
    %t_191 = move %t_173
    %t_192 = move %t_174
    %t_193 = move %t_177
    %breaker_25 = move %t_181
    %t_181 = move %t_181
    %breaker_25 = move %t_182
    %t_182 = move %t_182
    %breaker_25 = move %t_183
    %t_183 = move %t_183
    %breaker_25 = move %t_184
    %t_184 = move %t_184
    %breaker_25 = move %t_185
    %t_185 = move %t_185
    %breaker_25 = move %t_186
    %t_186 = move %t_186
    %breaker_25 = move %t_187
    %t_187 = move %t_187
    %breaker_25 = move %t_188
    %t_188 = move %t_188
    %breaker_25 = move %t_189
    %t_189 = move %t_189
    %breaker_25 = move %t_190
    %t_190 = move %t_190
    %breaker_25 = move %t_191
    %t_191 = move %t_191
    %breaker_25 = move %t_192
    %t_192 = move %t_192
    %breaker_25 = move %t_193
    jump A_A_for_cond_3

A_A_for_cond_3:
    cmp %t_184 %t_180
    br slt A_A_for_body_3 A_A_for_step_2

A_A_for_body_3:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_194 = move %vrax_1
    store 2 %t_194 null 0 0
    store %t_194 %t_184 null 0 0
    %t_195 = move %t_194
    %t_195 = add %t_195 8
    %t_196 = move %t_194
    %t_196 = add %t_196 24
    %t_197 = move %t_181
    %t_198 = move %t_182
    %t_199 = move %t_183
    %t_200 = move %t_185
    %t_201 = move %t_186
    %t_202 = move %t_187
    %t_203 = move %t_188
    %t_204 = move %t_189
    %t_205 = move %t_195
    %t_206 = move %t_192
    %t_207 = move %t_193
    %breaker_26 = move %t_197
    %t_197 = move %t_197
    %breaker_26 = move %t_198
    %t_198 = move %t_198
    %breaker_26 = move %t_199
    %t_199 = move %t_199
    %breaker_26 = move %t_200
    %t_200 = move %t_200
    %breaker_26 = move %t_201
    %t_201 = move %t_201
    %breaker_26 = move %t_202
    %t_202 = move %t_202
    %breaker_26 = move %t_203
    %t_203 = move %t_203
    %breaker_26 = move %t_204
    %t_204 = move %t_204
    %breaker_26 = move %t_205
    %t_205 = move %t_205
    %breaker_26 = move %t_206
    %t_206 = move %t_206
    %breaker_26 = move %t_207
    jump A_A_for_cond_4

A_A_for_cond_4:
    cmp %t_205 %t_196
    br slt A_A_for_body_4 A_A_for_step_3

A_A_for_step_3:
    %t_208 = move %t_184
    %t_208 = add %t_208 8
    %t_181 = move %t_197
    %t_182 = move %t_198
    %t_183 = move %t_199
    %t_184 = move %t_208
    %t_185 = move %t_200
    %t_186 = move %t_201
    %t_187 = move %t_202
    %t_188 = move %t_203
    %t_189 = move %t_204
    %t_190 = move %t_196
    %t_191 = move %t_205
    %t_192 = move %t_206
    %t_193 = move %t_207
    %breaker_27 = move %t_181
    %t_181 = move %t_181
    %breaker_27 = move %t_182
    %t_182 = move %t_182
    %breaker_27 = move %t_183
    %t_183 = move %t_183
    %breaker_27 = move %t_184
    %t_184 = move %t_184
    %breaker_27 = move %t_185
    %t_185 = move %t_185
    %breaker_27 = move %t_186
    %t_186 = move %t_186
    %breaker_27 = move %t_187
    %t_187 = move %t_187
    %breaker_27 = move %t_188
    %t_188 = move %t_188
    %breaker_27 = move %t_189
    %t_189 = move %t_189
    %breaker_27 = move %t_190
    %t_190 = move %t_190
    %breaker_27 = move %t_191
    %t_191 = move %t_191
    %breaker_27 = move %t_192
    %t_192 = move %t_192
    %breaker_27 = move %t_193
    jump A_A_for_cond_3

A_A_for_body_4:
    %vrdi_1 = move 32
    %vrax_1 = alloc %vrdi_1
    %t_209 = move %vrax_1
    store 3 %t_209 null 0 0
    store %t_209 %t_205 null 0 0
    %t_210 = move %t_209
    %t_210 = add %t_210 8
    %t_211 = move %t_209
    %t_211 = add %t_211 32
    %t_212 = move %t_197
    %t_213 = move %t_198
    %t_214 = move %t_199
    %t_215 = move %t_200
    %t_216 = move %t_201
    %t_217 = move %t_202
    %t_218 = move %t_203
    %t_219 = move %t_210
    %t_220 = move %t_207
    %breaker_28 = move %t_212
    %t_212 = move %t_212
    %breaker_28 = move %t_213
    %t_213 = move %t_213
    %breaker_28 = move %t_214
    %t_214 = move %t_214
    %breaker_28 = move %t_215
    %t_215 = move %t_215
    %breaker_28 = move %t_216
    %t_216 = move %t_216
    %breaker_28 = move %t_217
    %t_217 = move %t_217
    %breaker_28 = move %t_218
    %t_218 = move %t_218
    %breaker_28 = move %t_219
    %t_219 = move %t_219
    %breaker_28 = move %t_220
    jump A_A_for_cond_5

A_A_for_cond_5:
    cmp %t_219 %t_211
    br slt A_A_for_body_5 A_A_for_step_4

A_A_for_body_5:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_221 = move %vrax_1
    store 2 %t_221 null 0 0
    store %t_221 %t_219 null 0 0
    %t_222 = move %t_221
    %t_222 = add %t_222 8
    %t_223 = move %t_221
    %t_223 = add %t_223 24
    %t_224 = move %t_212
    %t_225 = move %t_213
    %t_226 = move %t_214
    %t_227 = move %t_215
    %t_228 = move %t_222
    %t_229 = move %t_217
    %t_230 = move %t_220
    %breaker_29 = move %t_224
    %t_224 = move %t_224
    %breaker_29 = move %t_225
    %t_225 = move %t_225
    %breaker_29 = move %t_226
    %t_226 = move %t_226
    %breaker_29 = move %t_227
    %t_227 = move %t_227
    %breaker_29 = move %t_228
    %t_228 = move %t_228
    %breaker_29 = move %t_229
    %t_229 = move %t_229
    %breaker_29 = move %t_230
    jump A_A_for_cond_6

A_A_for_cond_6:
    cmp %t_228 %t_223
    br slt A_A_for_body_6 A_A_for_step_5

A_A_for_step_5:
    %t_231 = move %t_219
    %t_231 = add %t_231 8
    %t_212 = move %t_224
    %t_213 = move %t_225
    %t_214 = move %t_226
    %t_215 = move %t_227
    %t_216 = move %t_228
    %t_217 = move %t_229
    %t_218 = move %t_223
    %t_219 = move %t_231
    %t_220 = move %t_230
    %breaker_30 = move %t_212
    %t_212 = move %t_212
    %breaker_30 = move %t_213
    %t_213 = move %t_213
    %breaker_30 = move %t_214
    %t_214 = move %t_214
    %breaker_30 = move %t_215
    %t_215 = move %t_215
    %breaker_30 = move %t_216
    %t_216 = move %t_216
    %breaker_30 = move %t_217
    %t_217 = move %t_217
    %breaker_30 = move %t_218
    %t_218 = move %t_218
    %breaker_30 = move %t_219
    %t_219 = move %t_219
    %breaker_30 = move %t_220
    jump A_A_for_cond_5

A_A_for_body_6:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_232 = move %vrax_1
    store 2 %t_232 null 0 0
    store %t_232 %t_228 null 0 0
    %t_233 = move %t_232
    %t_233 = add %t_233 8
    %t_234 = move %t_232
    %t_234 = add %t_234 24
    %t_235 = move %t_224
    %t_236 = move %t_225
    %t_237 = move %t_226
    %t_238 = move %t_227
    %t_239 = move %t_233
    %breaker_31 = move %t_235
    %t_235 = move %t_235
    %breaker_31 = move %t_236
    %t_236 = move %t_236
    %breaker_31 = move %t_237
    %t_237 = move %t_237
    %breaker_31 = move %t_238
    %t_238 = move %t_238
    %breaker_31 = move %t_239
    jump A_A_for_cond_7

A_A_for_cond_7:
    cmp %t_239 %t_234
    br slt A_A_for_body_7 A_A_for_step_6

A_A_for_step_6:
    %t_240 = move %t_228
    %t_240 = add %t_240 8
    %t_224 = move %t_235
    %t_225 = move %t_236
    %t_226 = move %t_237
    %t_227 = move %t_238
    %t_228 = move %t_240
    %t_229 = move %t_239
    %t_230 = move %t_234
    %breaker_32 = move %t_224
    %t_224 = move %t_224
    %breaker_32 = move %t_225
    %t_225 = move %t_225
    %breaker_32 = move %t_226
    %t_226 = move %t_226
    %breaker_32 = move %t_227
    %t_227 = move %t_227
    %breaker_32 = move %t_228
    %t_228 = move %t_228
    %breaker_32 = move %t_229
    %t_229 = move %t_229
    %breaker_32 = move %t_230
    jump A_A_for_cond_6

A_A_for_body_7:
    %vrdi_1 = move 32
    %vrax_1 = alloc %vrdi_1
    %t_241 = move %vrax_1
    store 3 %t_241 null 0 0
    store %t_241 %t_239 null 0 0
    %t_242 = move %t_241
    %t_242 = add %t_242 8
    %t_243 = move %t_241
    %t_243 = add %t_243 32
    %t_244 = move %t_242
    %t_245 = move %t_237
    %t_246 = move %t_238
    %breaker_33 = move %t_244
    %t_244 = move %t_244
    %breaker_33 = move %t_245
    %t_245 = move %t_245
    %breaker_33 = move %t_246
    jump A_A_for_cond_8

A_A_for_cond_8:
    cmp %t_244 %t_243
    br slt A_A_for_body_8 A_A_for_step_7

A_A_for_body_8:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_247 = move %vrax_1
    store 2 %t_247 null 0 0
    store %t_247 %t_244 null 0 0
    %t_248 = move %t_247
    %t_248 = add %t_248 8
    %t_249 = move %t_247
    %t_249 = add %t_249 24
    %t_250 = move %t_248
    %breaker_34 = move %t_250
    jump A_A_for_cond_9

A_A_for_cond_9:
    cmp %t_250 %t_249
    br slt A_A_for_body_9 A_A_for_step_8

A_A_for_step_8:
    %t_251 = move %t_244
    %t_251 = add %t_251 8
    %t_244 = move %t_251
    %t_245 = move %t_250
    %t_246 = move %t_249
    %breaker_35 = move %t_244
    %t_244 = move %t_244
    %breaker_35 = move %t_245
    %t_245 = move %t_245
    %breaker_35 = move %t_246
    jump A_A_for_cond_8

A_A_for_body_9:
    %vrdi_1 = move 24
    %vrax_1 = alloc %vrdi_1
    %t_252 = move %vrax_1
    store 2 %t_252 null 0 0
    store %t_252 %t_250 null 0 0
    %t_253 = move %t_250
    %t_253 = add %t_253 8
    %t_250 = move %t_253
    %breaker_36 = move %t_250
    jump A_A_for_cond_9

A_A_for_step_7:
    %t_254 = move %t_239
    %t_254 = add %t_254 8
    %t_235 = move %t_243
    %t_236 = move %t_244
    %t_237 = move %t_245
    %t_238 = move %t_246
    %t_239 = move %t_254
    %breaker_37 = move %t_235
    %t_235 = move %t_235
    %breaker_37 = move %t_236
    %t_236 = move %t_236
    %breaker_37 = move %t_237
    %t_237 = move %t_237
    %breaker_37 = move %t_238
    %t_238 = move %t_238
    %breaker_37 = move %t_239
    jump A_A_for_cond_7

A_A_for_step_4:
    %t_255 = move %t_205
    %t_255 = add %t_255 8
    %t_197 = move %t_212
    %t_198 = move %t_213
    %t_199 = move %t_214
    %t_200 = move %t_215
    %t_201 = move %t_216
    %t_202 = move %t_217
    %t_203 = move %t_218
    %t_204 = move %t_219
    %t_205 = move %t_255
    %t_206 = move %t_211
    %t_207 = move %t_220
    %breaker_38 = move %t_197
    %t_197 = move %t_197
    %breaker_38 = move %t_198
    %t_198 = move %t_198
    %breaker_38 = move %t_199
    %t_199 = move %t_199
    %breaker_38 = move %t_200
    %t_200 = move %t_200
    %breaker_38 = move %t_201
    %t_201 = move %t_201
    %breaker_38 = move %t_202
    %t_202 = move %t_202
    %breaker_38 = move %t_203
    %t_203 = move %t_203
    %breaker_38 = move %t_204
    %t_204 = move %t_204
    %breaker_38 = move %t_205
    %t_205 = move %t_205
    %breaker_38 = move %t_206
    %t_206 = move %t_206
    %breaker_38 = move %t_207
    jump A_A_for_cond_4

A_A_for_step_2:
    %t_256 = move %t_175
    %t_256 = add %t_256 8
    %t_163 = move %t_181
    %t_164 = move %t_182
    %t_165 = move %t_183
    %t_166 = move %t_184
    %t_167 = move %t_185
    %t_168 = move %t_186
    %t_169 = move %t_187
    %t_170 = move %t_188
    %t_171 = move %t_189
    %t_172 = move %t_190
    %t_173 = move %t_191
    %t_174 = move %t_192
    %t_175 = move %t_256
    %t_176 = move %t_180
    %t_177 = move %t_193
    %breaker_39 = move %t_163
    %t_163 = move %t_163
    %breaker_39 = move %t_164
    %t_164 = move %t_164
    %breaker_39 = move %t_165
    %t_165 = move %t_165
    %breaker_39 = move %t_166
    %t_166 = move %t_166
    %breaker_39 = move %t_167
    %t_167 = move %t_167
    %breaker_39 = move %t_168
    %t_168 = move %t_168
    %breaker_39 = move %t_169
    %t_169 = move %t_169
    %breaker_39 = move %t_170
    %t_170 = move %t_170
    %breaker_39 = move %t_171
    %t_171 = move %t_171
    %breaker_39 = move %t_172
    %t_172 = move %t_172
    %breaker_39 = move %t_173
    %t_173 = move %t_173
    %breaker_39 = move %t_174
    %t_174 = move %t_174
    %breaker_39 = move %t_175
    %t_175 = move %t_175
    %breaker_39 = move %t_176
    %t_176 = move %t_176
    %breaker_39 = move %t_177
    jump A_A_for_cond_2

A_A_for_step_1:
    %t_257 = move %t_145
    %t_257 = add %t_257 8
    %t_146 = move %t_163
    %t_147 = move %t_164
    %t_148 = move %t_165
    %t_149 = move %t_166
    %t_150 = move %t_167
    %t_151 = move %t_168
    %t_145 = move %t_257
    %t_152 = move %t_169
    %t_153 = move %t_170
    %t_154 = move %t_171
    %t_155 = move %t_172
    %t_156 = move %t_173
    %t_157 = move %t_174
    %t_158 = move %t_176
    %t_159 = move %t_177
    %breaker_40 = move %t_146
    %t_146 = move %t_146
    %breaker_40 = move %t_147
    %t_147 = move %t_147
    %breaker_40 = move %t_148
    %t_148 = move %t_148
    %breaker_40 = move %t_149
    %t_149 = move %t_149
    %breaker_40 = move %t_150
    %t_150 = move %t_150
    %breaker_40 = move %t_151
    %t_151 = move %t_151
    %breaker_40 = move %t_145
    %t_145 = move %t_145
    %breaker_40 = move %t_152
    %t_152 = move %t_152
    %breaker_40 = move %t_153
    %t_153 = move %t_153
    %breaker_40 = move %t_154
    %t_154 = move %t_154
    %breaker_40 = move %t_155
    %t_155 = move %t_155
    %breaker_40 = move %t_156
    %t_156 = move %t_156
    %breaker_40 = move %t_157
    %t_157 = move %t_157
    %breaker_40 = move %t_158
    %t_158 = move %t_158
    %breaker_40 = move %t_159
    jump A_A_for_cond_1

}

define i64 @quicksort  {
quicksort_entry_1:
    %temp_vr15_3 = move %vr15_1
    %temp_vr12_3 = move %vr12_1
    %temp_vr14_3 = move %vr14_1
    %temp_vr13_3 = move %vr13_1
    %temp_vrbx_3 = move %vrbx_1
    %r_1 = move %vrsi_1
    %l_1 = move %vrdi_1
    %a_left_2 = load @a_left_1 null 0 0
    %a_right_2 = load @a_right_1 null 0 0
    %a_2 = load @a_1 null 0 0
    %t_258 = load %a_2 %l_1 8 8
    %t_259 = move %l_1
    %t_259 = add %t_259 1
    %i_7 = move %t_259
    %breaker_41 = move %i_7
    %sum_3 = move 0
    %z_r_1 = move 0
    %z_l_1 = move 0
    jump quicksort_for_cond_1

quicksort_for_cond_1:
    cmp %i_7 %r_1
    br slt quicksort_for_body_1 quicksort_for_merge_1

quicksort_for_body_1:
    %sum_4 = move %sum_3
    %sum_4 = add %sum_4 1
    %t_260 = lea %a_2 %i_7 8 8
    %t_261 = load %t_260 null 0 0
    cmp %t_261 %t_258
    br slt quicksort_if_then_1 quicksort_if_else_1

quicksort_if_else_1:
    %z_r_2 = move %z_r_1
    %z_r_2 = add %z_r_2 1
    %t_262 = load %t_260 null 0 0
    store %t_262 %a_right_2 %z_r_1 8 8
    %z_r_3 = move %z_r_2
    %z_l_2 = move %z_l_1
    %breaker_42 = move %z_r_3
    %z_r_3 = move %z_r_3
    %breaker_42 = move %z_l_2
    jump quicksort_for_step_1

quicksort_if_then_1:
    %z_l_3 = move %z_l_1
    %z_l_3 = add %z_l_3 1
    %t_263 = load %t_260 null 0 0
    store %t_263 %a_left_2 %z_l_1 8 8
    %z_r_3 = move %z_r_1
    %z_l_2 = move %z_l_3
    %breaker_43 = move %z_r_3
    %z_r_3 = move %z_r_3
    %breaker_43 = move %z_l_2
    jump quicksort_for_step_1

quicksort_for_step_1:
    %i_8 = move %i_7
    %i_8 = add %i_8 1
    %sum_3 = move %sum_4
    %i_7 = move %i_8
    %z_r_1 = move %z_r_3
    %z_l_1 = move %z_l_2
    %breaker_44 = move %sum_3
    %sum_3 = move %sum_3
    %breaker_44 = move %i_7
    %i_7 = move %i_7
    %breaker_44 = move %z_r_1
    %z_r_1 = move %z_r_1
    %breaker_44 = move %z_l_1
    jump quicksort_for_cond_1

quicksort_for_merge_1:
    %p_1 = move %l_1
    %breaker_45 = move %p_1
    %i_9 = move 0
    jump quicksort_for_cond_2

quicksort_for_cond_2:
    cmp %i_9 %z_l_1
    br slt quicksort_for_body_2 quicksort_for_merge_2

quicksort_for_merge_2:
    %p_2 = move %p_1
    %p_2 = add %p_2 1
    store %t_258 %a_2 %p_1 8 8
    %p_3 = move %p_2
    %breaker_46 = move %p_3
    %i_10 = move 0
    jump quicksort_for_cond_3

quicksort_for_cond_3:
    cmp %i_10 %z_r_1
    br slt quicksort_for_body_3 quicksort_for_merge_3

quicksort_for_body_3:
    %p_4 = move %p_3
    %p_4 = add %p_4 1
    %t_264 = load %a_right_2 %i_10 8 8
    store %t_264 %a_2 %p_3 8 8
    %i_11 = move %i_10
    %i_11 = add %i_11 1
    %p_3 = move %p_4
    %i_10 = move %i_11
    %breaker_47 = move %p_3
    %p_3 = move %p_3
    %breaker_47 = move %i_10
    jump quicksort_for_cond_3

quicksort_for_merge_3:
    cmp %z_l_1 1
    br sgt quicksort_if_then_2 quicksort_parallel_copy_1

quicksort_if_then_2:
    %t_265 = move %l_1
    %t_265 = add %t_265 %z_l_1
    %vrdi_1 = move %l_1
    %vrsi_1 = move %t_265
    %vrax_1 = call quicksort %vrdi_1 %vrsi_1 
    %t_266 = move %vrax_1
    %t_267 = move %sum_3
    %t_267 = add %t_267 %t_266
    %sum_5 = move %t_267
    %breaker_48 = move %sum_5
    jump quicksort_if_merge_1

quicksort_parallel_copy_1:
    %sum_5 = move %sum_3
    %breaker_49 = move %sum_5
    jump quicksort_if_merge_1

quicksort_if_merge_1:
    cmp %z_r_1 1
    br sgt quicksort_if_then_3 quicksort_parallel_copy_2

quicksort_if_then_3:
    %t_268 = move %r_1
    %t_268 = sub %t_268 %z_r_1
    %vrdi_1 = move %t_268
    %vrsi_1 = move %r_1
    %vrax_1 = call quicksort %vrdi_1 %vrsi_1 
    %t_269 = move %vrax_1
    %t_270 = move %sum_5
    %t_270 = add %t_270 %t_269
    %sum_6 = move %t_270
    %breaker_50 = move %sum_6
    jump quicksort_if_merge_2

quicksort_parallel_copy_2:
    %sum_6 = move %sum_5
    %breaker_51 = move %sum_6
    jump quicksort_if_merge_2

quicksort_if_merge_2:
    %vrax_1 = move %sum_6
    %vr15_1 = move %temp_vr15_3
    %vr12_1 = move %temp_vr12_3
    %vr14_1 = move %temp_vr14_3
    %vr13_1 = move %temp_vr13_3
    %vrbx_1 = move %temp_vrbx_3
    ret %vrax_1

quicksort_for_body_2:
    %p_5 = move %p_1
    %p_5 = add %p_5 1
    %t_271 = load %a_left_2 %i_9 8 8
    store %t_271 %a_2 %p_1 8 8
    %i_12 = move %i_9
    %i_12 = add %i_12 1
    %p_1 = move %p_5
    %i_9 = move %i_12
    %breaker_52 = move %p_1
    %p_1 = move %p_1
    %breaker_52 = move %i_9
    jump quicksort_for_cond_2

}

define i64 @calc  {
calc_entry_1:
    %temp_vr15_4 = move %vr15_1
    %temp_vr12_4 = move %vr12_1
    %temp_vr14_4 = move %vr14_1
    %temp_vr13_4 = move %vr13_1
    %temp_vrbx_4 = move %vrbx_1
    %a_left_3 = load @a_left_1 null 0 0
    %a_right_3 = load @a_right_1 null 0 0
    %a_3 = load @a_1 null 0 0
    %n_2 = load @n_1 null 0 0
    %i_13 = move 1
    jump calc_for_cond_1

calc_for_cond_1:
    cmp %i_13 %n_2
    br sle calc_for_body_1 calc_for_merge_1

calc_for_merge_1:
    %i_14 = move %n_2
    %breaker_53 = move %i_14
    %sum_7 = move 0
    jump calc_for_cond_2

calc_for_cond_2:
    cmp %i_14 1
    br sge calc_for_body_2 calc_for_merge_2

calc_for_merge_2:
    %vrax_1 = move %sum_7
    %vr15_1 = move %temp_vr15_4
    %vr12_1 = move %temp_vr12_4
    %vr14_1 = move %temp_vr14_4
    %vr13_1 = move %temp_vr13_4
    %vrbx_1 = move %temp_vrbx_4
    ret %vrax_1

calc_for_body_2:
    %t_272 = lea %a_3 %i_14 8 8
    %t_273 = load %t_272 null 0 0
    %t_274 = load %a_left_3 %t_273 8 8
    %t_275 = load %t_272 null 0 0
    %t_276 = load %a_right_3 %t_275 8 8
    store %t_276 %a_right_3 %t_274 8 8
    store %t_274 %a_left_3 %t_276 8 8
    %t_277 = move %sum_7
    %t_277 = add %t_277 %t_276
    %t_278 = move %t_277
    %t_278 = sub %t_278 %t_274
    %t_279 = move %t_278
    %t_279 = sub %t_279 2
    %i_15 = move %i_14
    %i_15 = sub %i_15 1
    %sum_7 = move %t_279
    %i_14 = move %i_15
    %breaker_54 = move %sum_7
    %sum_7 = move %sum_7
    %breaker_54 = move %i_14
    jump calc_for_cond_2

calc_for_body_1:
    %t_280 = lea null %i_13 8 8
    %t_281 = move %i_13
    %t_281 = sub %t_281 1
    store %t_281 %a_left_3 %t_280 1 0
    %t_282 = move %i_13
    %t_282 = add %t_282 1
    store %t_282 %a_right_3 %t_280 1 0
    %i_13 = move %t_282
    %breaker_55 = move %i_13
    jump calc_for_cond_1

}

define i64 @mergesort  {
mergesort_entry_1:
    %temp_vr15_5 = move %vr15_1
    %temp_vr12_5 = move %vr12_1
    %temp_vr14_5 = move %vr14_1
    %temp_vr13_5 = move %vr13_1
    %temp_vrbx_5 = move %vrbx_1
    %r_2 = move %vrsi_1
    %l_2 = move %vrdi_1
    %a_left_4 = load @a_left_1 null 0 0
    %a_4 = load @a_1 null 0 0
    %a_right_4 = load @a_right_1 null 0 0
    %t_283 = move %l_2
    %t_283 = add %t_283 1
    cmp %t_283 %r_2
    br seq mergesort_if_then_1 mergesort_if_merge_1

mergesort_if_then_1:
    %t_284 = move 0
    jump mergesort_exit_1

mergesort_if_merge_1:
    %t_285 = move %l_2
    %t_285 = add %t_285 %r_2
    %t_286 = move %t_285
    %t_286 = shr %t_286 1
    %vrdi_1 = move %l_2
    %vrsi_1 = move %t_286
    %vrax_1 = call mergesort %vrdi_1 %vrsi_1 
    %t_287 = move %vrax_1
    %vrdi_1 = move %t_286
    %vrsi_1 = move %r_2
    %vrax_1 = call mergesort %vrdi_1 %vrsi_1 
    %t_288 = move %vrax_1
    %t_289 = lea %t_287 %t_288 1 0
    %i_16 = move %l_2
    %breaker_56 = move %i_16
    %n_l_1 = move 0
    jump mergesort_for_cond_1

mergesort_for_cond_1:
    cmp %i_16 %t_286
    br slt mergesort_for_body_1 mergesort_for_merge_1

mergesort_for_body_1:
    %n_l_2 = move %n_l_1
    %n_l_2 = add %n_l_2 1
    %t_290 = load %a_4 %i_16 8 8
    store %t_290 %a_left_4 %n_l_1 8 8
    %i_17 = move %i_16
    %i_17 = add %i_17 1
    %i_16 = move %i_17
    %n_l_1 = move %n_l_2
    %breaker_57 = move %i_16
    %i_16 = move %i_16
    %breaker_57 = move %n_l_1
    jump mergesort_for_cond_1

mergesort_for_merge_1:
    %i_18 = move %t_286
    %breaker_58 = move %i_18
    %n_r_1 = move 0
    jump mergesort_for_cond_2

mergesort_for_cond_2:
    cmp %i_18 %r_2
    br slt mergesort_for_body_2 mergesort_for_merge_2

mergesort_for_body_2:
    %n_r_2 = move %n_r_1
    %n_r_2 = add %n_r_2 1
    %t_291 = load %a_4 %i_18 8 8
    store %t_291 %a_right_4 %n_r_1 8 8
    %i_19 = move %i_18
    %i_19 = add %i_19 1
    %n_r_1 = move %n_r_2
    %i_18 = move %i_19
    %breaker_59 = move %n_r_1
    %n_r_1 = move %n_r_1
    %breaker_59 = move %i_18
    jump mergesort_for_cond_2

mergesort_for_merge_2:
    %sum_8 = move %t_289
    %z_1 = move %l_2
    %breaker_60 = move %sum_8
    %sum_8 = move %sum_8
    %breaker_60 = move %z_1
    %z_r_4 = move 0
    %z_l_4 = move 0
    jump mergesort_while_cond_1

mergesort_while_cond_1:
    cmp %z_l_4 %n_l_1
    br slt mergesort_lhs_then_1 mergesort_parallel_copy_1

mergesort_parallel_copy_1:
    %z_l_5 = move %z_l_4
    %z_2 = move %z_1
    %breaker_61 = move %z_l_5
    %z_l_5 = move %z_l_5
    %breaker_61 = move %z_2
    jump mergesort_while_cond_2

mergesort_lhs_then_1:
    cmp %z_r_4 %n_r_1
    br slt mergesort_while_body_1 mergesort_parallel_copy_2

mergesort_while_body_1:
    %sum_9 = move %sum_8
    %sum_9 = add %sum_9 1
    %t_292 = lea %a_left_4 %z_l_4 8 8
    %t_293 = lea %a_right_4 %z_r_4 8 8
    %t_294 = load %t_292 null 0 0
    %t_295 = load %t_293 null 0 0
    cmp %t_294 %t_295
    br slt mergesort_if_then_2 mergesort_if_else_1

mergesort_if_then_2:
    %z_3 = move %z_1
    %z_3 = add %z_3 1
    %z_l_6 = move %z_l_4
    %z_l_6 = add %z_l_6 1
    %t_296 = load %t_292 null 0 0
    store %t_296 %a_4 %z_1 8 8
    %sum_8 = move %sum_9
    %z_l_4 = move %z_l_6
    %z_1 = move %z_3
    %breaker_62 = move %sum_8
    %sum_8 = move %sum_8
    %breaker_62 = move %z_r_4
    %z_r_4 = move %breaker_62
    %breaker_62 = move %z_l_4
    %z_l_4 = move %z_l_4
    %breaker_62 = move %z_1
    jump mergesort_while_cond_1

mergesort_if_else_1:
    %z_4 = move %z_1
    %z_4 = add %z_4 1
    %z_r_5 = move %z_r_4
    %z_r_5 = add %z_r_5 1
    %t_297 = load %t_293 null 0 0
    store %t_297 %a_4 %z_1 8 8
    %sum_8 = move %sum_9
    %z_r_4 = move %z_r_5
    %z_1 = move %z_4
    %breaker_63 = move %sum_8
    %sum_8 = move %sum_8
    %breaker_63 = move %z_r_4
    %z_r_4 = move %z_r_4
    %breaker_63 = move %z_l_4
    %z_l_4 = move %breaker_63
    %breaker_63 = move %z_1
    jump mergesort_while_cond_1

mergesort_parallel_copy_2:
    %z_l_5 = move %z_l_4
    %z_2 = move %z_1
    %breaker_64 = move %z_l_5
    %z_l_5 = move %z_l_5
    %breaker_64 = move %z_2
    jump mergesort_while_cond_2

mergesort_while_cond_2:
    cmp %z_l_5 %n_l_1
    br slt mergesort_while_body_2 mergesort_parallel_copy_3

mergesort_parallel_copy_3:
    %z_r_6 = move %z_r_4
    %z_5 = move %z_2
    %breaker_65 = move %z_r_6
    %z_r_6 = move %z_r_6
    %breaker_65 = move %z_5
    jump mergesort_while_cond_3

mergesort_while_cond_3:
    cmp %z_r_6 %n_r_1
    br slt mergesort_while_body_3 mergesort_while_merge_1

mergesort_while_body_3:
    %z_6 = move %z_5
    %z_6 = add %z_6 1
    %z_r_7 = move %z_r_6
    %z_r_7 = add %z_r_7 1
    %t_298 = load %a_right_4 %z_r_6 8 8
    store %t_298 %a_4 %z_5 8 8
    %z_r_6 = move %z_r_7
    %z_5 = move %z_6
    %breaker_66 = move %z_r_6
    %z_r_6 = move %z_r_6
    %breaker_66 = move %z_5
    jump mergesort_while_cond_3

mergesort_while_merge_1:
    %t_284 = move %sum_8
    %breaker_67 = move %t_284
    jump mergesort_exit_1

mergesort_exit_1:
    %vrax_1 = move %t_284
    %vr15_1 = move %temp_vr15_5
    %vr12_1 = move %temp_vr12_5
    %vr14_1 = move %temp_vr14_5
    %vr13_1 = move %temp_vr13_5
    %vrbx_1 = move %temp_vrbx_5
    ret %vrax_1

mergesort_while_body_2:
    %z_7 = move %z_2
    %z_7 = add %z_7 1
    %z_l_7 = move %z_l_5
    %z_l_7 = add %z_l_7 1
    %t_299 = load %a_left_4 %z_l_5 8 8
    store %t_299 %a_4 %z_2 8 8
    %z_l_5 = move %z_l_7
    %z_2 = move %z_7
    %breaker_68 = move %z_l_5
    %z_l_5 = move %z_l_5
    %breaker_68 = move %z_2
    jump mergesort_while_cond_2

}

define i64 @heapsort  {
heapsort_entry_1:
    %temp_vr15_6 = move %vr15_1
    %temp_vr12_6 = move %vr12_1
    %temp_vr14_6 = move %vr14_1
    %temp_vr13_6 = move %vr13_1
    %temp_vrbx_6 = move %vrbx_1
    %heap_2 = load @heap_1 null 0 0
    %a_5 = load @a_1 null 0 0
    %n_3 = load @n_1 null 0 0
    %sum_10 = move 0
    %i_20 = move 1
    jump heapsort_for_cond_1

heapsort_for_cond_1:
    cmp %i_20 %n_3
    br sle heapsort_for_body_1 heapsort_for_merge_1

heapsort_for_merge_1:
    %sum_11 = move %sum_10
    %heap_size_1 = move %n_3
    %breaker_69 = move %sum_11
    %sum_11 = move %sum_11
    %breaker_69 = move %heap_size_1
    %l_3 = move 0
    %y_1 = move 0
    %i_21 = move 1
    %r_3 = move 0
    jump heapsort_for_cond_2

heapsort_for_cond_2:
    cmp %i_21 %n_3
    br sle heapsort_for_body_2 heapsort_for_merge_2

heapsort_for_body_2:
    %t_300 = move %heap_2
    %t_300 = add %t_300 16
    %t_301 = load %t_300 null 0 0
    store %t_301 %a_5 %i_21 8 8
    %heap_size_2 = move %heap_size_1
    %heap_size_2 = sub %heap_size_2 1
    %t_302 = load %heap_2 %heap_size_1 8 8
    store %t_302 %t_300 null 0 0
    %l_4 = move %l_3
    %sum_12 = move %sum_11
    %y_2 = move %y_1
    %r_4 = move %r_3
    %breaker_70 = move %l_4
    %l_4 = move %l_4
    %breaker_70 = move %sum_12
    %sum_12 = move %sum_12
    %breaker_70 = move %y_2
    %y_2 = move %y_2
    %breaker_70 = move %r_4
    %x_1 = move 1
    jump heapsort_while_cond_1

heapsort_while_cond_1:
    %t_303 = move %x_1
    %t_303 = shl %t_303 1
    cmp %t_303 %heap_size_2
    br sle heapsort_while_body_1 heapsort_parallel_copy_1

heapsort_parallel_copy_1:
    %l_5 = move %l_4
    %sum_13 = move %sum_12
    %y_3 = move %y_2
    %r_5 = move %r_4
    %breaker_71 = move %l_5
    %l_5 = move %l_5
    %breaker_71 = move %sum_13
    %sum_13 = move %sum_13
    %breaker_71 = move %y_3
    %y_3 = move %y_3
    %breaker_71 = move %r_5
    jump heapsort_for_step_1

heapsort_while_body_1:
    %t_304 = move %t_303
    %t_304 = add %t_304 1
    cmp %t_304 %heap_size_2
    br sle heapsort_if_then_1 heapsort_parallel_copy_2

heapsort_if_then_1:
    %sum_14 = move %sum_12
    %sum_14 = add %sum_14 1
    %t_305 = load %heap_2 %t_304 8 8
    %t_306 = load %heap_2 %t_303 8 8
    cmp %t_305 %t_306
    br slt heapsort_if_then_2 heapsort_parallel_copy_3

heapsort_parallel_copy_3:
    %sum_15 = move %sum_14
    %y_4 = move %t_303
    %breaker_72 = move %sum_15
    %sum_15 = move %sum_15
    %breaker_72 = move %y_4
    jump heapsort_if_merge_1

heapsort_if_then_2:
    %sum_15 = move %sum_14
    %y_4 = move %t_304
    %breaker_73 = move %sum_15
    %sum_15 = move %sum_15
    %breaker_73 = move %y_4
    jump heapsort_if_merge_1

heapsort_parallel_copy_2:
    %sum_15 = move %sum_12
    %y_4 = move %t_303
    %breaker_74 = move %sum_15
    %sum_15 = move %sum_15
    %breaker_74 = move %y_4
    jump heapsort_if_merge_1

heapsort_if_merge_1:
    %sum_16 = move %sum_15
    %sum_16 = add %sum_16 1
    %t_307 = lea %heap_2 %x_1 8 8
    %t_308 = lea %heap_2 %y_4 8 8
    %t_309 = load %t_307 null 0 0
    %t_310 = load %t_308 null 0 0
    cmp %t_309 %t_310
    br slt heapsort_parallel_copy_4 heapsort_if_merge_2

heapsort_parallel_copy_4:
    %l_5 = move %t_303
    %sum_13 = move %sum_16
    %y_3 = move %y_4
    %r_5 = move %t_304
    %breaker_75 = move %l_5
    %l_5 = move %l_5
    %breaker_75 = move %sum_13
    %sum_13 = move %sum_13
    %breaker_75 = move %y_3
    %y_3 = move %y_3
    %breaker_75 = move %r_5
    jump heapsort_for_step_1

heapsort_for_step_1:
    %i_22 = move %i_21
    %i_22 = add %i_22 1
    %l_3 = move %l_5
    %sum_11 = move %sum_13
    %heap_size_1 = move %heap_size_2
    %y_1 = move %y_3
    %i_21 = move %i_22
    %r_3 = move %r_5
    %breaker_76 = move %l_3
    %l_3 = move %l_3
    %breaker_76 = move %sum_11
    %sum_11 = move %sum_11
    %breaker_76 = move %heap_size_1
    %heap_size_1 = move %heap_size_1
    %breaker_76 = move %y_1
    %y_1 = move %y_1
    %breaker_76 = move %i_21
    %i_21 = move %i_21
    %breaker_76 = move %r_3
    jump heapsort_for_cond_2

heapsort_if_merge_2:
    %t_311 = load %t_307 null 0 0
    %t_312 = load %t_308 null 0 0
    store %t_312 %t_307 null 0 0
    store %t_311 %t_308 null 0 0
    %l_4 = move %t_303
    %sum_12 = move %sum_16
    %y_2 = move %x_1
    %r_4 = move %t_304
    %x_1 = move %y_4
    %breaker_77 = move %l_4
    %l_4 = move %l_4
    %breaker_77 = move %x_1
    %x_1 = move %x_1
    %breaker_77 = move %sum_12
    %sum_12 = move %sum_12
    %breaker_77 = move %r_4
    jump heapsort_while_cond_1

heapsort_for_merge_2:
    %vrax_1 = move %sum_11
    %vr15_1 = move %temp_vr15_6
    %vr12_1 = move %temp_vr12_6
    %vr14_1 = move %temp_vr14_6
    %vr13_1 = move %temp_vr13_6
    %vrbx_1 = move %temp_vrbx_6
    ret %vrax_1

heapsort_for_body_1:
    %t_313 = lea null %i_20 8 8
    %t_314 = load %a_5 %t_313 1 0
    store %t_314 %heap_2 %t_313 1 0
    %sum_17 = move %sum_10
    %x_2 = move %i_20
    %breaker_78 = move %sum_17
    %sum_17 = move %sum_17
    %breaker_78 = move %x_2
    jump heapsort_while_cond_2

heapsort_while_cond_2:
    cmp %x_2 1
    br sne heapsort_while_body_2 heapsort_parallel_copy_5

heapsort_parallel_copy_5:
    %sum_18 = move %sum_17
    %breaker_79 = move %sum_18
    jump heapsort_for_step_2

heapsort_while_body_2:
    %sum_19 = move %sum_17
    %sum_19 = add %sum_19 1
    %t_315 = lea %heap_2 %x_2 8 8
    %t_316 = move %x_2
    %t_316 = shr %t_316 1
    %t_317 = lea %heap_2 %t_316 8 8
    %t_318 = load %t_315 null 0 0
    %t_319 = load %t_317 null 0 0
    cmp %t_318 %t_319
    br sgt heapsort_parallel_copy_6 heapsort_if_merge_3

heapsort_if_merge_3:
    %t_320 = load %t_315 null 0 0
    %t_321 = load %t_317 null 0 0
    store %t_321 %t_315 null 0 0
    store %t_320 %t_317 null 0 0
    %sum_17 = move %sum_19
    %x_2 = move %t_316
    %breaker_80 = move %sum_17
    %sum_17 = move %sum_17
    %breaker_80 = move %x_2
    jump heapsort_while_cond_2

heapsort_parallel_copy_6:
    %sum_18 = move %sum_19
    %breaker_81 = move %sum_18
    jump heapsort_for_step_2

heapsort_for_step_2:
    %i_23 = move %i_20
    %i_23 = add %i_23 1
    %sum_10 = move %sum_18
    %i_20 = move %i_23
    %breaker_82 = move %sum_10
    %sum_10 = move %sum_10
    %breaker_82 = move %i_20
    jump heapsort_for_cond_1

}

define i64 @main  {
main_entry_1:
    %temp_vr15_7 = move %vr15_1
    %temp_vr12_7 = move %vr12_1
    %temp_vr14_7 = move %vr14_1
    %temp_vr13_7 = move %vr13_1
    %temp_vrbx_7 = move %vrbx_1
    %a_6 = load @a_1 null 0 0
    %bak_2 = load @bak_1 null 0 0
    %vrax_1 = call getInt 
    %t_322 = move %vrax_1
    %vrax_1 = call getInt 
    %t_323 = move %vrax_1
    %i_24 = move 1
    jump main_for_cond_1

main_for_cond_1:
    cmp %i_24 %t_322
    br sle main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_324 = lea %a_6 %i_24 8 8
    store %i_24 %t_324 null 0 0
    cmp %i_24 %t_323
    br sle main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_325 = move %t_323
    %t_325 = add %t_325 1
    %t_326 = move %t_325
    %t_326 = sub %t_326 %i_24
    store %t_326 %t_324 null 0 0
    jump main_if_merge_1

main_if_merge_1:
    %t_327 = lea null %i_24 8 8
    %t_328 = load %a_6 %t_327 1 0
    store %t_328 %bak_2 %t_327 1 0
    %i_25 = move %i_24
    %i_25 = add %i_25 1
    %i_24 = move %i_25
    %breaker_83 = move %i_24
    jump main_for_cond_1

main_for_merge_1:
    %t_329 = move %t_322
    %t_329 = add %t_329 1
    %vrdi_1 = move 1
    %vrsi_1 = move %t_329
    %vrax_1 = call quicksort %vrdi_1 %vrsi_1 
    %t_330 = move %vrax_1
    %i_26 = move 1
    jump main_faker_restore_for_cond_1

main_faker_restore_for_cond_1:
    cmp %i_26 %t_322
    br sle main_faker_restore_for_body_1 main_splitter_1

main_splitter_1:
    store %t_322 @n_1 null 0 0
    %vrax_1 = call calc 
    %t_331 = move %vrax_1
    %i_27 = move 1
    jump main_faker_restore_for_cond_2

main_faker_restore_for_cond_2:
    cmp %i_27 %t_322
    br sle main_faker_restore_for_body_2 main_splitter_2

main_faker_restore_for_body_2:
    %t_332 = lea null %i_27 8 8
    %t_333 = load %bak_2 %t_332 1 0
    store %t_333 %a_6 %t_332 1 0
    %i_28 = move %i_27
    %i_28 = add %i_28 1
    %i_27 = move %i_28
    %breaker_84 = move %i_27
    jump main_faker_restore_for_cond_2

main_splitter_2:
    %t_334 = move %t_322
    %t_334 = add %t_334 1
    %vrdi_1 = move 1
    %vrsi_1 = move %t_334
    %vrax_1 = call mergesort %vrdi_1 %vrsi_1 
    %t_335 = move %vrax_1
    %i_29 = move 1
    jump main_faker_restore_for_cond_3

main_faker_restore_for_cond_3:
    cmp %i_29 %t_322
    br sle main_faker_restore_for_body_3 main_splitter_3

main_faker_restore_for_body_3:
    %t_336 = lea null %i_29 8 8
    %t_337 = load %bak_2 %t_336 1 0
    store %t_337 %a_6 %t_336 1 0
    %i_30 = move %i_29
    %i_30 = add %i_30 1
    %i_29 = move %i_30
    %breaker_85 = move %i_29
    jump main_faker_restore_for_cond_3

main_splitter_3:
    store %t_322 @n_1 null 0 0
    %vrax_1 = call heapsort 
    %t_338 = move %vrax_1
    %vrdi_1 = move %t_330
    %vrax_1 = call toString %vrdi_1 
    %t_339 = move %vrax_1
    %vrdi_1 = move %t_339
    call println %vrdi_1 
    %vrdi_1 = move %t_331
    %vrax_1 = call toString %vrdi_1 
    %t_340 = move %vrax_1
    %vrdi_1 = move %t_340
    call println %vrdi_1 
    %vrdi_1 = move %t_335
    %vrax_1 = call toString %vrdi_1 
    %t_341 = move %vrax_1
    %vrdi_1 = move %t_341
    call println %vrdi_1 
    %vrdi_1 = move %t_338
    %vrax_1 = call toString %vrdi_1 
    %t_342 = move %vrax_1
    %vrdi_1 = move %t_342
    call println %vrdi_1 
    %vrdi_1 = move 8
    %vrax_1 = alloc %vrdi_1
    %t_343 = move %vrax_1
    %vrdi_1 = move %t_343
    call A_A %vrdi_1 
    call A_Optimizer 
    store %t_322 @n_1 null 0 0
    %vrax_1 = move 0
    %vr15_1 = move %temp_vr15_7
    %vr12_1 = move %temp_vr12_7
    %vr14_1 = move %temp_vr14_7
    %vr13_1 = move %temp_vr13_7
    %vrbx_1 = move %temp_vrbx_7
    ret %vrax_1

main_faker_restore_for_body_1:
    %t_344 = lea null %i_26 8 8
    %t_345 = load %bak_2 %t_344 1 0
    store %t_345 %a_6 %t_344 1 0
    %i_31 = move %i_26
    %i_31 = add %i_31 1
    %i_26 = move %i_31
    %breaker_86 = move %i_26
    jump main_faker_restore_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %temp_vr15_8 = move %vr15_1
    %temp_vr12_8 = move %vr12_1
    %temp_vr14_8 = move %vr14_1
    %temp_vr13_8 = move %vr13_1
    %temp_vrbx_8 = move %vrbx_1
    %vrdi_1 = move 800008
    %vrax_1 = alloc %vrdi_1
    %t_346 = move %vrax_1
    store 100000 %t_346 null 0 0
    %vrdi_1 = move 800008
    %vrax_1 = alloc %vrdi_1
    %t_347 = move %vrax_1
    store 100000 %t_347 null 0 0
    %vrdi_1 = move 800008
    %vrax_1 = alloc %vrdi_1
    %t_348 = move %vrax_1
    store 100000 %t_348 null 0 0
    %vrdi_1 = move 800008
    %vrax_1 = alloc %vrdi_1
    %t_349 = move %vrax_1
    store 100000 %t_349 null 0 0
    %vrdi_1 = move 800008
    %vrax_1 = alloc %vrdi_1
    %t_350 = move %vrax_1
    store 100000 %t_350 null 0 0
    store %t_347 @bak_1 null 0 0
    store %t_346 @a_1 null 0 0
    store %t_349 @a_right_1 null 0 0
    store %t_348 @a_left_1 null 0 0
    store %t_350 @heap_1 null 0 0
    %vrax_1 = call main 
    %t_351 = move %vrax_1
    store %t_347 @bak_1 null 0 0
    store %t_346 @a_1 null 0 0
    store %t_349 @a_right_1 null 0 0
    store %t_348 @a_left_1 null 0 0
    store %t_350 @heap_1 null 0 0
    store 100000 @N_1 null 0 0
    %vrax_1 = move %t_351
    %vr15_1 = move %temp_vr15_8
    %vr12_1 = move %temp_vr12_8
    %vr14_1 = move %temp_vr14_8
    %vr13_1 = move %temp_vr13_8
    %vrbx_1 = move %temp_vrbx_8
    ret %vrax_1

}


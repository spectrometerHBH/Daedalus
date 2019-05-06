@asciiTable_1
@MAXCHUNK_1
@MAXLENGTH_1
@chunks_1
@inputBuffer_1
@outputBuffer_1
@__str_const_1 = ""
@__str_const_2 = ""
@__str_const_3 = "nChunk > MAXCHUNK!"
@__str_const_4 = ""
@__str_const_5 = "Invalid input"
@__str_const_6 = ""
@__str_const_7 = "Not Found!"
@__str_const_8 = "C"
@__str_const_9 = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

define i64 @sha1  {
sha1_entry_1:
    %length_1 = move %vrsi_1
    %input_1 = move %vrdi_1
    %outputBuffer_2 = load @outputBuffer_1 null 0 0
    %MAXCHUNK_2 = load @MAXCHUNK_1 null 0 0
    %chunks_2 = load @chunks_1 null 0 0
    %t_1 = lea %length_1 null 0 8
    %t_2 = move %t_1
    %vrax_1 = move %t_2
    %vrdx_1 = move %rdx
    %vrcx_1 = move 64
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_2 = move %vrax_1
    %t_3 = move %t_2
    %t_3 = add %t_3 1
    cmp %t_3 %MAXCHUNK_2
    br sgt sha1_if_then_1 sha1_if_merge_1

sha1_if_then_1:
    %vrdi_1 = move @__str_const_3
    call println %vrdi_1 
    %t_4 = move 0
    jump sha1_exit_1

sha1_if_merge_1:
    %i_1 = move 0
    jump sha1_for_cond_1

sha1_for_cond_1:
    cmp %i_1 %t_3
    br slt sha1_for_body_1 sha1_for_merge_1

sha1_for_body_1:
    %j_1 = move 0
    jump sha1_for_cond_2

sha1_for_cond_2:
    cmp %j_1 80
    br slt sha1_for_body_2 sha1_for_step_1

sha1_for_step_1:
    %i_2 = move %i_1
    %i_2 = add %i_2 1
    %i_1 = move %i_2
    %breaker_1 = move %i_1
    jump sha1_for_cond_1

sha1_for_body_2:
    %t_5 = load %chunks_2 %i_1 8 8
    store 0 %t_5 %j_1 8 8
    %j_2 = move %j_1
    %j_2 = add %j_2 1
    %j_1 = move %j_2
    %breaker_2 = move %j_1
    jump sha1_for_cond_2

sha1_for_merge_1:
    %i_3 = move 0
    jump sha1_for_cond_3

sha1_for_cond_3:
    cmp %i_3 %length_1
    br slt sha1_for_body_3 sha1_for_merge_2

sha1_for_merge_2:
    %t_6 = move %i_3
    %vrax_1 = move %t_6
    %vrdx_1 = move %rdx
    %vrcx_1 = move 64
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_6 = move %vrax_1
    %t_7 = lea %chunks_2 %t_6 8 8
    %t_8 = move %i_3
    %vrax_1 = move %t_8
    %vrdx_1 = move %rdx
    %vrcx_1 = move 64
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_8 = move %vrdx_1
    %t_9 = move %t_8
    %vrax_1 = move %t_9
    %vrdx_1 = move %rdx
    %vrcx_1 = move 4
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_9 = move %vrax_1
    %t_10 = load %t_7 null 0 0
    %t_11 = lea null %t_9 8 8
    %t_12 = load %t_7 null 0 0
    %t_13 = move %i_3
    %vrax_1 = move %t_13
    %vrdx_1 = move %rdx
    %vrcx_1 = move 4
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_13 = move %vrdx_1
    %t_14 = move 3
    %t_14 = sub %t_14 %t_13
    %t_15 = move %t_14
    %t_15 = mul %t_15 8
    %t_16 = move 128
    %vrcx_1 = move %t_15
    %t_16 = shl %t_16 %vrcx_1
    %t_17 = load %t_12 %t_11 1 0
    %t_18 = move %t_17
    %t_18 = or %t_18 %t_16
    store %t_18 %t_10 %t_11 1 0
    %t_19 = lea %chunks_2 %t_3 8 0
    %t_20 = load %t_19 null 0 0
    %t_21 = move %length_1
    %t_21 = shl %t_21 3
    store %t_21 %t_20 null 0 128
    %t_22 = load %t_19 null 0 0
    %t_23 = move %length_1
    %t_23 = shr %t_23 29
    %t_24 = move %t_23
    %t_24 = and %t_24 7
    store %t_24 %t_22 null 0 120
    %t_25 = move 0
    %t_26 = move 0
    %h1_1 = move -271733879
    %t_27 = move 0
    %k_1 = move 0
    %h0_1 = move 1732584193
    %h4_1 = move -1009589776
    %h3_1 = move 271733878
    %x_1 = move 0
    %x_2 = move 0
    %f_1 = move 0
    %shift_1 = move 0
    %x_3 = move 0
    %shift_2 = move 0
    %h2_1 = move -1732584194
    %temp_1 = move 0
    %i_4 = move 0
    %t_28 = move 0
    %shift_3 = move 0
    jump sha1_for_cond_4

sha1_for_cond_4:
    cmp %i_4 %t_3
    br slt sha1_for_body_4 sha1_for_merge_3

sha1_for_body_4:
    %t_29 = move %t_25
    %t_30 = move %t_27
    %x_4 = move %x_3
    %shift_4 = move %shift_2
    %breaker_3 = move %t_29
    %t_29 = move %t_29
    %breaker_3 = move %t_30
    %t_30 = move %t_30
    %breaker_3 = move %x_4
    %x_4 = move %x_4
    %breaker_3 = move %shift_4
    %j_3 = move 16
    jump sha1_for_cond_5

sha1_for_cond_5:
    cmp %j_3 80
    br slt sha1_for_body_5 sha1_for_merge_4

sha1_for_merge_4:
    %t_31 = move %t_26
    %b_1 = move %h1_1
    %k_2 = move %k_1
    %e_1 = move %h4_1
    %x_5 = move %x_1
    %x_6 = move %x_2
    %f_2 = move %f_1
    %shift_5 = move %shift_1
    %c_1 = move %h2_1
    %d_1 = move %h3_1
    %a_1 = move %h0_1
    %temp_2 = move %temp_1
    %t_32 = move %t_28
    %shift_6 = move %shift_3
    %breaker_4 = move %t_31
    %t_31 = move %t_31
    %breaker_4 = move %b_1
    %b_1 = move %b_1
    %breaker_4 = move %k_2
    %k_2 = move %k_2
    %breaker_4 = move %e_1
    %e_1 = move %e_1
    %breaker_4 = move %x_5
    %x_5 = move %x_5
    %breaker_4 = move %x_6
    %x_6 = move %x_6
    %breaker_4 = move %f_2
    %f_2 = move %f_2
    %breaker_4 = move %shift_5
    %shift_5 = move %shift_5
    %breaker_4 = move %c_1
    %c_1 = move %c_1
    %breaker_4 = move %d_1
    %d_1 = move %d_1
    %breaker_4 = move %a_1
    %a_1 = move %a_1
    %breaker_4 = move %temp_2
    %temp_2 = move %temp_2
    %breaker_4 = move %t_32
    %t_32 = move %t_32
    %breaker_4 = move %shift_6
    %j_4 = move 0
    jump sha1_for_cond_6

sha1_for_cond_6:
    cmp %j_4 80
    br slt sha1_for_body_6 sha1_for_merge_5

sha1_for_merge_5:
    %t_33 = move %h0_1
    %t_33 = and %t_33 65535
    %t_34 = move %a_1
    %t_34 = and %t_34 65535
    %t_35 = move %t_33
    %t_35 = add %t_35 %t_34
    %t_36 = move %h0_1
    %t_36 = shr %t_36 16
    %t_37 = move %t_36
    %t_37 = and %t_37 65535
    %t_38 = move %a_1
    %t_38 = shr %t_38 16
    %t_39 = move %t_38
    %t_39 = and %t_39 65535
    %t_40 = move %t_37
    %t_40 = add %t_40 %t_39
    %t_41 = move %t_35
    %t_41 = shr %t_41 16
    %t_42 = move %t_40
    %t_42 = add %t_42 %t_41
    %t_43 = move %t_42
    %t_43 = and %t_43 65535
    %t_44 = move %t_43
    %t_44 = shl %t_44 16
    %t_45 = move %t_35
    %t_45 = and %t_45 65535
    %t_46 = move %t_44
    %t_46 = or %t_46 %t_45
    %t_47 = move %h1_1
    %t_47 = and %t_47 65535
    %t_48 = move %b_1
    %t_48 = and %t_48 65535
    %t_49 = move %t_47
    %t_49 = add %t_49 %t_48
    %t_50 = move %h1_1
    %t_50 = shr %t_50 16
    %t_51 = move %t_50
    %t_51 = and %t_51 65535
    %t_52 = move %b_1
    %t_52 = shr %t_52 16
    %t_53 = move %t_52
    %t_53 = and %t_53 65535
    %t_54 = move %t_51
    %t_54 = add %t_54 %t_53
    %t_55 = move %t_49
    %t_55 = shr %t_55 16
    %t_56 = move %t_54
    %t_56 = add %t_56 %t_55
    %t_57 = move %t_56
    %t_57 = and %t_57 65535
    %t_58 = move %t_57
    %t_58 = shl %t_58 16
    %t_59 = move %t_49
    %t_59 = and %t_59 65535
    %t_60 = move %t_58
    %t_60 = or %t_60 %t_59
    %t_61 = move %h2_1
    %t_61 = and %t_61 65535
    %t_62 = move %c_1
    %t_62 = and %t_62 65535
    %t_63 = move %t_61
    %t_63 = add %t_63 %t_62
    %t_64 = move %h2_1
    %t_64 = shr %t_64 16
    %t_65 = move %t_64
    %t_65 = and %t_65 65535
    %t_66 = move %c_1
    %t_66 = shr %t_66 16
    %t_67 = move %t_66
    %t_67 = and %t_67 65535
    %t_68 = move %t_65
    %t_68 = add %t_68 %t_67
    %t_69 = move %t_63
    %t_69 = shr %t_69 16
    %t_70 = move %t_68
    %t_70 = add %t_70 %t_69
    %t_71 = move %t_70
    %t_71 = and %t_71 65535
    %t_72 = move %t_71
    %t_72 = shl %t_72 16
    %t_73 = move %t_63
    %t_73 = and %t_73 65535
    %t_74 = move %t_72
    %t_74 = or %t_74 %t_73
    %t_75 = move %h3_1
    %t_75 = and %t_75 65535
    %t_76 = move %d_1
    %t_76 = and %t_76 65535
    %t_77 = move %t_75
    %t_77 = add %t_77 %t_76
    %t_78 = move %h3_1
    %t_78 = shr %t_78 16
    %t_79 = move %t_78
    %t_79 = and %t_79 65535
    %t_80 = move %d_1
    %t_80 = shr %t_80 16
    %t_81 = move %t_80
    %t_81 = and %t_81 65535
    %t_82 = move %t_79
    %t_82 = add %t_82 %t_81
    %t_83 = move %t_77
    %t_83 = shr %t_83 16
    %t_84 = move %t_82
    %t_84 = add %t_84 %t_83
    %t_85 = move %t_84
    %t_85 = and %t_85 65535
    %t_86 = move %t_85
    %t_86 = shl %t_86 16
    %t_87 = move %t_77
    %t_87 = and %t_87 65535
    %t_88 = move %t_86
    %t_88 = or %t_88 %t_87
    %t_89 = move %h4_1
    %t_89 = and %t_89 65535
    %t_90 = move %e_1
    %t_90 = and %t_90 65535
    %t_91 = move %t_89
    %t_91 = add %t_91 %t_90
    %t_92 = move %h4_1
    %t_92 = shr %t_92 16
    %t_93 = move %t_92
    %t_93 = and %t_93 65535
    %t_94 = move %e_1
    %t_94 = shr %t_94 16
    %t_95 = move %t_94
    %t_95 = and %t_95 65535
    %t_96 = move %t_93
    %t_96 = add %t_96 %t_95
    %t_97 = move %t_91
    %t_97 = shr %t_97 16
    %t_98 = move %t_96
    %t_98 = add %t_98 %t_97
    %t_99 = move %t_98
    %t_99 = and %t_99 65535
    %t_100 = move %t_99
    %t_100 = shl %t_100 16
    %t_101 = move %t_91
    %t_101 = and %t_101 65535
    %t_102 = move %t_100
    %t_102 = or %t_102 %t_101
    %i_5 = move %i_4
    %i_5 = add %i_5 1
    %t_25 = move %t_29
    %t_26 = move %t_31
    %h1_1 = move %t_60
    %t_27 = move %t_30
    %k_1 = move %k_2
    %h0_1 = move %t_46
    %h4_1 = move %t_102
    %h3_1 = move %t_88
    %x_1 = move %x_5
    %x_2 = move %x_6
    %f_1 = move %f_2
    %shift_1 = move %shift_5
    %x_3 = move %x_4
    %shift_2 = move %shift_4
    %h2_1 = move %t_74
    %temp_1 = move %temp_2
    %i_4 = move %i_5
    %t_28 = move %t_32
    %shift_3 = move %shift_6
    %breaker_5 = move %t_25
    %t_25 = move %t_25
    %breaker_5 = move %t_26
    %t_26 = move %t_26
    %breaker_5 = move %h1_1
    %h1_1 = move %h1_1
    %breaker_5 = move %t_27
    %t_27 = move %t_27
    %breaker_5 = move %k_1
    %k_1 = move %k_1
    %breaker_5 = move %h0_1
    %h0_1 = move %h0_1
    %breaker_5 = move %h4_1
    %h4_1 = move %h4_1
    %breaker_5 = move %h3_1
    %h3_1 = move %h3_1
    %breaker_5 = move %x_1
    %x_1 = move %x_1
    %breaker_5 = move %x_2
    %x_2 = move %x_2
    %breaker_5 = move %f_1
    %f_1 = move %f_1
    %breaker_5 = move %shift_1
    %shift_1 = move %shift_1
    %breaker_5 = move %x_3
    %x_3 = move %x_3
    %breaker_5 = move %shift_2
    %shift_2 = move %shift_2
    %breaker_5 = move %h2_1
    %h2_1 = move %h2_1
    %breaker_5 = move %temp_1
    %temp_1 = move %temp_1
    %breaker_5 = move %i_4
    %i_4 = move %i_4
    %breaker_5 = move %t_28
    %t_28 = move %t_28
    %breaker_5 = move %shift_3
    jump sha1_for_cond_4

sha1_for_body_6:
    cmp %j_4 20
    br slt sha1_if_then_2 sha1_if_else_1

sha1_if_else_1:
    cmp %j_4 40
    br slt sha1_if_then_3 sha1_if_else_2

sha1_if_else_2:
    cmp %j_4 60
    br slt sha1_if_then_4 sha1_if_else_3

sha1_if_else_3:
    %t_103 = move %b_1
    %t_103 = xor %t_103 %c_1
    %t_104 = move %t_103
    %t_104 = xor %t_104 %d_1
    %f_3 = move %t_104
    %breaker_6 = move %f_3
    %k_3 = move -899497514
    jump sha1_if_merge_2

sha1_if_then_4:
    %t_105 = move %b_1
    %t_105 = and %t_105 %c_1
    %t_106 = move %b_1
    %t_106 = and %t_106 %d_1
    %t_107 = move %t_105
    %t_107 = or %t_107 %t_106
    %t_108 = move %c_1
    %t_108 = and %t_108 %d_1
    %t_109 = move %t_107
    %t_109 = or %t_109 %t_108
    %f_3 = move %t_109
    %breaker_7 = move %f_3
    %k_3 = move -1894007588
    jump sha1_if_merge_2

sha1_if_then_3:
    %t_110 = move %b_1
    %t_110 = xor %t_110 %c_1
    %t_111 = move %t_110
    %t_111 = xor %t_111 %d_1
    %f_3 = move %t_111
    %breaker_8 = move %f_3
    %k_3 = move 1859775393
    jump sha1_if_merge_2

sha1_if_then_2:
    %t_112 = move %b_1
    %t_112 = and %t_112 %c_1
    %t_113 = not %b_1
    %t_114 = move %t_113
    %t_114 = and %t_114 %d_1
    %t_115 = move %t_112
    %t_115 = or %t_115 %t_114
    %f_3 = move %t_115
    %breaker_9 = move %f_3
    %k_3 = move 1518500249
    jump sha1_if_merge_2

sha1_if_merge_2:
    %t_116 = move %a_1
    %t_116 = and %t_116 134217727
    %t_117 = move %t_116
    %t_117 = shl %t_117 5
    %t_118 = move %a_1
    %t_118 = shr %t_118 27
    %t_119 = move %t_118
    %t_119 = and %t_119 31
    %t_120 = move %t_117
    %t_120 = or %t_120 %t_119
    %t_121 = move %t_120
    %t_121 = and %t_121 65535
    %t_122 = move %e_1
    %t_122 = and %t_122 65535
    %t_123 = move %t_121
    %t_123 = add %t_123 %t_122
    %t_124 = move %t_120
    %t_124 = shr %t_124 16
    %t_125 = move %t_124
    %t_125 = and %t_125 65535
    %t_126 = move %e_1
    %t_126 = shr %t_126 16
    %t_127 = move %t_126
    %t_127 = and %t_127 65535
    %t_128 = move %t_125
    %t_128 = add %t_128 %t_127
    %t_129 = move %t_123
    %t_129 = shr %t_129 16
    %t_130 = move %t_128
    %t_130 = add %t_130 %t_129
    %t_131 = move %t_130
    %t_131 = and %t_131 65535
    %t_132 = move %t_131
    %t_132 = shl %t_132 16
    %t_133 = move %t_123
    %t_133 = and %t_133 65535
    %t_134 = move %t_132
    %t_134 = or %t_134 %t_133
    %t_135 = move %f_3
    %t_135 = and %t_135 65535
    %t_136 = move %k_3
    %t_136 = and %t_136 65535
    %t_137 = move %t_135
    %t_137 = add %t_137 %t_136
    %t_138 = move %f_3
    %t_138 = shr %t_138 16
    %t_139 = move %t_138
    %t_139 = and %t_139 65535
    %t_140 = move %k_3
    %t_140 = shr %t_140 16
    %t_141 = move %t_140
    %t_141 = and %t_141 65535
    %t_142 = move %t_139
    %t_142 = add %t_142 %t_141
    %t_143 = move %t_137
    %t_143 = shr %t_143 16
    %t_144 = move %t_142
    %t_144 = add %t_144 %t_143
    %t_145 = move %t_144
    %t_145 = and %t_145 65535
    %t_146 = move %t_145
    %t_146 = shl %t_146 16
    %t_147 = move %t_137
    %t_147 = and %t_147 65535
    %t_148 = move %t_146
    %t_148 = or %t_148 %t_147
    %t_149 = move %t_134
    %t_149 = and %t_149 65535
    %t_150 = move %t_148
    %t_150 = and %t_150 65535
    %t_151 = move %t_149
    %t_151 = add %t_151 %t_150
    %t_152 = move %t_134
    %t_152 = shr %t_152 16
    %t_153 = move %t_152
    %t_153 = and %t_153 65535
    %t_154 = move %t_148
    %t_154 = shr %t_154 16
    %t_155 = move %t_154
    %t_155 = and %t_155 65535
    %t_156 = move %t_153
    %t_156 = add %t_156 %t_155
    %t_157 = move %t_151
    %t_157 = shr %t_157 16
    %t_158 = move %t_156
    %t_158 = add %t_158 %t_157
    %t_159 = move %t_158
    %t_159 = and %t_159 65535
    %t_160 = move %t_159
    %t_160 = shl %t_160 16
    %t_161 = move %t_151
    %t_161 = and %t_161 65535
    %t_162 = move %t_160
    %t_162 = or %t_162 %t_161
    %t_163 = load %chunks_2 %i_4 8 8
    %t_164 = load %t_163 %j_4 8 8
    %t_165 = move %t_162
    %t_165 = and %t_165 65535
    %t_166 = move %t_164
    %t_166 = and %t_166 65535
    %t_167 = move %t_165
    %t_167 = add %t_167 %t_166
    %t_168 = move %t_162
    %t_168 = shr %t_168 16
    %t_169 = move %t_168
    %t_169 = and %t_169 65535
    %t_170 = move %t_164
    %t_170 = shr %t_170 16
    %t_171 = move %t_170
    %t_171 = and %t_171 65535
    %t_172 = move %t_169
    %t_172 = add %t_172 %t_171
    %t_173 = move %t_167
    %t_173 = shr %t_173 16
    %t_174 = move %t_172
    %t_174 = add %t_174 %t_173
    %t_175 = move %t_174
    %t_175 = and %t_175 65535
    %t_176 = move %t_175
    %t_176 = shl %t_176 16
    %t_177 = move %t_167
    %t_177 = and %t_177 65535
    %t_178 = move %t_176
    %t_178 = or %t_178 %t_177
    %t_179 = move %b_1
    %t_179 = and %t_179 3
    %t_180 = move %t_179
    %t_180 = shl %t_180 30
    %t_181 = move %b_1
    %t_181 = shr %t_181 2
    %t_182 = move %t_181
    %t_182 = and %t_182 1073741823
    %t_183 = move %t_180
    %t_183 = or %t_183 %t_182
    %j_5 = move %j_4
    %j_5 = add %j_5 1
    %j_4 = move %j_5
    %t_31 = move %t_183
    %k_2 = move %k_3
    %e_1 = move %d_1
    %x_5 = move %b_1
    %x_6 = move %a_1
    %f_2 = move %f_3
    %temp_2 = move %t_178
    %t_32 = move %t_120
    %d_1 = move %c_1
    %b_1 = move %x_6
    %a_1 = move %temp_2
    %c_1 = move %t_31
    %breaker_10 = move %j_4
    %j_4 = move %j_4
    %breaker_10 = move %b_1
    %b_1 = move %b_1
    %breaker_10 = move %k_2
    %k_2 = move %k_2
    %breaker_10 = move %e_1
    %e_1 = move %e_1
    %breaker_10 = move %f_2
    %f_2 = move %f_2
    %breaker_10 = move %c_1
    %c_1 = move %c_1
    %breaker_10 = move %a_1
    %a_1 = move %a_1
    %breaker_10 = move %t_32
    %shift_5 = move 5
    %shift_6 = move 30
    jump sha1_for_cond_6

sha1_for_body_5:
    %t_184 = lea %chunks_2 %i_4 8 8
    %t_185 = load %t_184 null 0 0
    %t_186 = lea %t_185 %j_3 8 8
    %t_187 = load %t_184 null 0 0
    %t_188 = load %t_184 null 0 0
    %t_189 = load %t_187 %j_3 8 -16
    %t_190 = load %t_188 %j_3 8 -56
    %t_191 = move %t_189
    %t_191 = xor %t_191 %t_190
    %t_192 = load %t_184 null 0 0
    %t_193 = load %t_192 %j_3 8 -104
    %t_194 = move %t_191
    %t_194 = xor %t_194 %t_193
    %t_195 = load %t_184 null 0 0
    %t_196 = load %t_195 %j_3 8 -120
    %t_197 = move %t_194
    %t_197 = xor %t_197 %t_196
    %t_198 = move %t_197
    %t_198 = and %t_198 2147483647
    %t_199 = move %t_198
    %t_199 = shl %t_199 1
    %t_200 = move %t_197
    %t_200 = shr %t_200 31
    %t_201 = move %t_200
    %t_201 = and %t_201 1
    %t_202 = move %t_199
    %t_202 = or %t_202 %t_201
    store %t_202 %t_186 null 0 0
    %j_6 = move %j_3
    %j_6 = add %j_6 1
    %t_29 = move %t_186
    %j_3 = move %j_6
    %t_30 = move %t_202
    %x_4 = move %t_197
    %breaker_11 = move %t_29
    %t_29 = move %t_29
    %breaker_11 = move %j_3
    %j_3 = move %j_3
    %breaker_11 = move %t_30
    %t_30 = move %t_30
    %breaker_11 = move %x_4
    %shift_4 = move 1
    jump sha1_for_cond_5

sha1_for_merge_3:
    store %h0_1 %outputBuffer_2 null 0 8
    store %h1_1 %outputBuffer_2 null 0 16
    store %h2_1 %outputBuffer_2 null 0 24
    store %h3_1 %outputBuffer_2 null 0 32
    store %h4_1 %outputBuffer_2 null 0 40
    %t_4 = move %outputBuffer_2
    %breaker_12 = move %t_4
    jump sha1_exit_1

sha1_exit_1:
    %vrax_1 = move %t_4
    ret %vrax_1

sha1_for_body_3:
    %t_203 = move %i_3
    %vrax_1 = move %t_203
    %vrdx_1 = move %rdx
    %vrcx_1 = move 64
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_203 = move %vrax_1
    %t_204 = lea %chunks_2 %t_203 8 8
    %t_205 = move %i_3
    %vrax_1 = move %t_205
    %vrdx_1 = move %rdx
    %vrcx_1 = move 64
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_205 = move %vrdx_1
    %t_206 = move %t_205
    %vrax_1 = move %t_206
    %vrdx_1 = move %rdx
    %vrcx_1 = move 4
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_206 = move %vrax_1
    %t_207 = load %t_204 null 0 0
    %t_208 = lea null %t_206 8 8
    %t_209 = load %t_204 null 0 0
    %t_210 = move %i_3
    %vrax_1 = move %t_210
    %vrdx_1 = move %rdx
    %vrcx_1 = move 4
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_210 = move %vrdx_1
    %t_211 = move 3
    %t_211 = sub %t_211 %t_210
    %t_212 = move %t_211
    %t_212 = mul %t_212 8
    %t_213 = load %input_1 %i_3 8 8
    %t_214 = move %t_213
    %vrcx_1 = move %t_212
    %t_214 = shl %t_214 %vrcx_1
    %t_215 = load %t_209 %t_208 1 0
    %t_216 = move %t_215
    %t_216 = or %t_216 %t_214
    store %t_216 %t_207 %t_208 1 0
    %i_6 = move %i_3
    %i_6 = add %i_6 1
    %i_3 = move %i_6
    %breaker_13 = move %i_3
    jump sha1_for_cond_3

}

define i64 @main  {
main_entry_1:
    %asciiTable_2 = load @asciiTable_1 null 0 0
    %inputBuffer_2 = load @inputBuffer_1 null 0 0
    %digit_1 = move 0
    %i_7 = move 0
    %i_8 = move 0
    %input_2 = move 0
    %t_217 = move 0
    %result_1 = move 0
    %t_218 = move 0
    %t_219 = move 0
    %now_1 = move 0
    %x_7 = move 0
    %t_220 = move 0
    %i_9 = move 0
    %digit_2 = move 0
    %x_8 = move 0
    %x_9 = move 0
    %x_10 = move 0
    %digit_3 = move 0
    %input_3 = move 0
    %now_2 = move 0
    %x_11 = move 0
    %t_221 = move 0
    %i_10 = move 0
    %result_2 = move 0
    %t_222 = move 0
    %MAXDIGIT_1 = move 0
    %t_223 = move 0
    %target_1 = move 0
    %t_224 = move 0
    %i_11 = move 0
    %a_2 = move 0
    %t_225 = move 0
    %b_2 = move 0
    %ret_1 = move 0
    %t_226 = move 0
    %i_12 = move 0
    jump main_while_body_1

main_while_body_1:
    %vrax_1 = call getInt 
    %t_227 = move %vrax_1
    cmp %t_227 0
    br seq main_while_merge_1 main_if_merge_1

main_if_merge_1:
    cmp %t_227 1
    br seq main_if_then_1 main_if_else_1

main_if_then_1:
    %vrax_1 = call getString 
    %t_228 = move %vrax_1
    %i_13 = move 0
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_cond_1:
    %t_229 = load %t_228 null 0 0
    cmp %i_13 %t_229
    br slt main_faker_computeSHA1_for_body_1 main_faker_computeSHA1_for_merge_1

main_faker_computeSHA1_for_body_1:
    %vrdi_1 = move %t_228
    %vrsi_1 = move %i_13
    %vrax_1 = call string.ord %vrdi_1 %vrsi_1 
    %t_230 = move %vrax_1
    store %t_230 %inputBuffer_2 %i_13 8 8
    %i_14 = move %i_13
    %i_14 = add %i_14 1
    %i_13 = move %i_14
    %breaker_14 = move %i_13
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_merge_1:
    %t_231 = load %t_228 null 0 0
    %vrdi_1 = move %inputBuffer_2
    %vrsi_1 = move %t_231
    %vrax_1 = call sha1 %vrdi_1 %vrsi_1 
    %t_232 = move %vrax_1
    %i_15 = move %i_7
    %x_12 = move %x_7
    %digit_4 = move %digit_2
    %x_13 = move %x_9
    %x_14 = move %x_10
    %t_233 = move %t_223
    %ret_2 = move %ret_1
    %t_234 = move %t_226
    %breaker_15 = move %i_15
    %i_15 = move %i_15
    %breaker_15 = move %x_12
    %x_12 = move %x_12
    %breaker_15 = move %digit_4
    %digit_4 = move %digit_4
    %breaker_15 = move %x_13
    %x_13 = move %x_13
    %breaker_15 = move %x_14
    %x_14 = move %x_14
    %breaker_15 = move %t_233
    %t_233 = move %t_233
    %breaker_15 = move %ret_2
    %ret_2 = move %ret_2
    %breaker_15 = move %t_234
    %i_16 = move 0
    jump main_faker_computeSHA1_for_cond_2

main_faker_computeSHA1_for_cond_2:
    %t_235 = load %t_232 null 0 0
    cmp %i_16 %t_235
    br slt main_faker_computeSHA1_for_body_2 main_splitter_1

main_splitter_1:
    %vrdi_1 = move @__str_const_4
    call println %vrdi_1 
    %i_7 = move %i_15
    %input_2 = move %t_228
    %x_7 = move %x_12
    %digit_2 = move %digit_4
    %x_9 = move %x_13
    %x_10 = move %x_14
    %result_2 = move %t_232
    %t_223 = move %t_233
    %ret_1 = move %ret_2
    %t_226 = move %t_234
    %i_12 = move %i_16
    %breaker_16 = move %digit_1
    %digit_1 = move %breaker_16
    %breaker_16 = move %i_7
    %i_7 = move %i_7
    %breaker_16 = move %i_8
    %i_8 = move %breaker_16
    %breaker_16 = move %input_2
    %input_2 = move %input_2
    %breaker_16 = move %t_217
    %t_217 = move %breaker_16
    %breaker_16 = move %result_1
    %result_1 = move %breaker_16
    %breaker_16 = move %t_218
    %t_218 = move %breaker_16
    %breaker_16 = move %t_219
    %t_219 = move %breaker_16
    %breaker_16 = move %now_1
    %now_1 = move %breaker_16
    %breaker_16 = move %x_7
    %x_7 = move %x_7
    %breaker_16 = move %t_220
    %t_220 = move %breaker_16
    %breaker_16 = move %i_9
    %i_9 = move %breaker_16
    %breaker_16 = move %digit_2
    %digit_2 = move %digit_2
    %breaker_16 = move %x_8
    %x_8 = move %breaker_16
    %breaker_16 = move %x_9
    %x_9 = move %x_9
    %breaker_16 = move %x_10
    %x_10 = move %x_10
    %breaker_16 = move %digit_3
    %digit_3 = move %breaker_16
    %breaker_16 = move %input_3
    %input_3 = move %breaker_16
    %breaker_16 = move %now_2
    %now_2 = move %breaker_16
    %breaker_16 = move %x_11
    %x_11 = move %breaker_16
    %breaker_16 = move %t_221
    %t_221 = move %breaker_16
    %breaker_16 = move %i_10
    %i_10 = move %breaker_16
    %breaker_16 = move %result_2
    %result_2 = move %result_2
    %breaker_16 = move %t_222
    %t_222 = move %breaker_16
    %breaker_16 = move %MAXDIGIT_1
    %MAXDIGIT_1 = move %breaker_16
    %breaker_16 = move %t_223
    %t_223 = move %t_223
    %breaker_16 = move %target_1
    %target_1 = move %breaker_16
    %breaker_16 = move %t_224
    %t_224 = move %breaker_16
    %breaker_16 = move %i_11
    %i_11 = move %breaker_16
    %breaker_16 = move %a_2
    %a_2 = move %breaker_16
    %breaker_16 = move %t_225
    %t_225 = move %breaker_16
    %breaker_16 = move %b_2
    %b_2 = move %breaker_16
    %breaker_16 = move %ret_1
    %ret_1 = move %ret_1
    %breaker_16 = move %t_226
    %t_226 = move %t_226
    %breaker_16 = move %i_12
    jump main_while_body_1

main_faker_computeSHA1_for_body_2:
    %t_236 = load %t_232 %i_16 8 8
    %x_15 = move %x_12
    %digit_5 = move %digit_4
    %x_16 = move %x_14
    %t_237 = move %t_233
    %ret_3 = move @__str_const_2
    %t_238 = move %t_234
    %breaker_17 = move %x_15
    %x_15 = move %x_15
    %breaker_17 = move %digit_5
    %digit_5 = move %digit_5
    %breaker_17 = move %x_16
    %x_16 = move %x_16
    %breaker_17 = move %t_237
    %t_237 = move %t_237
    %breaker_17 = move %ret_3
    %ret_3 = move %ret_3
    %breaker_17 = move %t_238
    %i_17 = move 28
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_faker_toStringHex_for_cond_1:
    cmp %i_17 0
    br sge main_faker_computeSHA1_faker_toStringHex_for_body_1 main_faker_computeSHA1_splitter_1

main_faker_computeSHA1_faker_toStringHex_for_body_1:
    %t_239 = move %t_236
    %vrcx_1 = move %i_17
    %t_239 = shr %t_239 %vrcx_1
    %t_240 = move %t_239
    %t_240 = and %t_240 15
    cmp %t_240 10
    br slt main_faker_computeSHA1_faker_toStringHex_if_then_1 main_faker_computeSHA1_faker_toStringHex_if_else_1

main_faker_computeSHA1_faker_toStringHex_if_then_1:
    %t_241 = move 48
    %t_241 = add %t_241 %t_240
    cmp %t_241 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1:
    cmp %t_241 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1:
    %t_242 = move %t_241
    %t_242 = sub %t_242 32
    %vrdi_1 = move %asciiTable_2
    %vrsi_1 = move %t_242
    %vrdx_1 = move %t_242
    %vrax_1 = call string.substring %vrdi_1 %vrsi_1 %vrdx_1 
    %t_243 = move %vrax_1
    %t_244 = move %t_243
    %breaker_18 = move %t_244
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1:
    %t_244 = move @__str_const_1
    %breaker_19 = move %t_244
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_splitter_1:
    %vrdi_1 = move %ret_3
    %vrsi_1 = move %t_244
    %vrax_1 = call string.add %vrdi_1 %vrsi_1 
    %t_245 = move %vrax_1
    %x_17 = move %x_15
    %x_18 = move %t_241
    %t_246 = move %t_244
    %ret_4 = move %t_245
    %t_247 = move %t_238
    %breaker_20 = move %x_17
    %x_17 = move %x_17
    %breaker_20 = move %x_18
    %x_18 = move %x_18
    %breaker_20 = move %t_246
    %t_246 = move %t_246
    %breaker_20 = move %ret_4
    %ret_4 = move %ret_4
    %breaker_20 = move %t_247
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_if_else_1:
    %t_248 = lea %t_240 null 0 55
    cmp %t_248 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2:
    cmp %t_248 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2:
    %t_249 = move %t_248
    %t_249 = sub %t_249 32
    %vrdi_1 = move %asciiTable_2
    %vrsi_1 = move %t_249
    %vrdx_1 = move %t_249
    %vrax_1 = call string.substring %vrdi_1 %vrsi_1 %vrdx_1 
    %t_250 = move %vrax_1
    %t_251 = move %t_250
    %breaker_21 = move %t_251
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2:
    %t_251 = move @__str_const_1
    %breaker_22 = move %t_251
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_splitter_2:
    %vrdi_1 = move %ret_3
    %vrsi_1 = move %t_251
    %vrax_1 = call string.add %vrdi_1 %vrsi_1 
    %t_252 = move %vrax_1
    %x_17 = move %t_248
    %x_18 = move %x_16
    %t_246 = move %t_237
    %ret_4 = move %t_252
    %t_247 = move %t_251
    %breaker_23 = move %x_17
    %x_17 = move %x_17
    %breaker_23 = move %x_18
    %x_18 = move %x_18
    %breaker_23 = move %t_246
    %t_246 = move %t_246
    %breaker_23 = move %ret_4
    %ret_4 = move %ret_4
    %breaker_23 = move %t_247
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_for_step_1:
    %t_253 = move %i_17
    %t_253 = sub %t_253 4
    %i_17 = move %t_253
    %x_15 = move %x_17
    %digit_5 = move %t_240
    %x_16 = move %x_18
    %t_237 = move %t_246
    %ret_3 = move %ret_4
    %t_238 = move %t_247
    %breaker_24 = move %i_17
    %i_17 = move %i_17
    %breaker_24 = move %x_15
    %x_15 = move %x_15
    %breaker_24 = move %digit_5
    %digit_5 = move %digit_5
    %breaker_24 = move %x_16
    %x_16 = move %x_16
    %breaker_24 = move %t_237
    %t_237 = move %t_237
    %breaker_24 = move %ret_3
    %ret_3 = move %ret_3
    %breaker_24 = move %t_238
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_splitter_1:
    %vrdi_1 = move %ret_3
    call print %vrdi_1 
    %i_18 = move %i_16
    %i_18 = add %i_18 1
    %i_15 = move %i_17
    %x_12 = move %x_15
    %digit_4 = move %digit_5
    %x_13 = move %t_236
    %x_14 = move %x_16
    %t_233 = move %t_237
    %ret_2 = move %ret_3
    %t_234 = move %t_238
    %i_16 = move %i_18
    %breaker_25 = move %i_15
    %i_15 = move %i_15
    %breaker_25 = move %x_12
    %x_12 = move %x_12
    %breaker_25 = move %digit_4
    %digit_4 = move %digit_4
    %breaker_25 = move %x_13
    %x_13 = move %x_13
    %breaker_25 = move %x_14
    %x_14 = move %x_14
    %breaker_25 = move %t_233
    %t_233 = move %t_233
    %breaker_25 = move %ret_2
    %ret_2 = move %ret_2
    %breaker_25 = move %t_234
    %t_234 = move %t_234
    %breaker_25 = move %i_16
    jump main_faker_computeSHA1_for_cond_2

main_if_else_1:
    cmp %t_227 2
    br seq main_if_then_2 main_parallel_copy_1

main_parallel_copy_1:
    %breaker_26 = move %digit_1
    %digit_1 = move %breaker_26
    %breaker_26 = move %i_7
    %i_7 = move %breaker_26
    %breaker_26 = move %i_8
    %i_8 = move %breaker_26
    %breaker_26 = move %input_2
    %input_2 = move %breaker_26
    %breaker_26 = move %t_217
    %t_217 = move %breaker_26
    %breaker_26 = move %result_1
    %result_1 = move %breaker_26
    %breaker_26 = move %t_218
    %t_218 = move %breaker_26
    %breaker_26 = move %t_219
    %t_219 = move %breaker_26
    %breaker_26 = move %now_1
    %now_1 = move %breaker_26
    %breaker_26 = move %x_7
    %x_7 = move %breaker_26
    %breaker_26 = move %t_220
    %t_220 = move %breaker_26
    %breaker_26 = move %i_9
    %i_9 = move %breaker_26
    %breaker_26 = move %digit_2
    %digit_2 = move %breaker_26
    %breaker_26 = move %x_8
    %x_8 = move %breaker_26
    %breaker_26 = move %x_9
    %x_9 = move %breaker_26
    %breaker_26 = move %x_10
    %x_10 = move %breaker_26
    %breaker_26 = move %digit_3
    %digit_3 = move %breaker_26
    %breaker_26 = move %input_3
    %input_3 = move %breaker_26
    %breaker_26 = move %now_2
    %now_2 = move %breaker_26
    %breaker_26 = move %x_11
    %x_11 = move %breaker_26
    %breaker_26 = move %t_221
    %t_221 = move %breaker_26
    %breaker_26 = move %i_10
    %i_10 = move %breaker_26
    %breaker_26 = move %result_2
    %result_2 = move %breaker_26
    %breaker_26 = move %t_222
    %t_222 = move %breaker_26
    %breaker_26 = move %MAXDIGIT_1
    %MAXDIGIT_1 = move %breaker_26
    %breaker_26 = move %t_223
    %t_223 = move %breaker_26
    %breaker_26 = move %target_1
    %target_1 = move %breaker_26
    %breaker_26 = move %t_224
    %t_224 = move %breaker_26
    %breaker_26 = move %i_11
    %i_11 = move %breaker_26
    %breaker_26 = move %a_2
    %a_2 = move %breaker_26
    %breaker_26 = move %t_225
    %t_225 = move %breaker_26
    %breaker_26 = move %b_2
    %b_2 = move %breaker_26
    %breaker_26 = move %ret_1
    %ret_1 = move %breaker_26
    %breaker_26 = move %t_226
    %t_226 = move %breaker_26
    %breaker_26 = move %i_12
    jump main_while_body_1

main_if_then_2:
    %vrax_1 = call getString 
    %t_254 = move %vrax_1
    %vrdi_1 = move 48
    %vrax_1 = alloc %vrdi_1
    %t_255 = move %vrax_1
    store 5 %t_255 null 0 0
    %t_256 = load %t_254 null 0 0
    cmp %t_256 40
    br sne main_faker_crackSHA1_if_then_1 main_faker_crackSHA1_if_merge_1

main_faker_crackSHA1_if_then_1:
    %vrdi_1 = move @__str_const_5
    call println %vrdi_1 
    %input_3 = move %t_254
    %target_1 = move %t_255
    %breaker_27 = move %digit_1
    %digit_1 = move %breaker_27
    %breaker_27 = move %i_7
    %i_7 = move %breaker_27
    %breaker_27 = move %i_8
    %i_8 = move %breaker_27
    %breaker_27 = move %input_2
    %input_2 = move %breaker_27
    %breaker_27 = move %t_217
    %t_217 = move %breaker_27
    %breaker_27 = move %result_1
    %result_1 = move %breaker_27
    %breaker_27 = move %t_218
    %t_218 = move %breaker_27
    %breaker_27 = move %t_219
    %t_219 = move %breaker_27
    %breaker_27 = move %now_1
    %now_1 = move %breaker_27
    %breaker_27 = move %x_7
    %x_7 = move %breaker_27
    %breaker_27 = move %t_220
    %t_220 = move %breaker_27
    %breaker_27 = move %i_9
    %i_9 = move %breaker_27
    %breaker_27 = move %digit_2
    %digit_2 = move %breaker_27
    %breaker_27 = move %x_8
    %x_8 = move %breaker_27
    %breaker_27 = move %x_9
    %x_9 = move %breaker_27
    %breaker_27 = move %x_10
    %x_10 = move %breaker_27
    %breaker_27 = move %digit_3
    %digit_3 = move %breaker_27
    %breaker_27 = move %input_3
    %input_3 = move %input_3
    %breaker_27 = move %now_2
    %now_2 = move %breaker_27
    %breaker_27 = move %x_11
    %x_11 = move %breaker_27
    %breaker_27 = move %t_221
    %t_221 = move %breaker_27
    %breaker_27 = move %i_10
    %i_10 = move %breaker_27
    %breaker_27 = move %result_2
    %result_2 = move %breaker_27
    %breaker_27 = move %t_222
    %t_222 = move %breaker_27
    %breaker_27 = move %MAXDIGIT_1
    %MAXDIGIT_1 = move %breaker_27
    %breaker_27 = move %t_223
    %t_223 = move %breaker_27
    %breaker_27 = move %target_1
    %target_1 = move %target_1
    %breaker_27 = move %t_224
    %t_224 = move %breaker_27
    %breaker_27 = move %i_11
    %i_11 = move %breaker_27
    %breaker_27 = move %a_2
    %a_2 = move %breaker_27
    %breaker_27 = move %t_225
    %t_225 = move %breaker_27
    %breaker_27 = move %b_2
    %b_2 = move %breaker_27
    %breaker_27 = move %ret_1
    %ret_1 = move %breaker_27
    %breaker_27 = move %t_226
    %t_226 = move %breaker_27
    %breaker_27 = move %i_12
    jump main_while_body_1

main_faker_crackSHA1_if_merge_1:
    %i_19 = move 0
    jump main_faker_crackSHA1_for_cond_1

main_faker_crackSHA1_for_cond_1:
    cmp %i_19 5
    br slt main_faker_crackSHA1_for_body_1 main_faker_crackSHA1_for_merge_1

main_faker_crackSHA1_for_merge_1:
    %i_20 = move %i_8
    %result_3 = move %result_1
    %t_257 = move %t_219
    %t_258 = move %t_220
    %x_19 = move %x_8
    %digit_6 = move %digit_3
    %t_259 = move %t_224
    %breaker_28 = move %i_20
    %i_20 = move %i_20
    %breaker_28 = move %result_3
    %result_3 = move %result_3
    %breaker_28 = move %t_257
    %t_257 = move %t_257
    %breaker_28 = move %t_258
    %t_258 = move %t_258
    %breaker_28 = move %x_19
    %x_19 = move %x_19
    %breaker_28 = move %digit_6
    %digit_6 = move %digit_6
    %breaker_28 = move %t_259
    %i_21 = move 0
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_for_cond_2:
    cmp %i_21 40
    br slt main_faker_crackSHA1_for_body_2 main_faker_crackSHA1_for_merge_2

main_faker_crackSHA1_for_merge_2:
    %t_260 = move %t_217
    %t_261 = move %t_218
    %now_3 = move %now_1
    %i_22 = move %i_9
    %now_4 = move %now_2
    %i_23 = move %i_10
    %t_262 = move %t_222
    %i_24 = move %i_21
    %a_3 = move %a_2
    %t_263 = move %t_225
    %b_3 = move %b_2
    %breaker_29 = move %t_260
    %t_260 = move %t_260
    %breaker_29 = move %t_261
    %t_261 = move %t_261
    %breaker_29 = move %now_3
    %now_3 = move %now_3
    %breaker_29 = move %i_22
    %i_22 = move %i_22
    %breaker_29 = move %now_4
    %now_4 = move %now_4
    %breaker_29 = move %i_23
    %i_23 = move %i_23
    %breaker_29 = move %t_262
    %t_262 = move %t_262
    %breaker_29 = move %i_24
    %i_24 = move %i_24
    %breaker_29 = move %a_3
    %a_3 = move %a_3
    %breaker_29 = move %t_263
    %t_263 = move %t_263
    %breaker_29 = move %b_3
    %digit_7 = move 1
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_for_cond_3:
    cmp %digit_7 4
    br sle main_faker_crackSHA1_for_body_3 main_faker_crackSHA1_for_merge_3

main_faker_crackSHA1_for_merge_3:
    %vrdi_1 = move @__str_const_7
    call println %vrdi_1 
    %digit_1 = move %digit_7
    %i_8 = move %i_20
    %t_217 = move %t_260
    %result_1 = move %result_3
    %t_218 = move %t_261
    %t_219 = move %t_257
    %now_1 = move %now_3
    %t_220 = move %t_258
    %i_9 = move %i_22
    %x_8 = move %x_19
    %digit_3 = move %digit_6
    %input_3 = move %t_254
    %now_2 = move %now_4
    %i_10 = move %i_23
    %t_222 = move %t_262
    %target_1 = move %t_255
    %t_224 = move %t_259
    %i_11 = move %i_24
    %a_2 = move %a_3
    %t_225 = move %t_263
    %b_2 = move %b_3
    %breaker_30 = move %digit_1
    %digit_1 = move %digit_1
    %breaker_30 = move %i_7
    %i_7 = move %breaker_30
    %breaker_30 = move %i_8
    %i_8 = move %i_8
    %breaker_30 = move %input_2
    %input_2 = move %breaker_30
    %breaker_30 = move %t_217
    %t_217 = move %t_217
    %breaker_30 = move %result_1
    %result_1 = move %result_1
    %breaker_30 = move %t_218
    %t_218 = move %t_218
    %breaker_30 = move %t_219
    %t_219 = move %t_219
    %breaker_30 = move %now_1
    %now_1 = move %now_1
    %breaker_30 = move %x_7
    %x_7 = move %breaker_30
    %breaker_30 = move %t_220
    %t_220 = move %t_220
    %breaker_30 = move %i_9
    %i_9 = move %i_9
    %breaker_30 = move %digit_2
    %digit_2 = move %breaker_30
    %breaker_30 = move %x_8
    %x_8 = move %x_8
    %breaker_30 = move %x_9
    %x_9 = move %breaker_30
    %breaker_30 = move %x_10
    %x_10 = move %breaker_30
    %breaker_30 = move %digit_3
    %digit_3 = move %digit_3
    %breaker_30 = move %input_3
    %input_3 = move %input_3
    %breaker_30 = move %now_2
    %now_2 = move %now_2
    %breaker_30 = move %x_11
    %x_11 = move %breaker_30
    %breaker_30 = move %t_221
    %t_221 = move %breaker_30
    %breaker_30 = move %i_10
    %i_10 = move %i_10
    %breaker_30 = move %result_2
    %result_2 = move %breaker_30
    %breaker_30 = move %t_222
    %t_222 = move %t_222
    %breaker_30 = move %t_223
    %t_223 = move %breaker_30
    %breaker_30 = move %target_1
    %target_1 = move %target_1
    %breaker_30 = move %t_224
    %t_224 = move %t_224
    %breaker_30 = move %i_11
    %i_11 = move %i_11
    %breaker_30 = move %a_2
    %a_2 = move %a_2
    %breaker_30 = move %t_225
    %t_225 = move %t_225
    %breaker_30 = move %b_2
    %b_2 = move %b_2
    %breaker_30 = move %ret_1
    %ret_1 = move %breaker_30
    %breaker_30 = move %t_226
    %t_226 = move %breaker_30
    %breaker_30 = move %i_12
    %MAXDIGIT_1 = move 4
    jump main_while_body_1

main_faker_crackSHA1_for_body_3:
    %i_25 = move 0
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_for_cond_4:
    cmp %i_25 %digit_7
    br slt main_faker_crackSHA1_for_body_4 main_parallel_copy_2

main_faker_crackSHA1_for_body_4:
    store 48 %inputBuffer_2 %i_25 8 8
    %i_26 = move %i_25
    %i_26 = add %i_26 1
    %i_25 = move %i_26
    %breaker_31 = move %i_25
    jump main_faker_crackSHA1_for_cond_4

main_parallel_copy_2:
    %t_264 = move %t_260
    %now_5 = move %now_3
    %i_27 = move %i_22
    %now_6 = move %now_4
    %i_28 = move %i_23
    %t_265 = move %t_262
    %t_266 = move %t_263
    %breaker_32 = move %t_264
    %t_264 = move %t_264
    %breaker_32 = move %now_5
    %now_5 = move %now_5
    %breaker_32 = move %i_27
    %i_27 = move %i_27
    %breaker_32 = move %now_6
    %now_6 = move %now_6
    %breaker_32 = move %i_28
    %i_28 = move %i_28
    %breaker_32 = move %t_265
    %t_265 = move %t_265
    %breaker_32 = move %t_266
    jump main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_while_body_1:
    %vrdi_1 = move %inputBuffer_2
    %vrsi_1 = move %digit_7
    %vrax_1 = call sha1 %vrdi_1 %vrsi_1 
    %t_267 = move %vrax_1
    %t_268 = load %t_267 null 0 0
    %t_269 = load %t_255 null 0 0
    cmp %t_268 %t_269
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_1 main_faker_crackSHA1_faker_array_equal_if_merge_1

main_faker_crackSHA1_faker_array_equal_elseBB_1:
    %i_29 = move %i_27
    %breaker_33 = move %i_29
    %t_270 = move 0
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_array_equal_if_merge_1:
    %i_30 = move 0
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_for_cond_1:
    %t_271 = load %t_267 null 0 0
    cmp %i_30 %t_271
    br slt main_faker_crackSHA1_faker_array_equal_for_body_1 main_faker_crackSHA1_faker_array_equal_thenBB_1

main_faker_crackSHA1_faker_array_equal_for_body_1:
    %t_272 = lea null %i_30 8 8
    %t_273 = load %t_267 %t_272 1 0
    %t_274 = load %t_255 %t_272 1 0
    cmp %t_273 %t_274
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_2 main_faker_crackSHA1_faker_array_equal_for_step_1

main_faker_crackSHA1_faker_array_equal_elseBB_2:
    %i_29 = move %i_30
    %breaker_34 = move %i_29
    %t_270 = move 0
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_array_equal_for_step_1:
    %i_31 = move %i_30
    %i_31 = add %i_31 1
    %i_30 = move %i_31
    %breaker_35 = move %i_30
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_thenBB_1:
    %i_29 = move %i_30
    %breaker_36 = move %i_29
    %t_270 = move 1
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_splitter_1:
    cmp %t_270 1
    br seq main_faker_crackSHA1_if_then_2 main_faker_crackSHA1_if_merge_2

main_faker_crackSHA1_if_merge_2:
    %t_275 = move %digit_7
    %t_275 = sub %t_275 1
    %t_276 = move %t_264
    %now_7 = move %now_6
    %i_32 = move %t_275
    %t_277 = move %t_265
    %breaker_37 = move %t_276
    %t_276 = move %t_276
    %breaker_37 = move %now_7
    %now_7 = move %now_7
    %breaker_37 = move %i_32
    %i_32 = move %i_32
    %breaker_37 = move %t_277
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_faker_nextText_for_cond_1:
    cmp %i_32 0
    br sge main_faker_crackSHA1_faker_nextText_for_body_1 main_faker_crackSHA1_faker_nextText_elseBB_1

main_faker_crackSHA1_faker_nextText_elseBB_1:
    %t_278 = move %t_276
    %now_8 = move %now_7
    %t_279 = move %t_277
    %breaker_38 = move %t_278
    %t_278 = move %t_278
    %breaker_38 = move %now_8
    %now_8 = move %now_8
    %breaker_38 = move %t_279
    %t_280 = move 0
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_faker_nextText_for_body_1:
    %t_281 = lea %inputBuffer_2 %i_32 8 8
    %t_282 = load %t_281 null 0 0
    cmp %t_282 122
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1:
    cmp %t_282 90
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2:
    cmp %t_282 57
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3:
    %t_283 = move 65
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3:
    %t_284 = move %t_282
    %t_284 = add %t_284 1
    %t_283 = move %t_284
    %breaker_39 = move %t_283
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2:
    %t_283 = move 97
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1:
    %t_283 = move -1
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_splitter_1:
    store %t_283 %t_281 null 0 0
    %t_285 = lea %inputBuffer_2 %i_32 8 8
    %t_286 = load %t_285 null 0 0
    cmp %t_286 -1
    br seq main_faker_crackSHA1_faker_nextText_if_then_1 main_faker_crackSHA1_faker_nextText_thenBB_1

main_faker_crackSHA1_faker_nextText_thenBB_1:
    %t_278 = move %t_283
    %now_8 = move %t_282
    %t_279 = move %t_281
    %breaker_40 = move %t_278
    %t_278 = move %t_278
    %breaker_40 = move %now_8
    %now_8 = move %now_8
    %breaker_40 = move %t_279
    %t_280 = move 1
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_splitter_2:
    cmp %t_280 1
    br seq main_parallel_copy_3 main_faker_crackSHA1_for_step_1

main_parallel_copy_3:
    %t_264 = move %t_278
    %now_5 = move %inputBuffer_2
    %i_27 = move %i_29
    %now_6 = move %now_8
    %i_28 = move %i_32
    %t_265 = move %t_279
    %t_266 = move %t_280
    %breaker_41 = move %t_264
    %t_264 = move %t_264
    %breaker_41 = move %now_5
    %now_5 = move %now_5
    %breaker_41 = move %i_27
    %i_27 = move %i_27
    %breaker_41 = move %now_6
    %now_6 = move %now_6
    %breaker_41 = move %i_28
    %i_28 = move %i_28
    %breaker_41 = move %t_265
    %t_265 = move %t_265
    %breaker_41 = move %t_266
    jump main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_for_step_1:
    %digit_8 = move %digit_7
    %digit_8 = add %digit_8 1
    %digit_7 = move %digit_8
    %t_260 = move %t_278
    %t_261 = move %t_270
    %now_3 = move %inputBuffer_2
    %i_22 = move %i_29
    %now_4 = move %now_8
    %i_23 = move %i_32
    %t_262 = move %t_279
    %i_24 = move %i_25
    %a_3 = move %t_267
    %t_263 = move %t_280
    %b_3 = move %t_255
    %breaker_42 = move %digit_7
    %digit_7 = move %digit_7
    %breaker_42 = move %t_260
    %t_260 = move %t_260
    %breaker_42 = move %t_261
    %t_261 = move %t_261
    %breaker_42 = move %now_3
    %now_3 = move %now_3
    %breaker_42 = move %i_22
    %i_22 = move %i_22
    %breaker_42 = move %now_4
    %now_4 = move %now_4
    %breaker_42 = move %i_23
    %i_23 = move %i_23
    %breaker_42 = move %t_262
    %t_262 = move %t_262
    %breaker_42 = move %i_24
    %i_24 = move %i_24
    %breaker_42 = move %a_3
    %a_3 = move %a_3
    %breaker_42 = move %t_263
    %t_263 = move %t_263
    %breaker_42 = move %b_3
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_faker_nextText_if_then_1:
    store 48 %t_285 null 0 0
    %i_33 = move %i_32
    %i_33 = sub %i_33 1
    %t_276 = move %t_283
    %now_7 = move %t_282
    %i_32 = move %i_33
    %t_277 = move %t_281
    %breaker_43 = move %t_276
    %t_276 = move %t_276
    %breaker_43 = move %now_7
    %now_7 = move %now_7
    %breaker_43 = move %i_32
    %i_32 = move %i_32
    %breaker_43 = move %t_277
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_if_then_2:
    %x_20 = move %x_11
    %t_287 = move %t_221
    %breaker_44 = move %x_20
    %x_20 = move %x_20
    %breaker_44 = move %t_287
    %i_34 = move 0
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_cond_5:
    cmp %i_34 %digit_7
    br slt main_faker_crackSHA1_for_body_5 main_faker_crackSHA1_for_merge_4

main_faker_crackSHA1_for_body_5:
    %t_288 = load %inputBuffer_2 %i_34 8 8
    cmp %t_288 32
    br sge main_faker_crackSHA1_faker_int2chr_lhs_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_lhs_then_1:
    cmp %t_288 126
    br sle main_faker_crackSHA1_faker_int2chr_if_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_if_then_1:
    %t_289 = move %t_288
    %t_289 = sub %t_289 32
    %vrdi_1 = move %asciiTable_2
    %vrsi_1 = move %t_289
    %vrdx_1 = move %t_289
    %vrax_1 = call string.substring %vrdi_1 %vrsi_1 %vrdx_1 
    %t_290 = move %vrax_1
    %t_291 = move %t_290
    %breaker_45 = move %t_291
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_int2chr_if_merge_1:
    %t_291 = move @__str_const_1
    %breaker_46 = move %t_291
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_splitter_3:
    %vrdi_1 = move %t_291
    call print %vrdi_1 
    %i_35 = move %i_34
    %i_35 = add %i_35 1
    %x_20 = move %t_288
    %t_287 = move %t_291
    %i_34 = move %i_35
    %breaker_47 = move %x_20
    %x_20 = move %x_20
    %breaker_47 = move %t_287
    %t_287 = move %t_287
    %breaker_47 = move %i_34
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_merge_4:
    %vrdi_1 = move @__str_const_6
    call println %vrdi_1 
    %digit_1 = move %digit_7
    %i_8 = move %i_20
    %t_217 = move %t_264
    %result_1 = move %result_3
    %t_218 = move %t_270
    %t_219 = move %t_257
    %now_1 = move %now_5
    %t_220 = move %t_258
    %i_9 = move %i_29
    %x_8 = move %x_19
    %digit_3 = move %digit_6
    %input_3 = move %t_254
    %now_2 = move %now_6
    %x_11 = move %x_20
    %t_221 = move %t_287
    %i_10 = move %i_28
    %t_222 = move %t_265
    %target_1 = move %t_255
    %t_224 = move %t_259
    %i_11 = move %i_34
    %a_2 = move %t_267
    %t_225 = move %t_266
    %b_2 = move %target_1
    %breaker_48 = move %digit_1
    %digit_1 = move %digit_1
    %breaker_48 = move %i_7
    %i_7 = move %breaker_48
    %breaker_48 = move %i_8
    %i_8 = move %i_8
    %breaker_48 = move %input_2
    %input_2 = move %breaker_48
    %breaker_48 = move %t_217
    %t_217 = move %t_217
    %breaker_48 = move %result_1
    %result_1 = move %result_1
    %breaker_48 = move %t_218
    %t_218 = move %t_218
    %breaker_48 = move %t_219
    %t_219 = move %t_219
    %breaker_48 = move %now_1
    %now_1 = move %now_1
    %breaker_48 = move %x_7
    %x_7 = move %breaker_48
    %breaker_48 = move %t_220
    %t_220 = move %t_220
    %breaker_48 = move %i_9
    %i_9 = move %i_9
    %breaker_48 = move %digit_2
    %digit_2 = move %breaker_48
    %breaker_48 = move %x_8
    %x_8 = move %x_8
    %breaker_48 = move %x_9
    %x_9 = move %breaker_48
    %breaker_48 = move %x_10
    %x_10 = move %breaker_48
    %breaker_48 = move %digit_3
    %digit_3 = move %digit_3
    %breaker_48 = move %input_3
    %input_3 = move %input_3
    %breaker_48 = move %now_2
    %now_2 = move %now_2
    %breaker_48 = move %x_11
    %x_11 = move %x_11
    %breaker_48 = move %t_221
    %t_221 = move %t_221
    %breaker_48 = move %i_10
    %i_10 = move %i_10
    %breaker_48 = move %result_2
    %result_2 = move %breaker_48
    %breaker_48 = move %t_222
    %t_222 = move %t_222
    %breaker_48 = move %t_223
    %t_223 = move %breaker_48
    %breaker_48 = move %t_224
    %t_224 = move %t_224
    %breaker_48 = move %i_11
    %i_11 = move %i_11
    %breaker_48 = move %a_2
    %a_2 = move %a_2
    %breaker_48 = move %t_225
    %t_225 = move %t_225
    %breaker_48 = move %b_2
    %b_2 = move %b_2
    %breaker_48 = move %ret_1
    %ret_1 = move %breaker_48
    %breaker_48 = move %t_226
    %t_226 = move %breaker_48
    %breaker_48 = move %i_12
    %MAXDIGIT_1 = move 4
    jump main_while_body_1

main_faker_crackSHA1_for_body_2:
    %t_292 = move %i_21
    %vrax_1 = move %t_292
    %vrdx_1 = move %rdx
    %vrcx_1 = move 8
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_292 = move %vrax_1
    %t_293 = lea %t_255 %t_292 8 8
    %t_294 = move %i_21
    %t_294 = add %t_294 3
    %vrdi_1 = move %t_254
    %vrsi_1 = move %i_21
    %vrdx_1 = move %t_294
    %vrax_1 = call string.substring %vrdi_1 %vrsi_1 %vrdx_1 
    %t_295 = move %vrax_1
    %digit_9 = move %digit_6
    %breaker_49 = move %digit_9
    %i_36 = move 0
    %result_4 = move 0
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_faker_hex2int_for_cond_1:
    %t_296 = load %t_295 null 0 0
    cmp %i_36 %t_296
    br slt main_faker_crackSHA1_faker_hex2int_for_body_1 main_faker_crackSHA1_faker_hex2int_for_merge_1

main_faker_crackSHA1_faker_hex2int_for_merge_1:
    %digit_10 = move %digit_9
    %t_297 = move %result_4
    %breaker_50 = move %digit_10
    %digit_10 = move %digit_10
    %breaker_50 = move %t_297
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_faker_hex2int_for_body_1:
    %vrdi_1 = move %t_295
    %vrsi_1 = move %i_36
    %vrax_1 = call string.ord %vrdi_1 %vrsi_1 
    %t_298 = move %vrax_1
    cmp %t_298 48
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_lhs_then_1:
    cmp %t_298 57
    br sle main_faker_crackSHA1_faker_hex2int_if_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_if_else_1:
    cmp %t_298 65
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_lhs_then_2:
    cmp %t_298 70
    br sle main_faker_crackSHA1_faker_hex2int_if_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_if_then_2:
    %t_299 = move %result_4
    %t_299 = mul %t_299 16
    %t_300 = lea %t_299 %t_298 1 -55
    %result_5 = move %t_300
    %breaker_51 = move %result_5
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_2:
    cmp %t_298 97
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_lhs_then_3:
    cmp %t_298 102
    br sle main_faker_crackSHA1_faker_hex2int_if_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_if_then_3:
    %t_301 = move %result_4
    %t_301 = mul %t_301 16
    %t_302 = lea %t_301 %t_298 1 -87
    %result_5 = move %t_302
    %breaker_52 = move %result_5
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_3:
    %digit_10 = move %t_298
    %breaker_53 = move %digit_10
    %t_297 = move 0
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_splitter_4:
    %t_303 = move %i_21
    %vrax_1 = move %t_303
    %vrdx_1 = move %rdx
    %vrcx_1 = move 4
    %vrax_1 = div %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_303 = move %vrax_1
    %t_304 = move %t_303
    %vrax_1 = move %t_304
    %vrdx_1 = move %rdx
    %vrcx_1 = move 2
    %vrax_1 = mod %vrax_1 %vrcx_1
    %vrax_1 = move %rax
    %vrdx_1 = move %rdx
    %t_304 = move %vrdx_1
    %t_305 = move 1
    %t_305 = sub %t_305 %t_304
    %t_306 = move %t_305
    %t_306 = mul %t_306 16
    %t_307 = move %t_297
    %vrcx_1 = move %t_306
    %t_307 = shl %t_307 %vrcx_1
    %t_308 = load %t_293 null 0 0
    %t_309 = move %t_308
    %t_309 = or %t_309 %t_307
    store %t_309 %t_293 null 0 0
    %t_310 = move %i_21
    %t_310 = add %t_310 4
    %i_20 = move %i_36
    %result_3 = move %result_4
    %t_257 = move %t_293
    %t_258 = move %t_257
    %x_19 = move %t_295
    %digit_6 = move %digit_10
    %t_259 = move %t_297
    %i_21 = move %t_310
    %breaker_54 = move %i_20
    %i_20 = move %i_20
    %breaker_54 = move %result_3
    %result_3 = move %result_3
    %breaker_54 = move %t_258
    %t_258 = move %t_258
    %breaker_54 = move %x_19
    %x_19 = move %x_19
    %breaker_54 = move %digit_6
    %digit_6 = move %digit_6
    %breaker_54 = move %t_259
    %t_259 = move %t_259
    %breaker_54 = move %i_21
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_faker_hex2int_if_then_1:
    %t_311 = move %result_4
    %t_311 = mul %t_311 16
    %t_312 = lea %t_311 %t_298 1 -48
    %result_5 = move %t_312
    %breaker_55 = move %result_5
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_for_step_1:
    %i_37 = move %i_36
    %i_37 = add %i_37 1
    %i_36 = move %i_37
    %result_4 = move %result_5
    %digit_9 = move %t_298
    %breaker_56 = move %i_36
    %i_36 = move %i_36
    %breaker_56 = move %result_4
    %result_4 = move %result_4
    %breaker_56 = move %digit_9
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_for_body_1:
    store 0 %t_255 %i_19 8 8
    %i_38 = move %i_19
    %i_38 = add %i_38 1
    %i_19 = move %i_38
    %breaker_57 = move %i_19
    jump main_faker_crackSHA1_for_cond_1

main_while_merge_1:
    %vrax_1 = move 0
    ret %vrax_1

}

define i64 @__init  {
__init_entry_1:
    %vrdi_1 = move 808
    %vrax_1 = alloc %vrdi_1
    %t_313 = move %vrax_1
    store 100 %t_313 null 0 0
    %t_314 = move %t_313
    %t_314 = add %t_314 8
    %t_315 = move %t_313
    %t_315 = add %t_315 808
    %t_316 = move %t_314
    %breaker_58 = move %t_316
    jump __init_for_cond_1

__init_for_cond_1:
    cmp %t_316 %t_315
    br slt __init_for_body_1 __init_for_merge_1

__init_for_body_1:
    %vrdi_1 = move 648
    %vrax_1 = alloc %vrdi_1
    %t_317 = move %vrax_1
    store 80 %t_317 null 0 0
    store %t_317 %t_316 null 0 0
    %t_318 = move %t_316
    %t_318 = add %t_318 8
    %t_316 = move %t_318
    %breaker_59 = move %t_316
    jump __init_for_cond_1

__init_for_merge_1:
    %vrdi_1 = move 50568
    %vrax_1 = alloc %vrdi_1
    %t_319 = move %vrax_1
    store 6320 %t_319 null 0 0
    %vrdi_1 = move 48
    %vrax_1 = alloc %vrdi_1
    %t_320 = move %vrax_1
    store 5 %t_320 null 0 0
    store %t_313 @chunks_1 null 0 0
    store 100 @MAXCHUNK_1 null 0 0
    store @__str_const_9 @asciiTable_1 null 0 0
    store %t_319 @inputBuffer_1 null 0 0
    store %t_320 @outputBuffer_1 null 0 0
    %vrax_1 = call main 
    %t_321 = move %vrax_1
    %vrax_1 = move %t_321
    ret %vrax_1

}


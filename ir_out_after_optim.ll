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
    %t_1 = alloc 24
    store 2 %t_1 null 0 0
    %t_2 = add %t_1 8
    %t_3 = add %t_1 24
    jump A_Optimizer_for_cond_1

A_Optimizer_for_cond_1:
    %t_4 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_5 
    %t_6 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_7 
    %t_8 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_9 
    %t_10 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_11 
    %t_12 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_13 
    %t_14 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_15 
    %t_16 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_17 
    %t_18 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_19 
    %t_20 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_21 
    %t_22 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_23 
    %t_24 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_25 
    %t_26 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_27 
    %t_28 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_29 
    %t_30 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_31 
    %t_32 = phi A_Optimizer_entry_1 %t_2 A_Optimizer_for_step_1 %t_33 
    cmp %t_32 %t_3
    br slt A_Optimizer_for_body_1 A_Optimizer_for_merge_1

A_Optimizer_for_body_1:
    %t_34 = alloc 24
    store 2 %t_34 null 0 0
    store %t_34 %t_32 null 0 0
    %t_35 = add %t_34 8
    %t_36 = add %t_34 24
    jump A_Optimizer_for_cond_2

A_Optimizer_for_cond_2:
    %t_5 = phi A_Optimizer_for_body_1 %t_4 A_Optimizer_for_step_2 %t_37 
    %t_7 = phi A_Optimizer_for_body_1 %t_6 A_Optimizer_for_step_2 %t_38 
    %t_39 = phi A_Optimizer_for_body_1 %t_35 A_Optimizer_for_step_2 %t_40 
    %t_9 = phi A_Optimizer_for_body_1 %t_8 A_Optimizer_for_step_2 %t_41 
    %t_11 = phi A_Optimizer_for_body_1 %t_10 A_Optimizer_for_step_2 %t_42 
    %t_13 = phi A_Optimizer_for_body_1 %t_12 A_Optimizer_for_step_2 %t_43 
    %t_15 = phi A_Optimizer_for_body_1 %t_14 A_Optimizer_for_step_2 %t_44 
    %t_17 = phi A_Optimizer_for_body_1 %t_16 A_Optimizer_for_step_2 %t_45 
    %t_19 = phi A_Optimizer_for_body_1 %t_18 A_Optimizer_for_step_2 %t_46 
    %t_21 = phi A_Optimizer_for_body_1 %t_20 A_Optimizer_for_step_2 %t_47 
    %t_23 = phi A_Optimizer_for_body_1 %t_22 A_Optimizer_for_step_2 %t_48 
    %t_25 = phi A_Optimizer_for_body_1 %t_24 A_Optimizer_for_step_2 %t_49 
    %t_27 = phi A_Optimizer_for_body_1 %t_26 A_Optimizer_for_step_2 %t_50 
    %t_29 = phi A_Optimizer_for_body_1 %t_28 A_Optimizer_for_step_2 %t_51 
    %t_31 = phi A_Optimizer_for_body_1 %t_30 A_Optimizer_for_step_2 %t_52 
    cmp %t_39 %t_36
    br slt A_Optimizer_for_body_2 A_Optimizer_for_step_1

A_Optimizer_for_body_2:
    %t_53 = alloc 24
    store 2 %t_53 null 0 0
    store %t_53 %t_39 null 0 0
    %t_54 = add %t_53 8
    %t_52 = add %t_53 24
    jump A_Optimizer_for_cond_3

A_Optimizer_for_cond_3:
    %t_37 = phi A_Optimizer_for_body_2 %t_5 A_Optimizer_for_step_3 %t_55 
    %t_38 = phi A_Optimizer_for_body_2 %t_7 A_Optimizer_for_step_3 %t_56 
    %t_41 = phi A_Optimizer_for_body_2 %t_9 A_Optimizer_for_step_3 %t_57 
    %t_42 = phi A_Optimizer_for_body_2 %t_11 A_Optimizer_for_step_3 %t_58 
    %t_43 = phi A_Optimizer_for_body_2 %t_13 A_Optimizer_for_step_3 %t_59 
    %t_44 = phi A_Optimizer_for_body_2 %t_15 A_Optimizer_for_step_3 %t_60 
    %t_45 = phi A_Optimizer_for_body_2 %t_17 A_Optimizer_for_step_3 %t_61 
    %t_46 = phi A_Optimizer_for_body_2 %t_19 A_Optimizer_for_step_3 %t_62 
    %t_47 = phi A_Optimizer_for_body_2 %t_21 A_Optimizer_for_step_3 %t_63 
    %t_48 = phi A_Optimizer_for_body_2 %t_23 A_Optimizer_for_step_3 %t_64 
    %t_49 = phi A_Optimizer_for_body_2 %t_54 A_Optimizer_for_step_3 %t_65 
    %t_50 = phi A_Optimizer_for_body_2 %t_27 A_Optimizer_for_step_3 %t_66 
    %t_51 = phi A_Optimizer_for_body_2 %t_29 A_Optimizer_for_step_3 %t_67 
    cmp %t_49 %t_52
    br slt A_Optimizer_for_body_3 A_Optimizer_for_step_2

A_Optimizer_for_body_3:
    %t_68 = alloc 24
    store 2 %t_68 null 0 0
    store %t_68 %t_49 null 0 0
    %t_69 = add %t_68 8
    %t_56 = add %t_68 24
    jump A_Optimizer_for_cond_4

A_Optimizer_for_cond_4:
    %t_55 = phi A_Optimizer_for_body_3 %t_37 A_Optimizer_for_step_4 %t_70 
    %t_57 = phi A_Optimizer_for_body_3 %t_41 A_Optimizer_for_step_4 %t_71 
    %t_58 = phi A_Optimizer_for_body_3 %t_42 A_Optimizer_for_step_4 %t_72 
    %t_59 = phi A_Optimizer_for_body_3 %t_69 A_Optimizer_for_step_4 %t_73 
    %t_60 = phi A_Optimizer_for_body_3 %t_44 A_Optimizer_for_step_4 %t_74 
    %t_61 = phi A_Optimizer_for_body_3 %t_45 A_Optimizer_for_step_4 %t_75 
    %t_62 = phi A_Optimizer_for_body_3 %t_46 A_Optimizer_for_step_4 %t_76 
    %t_63 = phi A_Optimizer_for_body_3 %t_47 A_Optimizer_for_step_4 %t_77 
    %t_64 = phi A_Optimizer_for_body_3 %t_48 A_Optimizer_for_step_4 %t_78 
    %t_66 = phi A_Optimizer_for_body_3 %t_50 A_Optimizer_for_step_4 %t_79 
    %t_67 = phi A_Optimizer_for_body_3 %t_51 A_Optimizer_for_step_4 %t_80 
    cmp %t_59 %t_56
    br slt A_Optimizer_for_body_4 A_Optimizer_for_step_3

A_Optimizer_for_step_3:
    %t_65 = add %t_49 8
    jump A_Optimizer_for_cond_3

A_Optimizer_for_body_4:
    %t_81 = alloc 24
    store 2 %t_81 null 0 0
    store %t_81 %t_59 null 0 0
    %t_82 = add %t_81 8
    %t_76 = add %t_81 24
    jump A_Optimizer_for_cond_5

A_Optimizer_for_cond_5:
    %t_70 = phi A_Optimizer_for_body_4 %t_55 A_Optimizer_for_step_5 %t_83 
    %t_71 = phi A_Optimizer_for_body_4 %t_57 A_Optimizer_for_step_5 %t_84 
    %t_72 = phi A_Optimizer_for_body_4 %t_58 A_Optimizer_for_step_5 %t_85 
    %t_74 = phi A_Optimizer_for_body_4 %t_60 A_Optimizer_for_step_5 %t_86 
    %t_75 = phi A_Optimizer_for_body_4 %t_61 A_Optimizer_for_step_5 %t_87 
    %t_77 = phi A_Optimizer_for_body_4 %t_63 A_Optimizer_for_step_5 %t_88 
    %t_78 = phi A_Optimizer_for_body_4 %t_64 A_Optimizer_for_step_5 %t_89 
    %t_79 = phi A_Optimizer_for_body_4 %t_66 A_Optimizer_for_step_5 %t_90 
    %t_80 = phi A_Optimizer_for_body_4 %t_82 A_Optimizer_for_step_5 %t_91 
    cmp %t_80 %t_76
    br slt A_Optimizer_for_body_5 A_Optimizer_for_step_4

A_Optimizer_for_body_5:
    %t_92 = alloc 24
    store 2 %t_92 null 0 0
    store %t_92 %t_80 null 0 0
    %t_93 = add %t_92 8
    %t_90 = add %t_92 24
    jump A_Optimizer_for_cond_6

A_Optimizer_for_cond_6:
    %t_83 = phi A_Optimizer_for_body_5 %t_70 A_Optimizer_for_step_6 %t_94 
    %t_84 = phi A_Optimizer_for_body_5 %t_71 A_Optimizer_for_step_6 %t_95 
    %t_85 = phi A_Optimizer_for_body_5 %t_72 A_Optimizer_for_step_6 %t_96 
    %t_86 = phi A_Optimizer_for_body_5 %t_93 A_Optimizer_for_step_6 %t_97 
    %t_87 = phi A_Optimizer_for_body_5 %t_75 A_Optimizer_for_step_6 %t_98 
    %t_88 = phi A_Optimizer_for_body_5 %t_77 A_Optimizer_for_step_6 %t_99 
    %t_89 = phi A_Optimizer_for_body_5 %t_78 A_Optimizer_for_step_6 %t_100 
    cmp %t_86 %t_90
    br slt A_Optimizer_for_body_6 A_Optimizer_for_step_5

A_Optimizer_for_step_5:
    %t_91 = add %t_80 8
    jump A_Optimizer_for_cond_5

A_Optimizer_for_body_6:
    %t_101 = alloc 24
    store 2 %t_101 null 0 0
    store %t_101 %t_86 null 0 0
    %t_102 = add %t_101 8
    %t_95 = add %t_101 24
    jump A_Optimizer_for_cond_7

A_Optimizer_for_cond_7:
    %t_94 = phi A_Optimizer_for_body_6 %t_83 A_Optimizer_for_step_7 %t_103 
    %t_96 = phi A_Optimizer_for_body_6 %t_85 A_Optimizer_for_step_7 %t_104 
    %t_98 = phi A_Optimizer_for_body_6 %t_87 A_Optimizer_for_step_7 %t_105 
    %t_99 = phi A_Optimizer_for_body_6 %t_88 A_Optimizer_for_step_7 %t_106 
    %t_100 = phi A_Optimizer_for_body_6 %t_102 A_Optimizer_for_step_7 %t_107 
    cmp %t_100 %t_95
    br slt A_Optimizer_for_body_7 A_Optimizer_for_step_6

A_Optimizer_for_step_6:
    %t_97 = add %t_86 8
    jump A_Optimizer_for_cond_6

A_Optimizer_for_body_7:
    %t_108 = alloc 24
    store 2 %t_108 null 0 0
    store %t_108 %t_100 null 0 0
    %t_109 = add %t_108 8
    %t_104 = add %t_108 24
    jump A_Optimizer_for_cond_8

A_Optimizer_for_cond_8:
    %t_103 = phi A_Optimizer_for_body_7 %t_94 A_Optimizer_for_step_8 %t_110 
    %t_105 = phi A_Optimizer_for_body_7 %t_98 A_Optimizer_for_step_8 %t_111 
    %t_106 = phi A_Optimizer_for_body_7 %t_109 A_Optimizer_for_step_8 %t_112 
    cmp %t_106 %t_104
    br slt A_Optimizer_for_body_8 A_Optimizer_for_step_7

A_Optimizer_for_step_7:
    %t_107 = add %t_100 8
    jump A_Optimizer_for_cond_7

A_Optimizer_for_body_8:
    %t_113 = alloc 24
    store 2 %t_113 null 0 0
    store %t_113 %t_106 null 0 0
    %t_114 = add %t_113 8
    %t_111 = add %t_113 24
    jump A_Optimizer_for_cond_9

A_Optimizer_for_cond_9:
    %t_110 = phi A_Optimizer_for_body_8 %t_114 A_Optimizer_for_body_9 %t_115 
    cmp %t_110 %t_111
    br slt A_Optimizer_for_body_9 A_Optimizer_for_step_8

A_Optimizer_for_step_8:
    %t_112 = add %t_106 8
    jump A_Optimizer_for_cond_8

A_Optimizer_for_body_9:
    %t_116 = alloc 24
    store 2 %t_116 null 0 0
    store %t_116 %t_110 null 0 0
    %t_115 = add %t_110 8
    jump A_Optimizer_for_cond_9

A_Optimizer_for_step_4:
    %t_73 = add %t_59 8
    jump A_Optimizer_for_cond_4

A_Optimizer_for_step_2:
    %t_40 = add %t_39 8
    jump A_Optimizer_for_cond_2

A_Optimizer_for_step_1:
    %t_33 = add %t_32 8
    jump A_Optimizer_for_cond_1

A_Optimizer_for_merge_1:
    jump A_Optimizer_for_cond_10

A_Optimizer_for_cond_10:
    %i_1 = phi A_Optimizer_for_merge_1 1 A_Optimizer_for_body_10 %i_2 
    %sum_1 = phi A_Optimizer_for_merge_1 0 A_Optimizer_for_body_10 %t_117 
    cmp %i_1 1000
    br sle A_Optimizer_for_body_10 A_Optimizer_for_merge_2

A_Optimizer_for_merge_2:
    %t_118 = call toString %sum_1 
    call println %t_118 
    jump A_Optimizer_for_cond_11

A_Optimizer_for_cond_11:
    %i_3 = phi A_Optimizer_for_merge_2 1 A_Optimizer_for_body_11 %i_4 
    %sum_2 = phi A_Optimizer_for_merge_2 %sum_1 A_Optimizer_for_body_11 %t_119 
    cmp %i_3 1000000
    br sle A_Optimizer_for_body_11 A_Optimizer_for_merge_3

A_Optimizer_for_body_11:
    %t_119 = add %sum_2 8
    %i_4 = add %i_3 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_merge_3:
    %t_120 = call toString %sum_2 
    call println %t_120 
    jump A_Optimizer_for_cond_12

A_Optimizer_for_cond_12:
    %i_5 = phi A_Optimizer_for_merge_3 1 A_Optimizer_for_step_9 %i_6 
    cmp %i_5 200000000
    br sle A_Optimizer_for_step_9 A_Optimizer_for_merge_4

A_Optimizer_for_step_9:
    %i_6 = add %i_5 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_merge_4:
    ret 

A_Optimizer_for_body_10:
    %t_121 = add %t_1 8
    %t_122 = load %t_121 null 0 0
    %t_123 = load %t_122 null 0 16
    %t_124 = load %t_123 null 0 8
    %t_125 = load %t_124 null 0 16
    %t_126 = load %t_125 null 0 8
    %t_127 = load %t_126 null 0 16
    %t_128 = load %t_127 null 0 8
    %t_129 = load %t_128 null 0 16
    %t_130 = load %t_129 null 0 8
    %t_131 = add 123 %i_1
    store %t_131 %t_130 null 0 16
    %t_132 = load %t_121 null 0 0
    %t_133 = load %t_132 null 0 16
    %t_134 = load %t_133 null 0 8
    %t_135 = load %t_134 null 0 16
    %t_136 = load %t_135 null 0 8
    %t_137 = load %t_136 null 0 16
    %t_138 = load %t_137 null 0 8
    %t_139 = load %t_138 null 0 16
    %t_140 = load %t_139 null 0 8
    %t_141 = load %t_140 null 0 16
    %t_117 = add %sum_1 %t_141
    %i_2 = add %i_1 1
    jump A_Optimizer_for_cond_10

}

define i64 @A_A  {
A_A_entry_1:
    %t_142 = alloc 24
    store 2 %t_142 null 0 0
    %t_143 = add %t_142 8
    %t_144 = add %t_142 24
    jump A_A_for_cond_1

A_A_for_cond_1:
    %t_145 = phi A_A_entry_1 undef A_A_for_step_1 %t_146 
    %t_147 = phi A_A_entry_1 undef A_A_for_step_1 %t_148 
    %t_149 = phi A_A_entry_1 undef A_A_for_step_1 %t_150 
    %t_151 = phi A_A_entry_1 undef A_A_for_step_1 %t_152 
    %t_153 = phi A_A_entry_1 undef A_A_for_step_1 %t_154 
    %t_155 = phi A_A_entry_1 undef A_A_for_step_1 %t_156 
    %t_157 = phi A_A_entry_1 %t_143 A_A_for_step_1 %t_158 
    %t_159 = phi A_A_entry_1 undef A_A_for_step_1 %t_160 
    %t_161 = phi A_A_entry_1 undef A_A_for_step_1 %t_162 
    %t_163 = phi A_A_entry_1 undef A_A_for_step_1 %t_164 
    %t_165 = phi A_A_entry_1 undef A_A_for_step_1 %t_166 
    %t_167 = phi A_A_entry_1 undef A_A_for_step_1 %t_168 
    %t_169 = phi A_A_entry_1 undef A_A_for_step_1 %t_170 
    %t_171 = phi A_A_entry_1 undef A_A_for_step_1 %t_172 
    %t_173 = phi A_A_entry_1 undef A_A_for_step_1 %t_174 
    cmp %t_157 %t_144
    br slt A_A_for_body_1 A_A_for_merge_1

A_A_for_merge_1:
    store %t_142 %this_1 null 0 0
    ret 0

A_A_for_body_1:
    %t_175 = alloc 24
    store 2 %t_175 null 0 0
    store %t_175 %t_157 null 0 0
    %t_176 = add %t_175 8
    %t_177 = add %t_175 24
    jump A_A_for_cond_2

A_A_for_cond_2:
    %t_146 = phi A_A_for_body_1 %t_145 A_A_for_step_2 %t_178 
    %t_148 = phi A_A_for_body_1 %t_147 A_A_for_step_2 %t_179 
    %t_150 = phi A_A_for_body_1 %t_149 A_A_for_step_2 %t_180 
    %t_152 = phi A_A_for_body_1 %t_151 A_A_for_step_2 %t_181 
    %t_154 = phi A_A_for_body_1 %t_153 A_A_for_step_2 %t_182 
    %t_156 = phi A_A_for_body_1 %t_155 A_A_for_step_2 %t_183 
    %t_160 = phi A_A_for_body_1 %t_159 A_A_for_step_2 %t_184 
    %t_162 = phi A_A_for_body_1 %t_161 A_A_for_step_2 %t_185 
    %t_164 = phi A_A_for_body_1 %t_163 A_A_for_step_2 %t_186 
    %t_166 = phi A_A_for_body_1 %t_165 A_A_for_step_2 %t_187 
    %t_168 = phi A_A_for_body_1 %t_167 A_A_for_step_2 %t_188 
    %t_170 = phi A_A_for_body_1 %t_169 A_A_for_step_2 %t_189 
    %t_190 = phi A_A_for_body_1 %t_176 A_A_for_step_2 %t_191 
    %t_172 = phi A_A_for_body_1 %t_171 A_A_for_step_2 %t_192 
    %t_174 = phi A_A_for_body_1 %t_173 A_A_for_step_2 %t_193 
    cmp %t_190 %t_177
    br slt A_A_for_body_2 A_A_for_step_1

A_A_for_body_2:
    %t_194 = alloc 32
    store 3 %t_194 null 0 0
    store %t_194 %t_190 null 0 0
    %t_195 = add %t_194 8
    %t_192 = add %t_194 32
    jump A_A_for_cond_3

A_A_for_cond_3:
    %t_178 = phi A_A_for_body_2 %t_146 A_A_for_step_3 %t_196 
    %t_179 = phi A_A_for_body_2 %t_148 A_A_for_step_3 %t_197 
    %t_180 = phi A_A_for_body_2 %t_150 A_A_for_step_3 %t_198 
    %t_181 = phi A_A_for_body_2 %t_195 A_A_for_step_3 %t_199 
    %t_182 = phi A_A_for_body_2 %t_154 A_A_for_step_3 %t_200 
    %t_183 = phi A_A_for_body_2 %t_156 A_A_for_step_3 %t_201 
    %t_184 = phi A_A_for_body_2 %t_160 A_A_for_step_3 %t_202 
    %t_185 = phi A_A_for_body_2 %t_162 A_A_for_step_3 %t_203 
    %t_186 = phi A_A_for_body_2 %t_164 A_A_for_step_3 %t_204 
    %t_187 = phi A_A_for_body_2 %t_166 A_A_for_step_3 %t_205 
    %t_188 = phi A_A_for_body_2 %t_168 A_A_for_step_3 %t_206 
    %t_189 = phi A_A_for_body_2 %t_170 A_A_for_step_3 %t_207 
    %t_193 = phi A_A_for_body_2 %t_174 A_A_for_step_3 %t_208 
    cmp %t_181 %t_192
    br slt A_A_for_body_3 A_A_for_step_2

A_A_for_body_3:
    %t_209 = alloc 24
    store 2 %t_209 null 0 0
    store %t_209 %t_181 null 0 0
    %t_210 = add %t_209 8
    %t_205 = add %t_209 24
    jump A_A_for_cond_4

A_A_for_cond_4:
    %t_196 = phi A_A_for_body_3 %t_178 A_A_for_step_4 %t_211 
    %t_197 = phi A_A_for_body_3 %t_179 A_A_for_step_4 %t_212 
    %t_198 = phi A_A_for_body_3 %t_180 A_A_for_step_4 %t_213 
    %t_200 = phi A_A_for_body_3 %t_182 A_A_for_step_4 %t_214 
    %t_201 = phi A_A_for_body_3 %t_183 A_A_for_step_4 %t_215 
    %t_202 = phi A_A_for_body_3 %t_184 A_A_for_step_4 %t_216 
    %t_203 = phi A_A_for_body_3 %t_185 A_A_for_step_4 %t_217 
    %t_204 = phi A_A_for_body_3 %t_186 A_A_for_step_4 %t_218 
    %t_206 = phi A_A_for_body_3 %t_210 A_A_for_step_4 %t_219 
    %t_207 = phi A_A_for_body_3 %t_189 A_A_for_step_4 %t_220 
    %t_208 = phi A_A_for_body_3 %t_193 A_A_for_step_4 %t_221 
    cmp %t_206 %t_205
    br slt A_A_for_body_4 A_A_for_step_3

A_A_for_step_3:
    %t_199 = add %t_181 8
    jump A_A_for_cond_3

A_A_for_body_4:
    %t_222 = alloc 32
    store 3 %t_222 null 0 0
    store %t_222 %t_206 null 0 0
    %t_223 = add %t_222 8
    %t_220 = add %t_222 32
    jump A_A_for_cond_5

A_A_for_cond_5:
    %t_211 = phi A_A_for_body_4 %t_196 A_A_for_step_5 %t_224 
    %t_212 = phi A_A_for_body_4 %t_197 A_A_for_step_5 %t_225 
    %t_213 = phi A_A_for_body_4 %t_198 A_A_for_step_5 %t_226 
    %t_214 = phi A_A_for_body_4 %t_200 A_A_for_step_5 %t_227 
    %t_215 = phi A_A_for_body_4 %t_201 A_A_for_step_5 %t_228 
    %t_216 = phi A_A_for_body_4 %t_202 A_A_for_step_5 %t_229 
    %t_217 = phi A_A_for_body_4 %t_203 A_A_for_step_5 %t_230 
    %t_218 = phi A_A_for_body_4 %t_223 A_A_for_step_5 %t_231 
    %t_221 = phi A_A_for_body_4 %t_208 A_A_for_step_5 %t_232 
    cmp %t_218 %t_220
    br slt A_A_for_body_5 A_A_for_step_4

A_A_for_step_4:
    %t_219 = add %t_206 8
    jump A_A_for_cond_4

A_A_for_body_5:
    %t_233 = alloc 24
    store 2 %t_233 null 0 0
    store %t_233 %t_218 null 0 0
    %t_234 = add %t_233 8
    %t_230 = add %t_233 24
    jump A_A_for_cond_6

A_A_for_cond_6:
    %t_224 = phi A_A_for_body_5 %t_211 A_A_for_step_6 %t_235 
    %t_225 = phi A_A_for_body_5 %t_212 A_A_for_step_6 %t_236 
    %t_226 = phi A_A_for_body_5 %t_213 A_A_for_step_6 %t_237 
    %t_227 = phi A_A_for_body_5 %t_214 A_A_for_step_6 %t_238 
    %t_228 = phi A_A_for_body_5 %t_234 A_A_for_step_6 %t_239 
    %t_229 = phi A_A_for_body_5 %t_216 A_A_for_step_6 %t_240 
    %t_232 = phi A_A_for_body_5 %t_221 A_A_for_step_6 %t_241 
    cmp %t_228 %t_230
    br slt A_A_for_body_6 A_A_for_step_5

A_A_for_step_5:
    %t_231 = add %t_218 8
    jump A_A_for_cond_5

A_A_for_body_6:
    %t_242 = alloc 24
    store 2 %t_242 null 0 0
    store %t_242 %t_228 null 0 0
    %t_243 = add %t_242 8
    %t_241 = add %t_242 24
    jump A_A_for_cond_7

A_A_for_cond_7:
    %t_235 = phi A_A_for_body_6 %t_224 A_A_for_step_7 %t_244 
    %t_236 = phi A_A_for_body_6 %t_225 A_A_for_step_7 %t_245 
    %t_237 = phi A_A_for_body_6 %t_226 A_A_for_step_7 %t_246 
    %t_238 = phi A_A_for_body_6 %t_227 A_A_for_step_7 %t_247 
    %t_240 = phi A_A_for_body_6 %t_243 A_A_for_step_7 %t_248 
    cmp %t_240 %t_241
    br slt A_A_for_body_7 A_A_for_step_6

A_A_for_step_6:
    %t_239 = add %t_228 8
    jump A_A_for_cond_6

A_A_for_body_7:
    %t_249 = alloc 32
    store 3 %t_249 null 0 0
    store %t_249 %t_240 null 0 0
    %t_250 = add %t_249 8
    %t_244 = add %t_249 32
    jump A_A_for_cond_8

A_A_for_cond_8:
    %t_245 = phi A_A_for_body_7 %t_250 A_A_for_step_8 %t_251 
    %t_246 = phi A_A_for_body_7 %t_237 A_A_for_step_8 %t_252 
    %t_247 = phi A_A_for_body_7 %t_238 A_A_for_step_8 %t_253 
    cmp %t_245 %t_244
    br slt A_A_for_body_8 A_A_for_step_7

A_A_for_body_8:
    %t_254 = alloc 24
    store 2 %t_254 null 0 0
    store %t_254 %t_245 null 0 0
    %t_255 = add %t_254 8
    %t_253 = add %t_254 24
    jump A_A_for_cond_9

A_A_for_cond_9:
    %t_252 = phi A_A_for_body_8 %t_255 A_A_for_body_9 %t_256 
    cmp %t_252 %t_253
    br slt A_A_for_body_9 A_A_for_step_8

A_A_for_step_8:
    %t_251 = add %t_245 8
    jump A_A_for_cond_8

A_A_for_body_9:
    %t_257 = alloc 24
    store 2 %t_257 null 0 0
    store %t_257 %t_252 null 0 0
    %t_256 = add %t_252 8
    jump A_A_for_cond_9

A_A_for_step_7:
    %t_248 = add %t_240 8
    jump A_A_for_cond_7

A_A_for_step_2:
    %t_191 = add %t_190 8
    jump A_A_for_cond_2

A_A_for_step_1:
    %t_158 = add %t_157 8
    jump A_A_for_cond_1

}

define i64 @quicksort  {
quicksort_entry_1:
    %a_left_2 = load @a_left_1 null 0 0
    %a_right_2 = load @a_right_1 null 0 0
    %a_2 = load @a_1 null 0 0
    %t_258 = load %a_2 %l_1 8 8
    %t_259 = add %l_1 1
    jump quicksort_for_cond_1

quicksort_for_cond_1:
    %sum_3 = phi quicksort_entry_1 0 quicksort_for_step_1 %sum_4 
    %i_7 = phi quicksort_entry_1 %t_259 quicksort_for_step_1 %i_8 
    %z_r_1 = phi quicksort_entry_1 0 quicksort_for_step_1 %z_r_2 
    %z_l_1 = phi quicksort_entry_1 0 quicksort_for_step_1 %z_l_2 
    cmp %i_7 %r_1
    br slt quicksort_for_body_1 quicksort_for_merge_1

quicksort_for_body_1:
    %sum_4 = add %sum_3 1
    %t_260 = lea %a_2 %i_7 8 8
    %t_261 = load %t_260 null 0 0
    cmp %t_261 %t_258
    br slt quicksort_if_then_1 quicksort_if_else_1

quicksort_if_else_1:
    %z_r_3 = add %z_r_1 1
    %t_262 = load %t_260 null 0 0
    store %t_262 %a_right_2 %z_r_1 8 8
    jump quicksort_for_step_1

quicksort_if_then_1:
    %z_l_3 = add %z_l_1 1
    %t_263 = load %t_260 null 0 0
    store %t_263 %a_left_2 %z_l_1 8 8
    jump quicksort_for_step_1

quicksort_for_step_1:
    %z_r_2 = phi quicksort_if_then_1 %z_r_1 quicksort_if_else_1 %z_r_3 
    %z_l_2 = phi quicksort_if_then_1 %z_l_3 quicksort_if_else_1 %z_l_1 
    %i_8 = add %i_7 1
    jump quicksort_for_cond_1

quicksort_for_merge_1:
    jump quicksort_for_cond_2

quicksort_for_cond_2:
    %p_1 = phi quicksort_for_merge_1 %l_1 quicksort_for_body_2 %p_2 
    %i_9 = phi quicksort_for_merge_1 0 quicksort_for_body_2 %i_10 
    cmp %i_9 %z_l_1
    br slt quicksort_for_body_2 quicksort_for_merge_2

quicksort_for_merge_2:
    %p_3 = add %p_1 1
    store %t_258 %a_2 %p_1 8 8
    jump quicksort_for_cond_3

quicksort_for_cond_3:
    %p_4 = phi quicksort_for_merge_2 %p_3 quicksort_for_body_3 %p_5 
    %i_11 = phi quicksort_for_merge_2 0 quicksort_for_body_3 %i_12 
    cmp %i_11 %z_r_1
    br slt quicksort_for_body_3 quicksort_for_merge_3

quicksort_for_body_3:
    %p_5 = add %p_4 1
    %t_264 = load %a_right_2 %i_11 8 8
    store %t_264 %a_2 %p_4 8 8
    %i_12 = add %i_11 1
    jump quicksort_for_cond_3

quicksort_for_merge_3:
    cmp %z_l_1 1
    br sgt quicksort_if_then_2 quicksort_if_merge_1

quicksort_if_then_2:
    %t_265 = add %l_1 %z_l_1
    %t_266 = call quicksort %l_1 %t_265 
    %t_267 = add %sum_3 %t_266
    jump quicksort_if_merge_1

quicksort_if_merge_1:
    %sum_5 = phi quicksort_for_merge_3 %sum_3 quicksort_if_then_2 %t_267 
    cmp %z_r_1 1
    br sgt quicksort_if_then_3 quicksort_if_merge_2

quicksort_if_then_3:
    %t_268 = sub %r_1 %z_r_1
    %t_269 = call quicksort %t_268 %r_1 
    %t_270 = add %sum_5 %t_269
    jump quicksort_if_merge_2

quicksort_if_merge_2:
    %sum_6 = phi quicksort_if_merge_1 %sum_5 quicksort_if_then_3 %t_270 
    ret %sum_6

quicksort_for_body_2:
    %p_2 = add %p_1 1
    %t_271 = load %a_left_2 %i_9 8 8
    store %t_271 %a_2 %p_1 8 8
    %i_10 = add %i_9 1
    jump quicksort_for_cond_2

}

define i64 @calc  {
calc_entry_1:
    %a_left_3 = load @a_left_1 null 0 0
    %a_right_3 = load @a_right_1 null 0 0
    %a_3 = load @a_1 null 0 0
    %n_2 = load @n_1 null 0 0
    jump calc_for_cond_1

calc_for_cond_1:
    %i_13 = phi calc_entry_1 1 calc_for_body_1 %t_272 
    cmp %i_13 %n_2
    br sle calc_for_body_1 calc_for_merge_1

calc_for_merge_1:
    jump calc_for_cond_2

calc_for_cond_2:
    %sum_7 = phi calc_for_merge_1 0 calc_for_body_2 %t_273 
    %i_14 = phi calc_for_merge_1 %n_2 calc_for_body_2 %i_15 
    cmp %i_14 1
    br sge calc_for_body_2 calc_for_merge_2

calc_for_merge_2:
    ret %sum_7

calc_for_body_2:
    %t_274 = lea %a_3 %i_14 8 8
    %t_275 = load %t_274 null 0 0
    %t_276 = load %a_left_3 %t_275 8 8
    %t_277 = load %t_274 null 0 0
    %t_278 = load %a_right_3 %t_277 8 8
    store %t_278 %a_right_3 %t_276 8 8
    store %t_276 %a_left_3 %t_278 8 8
    %t_279 = add %sum_7 %t_278
    %t_280 = sub %t_279 %t_276
    %t_273 = sub %t_280 2
    %i_15 = sub %i_14 1
    jump calc_for_cond_2

calc_for_body_1:
    %t_281 = lea null %i_13 8 8
    %t_282 = sub %i_13 1
    store %t_282 %a_left_3 %t_281 1 0
    %t_272 = add %i_13 1
    store %t_272 %a_right_3 %t_281 1 0
    jump calc_for_cond_1

}

define i64 @mergesort  {
mergesort_entry_1:
    %a_left_4 = load @a_left_1 null 0 0
    %a_4 = load @a_1 null 0 0
    %a_right_4 = load @a_right_1 null 0 0
    %t_283 = add %l_2 1
    cmp %t_283 %r_2
    br seq mergesort_if_then_1 mergesort_if_merge_1

mergesort_if_then_1:
    jump mergesort_exit_1

mergesort_if_merge_1:
    %t_284 = add %l_2 %r_2
    %t_285 = shr %t_284 1
    %t_286 = call mergesort %l_2 %t_285 
    %t_287 = call mergesort %t_285 %r_2 
    %t_288 = lea %t_286 %t_287 1 0
    jump mergesort_for_cond_1

mergesort_for_cond_1:
    %i_16 = phi mergesort_if_merge_1 %l_2 mergesort_for_body_1 %i_17 
    %n_l_1 = phi mergesort_if_merge_1 0 mergesort_for_body_1 %n_l_2 
    cmp %i_16 %t_285
    br slt mergesort_for_body_1 mergesort_for_merge_1

mergesort_for_merge_1:
    jump mergesort_for_cond_2

mergesort_for_cond_2:
    %n_r_1 = phi mergesort_for_merge_1 0 mergesort_for_body_2 %n_r_2 
    %i_18 = phi mergesort_for_merge_1 %t_285 mergesort_for_body_2 %i_19 
    cmp %i_18 %r_2
    br slt mergesort_for_body_2 mergesort_for_merge_2

mergesort_for_body_2:
    %n_r_2 = add %n_r_1 1
    %t_289 = load %a_4 %i_18 8 8
    store %t_289 %a_right_4 %n_r_1 8 8
    %i_19 = add %i_18 1
    jump mergesort_for_cond_2

mergesort_for_merge_2:
    jump mergesort_while_cond_1

mergesort_while_cond_1:
    %sum_8 = phi mergesort_for_merge_2 %t_288 mergesort_if_else_1 %sum_9 mergesort_if_then_2 %sum_9 
    %z_r_4 = phi mergesort_for_merge_2 0 mergesort_if_else_1 %z_r_5 mergesort_if_then_2 %z_r_4 
    %z_l_4 = phi mergesort_for_merge_2 0 mergesort_if_else_1 %z_l_4 mergesort_if_then_2 %z_l_5 
    %z_1 = phi mergesort_for_merge_2 %l_2 mergesort_if_else_1 %z_2 mergesort_if_then_2 %z_3 
    cmp %z_l_4 %n_l_1
    br slt mergesort_lhs_then_1 mergesort_while_cond_2

mergesort_lhs_then_1:
    cmp %z_r_4 %n_r_1
    br slt mergesort_while_body_1 mergesort_while_cond_2

mergesort_while_body_1:
    %sum_9 = add %sum_8 1
    %t_290 = lea %a_left_4 %z_l_4 8 8
    %t_291 = lea %a_right_4 %z_r_4 8 8
    %t_292 = load %t_290 null 0 0
    %t_293 = load %t_291 null 0 0
    cmp %t_292 %t_293
    br slt mergesort_if_then_2 mergesort_if_else_1

mergesort_if_then_2:
    %z_3 = add %z_1 1
    %z_l_5 = add %z_l_4 1
    %t_294 = load %t_290 null 0 0
    store %t_294 %a_4 %z_1 8 8
    jump mergesort_while_cond_1

mergesort_if_else_1:
    %z_2 = add %z_1 1
    %z_r_5 = add %z_r_4 1
    %t_295 = load %t_291 null 0 0
    store %t_295 %a_4 %z_1 8 8
    jump mergesort_while_cond_1

mergesort_while_cond_2:
    %z_l_6 = phi mergesort_while_cond_1 %z_l_4 mergesort_while_body_2 %z_l_7 mergesort_lhs_then_1 %z_l_4 
    %z_4 = phi mergesort_while_cond_1 %z_1 mergesort_while_body_2 %z_5 mergesort_lhs_then_1 %z_1 
    cmp %z_l_6 %n_l_1
    br slt mergesort_while_body_2 mergesort_while_cond_3

mergesort_while_body_2:
    %z_5 = add %z_4 1
    %z_l_7 = add %z_l_6 1
    %t_296 = load %a_left_4 %z_l_6 8 8
    store %t_296 %a_4 %z_4 8 8
    jump mergesort_while_cond_2

mergesort_while_cond_3:
    %z_r_6 = phi mergesort_while_cond_2 %z_r_4 mergesort_while_body_3 %z_r_7 
    %z_6 = phi mergesort_while_cond_2 %z_4 mergesort_while_body_3 %z_7 
    cmp %z_r_6 %n_r_1
    br slt mergesort_while_body_3 mergesort_while_merge_1

mergesort_while_body_3:
    %z_7 = add %z_6 1
    %z_r_7 = add %z_r_6 1
    %t_297 = load %a_right_4 %z_r_6 8 8
    store %t_297 %a_4 %z_6 8 8
    jump mergesort_while_cond_3

mergesort_while_merge_1:
    jump mergesort_exit_1

mergesort_exit_1:
    %t_298 = phi mergesort_while_merge_1 %sum_8 mergesort_if_then_1 0 
    ret %t_298

mergesort_for_body_1:
    %n_l_2 = add %n_l_1 1
    %t_299 = load %a_4 %i_16 8 8
    store %t_299 %a_left_4 %n_l_1 8 8
    %i_17 = add %i_16 1
    jump mergesort_for_cond_1

}

define i64 @heapsort  {
heapsort_entry_1:
    %heap_2 = load @heap_1 null 0 0
    %a_5 = load @a_1 null 0 0
    %n_3 = load @n_1 null 0 0
    jump heapsort_for_cond_1

heapsort_for_cond_1:
    %sum_10 = phi heapsort_entry_1 0 heapsort_for_step_1 %sum_11 
    %i_20 = phi heapsort_entry_1 1 heapsort_for_step_1 %i_21 
    cmp %i_20 %n_3
    br sle heapsort_for_body_1 heapsort_for_merge_1

heapsort_for_merge_1:
    jump heapsort_for_cond_2

heapsort_for_cond_2:
    %l_3 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %l_4 
    %sum_12 = phi heapsort_for_merge_1 %sum_10 heapsort_for_step_2 %sum_13 
    %heap_size_1 = phi heapsort_for_merge_1 %n_3 heapsort_for_step_2 %heap_size_2 
    %y_1 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %y_2 
    %i_22 = phi heapsort_for_merge_1 1 heapsort_for_step_2 %i_23 
    %r_3 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %r_4 
    cmp %i_22 %n_3
    br sle heapsort_for_body_2 heapsort_for_merge_2

heapsort_for_body_2:
    %t_300 = add %heap_2 16
    %t_301 = load %t_300 null 0 0
    store %t_301 %a_5 %i_22 8 8
    %heap_size_2 = sub %heap_size_1 1
    %t_302 = load %heap_2 %heap_size_1 8 8
    store %t_302 %t_300 null 0 0
    jump heapsort_while_cond_1

heapsort_while_cond_1:
    %l_5 = phi heapsort_for_body_2 %l_3 heapsort_if_merge_1 %t_303 
    %x_1 = phi heapsort_for_body_2 1 heapsort_if_merge_1 %y_3 
    %sum_14 = phi heapsort_for_body_2 %sum_12 heapsort_if_merge_1 %sum_15 
    %y_4 = phi heapsort_for_body_2 %y_1 heapsort_if_merge_1 %x_1 
    %r_5 = phi heapsort_for_body_2 %r_3 heapsort_if_merge_1 %t_304 
    %t_303 = shl %x_1 1
    cmp %t_303 %heap_size_2
    br sle heapsort_while_body_1 heapsort_for_step_2

heapsort_while_body_1:
    %t_304 = add %t_303 1
    cmp %t_304 %heap_size_2
    br sle heapsort_if_then_1 heapsort_if_merge_2

heapsort_if_then_1:
    %sum_16 = add %sum_14 1
    %t_305 = load %heap_2 %t_304 8 8
    %t_306 = load %heap_2 %t_303 8 8
    cmp %t_305 %t_306
    br slt heapsort_if_then_2 heapsort_if_merge_2

heapsort_if_then_2:
    jump heapsort_if_merge_2

heapsort_if_merge_2:
    %sum_17 = phi heapsort_while_body_1 %sum_14 heapsort_if_then_1 %sum_16 heapsort_if_then_2 %sum_16 
    %y_3 = phi heapsort_while_body_1 %t_303 heapsort_if_then_1 %t_303 heapsort_if_then_2 %t_304 
    %sum_15 = add %sum_17 1
    %t_307 = lea %heap_2 %x_1 8 8
    %t_308 = lea %heap_2 %y_3 8 8
    %t_309 = load %t_307 null 0 0
    %t_310 = load %t_308 null 0 0
    cmp %t_309 %t_310
    br slt heapsort_for_step_2 heapsort_if_merge_1

heapsort_for_step_2:
    %l_4 = phi heapsort_while_cond_1 %l_5 heapsort_if_merge_2 %t_303 
    %sum_13 = phi heapsort_while_cond_1 %sum_14 heapsort_if_merge_2 %sum_15 
    %y_2 = phi heapsort_while_cond_1 %y_4 heapsort_if_merge_2 %y_3 
    %r_4 = phi heapsort_while_cond_1 %r_5 heapsort_if_merge_2 %t_304 
    %i_23 = add %i_22 1
    jump heapsort_for_cond_2

heapsort_if_merge_1:
    %t_311 = load %t_307 null 0 0
    %t_312 = load %t_308 null 0 0
    store %t_312 %t_307 null 0 0
    store %t_311 %t_308 null 0 0
    jump heapsort_while_cond_1

heapsort_for_merge_2:
    ret %sum_12

heapsort_for_body_1:
    %t_313 = lea null %i_20 8 8
    %t_314 = load %a_5 %t_313 1 0
    store %t_314 %heap_2 %t_313 1 0
    jump heapsort_while_cond_2

heapsort_while_cond_2:
    %sum_18 = phi heapsort_for_body_1 %sum_10 heapsort_if_merge_3 %sum_19 
    %x_2 = phi heapsort_for_body_1 %i_20 heapsort_if_merge_3 %t_315 
    cmp %x_2 1
    br sne heapsort_while_body_2 heapsort_for_step_1

heapsort_while_body_2:
    %sum_19 = add %sum_18 1
    %t_316 = lea %heap_2 %x_2 8 8
    %t_315 = shr %x_2 1
    %t_317 = lea %heap_2 %t_315 8 8
    %t_318 = load %t_316 null 0 0
    %t_319 = load %t_317 null 0 0
    cmp %t_318 %t_319
    br sgt heapsort_for_step_1 heapsort_if_merge_3

heapsort_for_step_1:
    %sum_11 = phi heapsort_while_cond_2 %sum_18 heapsort_while_body_2 %sum_19 
    %i_21 = add %i_20 1
    jump heapsort_for_cond_1

heapsort_if_merge_3:
    %t_320 = load %t_316 null 0 0
    %t_321 = load %t_317 null 0 0
    store %t_321 %t_316 null 0 0
    store %t_320 %t_317 null 0 0
    jump heapsort_while_cond_2

}

define i64 @main  {
main_entry_1:
    %a_6 = load @a_1 null 0 0
    %bak_2 = load @bak_1 null 0 0
    %t_322 = call getInt 
    %t_323 = call getInt 
    jump main_for_cond_1

main_for_cond_1:
    %i_24 = phi main_entry_1 1 main_if_merge_1 %i_25 
    cmp %i_24 %t_322
    br sle main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_324 = lea %a_6 %i_24 8 8
    store %i_24 %t_324 null 0 0
    cmp %i_24 %t_323
    br sle main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_325 = add %t_323 1
    %t_326 = sub %t_325 %i_24
    store %t_326 %t_324 null 0 0
    jump main_if_merge_1

main_if_merge_1:
    %t_327 = lea null %i_24 8 8
    %t_328 = load %a_6 %t_327 1 0
    store %t_328 %bak_2 %t_327 1 0
    %i_25 = add %i_24 1
    jump main_for_cond_1

main_for_merge_1:
    %t_329 = add %t_322 1
    %t_330 = call quicksort 1 %t_329 
    jump main_faker_restore_for_cond_1

main_faker_restore_for_cond_1:
    %i_26 = phi main_for_merge_1 1 main_faker_restore_for_body_1 %i_27 
    cmp %i_26 %t_322
    br sle main_faker_restore_for_body_1 main_splitter_1

main_splitter_1:
    store %t_322 @n_1 null 0 0
    %t_331 = call calc 
    jump main_faker_restore_for_cond_2

main_faker_restore_for_cond_2:
    %i_28 = phi main_splitter_1 1 main_faker_restore_for_body_2 %i_29 
    cmp %i_28 %t_322
    br sle main_faker_restore_for_body_2 main_splitter_2

main_splitter_2:
    %t_332 = add %t_322 1
    %t_333 = call mergesort 1 %t_332 
    jump main_faker_restore_for_cond_3

main_faker_restore_for_cond_3:
    %i_30 = phi main_splitter_2 1 main_faker_restore_for_body_3 %i_31 
    cmp %i_30 %t_322
    br sle main_faker_restore_for_body_3 main_splitter_3

main_faker_restore_for_body_3:
    %t_334 = lea null %i_30 8 8
    %t_335 = load %bak_2 %t_334 1 0
    store %t_335 %a_6 %t_334 1 0
    %i_31 = add %i_30 1
    jump main_faker_restore_for_cond_3

main_splitter_3:
    store %t_322 @n_1 null 0 0
    %t_336 = call heapsort 
    %t_337 = call toString %t_330 
    call println %t_337 
    %t_338 = call toString %t_331 
    call println %t_338 
    %t_339 = call toString %t_333 
    call println %t_339 
    %t_340 = call toString %t_336 
    call println %t_340 
    %t_341 = alloc 8
    call A_A %t_341 
    call A_Optimizer 
    store %t_322 @n_1 null 0 0
    ret 0

main_faker_restore_for_body_2:
    %t_342 = lea null %i_28 8 8
    %t_343 = load %bak_2 %t_342 1 0
    store %t_343 %a_6 %t_342 1 0
    %i_29 = add %i_28 1
    jump main_faker_restore_for_cond_2

main_faker_restore_for_body_1:
    %t_344 = lea null %i_26 8 8
    %t_345 = load %bak_2 %t_344 1 0
    store %t_345 %a_6 %t_344 1 0
    %i_27 = add %i_26 1
    jump main_faker_restore_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %t_346 = alloc 800008
    store 100000 %t_346 null 0 0
    %t_347 = alloc 800008
    store 100000 %t_347 null 0 0
    %t_348 = alloc 800008
    store 100000 %t_348 null 0 0
    %t_349 = alloc 800008
    store 100000 %t_349 null 0 0
    %t_350 = alloc 800008
    store 100000 %t_350 null 0 0
    store %t_347 @bak_1 null 0 0
    store %t_346 @a_1 null 0 0
    store %t_349 @a_right_1 null 0 0
    store %t_348 @a_left_1 null 0 0
    store %t_350 @heap_1 null 0 0
    %t_351 = call main 
    store %t_347 @bak_1 null 0 0
    store %t_346 @a_1 null 0 0
    store %t_349 @a_right_1 null 0 0
    store %t_348 @a_left_1 null 0 0
    store %t_350 @heap_1 null 0 0
    store 100000 @N_1 null 0 0
    ret %t_351

}


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
    %outputBuffer_2 = load @outputBuffer_1 null 0 0
    %MAXCHUNK_2 = load @MAXCHUNK_1 null 0 0
    %chunks_2 = load @chunks_1 null 0 0
    %t_1 = lea %length_1 null 0 8
    %t_2 = div %t_1 64
    %t_3 = add %t_2 1
    cmp %t_3 %MAXCHUNK_2
    br sgt sha1_if_then_1 sha1_if_merge_1

sha1_if_then_1:
    call println @__str_const_3 
    jump sha1_exit_1

sha1_if_merge_1:
    jump sha1_for_cond_1

sha1_for_cond_1:
    %i_1 = phi sha1_if_merge_1 0 sha1_for_step_1 %i_2 
    cmp %i_1 %t_3
    br slt sha1_for_body_1 sha1_for_merge_1

sha1_for_body_1:
    jump sha1_for_cond_2

sha1_for_cond_2:
    %j_1 = phi sha1_for_body_1 0 sha1_for_body_2 %j_2 
    cmp %j_1 80
    br slt sha1_for_body_2 sha1_for_step_1

sha1_for_step_1:
    %i_2 = add %i_1 1
    jump sha1_for_cond_1

sha1_for_body_2:
    %t_4 = load %chunks_2 %i_1 8 8
    store 0 %t_4 %j_1 8 8
    %j_2 = add %j_1 1
    jump sha1_for_cond_2

sha1_for_merge_1:
    jump sha1_for_cond_3

sha1_for_cond_3:
    %i_3 = phi sha1_for_merge_1 0 sha1_for_body_3 %i_4 
    cmp %i_3 %length_1
    br slt sha1_for_body_3 sha1_for_merge_2

sha1_for_merge_2:
    %t_5 = div %i_3 64
    %t_6 = lea %chunks_2 %t_5 8 8
    %t_7 = mod %i_3 64
    %t_8 = div %t_7 4
    %t_9 = load %t_6 null 0 0
    %t_10 = lea null %t_8 8 8
    %t_11 = load %t_6 null 0 0
    %t_12 = mod %i_3 4
    %t_13 = sub 3 %t_12
    %t_14 = mul %t_13 8
    %t_15 = shl 128 %t_14
    %t_16 = load %t_11 %t_10 1 0
    %t_17 = or %t_16 %t_15
    store %t_17 %t_9 %t_10 1 0
    %t_18 = lea %chunks_2 %t_3 8 0
    %t_19 = load %t_18 null 0 0
    %t_20 = shl %length_1 3
    store %t_20 %t_19 null 0 128
    %t_21 = load %t_18 null 0 0
    %t_22 = shr %length_1 29
    %t_23 = and %t_22 7
    store %t_23 %t_21 null 0 120
    jump sha1_for_cond_4

sha1_for_cond_4:
    %t_24 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_25 
    %t_26 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_27 
    %h1_1 = phi sha1_for_merge_2 -271733879 sha1_for_merge_3 %t_28 
    %t_29 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_30 
    %k_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %k_2 
    %h0_1 = phi sha1_for_merge_2 1732584193 sha1_for_merge_3 %t_31 
    %h4_1 = phi sha1_for_merge_2 -1009589776 sha1_for_merge_3 %t_32 
    %h3_1 = phi sha1_for_merge_2 271733878 sha1_for_merge_3 %t_33 
    %x_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_2 
    %x_3 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_4 
    %f_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %f_2 
    %shift_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_2 
    %x_5 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_6 
    %shift_3 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_4 
    %h2_1 = phi sha1_for_merge_2 -1732584194 sha1_for_merge_3 %t_34 
    %temp_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %temp_2 
    %i_5 = phi sha1_for_merge_2 0 sha1_for_merge_3 %i_6 
    %t_35 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_36 
    %shift_5 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_6 
    cmp %i_5 %t_3
    br slt sha1_for_body_4 sha1_for_merge_4

sha1_for_body_4:
    jump sha1_for_cond_5

sha1_for_cond_5:
    %t_25 = phi sha1_for_body_4 %t_24 sha1_for_body_5 %t_37 
    %j_3 = phi sha1_for_body_4 16 sha1_for_body_5 %j_4 
    %t_30 = phi sha1_for_body_4 %t_29 sha1_for_body_5 %t_38 
    %x_6 = phi sha1_for_body_4 %x_5 sha1_for_body_5 %t_39 
    %shift_4 = phi sha1_for_body_4 %shift_3 sha1_for_body_5 1 
    cmp %j_3 80
    br slt sha1_for_body_5 sha1_for_merge_5

sha1_for_merge_5:
    jump sha1_for_cond_6

sha1_for_cond_6:
    %j_5 = phi sha1_for_merge_5 0 sha1_if_merge_2 %j_6 
    %t_27 = phi sha1_for_merge_5 %t_26 sha1_if_merge_2 %t_40 
    %b_1 = phi sha1_for_merge_5 %h1_1 sha1_if_merge_2 %a_1 
    %k_2 = phi sha1_for_merge_5 %k_1 sha1_if_merge_2 %k_3 
    %e_1 = phi sha1_for_merge_5 %h4_1 sha1_if_merge_2 %d_1 
    %x_2 = phi sha1_for_merge_5 %x_1 sha1_if_merge_2 %b_1 
    %x_4 = phi sha1_for_merge_5 %x_3 sha1_if_merge_2 %a_1 
    %f_2 = phi sha1_for_merge_5 %f_1 sha1_if_merge_2 %f_3 
    %shift_2 = phi sha1_for_merge_5 %shift_1 sha1_if_merge_2 5 
    %c_1 = phi sha1_for_merge_5 %h2_1 sha1_if_merge_2 %t_40 
    %d_1 = phi sha1_for_merge_5 %h3_1 sha1_if_merge_2 %c_1 
    %a_1 = phi sha1_for_merge_5 %h0_1 sha1_if_merge_2 %t_41 
    %temp_2 = phi sha1_for_merge_5 %temp_1 sha1_if_merge_2 %t_41 
    %t_36 = phi sha1_for_merge_5 %t_35 sha1_if_merge_2 %t_42 
    %shift_6 = phi sha1_for_merge_5 %shift_5 sha1_if_merge_2 30 
    cmp %j_5 80
    br slt sha1_for_body_6 sha1_for_merge_3

sha1_for_merge_3:
    %t_43 = and %h0_1 65535
    %t_44 = and %a_1 65535
    %t_45 = add %t_43 %t_44
    %t_46 = shr %h0_1 16
    %t_47 = and %t_46 65535
    %t_48 = shr %a_1 16
    %t_49 = and %t_48 65535
    %t_50 = add %t_47 %t_49
    %t_51 = shr %t_45 16
    %t_52 = add %t_50 %t_51
    %t_53 = and %t_52 65535
    %t_54 = shl %t_53 16
    %t_55 = and %t_45 65535
    %t_31 = or %t_54 %t_55
    %t_56 = and %h1_1 65535
    %t_57 = and %b_1 65535
    %t_58 = add %t_56 %t_57
    %t_59 = shr %h1_1 16
    %t_60 = and %t_59 65535
    %t_61 = shr %b_1 16
    %t_62 = and %t_61 65535
    %t_63 = add %t_60 %t_62
    %t_64 = shr %t_58 16
    %t_65 = add %t_63 %t_64
    %t_66 = and %t_65 65535
    %t_67 = shl %t_66 16
    %t_68 = and %t_58 65535
    %t_28 = or %t_67 %t_68
    %t_69 = and %h2_1 65535
    %t_70 = and %c_1 65535
    %t_71 = add %t_69 %t_70
    %t_72 = shr %h2_1 16
    %t_73 = and %t_72 65535
    %t_74 = shr %c_1 16
    %t_75 = and %t_74 65535
    %t_76 = add %t_73 %t_75
    %t_77 = shr %t_71 16
    %t_78 = add %t_76 %t_77
    %t_79 = and %t_78 65535
    %t_80 = shl %t_79 16
    %t_81 = and %t_71 65535
    %t_34 = or %t_80 %t_81
    %t_82 = and %h3_1 65535
    %t_83 = and %d_1 65535
    %t_84 = add %t_82 %t_83
    %t_85 = shr %h3_1 16
    %t_86 = and %t_85 65535
    %t_87 = shr %d_1 16
    %t_88 = and %t_87 65535
    %t_89 = add %t_86 %t_88
    %t_90 = shr %t_84 16
    %t_91 = add %t_89 %t_90
    %t_92 = and %t_91 65535
    %t_93 = shl %t_92 16
    %t_94 = and %t_84 65535
    %t_33 = or %t_93 %t_94
    %t_95 = and %h4_1 65535
    %t_96 = and %e_1 65535
    %t_97 = add %t_95 %t_96
    %t_98 = shr %h4_1 16
    %t_99 = and %t_98 65535
    %t_100 = shr %e_1 16
    %t_101 = and %t_100 65535
    %t_102 = add %t_99 %t_101
    %t_103 = shr %t_97 16
    %t_104 = add %t_102 %t_103
    %t_105 = and %t_104 65535
    %t_106 = shl %t_105 16
    %t_107 = and %t_97 65535
    %t_32 = or %t_106 %t_107
    %i_6 = add %i_5 1
    jump sha1_for_cond_4

sha1_for_body_6:
    cmp %j_5 20
    br slt sha1_if_then_2 sha1_if_else_1

sha1_if_else_1:
    cmp %j_5 40
    br slt sha1_if_then_3 sha1_if_else_2

sha1_if_else_2:
    cmp %j_5 60
    br slt sha1_if_then_4 sha1_if_else_3

sha1_if_else_3:
    %t_108 = xor %b_1 %c_1
    %t_109 = xor %t_108 %d_1
    jump sha1_if_merge_2

sha1_if_then_4:
    %t_110 = and %b_1 %c_1
    %t_111 = and %b_1 %d_1
    %t_112 = or %t_110 %t_111
    %t_113 = and %c_1 %d_1
    %t_114 = or %t_112 %t_113
    jump sha1_if_merge_2

sha1_if_then_3:
    %t_115 = xor %b_1 %c_1
    %t_116 = xor %t_115 %d_1
    jump sha1_if_merge_2

sha1_if_then_2:
    %t_117 = and %b_1 %c_1
    %t_118 = not %b_1
    %t_119 = and %t_118 %d_1
    %t_120 = or %t_117 %t_119
    jump sha1_if_merge_2

sha1_if_merge_2:
    %k_3 = phi sha1_if_then_2 1518500249 sha1_if_then_3 1859775393 sha1_if_then_4 -1894007588 sha1_if_else_3 -899497514 
    %f_3 = phi sha1_if_then_2 %t_120 sha1_if_then_3 %t_116 sha1_if_then_4 %t_114 sha1_if_else_3 %t_109 
    %t_121 = and %a_1 134217727
    %t_122 = shl %t_121 5
    %t_123 = shr %a_1 27
    %t_124 = and %t_123 31
    %t_42 = or %t_122 %t_124
    %t_125 = and %t_42 65535
    %t_126 = and %e_1 65535
    %t_127 = add %t_125 %t_126
    %t_128 = shr %t_42 16
    %t_129 = and %t_128 65535
    %t_130 = shr %e_1 16
    %t_131 = and %t_130 65535
    %t_132 = add %t_129 %t_131
    %t_133 = shr %t_127 16
    %t_134 = add %t_132 %t_133
    %t_135 = and %t_134 65535
    %t_136 = shl %t_135 16
    %t_137 = and %t_127 65535
    %t_138 = or %t_136 %t_137
    %t_139 = and %f_3 65535
    %t_140 = and %k_3 65535
    %t_141 = add %t_139 %t_140
    %t_142 = shr %f_3 16
    %t_143 = and %t_142 65535
    %t_144 = shr %k_3 16
    %t_145 = and %t_144 65535
    %t_146 = add %t_143 %t_145
    %t_147 = shr %t_141 16
    %t_148 = add %t_146 %t_147
    %t_149 = and %t_148 65535
    %t_150 = shl %t_149 16
    %t_151 = and %t_141 65535
    %t_152 = or %t_150 %t_151
    %t_153 = and %t_138 65535
    %t_154 = and %t_152 65535
    %t_155 = add %t_153 %t_154
    %t_156 = shr %t_138 16
    %t_157 = and %t_156 65535
    %t_158 = shr %t_152 16
    %t_159 = and %t_158 65535
    %t_160 = add %t_157 %t_159
    %t_161 = shr %t_155 16
    %t_162 = add %t_160 %t_161
    %t_163 = and %t_162 65535
    %t_164 = shl %t_163 16
    %t_165 = and %t_155 65535
    %t_166 = or %t_164 %t_165
    %t_167 = load %chunks_2 %i_5 8 8
    %t_168 = load %t_167 %j_5 8 8
    %t_169 = and %t_166 65535
    %t_170 = and %t_168 65535
    %t_171 = add %t_169 %t_170
    %t_172 = shr %t_166 16
    %t_173 = and %t_172 65535
    %t_174 = shr %t_168 16
    %t_175 = and %t_174 65535
    %t_176 = add %t_173 %t_175
    %t_177 = shr %t_171 16
    %t_178 = add %t_176 %t_177
    %t_179 = and %t_178 65535
    %t_180 = shl %t_179 16
    %t_181 = and %t_171 65535
    %t_41 = or %t_180 %t_181
    %t_182 = and %b_1 3
    %t_183 = shl %t_182 30
    %t_184 = shr %b_1 2
    %t_185 = and %t_184 1073741823
    %t_40 = or %t_183 %t_185
    %j_6 = add %j_5 1
    jump sha1_for_cond_6

sha1_for_body_5:
    %t_186 = lea %chunks_2 %i_5 8 8
    %t_187 = load %t_186 null 0 0
    %t_37 = lea %t_187 %j_3 8 8
    %t_188 = load %t_186 null 0 0
    %t_189 = load %t_186 null 0 0
    %t_190 = load %t_188 %j_3 8 -16
    %t_191 = load %t_189 %j_3 8 -56
    %t_192 = xor %t_190 %t_191
    %t_193 = load %t_186 null 0 0
    %t_194 = load %t_193 %j_3 8 -104
    %t_195 = xor %t_192 %t_194
    %t_196 = load %t_186 null 0 0
    %t_197 = load %t_196 %j_3 8 -120
    %t_39 = xor %t_195 %t_197
    %t_198 = and %t_39 2147483647
    %t_199 = shl %t_198 1
    %t_200 = shr %t_39 31
    %t_201 = and %t_200 1
    %t_38 = or %t_199 %t_201
    store %t_38 %t_37 null 0 0
    %j_4 = add %j_3 1
    jump sha1_for_cond_5

sha1_for_merge_4:
    store %h0_1 %outputBuffer_2 null 0 8
    store %h1_1 %outputBuffer_2 null 0 16
    store %h2_1 %outputBuffer_2 null 0 24
    store %h3_1 %outputBuffer_2 null 0 32
    store %h4_1 %outputBuffer_2 null 0 40
    jump sha1_exit_1

sha1_exit_1:
    %t_202 = phi sha1_for_merge_4 %outputBuffer_2 sha1_if_then_1 0 
    ret %t_202

sha1_for_body_3:
    %t_203 = div %i_3 64
    %t_204 = lea %chunks_2 %t_203 8 8
    %t_205 = mod %i_3 64
    %t_206 = div %t_205 4
    %t_207 = load %t_204 null 0 0
    %t_208 = lea null %t_206 8 8
    %t_209 = load %t_204 null 0 0
    %t_210 = mod %i_3 4
    %t_211 = sub 3 %t_210
    %t_212 = mul %t_211 8
    %t_213 = load %input_1 %i_3 8 8
    %t_214 = shl %t_213 %t_212
    %t_215 = load %t_209 %t_208 1 0
    %t_216 = or %t_215 %t_214
    store %t_216 %t_207 %t_208 1 0
    %i_4 = add %i_3 1
    jump sha1_for_cond_3

}

define i64 @main  {
main_entry_1:
    %asciiTable_2 = load @asciiTable_1 null 0 0
    %inputBuffer_2 = load @inputBuffer_1 null 0 0
    jump main_while_body_1

main_while_body_1:
    %digit_1 = phi main_entry_1 undef main_if_else_1 %digit_1 main_faker_crackSHA1_for_merge_1 %digit_2 main_faker_crackSHA1_for_merge_2 %digit_2 main_faker_crackSHA1_if_then_1 %digit_1 main_splitter_1 %digit_1 
    %i_7 = phi main_entry_1 undef main_if_else_1 %i_7 main_faker_crackSHA1_for_merge_1 %i_7 main_faker_crackSHA1_for_merge_2 %i_7 main_faker_crackSHA1_if_then_1 %i_7 main_splitter_1 %i_8 
    %i_9 = phi main_entry_1 undef main_if_else_1 %i_9 main_faker_crackSHA1_for_merge_1 %i_10 main_faker_crackSHA1_for_merge_2 %i_10 main_faker_crackSHA1_if_then_1 %i_9 main_splitter_1 %i_9 
    %input_2 = phi main_entry_1 undef main_if_else_1 %input_2 main_faker_crackSHA1_for_merge_1 %input_2 main_faker_crackSHA1_for_merge_2 %input_2 main_faker_crackSHA1_if_then_1 %input_2 main_splitter_1 %t_217 
    %t_218 = phi main_entry_1 undef main_if_else_1 %t_218 main_faker_crackSHA1_for_merge_1 %t_219 main_faker_crackSHA1_for_merge_2 %t_220 main_faker_crackSHA1_if_then_1 %t_218 main_splitter_1 %t_218 
    %result_1 = phi main_entry_1 undef main_if_else_1 %result_1 main_faker_crackSHA1_for_merge_1 %result_2 main_faker_crackSHA1_for_merge_2 %result_2 main_faker_crackSHA1_if_then_1 %result_1 main_splitter_1 %result_1 
    %t_221 = phi main_entry_1 undef main_if_else_1 %t_221 main_faker_crackSHA1_for_merge_1 %t_222 main_faker_crackSHA1_for_merge_2 %t_223 main_faker_crackSHA1_if_then_1 %t_221 main_splitter_1 %t_221 
    %t_224 = phi main_entry_1 undef main_if_else_1 %t_224 main_faker_crackSHA1_for_merge_1 %t_225 main_faker_crackSHA1_for_merge_2 %t_225 main_faker_crackSHA1_if_then_1 %t_224 main_splitter_1 %t_224 
    %now_1 = phi main_entry_1 undef main_if_else_1 %now_1 main_faker_crackSHA1_for_merge_1 %now_2 main_faker_crackSHA1_for_merge_2 %now_3 main_faker_crackSHA1_if_then_1 %now_1 main_splitter_1 %now_1 
    %x_7 = phi main_entry_1 undef main_if_else_1 %x_7 main_faker_crackSHA1_for_merge_1 %x_7 main_faker_crackSHA1_for_merge_2 %x_7 main_faker_crackSHA1_if_then_1 %x_7 main_splitter_1 %x_8 
    %t_226 = phi main_entry_1 undef main_if_else_1 %t_226 main_faker_crackSHA1_for_merge_1 %t_227 main_faker_crackSHA1_for_merge_2 %t_227 main_faker_crackSHA1_if_then_1 %t_226 main_splitter_1 %t_226 
    %i_11 = phi main_entry_1 undef main_if_else_1 %i_11 main_faker_crackSHA1_for_merge_1 %i_12 main_faker_crackSHA1_for_merge_2 %i_13 main_faker_crackSHA1_if_then_1 %i_11 main_splitter_1 %i_11 
    %digit_3 = phi main_entry_1 undef main_if_else_1 %digit_3 main_faker_crackSHA1_for_merge_1 %digit_3 main_faker_crackSHA1_for_merge_2 %digit_3 main_faker_crackSHA1_if_then_1 %digit_3 main_splitter_1 %digit_4 
    %x_9 = phi main_entry_1 undef main_if_else_1 %x_9 main_faker_crackSHA1_for_merge_1 %x_10 main_faker_crackSHA1_for_merge_2 %x_10 main_faker_crackSHA1_if_then_1 %x_9 main_splitter_1 %x_9 
    %x_11 = phi main_entry_1 undef main_if_else_1 %x_11 main_faker_crackSHA1_for_merge_1 %x_11 main_faker_crackSHA1_for_merge_2 %x_11 main_faker_crackSHA1_if_then_1 %x_11 main_splitter_1 %x_12 
    %x_13 = phi main_entry_1 undef main_if_else_1 %x_13 main_faker_crackSHA1_for_merge_1 %x_13 main_faker_crackSHA1_for_merge_2 %x_13 main_faker_crackSHA1_if_then_1 %x_13 main_splitter_1 %x_14 
    %digit_5 = phi main_entry_1 undef main_if_else_1 %digit_5 main_faker_crackSHA1_for_merge_1 %digit_6 main_faker_crackSHA1_for_merge_2 %digit_6 main_faker_crackSHA1_if_then_1 %digit_5 main_splitter_1 %digit_5 
    %input_3 = phi main_entry_1 undef main_if_else_1 %input_3 main_faker_crackSHA1_for_merge_1 %t_228 main_faker_crackSHA1_for_merge_2 %t_228 main_faker_crackSHA1_if_then_1 %t_228 main_splitter_1 %input_3 
    %now_4 = phi main_entry_1 undef main_if_else_1 %now_4 main_faker_crackSHA1_for_merge_1 %now_5 main_faker_crackSHA1_for_merge_2 %now_6 main_faker_crackSHA1_if_then_1 %now_4 main_splitter_1 %now_4 
    %x_15 = phi main_entry_1 undef main_if_else_1 %x_15 main_faker_crackSHA1_for_merge_1 %x_16 main_faker_crackSHA1_for_merge_2 %x_15 main_faker_crackSHA1_if_then_1 %x_15 main_splitter_1 %x_15 
    %t_229 = phi main_entry_1 undef main_if_else_1 %t_229 main_faker_crackSHA1_for_merge_1 %t_230 main_faker_crackSHA1_for_merge_2 %t_229 main_faker_crackSHA1_if_then_1 %t_229 main_splitter_1 %t_229 
    %i_14 = phi main_entry_1 undef main_if_else_1 %i_14 main_faker_crackSHA1_for_merge_1 %i_15 main_faker_crackSHA1_for_merge_2 %i_16 main_faker_crackSHA1_if_then_1 %i_14 main_splitter_1 %i_14 
    %result_3 = phi main_entry_1 undef main_if_else_1 %result_3 main_faker_crackSHA1_for_merge_1 %result_3 main_faker_crackSHA1_for_merge_2 %result_3 main_faker_crackSHA1_if_then_1 %result_3 main_splitter_1 %t_231 
    %t_232 = phi main_entry_1 undef main_if_else_1 %t_232 main_faker_crackSHA1_for_merge_1 %t_233 main_faker_crackSHA1_for_merge_2 %t_234 main_faker_crackSHA1_if_then_1 %t_232 main_splitter_1 %t_232 
    %MAXDIGIT_1 = phi main_entry_1 undef main_if_else_1 %MAXDIGIT_1 main_faker_crackSHA1_for_merge_1 4 main_faker_crackSHA1_for_merge_2 4 main_faker_crackSHA1_if_then_1 %MAXDIGIT_1 main_splitter_1 %MAXDIGIT_1 
    %t_235 = phi main_entry_1 undef main_if_else_1 %t_235 main_faker_crackSHA1_for_merge_1 %t_235 main_faker_crackSHA1_for_merge_2 %t_235 main_faker_crackSHA1_if_then_1 %t_235 main_splitter_1 %t_236 
    %target_1 = phi main_entry_1 undef main_if_else_1 %target_1 main_faker_crackSHA1_for_merge_1 %t_237 main_faker_crackSHA1_for_merge_2 %t_237 main_faker_crackSHA1_if_then_1 %t_237 main_splitter_1 %target_1 
    %t_238 = phi main_entry_1 undef main_if_else_1 %t_238 main_faker_crackSHA1_for_merge_1 %t_239 main_faker_crackSHA1_for_merge_2 %t_239 main_faker_crackSHA1_if_then_1 %t_238 main_splitter_1 %t_238 
    %i_17 = phi main_entry_1 undef main_if_else_1 %i_17 main_faker_crackSHA1_for_merge_1 %i_18 main_faker_crackSHA1_for_merge_2 %i_19 main_faker_crackSHA1_if_then_1 %i_17 main_splitter_1 %i_17 
    %a_2 = phi main_entry_1 undef main_if_else_1 %a_2 main_faker_crackSHA1_for_merge_1 %t_240 main_faker_crackSHA1_for_merge_2 %a_3 main_faker_crackSHA1_if_then_1 %a_2 main_splitter_1 %a_2 
    %t_241 = phi main_entry_1 undef main_if_else_1 %t_241 main_faker_crackSHA1_for_merge_1 %t_242 main_faker_crackSHA1_for_merge_2 %t_243 main_faker_crackSHA1_if_then_1 %t_241 main_splitter_1 %t_241 
    %b_2 = phi main_entry_1 undef main_if_else_1 %b_2 main_faker_crackSHA1_for_merge_1 %t_237 main_faker_crackSHA1_for_merge_2 %b_3 main_faker_crackSHA1_if_then_1 %b_2 main_splitter_1 %b_2 
    %ret_1 = phi main_entry_1 undef main_if_else_1 %ret_1 main_faker_crackSHA1_for_merge_1 %ret_1 main_faker_crackSHA1_for_merge_2 %ret_1 main_faker_crackSHA1_if_then_1 %ret_1 main_splitter_1 %ret_2 
    %t_244 = phi main_entry_1 undef main_if_else_1 %t_244 main_faker_crackSHA1_for_merge_1 %t_244 main_faker_crackSHA1_for_merge_2 %t_244 main_faker_crackSHA1_if_then_1 %t_244 main_splitter_1 %t_245 
    %i_20 = phi main_entry_1 undef main_if_else_1 %i_20 main_faker_crackSHA1_for_merge_1 %i_20 main_faker_crackSHA1_for_merge_2 %i_20 main_faker_crackSHA1_if_then_1 %i_20 main_splitter_1 %i_21 
    %t_246 = call getInt 
    cmp %t_246 0
    br seq main_while_merge_1 main_if_merge_1

main_if_merge_1:
    cmp %t_246 1
    br seq main_if_then_1 main_if_else_1

main_if_then_1:
    %t_217 = call getString 
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_cond_1:
    %i_22 = phi main_if_then_1 0 main_faker_computeSHA1_for_body_1 %i_23 
    %t_247 = call string.length %t_217 
    cmp %i_22 %t_247
    br slt main_faker_computeSHA1_for_body_1 main_faker_computeSHA1_for_merge_1

main_faker_computeSHA1_for_body_1:
    %t_248 = call string.ord %t_217 %i_22 
    store %t_248 %inputBuffer_2 %i_22 8 8
    %i_23 = add %i_22 1
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_merge_1:
    %t_249 = call string.length %t_217 
    %t_231 = call sha1 %inputBuffer_2 %t_249 
    jump main_faker_computeSHA1_for_cond_2

main_faker_computeSHA1_for_cond_2:
    %i_8 = phi main_faker_computeSHA1_for_merge_1 %i_7 main_faker_computeSHA1_splitter_1 %i_24 
    %x_8 = phi main_faker_computeSHA1_for_merge_1 %x_7 main_faker_computeSHA1_splitter_1 %x_17 
    %digit_4 = phi main_faker_computeSHA1_for_merge_1 %digit_3 main_faker_computeSHA1_splitter_1 %digit_7 
    %x_12 = phi main_faker_computeSHA1_for_merge_1 %x_11 main_faker_computeSHA1_splitter_1 %t_250 
    %x_14 = phi main_faker_computeSHA1_for_merge_1 %x_13 main_faker_computeSHA1_splitter_1 %x_18 
    %t_236 = phi main_faker_computeSHA1_for_merge_1 %t_235 main_faker_computeSHA1_splitter_1 %t_251 
    %ret_2 = phi main_faker_computeSHA1_for_merge_1 %ret_1 main_faker_computeSHA1_splitter_1 %ret_3 
    %t_245 = phi main_faker_computeSHA1_for_merge_1 %t_244 main_faker_computeSHA1_splitter_1 %t_252 
    %i_21 = phi main_faker_computeSHA1_for_merge_1 0 main_faker_computeSHA1_splitter_1 %i_25 
    %t_253 = load %t_231 null 0 0
    cmp %i_21 %t_253
    br slt main_faker_computeSHA1_for_body_2 main_splitter_1

main_splitter_1:
    call println @__str_const_4 
    jump main_while_body_1

main_faker_computeSHA1_for_body_2:
    %t_250 = load %t_231 %i_21 8 8
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_faker_toStringHex_for_cond_1:
    %i_24 = phi main_faker_computeSHA1_for_body_2 28 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_254 
    %x_17 = phi main_faker_computeSHA1_for_body_2 %x_8 main_faker_computeSHA1_faker_toStringHex_for_step_1 %x_19 
    %digit_7 = phi main_faker_computeSHA1_for_body_2 %digit_4 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_255 
    %x_18 = phi main_faker_computeSHA1_for_body_2 %x_14 main_faker_computeSHA1_faker_toStringHex_for_step_1 %x_20 
    %t_251 = phi main_faker_computeSHA1_for_body_2 %t_236 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_256 
    %ret_3 = phi main_faker_computeSHA1_for_body_2 @__str_const_2 main_faker_computeSHA1_faker_toStringHex_for_step_1 %ret_4 
    %t_252 = phi main_faker_computeSHA1_for_body_2 %t_245 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_257 
    cmp %i_24 0
    br sge main_faker_computeSHA1_faker_toStringHex_for_body_1 main_faker_computeSHA1_splitter_1

main_faker_computeSHA1_faker_toStringHex_for_body_1:
    %t_258 = shr %t_250 %i_24
    %t_255 = and %t_258 15
    cmp %t_255 10
    br slt main_faker_computeSHA1_faker_toStringHex_if_then_1 main_faker_computeSHA1_faker_toStringHex_if_else_1

main_faker_computeSHA1_faker_toStringHex_if_then_1:
    %t_259 = add 48 %t_255
    cmp %t_259 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1:
    cmp %t_259 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1:
    %t_260 = sub %t_259 32
    %t_261 = call string.substring %asciiTable_2 %t_260 %t_260 
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1:
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_splitter_1:
    %t_262 = phi main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 %t_261 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1 @__str_const_1 
    %t_263 = call string.add %ret_3 %t_262 
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_if_else_1:
    %t_264 = lea %t_255 null 0 55
    cmp %t_264 32
    br sge main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2:
    cmp %t_264 126
    br sle main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2:
    %t_265 = sub %t_264 32
    %t_266 = call string.substring %asciiTable_2 %t_265 %t_265 
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2:
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_splitter_2:
    %t_267 = phi main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2 @__str_const_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 %t_266 
    %t_268 = call string.add %ret_3 %t_267 
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_for_step_1:
    %x_19 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_264 main_faker_computeSHA1_faker_toStringHex_splitter_1 %x_17 
    %x_20 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %x_18 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_259 
    %t_256 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_251 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_262 
    %ret_4 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_268 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_263 
    %t_257 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_267 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_252 
    %t_254 = sub %i_24 4
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_splitter_1:
    call print %ret_3 
    %i_25 = add %i_21 1
    jump main_faker_computeSHA1_for_cond_2

main_if_else_1:
    cmp %t_246 2
    br seq main_if_then_2 main_while_body_1

main_if_then_2:
    %t_228 = call getString 
    %t_237 = alloc 48
    store 5 %t_237 null 0 0
    %t_269 = call string.length %t_228 
    cmp %t_269 40
    br sne main_faker_crackSHA1_if_then_1 main_faker_crackSHA1_if_merge_1

main_faker_crackSHA1_if_then_1:
    call println @__str_const_5 
    jump main_while_body_1

main_faker_crackSHA1_if_merge_1:
    jump main_faker_crackSHA1_for_cond_1

main_faker_crackSHA1_for_cond_1:
    %i_26 = phi main_faker_crackSHA1_if_merge_1 0 main_faker_crackSHA1_for_body_1 %i_27 
    cmp %i_26 5
    br slt main_faker_crackSHA1_for_body_1 main_faker_crackSHA1_for_merge_3

main_faker_crackSHA1_for_merge_3:
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_for_cond_2:
    %i_10 = phi main_faker_crackSHA1_for_merge_3 %i_9 main_faker_crackSHA1_splitter_1 %i_28 
    %result_2 = phi main_faker_crackSHA1_for_merge_3 %result_1 main_faker_crackSHA1_splitter_1 %result_4 
    %t_225 = phi main_faker_crackSHA1_for_merge_3 %t_224 main_faker_crackSHA1_splitter_1 %t_270 
    %t_227 = phi main_faker_crackSHA1_for_merge_3 %t_226 main_faker_crackSHA1_splitter_1 %t_270 
    %x_10 = phi main_faker_crackSHA1_for_merge_3 %x_9 main_faker_crackSHA1_splitter_1 %t_271 
    %digit_6 = phi main_faker_crackSHA1_for_merge_3 %digit_5 main_faker_crackSHA1_splitter_1 %digit_8 
    %t_239 = phi main_faker_crackSHA1_for_merge_3 %t_238 main_faker_crackSHA1_splitter_1 %t_272 
    %i_29 = phi main_faker_crackSHA1_for_merge_3 0 main_faker_crackSHA1_splitter_1 %t_273 
    cmp %i_29 40
    br slt main_faker_crackSHA1_for_body_2 main_faker_crackSHA1_for_merge_4

main_faker_crackSHA1_for_merge_4:
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_for_cond_3:
    %digit_2 = phi main_faker_crackSHA1_for_merge_4 1 main_faker_crackSHA1_for_step_1 %digit_9 
    %t_220 = phi main_faker_crackSHA1_for_merge_4 %t_218 main_faker_crackSHA1_for_step_1 %t_274 
    %t_223 = phi main_faker_crackSHA1_for_merge_4 %t_221 main_faker_crackSHA1_for_step_1 %t_222 
    %now_3 = phi main_faker_crackSHA1_for_merge_4 %now_1 main_faker_crackSHA1_for_step_1 %inputBuffer_2 
    %i_13 = phi main_faker_crackSHA1_for_merge_4 %i_11 main_faker_crackSHA1_for_step_1 %i_12 
    %now_6 = phi main_faker_crackSHA1_for_merge_4 %now_4 main_faker_crackSHA1_for_step_1 %now_7 
    %i_16 = phi main_faker_crackSHA1_for_merge_4 %i_14 main_faker_crackSHA1_for_step_1 %i_30 
    %t_234 = phi main_faker_crackSHA1_for_merge_4 %t_232 main_faker_crackSHA1_for_step_1 %t_275 
    %i_19 = phi main_faker_crackSHA1_for_merge_4 %i_29 main_faker_crackSHA1_for_step_1 %i_31 
    %a_3 = phi main_faker_crackSHA1_for_merge_4 %a_2 main_faker_crackSHA1_for_step_1 %t_240 
    %t_243 = phi main_faker_crackSHA1_for_merge_4 %t_241 main_faker_crackSHA1_for_step_1 %t_276 
    %b_3 = phi main_faker_crackSHA1_for_merge_4 %b_2 main_faker_crackSHA1_for_step_1 %t_237 
    cmp %digit_2 4
    br sle main_faker_crackSHA1_for_body_3 main_faker_crackSHA1_for_merge_2

main_faker_crackSHA1_for_merge_2:
    call println @__str_const_7 
    jump main_while_body_1

main_faker_crackSHA1_for_body_3:
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_for_cond_4:
    %i_31 = phi main_faker_crackSHA1_for_body_3 0 main_faker_crackSHA1_for_body_4 %i_32 
    cmp %i_31 %digit_2
    br slt main_faker_crackSHA1_for_body_4 main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_for_body_4:
    store 48 %inputBuffer_2 %i_31 8 8
    %i_32 = add %i_31 1
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_while_body_1:
    %t_219 = phi main_faker_crackSHA1_for_cond_4 %t_220 main_faker_crackSHA1_splitter_2 %t_274 
    %now_2 = phi main_faker_crackSHA1_for_cond_4 %now_3 main_faker_crackSHA1_splitter_2 %inputBuffer_2 
    %i_33 = phi main_faker_crackSHA1_for_cond_4 %i_13 main_faker_crackSHA1_splitter_2 %i_12 
    %now_5 = phi main_faker_crackSHA1_for_cond_4 %now_6 main_faker_crackSHA1_splitter_2 %now_7 
    %i_15 = phi main_faker_crackSHA1_for_cond_4 %i_16 main_faker_crackSHA1_splitter_2 %i_30 
    %t_233 = phi main_faker_crackSHA1_for_cond_4 %t_234 main_faker_crackSHA1_splitter_2 %t_275 
    %t_242 = phi main_faker_crackSHA1_for_cond_4 %t_243 main_faker_crackSHA1_splitter_2 %t_276 
    %t_240 = call sha1 %inputBuffer_2 %digit_2 
    %t_277 = load %t_240 null 0 0
    %t_278 = load %t_237 null 0 0
    cmp %t_277 %t_278
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_1 main_faker_crackSHA1_faker_array_equal_if_merge_1

main_faker_crackSHA1_faker_array_equal_elseBB_1:
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_array_equal_if_merge_1:
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_for_cond_1:
    %i_34 = phi main_faker_crackSHA1_faker_array_equal_if_merge_1 0 main_faker_crackSHA1_faker_array_equal_for_step_1 %i_35 
    %t_279 = load %t_240 null 0 0
    cmp %i_34 %t_279
    br slt main_faker_crackSHA1_faker_array_equal_for_body_1 main_faker_crackSHA1_faker_array_equal_thenBB_1

main_faker_crackSHA1_faker_array_equal_for_body_1:
    %t_280 = lea null %i_34 8 8
    %t_281 = load %t_240 %t_280 1 0
    %t_282 = load %t_237 %t_280 1 0
    cmp %t_281 %t_282
    br sne main_faker_crackSHA1_faker_array_equal_elseBB_2 main_faker_crackSHA1_faker_array_equal_for_step_1

main_faker_crackSHA1_faker_array_equal_elseBB_2:
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_array_equal_for_step_1:
    %i_35 = add %i_34 1
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_thenBB_1:
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_splitter_3:
    %t_222 = phi main_faker_crackSHA1_faker_array_equal_thenBB_1 1 main_faker_crackSHA1_faker_array_equal_elseBB_2 0 main_faker_crackSHA1_faker_array_equal_elseBB_1 0 
    %i_12 = phi main_faker_crackSHA1_faker_array_equal_thenBB_1 %i_34 main_faker_crackSHA1_faker_array_equal_elseBB_2 %i_34 main_faker_crackSHA1_faker_array_equal_elseBB_1 %i_33 
    cmp %t_222 1
    br seq main_faker_crackSHA1_if_then_2 main_faker_crackSHA1_if_merge_2

main_faker_crackSHA1_if_merge_2:
    %t_283 = sub %digit_2 1
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_faker_nextText_for_cond_1:
    %t_284 = phi main_faker_crackSHA1_if_merge_2 %t_219 main_faker_crackSHA1_faker_nextText_if_then_1 %t_285 
    %now_8 = phi main_faker_crackSHA1_if_merge_2 %now_5 main_faker_crackSHA1_faker_nextText_if_then_1 %t_286 
    %i_30 = phi main_faker_crackSHA1_if_merge_2 %t_283 main_faker_crackSHA1_faker_nextText_if_then_1 %i_36 
    %t_287 = phi main_faker_crackSHA1_if_merge_2 %t_233 main_faker_crackSHA1_faker_nextText_if_then_1 %t_288 
    cmp %i_30 0
    br sge main_faker_crackSHA1_faker_nextText_for_body_1 main_faker_crackSHA1_faker_nextText_elseBB_1

main_faker_crackSHA1_faker_nextText_elseBB_1:
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_faker_nextText_for_body_1:
    %t_288 = lea %inputBuffer_2 %i_30 8 8
    %t_286 = load %t_288 null 0 0
    cmp %t_286 122
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1:
    cmp %t_286 90
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2:
    cmp %t_286 57
    br seq main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3:
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3:
    %t_289 = add %t_286 1
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2:
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1:
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_splitter_1:
    %t_285 = phi main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 -1 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 97 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3 %t_289 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 65 
    store %t_285 %t_288 null 0 0
    %t_290 = lea %inputBuffer_2 %i_30 8 8
    %t_291 = load %t_290 null 0 0
    cmp %t_291 -1
    br seq main_faker_crackSHA1_faker_nextText_if_then_1 main_faker_crackSHA1_faker_nextText_thenBB_1

main_faker_crackSHA1_faker_nextText_thenBB_1:
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_splitter_2:
    %t_274 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_285 main_faker_crackSHA1_faker_nextText_elseBB_1 %t_284 
    %now_7 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_286 main_faker_crackSHA1_faker_nextText_elseBB_1 %now_8 
    %t_275 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_288 main_faker_crackSHA1_faker_nextText_elseBB_1 %t_287 
    %t_276 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 1 main_faker_crackSHA1_faker_nextText_elseBB_1 0 
    cmp %t_276 1
    br seq main_faker_crackSHA1_while_body_1 main_faker_crackSHA1_for_step_1

main_faker_crackSHA1_for_step_1:
    %digit_9 = add %digit_2 1
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_faker_nextText_if_then_1:
    store 48 %t_290 null 0 0
    %i_36 = sub %i_30 1
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_if_then_2:
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_cond_5:
    %x_16 = phi main_faker_crackSHA1_if_then_2 %x_15 main_faker_crackSHA1_splitter_4 %t_292 
    %t_230 = phi main_faker_crackSHA1_if_then_2 %t_229 main_faker_crackSHA1_splitter_4 %t_293 
    %i_18 = phi main_faker_crackSHA1_if_then_2 0 main_faker_crackSHA1_splitter_4 %i_37 
    cmp %i_18 %digit_2
    br slt main_faker_crackSHA1_for_body_5 main_faker_crackSHA1_for_merge_1

main_faker_crackSHA1_for_body_5:
    %t_292 = load %inputBuffer_2 %i_18 8 8
    cmp %t_292 32
    br sge main_faker_crackSHA1_faker_int2chr_lhs_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_lhs_then_1:
    cmp %t_292 126
    br sle main_faker_crackSHA1_faker_int2chr_if_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_if_then_1:
    %t_294 = sub %t_292 32
    %t_295 = call string.substring %asciiTable_2 %t_294 %t_294 
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_faker_int2chr_if_merge_1:
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_splitter_4:
    %t_293 = phi main_faker_crackSHA1_faker_int2chr_if_merge_1 @__str_const_1 main_faker_crackSHA1_faker_int2chr_if_then_1 %t_295 
    call print %t_293 
    %i_37 = add %i_18 1
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_merge_1:
    call println @__str_const_6 
    jump main_while_body_1

main_faker_crackSHA1_for_body_2:
    %t_296 = div %i_29 8
    %t_270 = lea %t_237 %t_296 8 8
    %t_297 = add %i_29 3
    %t_271 = call string.substring %t_228 %i_29 %t_297 
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_faker_hex2int_for_cond_1:
    %i_28 = phi main_faker_crackSHA1_for_body_2 0 main_faker_crackSHA1_faker_hex2int_for_step_1 %i_38 
    %result_4 = phi main_faker_crackSHA1_for_body_2 0 main_faker_crackSHA1_faker_hex2int_for_step_1 %result_5 
    %digit_10 = phi main_faker_crackSHA1_for_body_2 %digit_6 main_faker_crackSHA1_faker_hex2int_for_step_1 %t_298 
    %t_299 = call string.length %t_271 
    cmp %i_28 %t_299
    br slt main_faker_crackSHA1_faker_hex2int_for_body_1 main_faker_crackSHA1_faker_hex2int_for_merge_1

main_faker_crackSHA1_faker_hex2int_for_merge_1:
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_hex2int_for_body_1:
    %t_298 = call string.ord %t_271 %i_28 
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
    %t_300 = mul %result_4 16
    %t_301 = lea %t_300 %t_298 1 -55
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_2:
    cmp %t_298 97
    br sge main_faker_crackSHA1_faker_hex2int_lhs_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_lhs_then_3:
    cmp %t_298 102
    br sle main_faker_crackSHA1_faker_hex2int_if_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_if_else_3:
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_splitter_1:
    %digit_8 = phi main_faker_crackSHA1_faker_hex2int_if_else_3 %t_298 main_faker_crackSHA1_faker_hex2int_for_merge_1 %digit_10 
    %t_272 = phi main_faker_crackSHA1_faker_hex2int_if_else_3 0 main_faker_crackSHA1_faker_hex2int_for_merge_1 %result_4 
    %t_302 = div %i_29 4
    %t_303 = mod %t_302 2
    %t_304 = sub 1 %t_303
    %t_305 = mul %t_304 16
    %t_306 = shl %t_272 %t_305
    %t_307 = load %t_270 null 0 0
    %t_308 = or %t_307 %t_306
    store %t_308 %t_270 null 0 0
    %t_273 = add %i_29 4
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_faker_hex2int_if_then_3:
    %t_309 = mul %result_4 16
    %t_310 = lea %t_309 %t_298 1 -87
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_then_1:
    %t_311 = mul %result_4 16
    %t_312 = lea %t_311 %t_298 1 -48
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_for_step_1:
    %result_5 = phi main_faker_crackSHA1_faker_hex2int_if_then_1 %t_312 main_faker_crackSHA1_faker_hex2int_if_then_3 %t_310 main_faker_crackSHA1_faker_hex2int_if_then_2 %t_301 
    %i_38 = add %i_28 1
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_for_body_1:
    store 0 %t_237 %i_26 8 8
    %i_27 = add %i_26 1
    jump main_faker_crackSHA1_for_cond_1

main_while_merge_1:
    ret 0

}

define i64 @__init  {
__init_entry_1:
    %t_313 = alloc 808
    store 100 %t_313 null 0 0
    %t_314 = add %t_313 8
    %t_315 = add %t_313 808
    jump __init_for_cond_1

__init_for_cond_1:
    %t_316 = phi __init_entry_1 %t_314 __init_for_body_1 %t_317 
    cmp %t_316 %t_315
    br slt __init_for_body_1 __init_for_merge_1

__init_for_body_1:
    %t_318 = alloc 648
    store 80 %t_318 null 0 0
    store %t_318 %t_316 null 0 0
    %t_317 = add %t_316 8
    jump __init_for_cond_1

__init_for_merge_1:
    %t_319 = alloc 50568
    store 6320 %t_319 null 0 0
    %t_320 = alloc 48
    store 5 %t_320 null 0 0
    store %t_313 @chunks_1 null 0 0
    store 100 @MAXCHUNK_1 null 0 0
    store @__str_const_9 @asciiTable_1 null 0 0
    store %t_319 @inputBuffer_1 null 0 0
    store %t_320 @outputBuffer_1 null 0 0
    %t_321 = call main 
    ret %t_321

}


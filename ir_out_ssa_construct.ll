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
    %outputBuffer_2 = load @outputBuffer_1
    %MAXCHUNK_2 = load @MAXCHUNK_1
    %chunks_2 = load @chunks_1
    %t_1 = add %length_1 64
    %t_2 = sub %t_1 56
    %t_3 = div %t_2 64
    %t_4 = add %t_3 1
    %nChunk_1 = move %t_4
    %t_5 = sgt %nChunk_1 %MAXCHUNK_2
    br %t_5 sha1_if_then_1 sha1_if_merge_1

sha1_if_then_1:
    call println @__str_const_3 
    %t_6 = move 0
    %t_7 = move %t_6
    jump sha1_exit_1

sha1_if_merge_1:
    %i_1 = move 0
    %j_1 = move 0
    %i_2 = move 0
    jump sha1_for_cond_1

sha1_for_cond_1:
    %j_2 = phi sha1_if_merge_1 %j_1 sha1_for_step_1 %j_3 
    %i_3 = phi sha1_if_merge_1 %i_2 sha1_for_step_1 %i_4 
    %t_8 = slt %i_3 %nChunk_1
    br %t_8 sha1_for_body_1 sha1_for_merge_1

sha1_for_body_1:
    %j_4 = move 0
    jump sha1_for_cond_2

sha1_for_cond_2:
    %j_3 = phi sha1_for_body_1 %j_4 sha1_for_body_2 %j_5 
    %t_9 = slt %j_3 80
    br %t_9 sha1_for_body_2 sha1_for_step_1

sha1_for_step_1:
    %t_10 = move %i_3
    %i_4 = add %i_3 1
    jump sha1_for_cond_1

sha1_for_body_2:
    %t_11 = mul %i_3 8
    %t_12 = add %t_11 8
    %t_13 = add %chunks_2 %t_12
    %t_14 = load %t_13
    %t_15 = mul %j_3 8
    %t_16 = add %t_15 8
    %t_17 = add %t_14 %t_16
    store 0 %t_17
    %t_18 = move %j_3
    %j_5 = add %j_3 1
    jump sha1_for_cond_2

sha1_for_merge_1:
    %i_5 = move 0
    jump sha1_for_cond_3

sha1_for_cond_3:
    %i_6 = phi sha1_for_merge_1 %i_5 sha1_for_body_3 %i_7 
    %t_19 = slt %i_6 %length_1
    br %t_19 sha1_for_body_3 sha1_for_merge_2

sha1_for_merge_2:
    %t_20 = div %i_6 64
    %t_21 = mul %t_20 8
    %t_22 = add %t_21 8
    %t_23 = add %chunks_2 %t_22
    %t_24 = mod %i_6 64
    %t_25 = div %t_24 4
    %t_26 = load %t_23
    %t_27 = mul %t_25 8
    %t_28 = add %t_27 8
    %t_29 = add %t_26 %t_28
    %t_30 = div %i_6 64
    %t_31 = mul %t_30 8
    %t_32 = add %t_31 8
    %t_33 = add %chunks_2 %t_32
    %t_34 = mod %i_6 64
    %t_35 = div %t_34 4
    %t_36 = load %t_33
    %t_37 = mul %t_35 8
    %t_38 = add %t_37 8
    %t_39 = add %t_36 %t_38
    %t_40 = mod %i_6 4
    %t_41 = sub 3 %t_40
    %t_42 = mul %t_41 8
    %t_43 = shl 128 %t_42
    %t_44 = load %t_39
    %t_45 = or %t_44 %t_43
    store %t_45 %t_29
    %t_46 = sub %nChunk_1 1
    %t_47 = mul %t_46 8
    %t_48 = add %t_47 8
    %t_49 = add %chunks_2 %t_48
    %t_50 = load %t_49
    %t_51 = mul 15 8
    %t_52 = add %t_51 8
    %t_53 = add %t_50 %t_52
    %t_54 = shl %length_1 3
    store %t_54 %t_53
    %t_55 = sub %nChunk_1 1
    %t_56 = mul %t_55 8
    %t_57 = add %t_56 8
    %t_58 = add %chunks_2 %t_57
    %t_59 = load %t_58
    %t_60 = mul 14 8
    %t_61 = add %t_60 8
    %t_62 = add %t_59 %t_61
    %t_63 = shr %length_1 29
    %t_64 = and %t_63 7
    store %t_64 %t_62
    %h0_1 = move 1732584193
    %lo_1 = move 43913
    %hi_1 = move 61389
    %t_65 = shl %hi_1 16
    %t_66 = or %lo_1 %t_65
    %t_67 = move %t_66
    %t_68 = move %t_67
    %h1_1 = move %t_68
    %lo_2 = move 56574
    %hi_2 = move 39098
    %t_69 = shl %hi_2 16
    %t_70 = or %lo_2 %t_69
    %t_71 = move %t_70
    %t_72 = move %t_71
    %h2_1 = move %t_72
    %h3_1 = move 271733878
    %lo_3 = move 57840
    %hi_3 = move 50130
    %t_73 = shl %hi_3 16
    %t_74 = or %lo_3 %t_73
    %t_75 = move %t_74
    %t_76 = move %t_75
    %h4_1 = move %t_76
    %i_8 = move 0
    jump sha1_for_cond_4

sha1_for_cond_4:
    %t_77 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_78 
    %j_6 = phi sha1_for_merge_2 %j_2 sha1_for_merge_3 %j_7 
    %t_79 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_80 
    %h1_2 = phi sha1_for_merge_2 %h1_1 sha1_for_merge_3 %h1_3 
    %t_81 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_82 
    %b_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %b_2 
    %k_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %k_2 
    %e_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %e_2 
    %h0_2 = phi sha1_for_merge_2 %h0_1 sha1_for_merge_3 %h0_3 
    %h4_2 = phi sha1_for_merge_2 %h4_1 sha1_for_merge_3 %h4_3 
    %h3_2 = phi sha1_for_merge_2 %h3_1 sha1_for_merge_3 %h3_3 
    %x_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_2 
    %x_3 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_4 
    %f_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %f_2 
    %shift_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_2 
    %c_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %c_2 
    %x_5 = phi sha1_for_merge_2 undef sha1_for_merge_3 %x_6 
    %d_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %d_2 
    %shift_3 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_4 
    %a_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %a_2 
    %h2_2 = phi sha1_for_merge_2 %h2_1 sha1_for_merge_3 %h2_3 
    %temp_1 = phi sha1_for_merge_2 undef sha1_for_merge_3 %temp_2 
    %i_9 = phi sha1_for_merge_2 %i_8 sha1_for_merge_3 %i_10 
    %t_83 = phi sha1_for_merge_2 undef sha1_for_merge_3 %t_84 
    %shift_5 = phi sha1_for_merge_2 undef sha1_for_merge_3 %shift_6 
    %t_85 = slt %i_9 %nChunk_1
    br %t_85 sha1_for_body_4 sha1_for_merge_4

sha1_for_body_4:
    %j_8 = move 16
    jump sha1_for_cond_5

sha1_for_cond_5:
    %t_78 = phi sha1_for_body_4 %t_77 sha1_splitter_1 %t_86 
    %j_9 = phi sha1_for_body_4 %j_8 sha1_splitter_1 %j_10 
    %t_82 = phi sha1_for_body_4 %t_81 sha1_splitter_1 %t_87 
    %x_6 = phi sha1_for_body_4 %x_5 sha1_splitter_1 %x_7 
    %shift_4 = phi sha1_for_body_4 %shift_3 sha1_splitter_1 %shift_7 
    %t_88 = slt %j_9 80
    br %t_88 sha1_for_body_5 sha1_for_merge_5

sha1_for_merge_5:
    %a_3 = move %h0_2
    %b_3 = move %h1_2
    %c_3 = move %h2_2
    %d_3 = move %h3_2
    %e_3 = move %h4_2
    %j_11 = move 0
    jump sha1_for_cond_6

sha1_for_cond_6:
    %j_7 = phi sha1_for_merge_5 %j_11 sha1_splitter_2 %j_12 
    %t_80 = phi sha1_for_merge_5 %t_79 sha1_splitter_2 %t_89 
    %b_2 = phi sha1_for_merge_5 %b_3 sha1_splitter_2 %b_4 
    %k_2 = phi sha1_for_merge_5 %k_1 sha1_splitter_2 %k_3 
    %e_2 = phi sha1_for_merge_5 %e_3 sha1_splitter_2 %e_4 
    %x_2 = phi sha1_for_merge_5 %x_1 sha1_splitter_2 %x_8 
    %x_4 = phi sha1_for_merge_5 %x_3 sha1_splitter_2 %x_9 
    %f_2 = phi sha1_for_merge_5 %f_1 sha1_splitter_2 %f_3 
    %shift_2 = phi sha1_for_merge_5 %shift_1 sha1_splitter_2 %shift_8 
    %c_2 = phi sha1_for_merge_5 %c_3 sha1_splitter_2 %c_4 
    %d_2 = phi sha1_for_merge_5 %d_3 sha1_splitter_2 %d_4 
    %a_2 = phi sha1_for_merge_5 %a_3 sha1_splitter_2 %a_4 
    %temp_2 = phi sha1_for_merge_5 %temp_1 sha1_splitter_2 %temp_3 
    %t_84 = phi sha1_for_merge_5 %t_83 sha1_splitter_2 %t_90 
    %shift_6 = phi sha1_for_merge_5 %shift_5 sha1_splitter_2 %shift_9 
    %t_91 = slt %j_7 80
    br %t_91 sha1_for_body_6 sha1_for_merge_3

sha1_for_merge_3:
    %x_10 = move %h0_2
    %y_1 = move %a_2
    %t_92 = and %x_10 65535
    %t_93 = and %y_1 65535
    %t_94 = add %t_92 %t_93
    %low_1 = move %t_94
    %t_95 = shr %x_10 16
    %t_96 = and %t_95 65535
    %t_97 = shr %y_1 16
    %t_98 = and %t_97 65535
    %t_99 = add %t_96 %t_98
    %t_100 = shr %low_1 16
    %t_101 = add %t_99 %t_100
    %t_102 = and %t_101 65535
    %high_1 = move %t_102
    %t_103 = shl %high_1 16
    %t_104 = and %low_1 65535
    %t_105 = or %t_103 %t_104
    %t_106 = move %t_105
    %t_107 = move %t_106
    %h0_3 = move %t_107
    %x_11 = move %h1_2
    %y_2 = move %b_2
    %t_108 = and %x_11 65535
    %t_109 = and %y_2 65535
    %t_110 = add %t_108 %t_109
    %low_2 = move %t_110
    %t_111 = shr %x_11 16
    %t_112 = and %t_111 65535
    %t_113 = shr %y_2 16
    %t_114 = and %t_113 65535
    %t_115 = add %t_112 %t_114
    %t_116 = shr %low_2 16
    %t_117 = add %t_115 %t_116
    %t_118 = and %t_117 65535
    %high_2 = move %t_118
    %t_119 = shl %high_2 16
    %t_120 = and %low_2 65535
    %t_121 = or %t_119 %t_120
    %t_122 = move %t_121
    %t_123 = move %t_122
    %h1_3 = move %t_123
    %x_12 = move %h2_2
    %y_3 = move %c_2
    %t_124 = and %x_12 65535
    %t_125 = and %y_3 65535
    %t_126 = add %t_124 %t_125
    %low_3 = move %t_126
    %t_127 = shr %x_12 16
    %t_128 = and %t_127 65535
    %t_129 = shr %y_3 16
    %t_130 = and %t_129 65535
    %t_131 = add %t_128 %t_130
    %t_132 = shr %low_3 16
    %t_133 = add %t_131 %t_132
    %t_134 = and %t_133 65535
    %high_3 = move %t_134
    %t_135 = shl %high_3 16
    %t_136 = and %low_3 65535
    %t_137 = or %t_135 %t_136
    %t_138 = move %t_137
    %t_139 = move %t_138
    %h2_3 = move %t_139
    %x_13 = move %h3_2
    %y_4 = move %d_2
    %t_140 = and %x_13 65535
    %t_141 = and %y_4 65535
    %t_142 = add %t_140 %t_141
    %low_4 = move %t_142
    %t_143 = shr %x_13 16
    %t_144 = and %t_143 65535
    %t_145 = shr %y_4 16
    %t_146 = and %t_145 65535
    %t_147 = add %t_144 %t_146
    %t_148 = shr %low_4 16
    %t_149 = add %t_147 %t_148
    %t_150 = and %t_149 65535
    %high_4 = move %t_150
    %t_151 = shl %high_4 16
    %t_152 = and %low_4 65535
    %t_153 = or %t_151 %t_152
    %t_154 = move %t_153
    %t_155 = move %t_154
    %h3_3 = move %t_155
    %x_14 = move %h4_2
    %y_5 = move %e_2
    %t_156 = and %x_14 65535
    %t_157 = and %y_5 65535
    %t_158 = add %t_156 %t_157
    %low_5 = move %t_158
    %t_159 = shr %x_14 16
    %t_160 = and %t_159 65535
    %t_161 = shr %y_5 16
    %t_162 = and %t_161 65535
    %t_163 = add %t_160 %t_162
    %t_164 = shr %low_5 16
    %t_165 = add %t_163 %t_164
    %t_166 = and %t_165 65535
    %high_5 = move %t_166
    %t_167 = shl %high_5 16
    %t_168 = and %low_5 65535
    %t_169 = or %t_167 %t_168
    %t_170 = move %t_169
    %t_171 = move %t_170
    %h4_3 = move %t_171
    %t_172 = move %i_9
    %i_10 = add %i_9 1
    jump sha1_for_cond_4

sha1_for_body_6:
    %f_4 = move 0
    %k_4 = move 0
    %t_173 = slt %j_7 20
    br %t_173 sha1_if_then_2 sha1_if_else_1

sha1_if_else_1:
    %t_174 = slt %j_7 40
    br %t_174 sha1_if_then_3 sha1_if_else_2

sha1_if_else_2:
    %t_175 = slt %j_7 60
    br %t_175 sha1_if_then_4 sha1_if_else_3

sha1_if_else_3:
    %t_176 = xor %b_2 %c_2
    %t_177 = xor %t_176 %d_2
    %f_5 = move %t_177
    %lo_4 = move 49622
    %hi_4 = move 51810
    %t_178 = shl %hi_4 16
    %t_179 = or %lo_4 %t_178
    %t_180 = move %t_179
    %t_181 = move %t_180
    %k_5 = move %t_181
    jump sha1_if_merge_2

sha1_if_then_4:
    %t_182 = and %b_2 %c_2
    %t_183 = and %b_2 %d_2
    %t_184 = or %t_182 %t_183
    %t_185 = and %c_2 %d_2
    %t_186 = or %t_184 %t_185
    %f_6 = move %t_186
    %lo_5 = move 48348
    %hi_5 = move 36635
    %t_187 = shl %hi_5 16
    %t_188 = or %lo_5 %t_187
    %t_189 = move %t_188
    %t_190 = move %t_189
    %k_6 = move %t_190
    jump sha1_if_merge_2

sha1_if_then_3:
    %t_191 = xor %b_2 %c_2
    %t_192 = xor %t_191 %d_2
    %f_7 = move %t_192
    %k_7 = move 1859775393
    jump sha1_if_merge_2

sha1_if_then_2:
    %t_193 = and %b_2 %c_2
    %t_194 = not %b_2
    %t_195 = and %t_194 %d_2
    %t_196 = or %t_193 %t_195
    %f_8 = move %t_196
    %k_8 = move 1518500249
    jump sha1_if_merge_2

sha1_if_merge_2:
    %k_3 = phi sha1_if_then_2 %k_8 sha1_if_then_3 %k_7 sha1_if_then_4 %k_6 sha1_if_else_3 %k_5 
    %f_3 = phi sha1_if_then_2 %f_8 sha1_if_then_3 %f_7 sha1_if_then_4 %f_6 sha1_if_else_3 %f_5 
    %x_9 = move %a_2
    %shift_8 = move 5
    %t_197 = seq %shift_8 1
    br %t_197 sha1_faker_rotate_left_if_then_1 sha1_faker_rotate_left_if_merge_1

sha1_faker_rotate_left_if_merge_1:
    %t_198 = seq %shift_8 31
    br %t_198 sha1_faker_rotate_left_if_then_2 sha1_faker_rotate_left_if_merge_2

sha1_faker_rotate_left_if_then_2:
    %t_199 = and %x_9 1
    %t_200 = shl %t_199 31
    %t_201 = shr %x_9 1
    %t_202 = and %t_201 2147483647
    %t_203 = or %t_200 %t_202
    %t_204 = move %t_203
    %t_205 = move %t_204
    jump sha1_splitter_3

sha1_faker_rotate_left_if_merge_2:
    %t_206 = sub 32 %shift_8
    %t_207 = shl 1 %t_206
    %t_208 = sub %t_207 1
    %t_209 = and %x_9 %t_208
    %t_210 = shl %t_209 %shift_8
    %t_211 = sub 32 %shift_8
    %t_212 = shr %x_9 %t_211
    %t_213 = shl 1 %shift_8
    %t_214 = sub %t_213 1
    %t_215 = and %t_212 %t_214
    %t_216 = or %t_210 %t_215
    %t_217 = move %t_216
    %t_218 = move %t_217
    jump sha1_splitter_3

sha1_faker_rotate_left_if_then_1:
    %t_219 = and %x_9 2147483647
    %t_220 = shl %t_219 1
    %t_221 = shr %x_9 31
    %t_222 = and %t_221 1
    %t_223 = or %t_220 %t_222
    %t_224 = move %t_223
    %t_225 = move %t_224
    jump sha1_splitter_3

sha1_splitter_3:
    %t_90 = phi sha1_faker_rotate_left_if_then_1 %t_225 sha1_faker_rotate_left_if_merge_2 %t_218 sha1_faker_rotate_left_if_then_2 %t_205 
    %t_226 = move %t_90
    %x_15 = move %t_226
    %y_6 = move %e_2
    %t_227 = and %x_15 65535
    %t_228 = and %y_6 65535
    %t_229 = add %t_227 %t_228
    %low_6 = move %t_229
    %t_230 = shr %x_15 16
    %t_231 = and %t_230 65535
    %t_232 = shr %y_6 16
    %t_233 = and %t_232 65535
    %t_234 = add %t_231 %t_233
    %t_235 = shr %low_6 16
    %t_236 = add %t_234 %t_235
    %t_237 = and %t_236 65535
    %high_6 = move %t_237
    %t_238 = shl %high_6 16
    %t_239 = and %low_6 65535
    %t_240 = or %t_238 %t_239
    %t_241 = move %t_240
    %t_242 = move %t_241
    %x_16 = move %f_3
    %y_7 = move %k_3
    %t_243 = and %x_16 65535
    %t_244 = and %y_7 65535
    %t_245 = add %t_243 %t_244
    %low_7 = move %t_245
    %t_246 = shr %x_16 16
    %t_247 = and %t_246 65535
    %t_248 = shr %y_7 16
    %t_249 = and %t_248 65535
    %t_250 = add %t_247 %t_249
    %t_251 = shr %low_7 16
    %t_252 = add %t_250 %t_251
    %t_253 = and %t_252 65535
    %high_7 = move %t_253
    %t_254 = shl %high_7 16
    %t_255 = and %low_7 65535
    %t_256 = or %t_254 %t_255
    %t_257 = move %t_256
    %t_258 = move %t_257
    %x_17 = move %t_242
    %y_8 = move %t_258
    %t_259 = and %x_17 65535
    %t_260 = and %y_8 65535
    %t_261 = add %t_259 %t_260
    %low_8 = move %t_261
    %t_262 = shr %x_17 16
    %t_263 = and %t_262 65535
    %t_264 = shr %y_8 16
    %t_265 = and %t_264 65535
    %t_266 = add %t_263 %t_265
    %t_267 = shr %low_8 16
    %t_268 = add %t_266 %t_267
    %t_269 = and %t_268 65535
    %high_8 = move %t_269
    %t_270 = shl %high_8 16
    %t_271 = and %low_8 65535
    %t_272 = or %t_270 %t_271
    %t_273 = move %t_272
    %t_274 = move %t_273
    %t_275 = mul %i_9 8
    %t_276 = add %t_275 8
    %t_277 = add %chunks_2 %t_276
    %t_278 = load %t_277
    %t_279 = mul %j_7 8
    %t_280 = add %t_279 8
    %t_281 = add %t_278 %t_280
    %t_282 = load %t_281
    %x_18 = move %t_274
    %y_9 = move %t_282
    %t_283 = and %x_18 65535
    %t_284 = and %y_9 65535
    %t_285 = add %t_283 %t_284
    %low_9 = move %t_285
    %t_286 = shr %x_18 16
    %t_287 = and %t_286 65535
    %t_288 = shr %y_9 16
    %t_289 = and %t_288 65535
    %t_290 = add %t_287 %t_289
    %t_291 = shr %low_9 16
    %t_292 = add %t_290 %t_291
    %t_293 = and %t_292 65535
    %high_9 = move %t_293
    %t_294 = shl %high_9 16
    %t_295 = and %low_9 65535
    %t_296 = or %t_294 %t_295
    %t_297 = move %t_296
    %t_298 = move %t_297
    %temp_3 = move %t_298
    %e_4 = move %d_2
    %d_4 = move %c_2
    %x_8 = move %b_2
    %shift_9 = move 30
    %t_299 = seq %shift_9 1
    br %t_299 sha1_faker_rotate_left_if_then_3 sha1_faker_rotate_left_if_merge_3

sha1_faker_rotate_left_if_merge_3:
    %t_300 = seq %shift_9 31
    br %t_300 sha1_faker_rotate_left_if_then_4 sha1_faker_rotate_left_if_merge_4

sha1_faker_rotate_left_if_merge_4:
    %t_301 = sub 32 %shift_9
    %t_302 = shl 1 %t_301
    %t_303 = sub %t_302 1
    %t_304 = and %x_8 %t_303
    %t_305 = shl %t_304 %shift_9
    %t_306 = sub 32 %shift_9
    %t_307 = shr %x_8 %t_306
    %t_308 = shl 1 %shift_9
    %t_309 = sub %t_308 1
    %t_310 = and %t_307 %t_309
    %t_311 = or %t_305 %t_310
    %t_312 = move %t_311
    %t_313 = move %t_312
    jump sha1_splitter_2

sha1_faker_rotate_left_if_then_4:
    %t_314 = and %x_8 1
    %t_315 = shl %t_314 31
    %t_316 = shr %x_8 1
    %t_317 = and %t_316 2147483647
    %t_318 = or %t_315 %t_317
    %t_319 = move %t_318
    %t_320 = move %t_319
    jump sha1_splitter_2

sha1_faker_rotate_left_if_then_3:
    %t_321 = and %x_8 2147483647
    %t_322 = shl %t_321 1
    %t_323 = shr %x_8 31
    %t_324 = and %t_323 1
    %t_325 = or %t_322 %t_324
    %t_326 = move %t_325
    %t_327 = move %t_326
    jump sha1_splitter_2

sha1_splitter_2:
    %t_89 = phi sha1_faker_rotate_left_if_then_3 %t_327 sha1_faker_rotate_left_if_then_4 %t_320 sha1_faker_rotate_left_if_merge_4 %t_313 
    %t_328 = move %t_89
    %c_4 = move %t_328
    %b_4 = move %a_2
    %a_4 = move %temp_3
    %t_329 = move %j_7
    %j_12 = add %j_7 1
    jump sha1_for_cond_6

sha1_for_body_5:
    %t_330 = mul %i_9 8
    %t_331 = add %t_330 8
    %t_332 = add %chunks_2 %t_331
    %t_333 = load %t_332
    %t_334 = mul %j_9 8
    %t_335 = add %t_334 8
    %t_86 = add %t_333 %t_335
    %t_336 = mul %i_9 8
    %t_337 = add %t_336 8
    %t_338 = add %chunks_2 %t_337
    %t_339 = sub %j_9 3
    %t_340 = load %t_338
    %t_341 = mul %t_339 8
    %t_342 = add %t_341 8
    %t_343 = add %t_340 %t_342
    %t_344 = mul %i_9 8
    %t_345 = add %t_344 8
    %t_346 = add %chunks_2 %t_345
    %t_347 = sub %j_9 8
    %t_348 = load %t_346
    %t_349 = mul %t_347 8
    %t_350 = add %t_349 8
    %t_351 = add %t_348 %t_350
    %t_352 = load %t_343
    %t_353 = load %t_351
    %t_354 = xor %t_352 %t_353
    %t_355 = mul %i_9 8
    %t_356 = add %t_355 8
    %t_357 = add %chunks_2 %t_356
    %t_358 = sub %j_9 14
    %t_359 = load %t_357
    %t_360 = mul %t_358 8
    %t_361 = add %t_360 8
    %t_362 = add %t_359 %t_361
    %t_363 = load %t_362
    %t_364 = xor %t_354 %t_363
    %t_365 = mul %i_9 8
    %t_366 = add %t_365 8
    %t_367 = add %chunks_2 %t_366
    %t_368 = sub %j_9 16
    %t_369 = load %t_367
    %t_370 = mul %t_368 8
    %t_371 = add %t_370 8
    %t_372 = add %t_369 %t_371
    %t_373 = load %t_372
    %t_374 = xor %t_364 %t_373
    %x_7 = move %t_374
    %shift_7 = move 1
    %t_375 = seq %shift_7 1
    br %t_375 sha1_faker_rotate_left_if_then_5 sha1_faker_rotate_left_if_merge_5

sha1_faker_rotate_left_if_then_5:
    %t_376 = and %x_7 2147483647
    %t_377 = shl %t_376 1
    %t_378 = shr %x_7 31
    %t_379 = and %t_378 1
    %t_380 = or %t_377 %t_379
    %t_381 = move %t_380
    %t_382 = move %t_381
    jump sha1_splitter_1

sha1_faker_rotate_left_if_merge_5:
    %t_383 = seq %shift_7 31
    br %t_383 sha1_faker_rotate_left_if_then_6 sha1_faker_rotate_left_if_merge_6

sha1_faker_rotate_left_if_merge_6:
    %t_384 = sub 32 %shift_7
    %t_385 = shl 1 %t_384
    %t_386 = sub %t_385 1
    %t_387 = and %x_7 %t_386
    %t_388 = shl %t_387 %shift_7
    %t_389 = sub 32 %shift_7
    %t_390 = shr %x_7 %t_389
    %t_391 = shl 1 %shift_7
    %t_392 = sub %t_391 1
    %t_393 = and %t_390 %t_392
    %t_394 = or %t_388 %t_393
    %t_395 = move %t_394
    %t_396 = move %t_395
    jump sha1_splitter_1

sha1_faker_rotate_left_if_then_6:
    %t_397 = and %x_7 1
    %t_398 = shl %t_397 31
    %t_399 = shr %x_7 1
    %t_400 = and %t_399 2147483647
    %t_401 = or %t_398 %t_400
    %t_402 = move %t_401
    %t_403 = move %t_402
    jump sha1_splitter_1

sha1_splitter_1:
    %t_87 = phi sha1_faker_rotate_left_if_then_6 %t_403 sha1_faker_rotate_left_if_merge_6 %t_396 sha1_faker_rotate_left_if_then_5 %t_382 
    %t_404 = move %t_87
    store %t_404 %t_86
    %t_405 = move %j_9
    %j_10 = add %j_9 1
    jump sha1_for_cond_5

sha1_for_merge_4:
    %t_406 = mul 0 8
    %t_407 = add %t_406 8
    %t_408 = add %outputBuffer_2 %t_407
    store %h0_2 %t_408
    %t_409 = mul 1 8
    %t_410 = add %t_409 8
    %t_411 = add %outputBuffer_2 %t_410
    store %h1_2 %t_411
    %t_412 = mul 2 8
    %t_413 = add %t_412 8
    %t_414 = add %outputBuffer_2 %t_413
    store %h2_2 %t_414
    %t_415 = mul 3 8
    %t_416 = add %t_415 8
    %t_417 = add %outputBuffer_2 %t_416
    store %h3_2 %t_417
    %t_418 = mul 4 8
    %t_419 = add %t_418 8
    %t_420 = add %outputBuffer_2 %t_419
    store %h4_2 %t_420
    %t_421 = move %outputBuffer_2
    %t_422 = move %t_421
    jump sha1_exit_1

sha1_exit_1:
    %t_423 = phi sha1_for_merge_4 %t_77 sha1_if_then_1 undef 
    %j_13 = phi sha1_for_merge_4 %j_6 sha1_if_then_1 undef 
    %t_424 = phi sha1_for_merge_4 %t_79 sha1_if_then_1 undef 
    %h1_4 = phi sha1_for_merge_4 %h1_2 sha1_if_then_1 undef 
    %t_425 = phi sha1_for_merge_4 %t_81 sha1_if_then_1 undef 
    %b_5 = phi sha1_for_merge_4 %b_1 sha1_if_then_1 undef 
    %k_9 = phi sha1_for_merge_4 %k_1 sha1_if_then_1 undef 
    %e_5 = phi sha1_for_merge_4 %e_1 sha1_if_then_1 undef 
    %h0_4 = phi sha1_for_merge_4 %h0_2 sha1_if_then_1 undef 
    %h4_4 = phi sha1_for_merge_4 %h4_2 sha1_if_then_1 undef 
    %h3_4 = phi sha1_for_merge_4 %h3_2 sha1_if_then_1 undef 
    %x_19 = phi sha1_for_merge_4 %x_1 sha1_if_then_1 undef 
    %x_20 = phi sha1_for_merge_4 %x_3 sha1_if_then_1 undef 
    %t_426 = phi sha1_for_merge_4 %t_422 sha1_if_then_1 %t_7 
    %f_9 = phi sha1_for_merge_4 %f_1 sha1_if_then_1 undef 
    %shift_10 = phi sha1_for_merge_4 %shift_1 sha1_if_then_1 undef 
    %c_5 = phi sha1_for_merge_4 %c_1 sha1_if_then_1 undef 
    %x_21 = phi sha1_for_merge_4 %x_5 sha1_if_then_1 undef 
    %d_5 = phi sha1_for_merge_4 %d_1 sha1_if_then_1 undef 
    %shift_11 = phi sha1_for_merge_4 %shift_3 sha1_if_then_1 undef 
    %a_5 = phi sha1_for_merge_4 %a_1 sha1_if_then_1 undef 
    %h2_4 = phi sha1_for_merge_4 %h2_2 sha1_if_then_1 undef 
    %temp_4 = phi sha1_for_merge_4 %temp_1 sha1_if_then_1 undef 
    %i_11 = phi sha1_for_merge_4 %i_9 sha1_if_then_1 undef 
    %t_427 = phi sha1_for_merge_4 %t_83 sha1_if_then_1 undef 
    %shift_12 = phi sha1_for_merge_4 %shift_5 sha1_if_then_1 undef 
    ret %t_426

sha1_for_body_3:
    %t_428 = div %i_6 64
    %t_429 = mul %t_428 8
    %t_430 = add %t_429 8
    %t_431 = add %chunks_2 %t_430
    %t_432 = mod %i_6 64
    %t_433 = div %t_432 4
    %t_434 = load %t_431
    %t_435 = mul %t_433 8
    %t_436 = add %t_435 8
    %t_437 = add %t_434 %t_436
    %t_438 = div %i_6 64
    %t_439 = mul %t_438 8
    %t_440 = add %t_439 8
    %t_441 = add %chunks_2 %t_440
    %t_442 = mod %i_6 64
    %t_443 = div %t_442 4
    %t_444 = load %t_441
    %t_445 = mul %t_443 8
    %t_446 = add %t_445 8
    %t_447 = add %t_444 %t_446
    %t_448 = mul %i_6 8
    %t_449 = add %t_448 8
    %t_450 = add %input_1 %t_449
    %t_451 = mod %i_6 4
    %t_452 = sub 3 %t_451
    %t_453 = mul %t_452 8
    %t_454 = load %t_450
    %t_455 = shl %t_454 %t_453
    %t_456 = load %t_447
    %t_457 = or %t_456 %t_455
    store %t_457 %t_437
    %t_458 = move %i_6
    %i_7 = add %i_6 1
    jump sha1_for_cond_3

}

define i64 @main  {
main_entry_1:
    %asciiTable_2 = load @asciiTable_1
    %inputBuffer_2 = load @inputBuffer_1
    %op_1 = move 0
    %input_2 = move @__str_const_8
    jump main_while_body_1

main_while_body_1:
    %digit_1 = phi main_entry_1 undef main_if_else_1 %digit_1 main_faker_crackSHA1_for_merge_1 %digit_2 main_faker_crackSHA1_for_merge_2 %digit_2 main_faker_crackSHA1_if_then_1 %digit_1 main_splitter_1 %digit_1 
    %i_12 = phi main_entry_1 undef main_if_else_1 %i_12 main_faker_crackSHA1_for_merge_1 %i_12 main_faker_crackSHA1_for_merge_2 %i_12 main_faker_crackSHA1_if_then_1 %i_12 main_splitter_1 %i_13 
    %i_14 = phi main_entry_1 undef main_if_else_1 %i_14 main_faker_crackSHA1_for_merge_1 %i_15 main_faker_crackSHA1_for_merge_2 %i_15 main_faker_crackSHA1_if_then_1 %i_14 main_splitter_1 %i_14 
    %input_3 = phi main_entry_1 undef main_if_else_1 %input_3 main_faker_crackSHA1_for_merge_1 %input_3 main_faker_crackSHA1_for_merge_2 %input_3 main_faker_crackSHA1_if_then_1 %input_3 main_splitter_1 %input_4 
    %t_459 = phi main_entry_1 undef main_if_else_1 %t_459 main_faker_crackSHA1_for_merge_1 %t_460 main_faker_crackSHA1_for_merge_2 %t_461 main_faker_crackSHA1_if_then_1 %t_459 main_splitter_1 %t_459 
    %result_1 = phi main_entry_1 undef main_if_else_1 %result_1 main_faker_crackSHA1_for_merge_1 %result_2 main_faker_crackSHA1_for_merge_2 %result_2 main_faker_crackSHA1_if_then_1 %result_1 main_splitter_1 %result_1 
    %t_462 = phi main_entry_1 undef main_if_else_1 %t_462 main_faker_crackSHA1_for_merge_1 %t_463 main_faker_crackSHA1_for_merge_2 %t_464 main_faker_crackSHA1_if_then_1 %t_462 main_splitter_1 %t_462 
    %t_465 = phi main_entry_1 undef main_if_else_1 %t_465 main_faker_crackSHA1_for_merge_1 %t_466 main_faker_crackSHA1_for_merge_2 %t_466 main_faker_crackSHA1_if_then_1 %t_465 main_splitter_1 %t_465 
    %now_1 = phi main_entry_1 undef main_if_else_1 %now_1 main_faker_crackSHA1_for_merge_1 %now_2 main_faker_crackSHA1_for_merge_2 %now_3 main_faker_crackSHA1_if_then_1 %now_1 main_splitter_1 %now_1 
    %x_22 = phi main_entry_1 undef main_if_else_1 %x_22 main_faker_crackSHA1_for_merge_1 %x_22 main_faker_crackSHA1_for_merge_2 %x_22 main_faker_crackSHA1_if_then_1 %x_22 main_splitter_1 %x_23 
    %t_467 = phi main_entry_1 undef main_if_else_1 %t_467 main_faker_crackSHA1_for_merge_1 %t_468 main_faker_crackSHA1_for_merge_2 %t_468 main_faker_crackSHA1_if_then_1 %t_467 main_splitter_1 %t_467 
    %i_16 = phi main_entry_1 undef main_if_else_1 %i_16 main_faker_crackSHA1_for_merge_1 %i_17 main_faker_crackSHA1_for_merge_2 %i_18 main_faker_crackSHA1_if_then_1 %i_16 main_splitter_1 %i_16 
    %digit_3 = phi main_entry_1 undef main_if_else_1 %digit_3 main_faker_crackSHA1_for_merge_1 %digit_3 main_faker_crackSHA1_for_merge_2 %digit_3 main_faker_crackSHA1_if_then_1 %digit_3 main_splitter_1 %digit_4 
    %x_24 = phi main_entry_1 undef main_if_else_1 %x_24 main_faker_crackSHA1_for_merge_1 %x_25 main_faker_crackSHA1_for_merge_2 %x_25 main_faker_crackSHA1_if_then_1 %x_24 main_splitter_1 %x_24 
    %x_26 = phi main_entry_1 undef main_if_else_1 %x_26 main_faker_crackSHA1_for_merge_1 %x_26 main_faker_crackSHA1_for_merge_2 %x_26 main_faker_crackSHA1_if_then_1 %x_26 main_splitter_1 %x_27 
    %x_28 = phi main_entry_1 undef main_if_else_1 %x_28 main_faker_crackSHA1_for_merge_1 %x_28 main_faker_crackSHA1_for_merge_2 %x_28 main_faker_crackSHA1_if_then_1 %x_28 main_splitter_1 %x_29 
    %digit_5 = phi main_entry_1 undef main_if_else_1 %digit_5 main_faker_crackSHA1_for_merge_1 %digit_6 main_faker_crackSHA1_for_merge_2 %digit_6 main_faker_crackSHA1_if_then_1 %digit_5 main_splitter_1 %digit_5 
    %input_5 = phi main_entry_1 undef main_if_else_1 %input_5 main_faker_crackSHA1_for_merge_1 %input_6 main_faker_crackSHA1_for_merge_2 %input_6 main_faker_crackSHA1_if_then_1 %input_6 main_splitter_1 %input_5 
    %now_4 = phi main_entry_1 undef main_if_else_1 %now_4 main_faker_crackSHA1_for_merge_1 %now_5 main_faker_crackSHA1_for_merge_2 %now_6 main_faker_crackSHA1_if_then_1 %now_4 main_splitter_1 %now_4 
    %x_30 = phi main_entry_1 undef main_if_else_1 %x_30 main_faker_crackSHA1_for_merge_1 %x_31 main_faker_crackSHA1_for_merge_2 %x_30 main_faker_crackSHA1_if_then_1 %x_30 main_splitter_1 %x_30 
    %t_469 = phi main_entry_1 undef main_if_else_1 %t_469 main_faker_crackSHA1_for_merge_1 %t_470 main_faker_crackSHA1_for_merge_2 %t_469 main_faker_crackSHA1_if_then_1 %t_469 main_splitter_1 %t_469 
    %i_19 = phi main_entry_1 undef main_if_else_1 %i_19 main_faker_crackSHA1_for_merge_1 %i_20 main_faker_crackSHA1_for_merge_2 %i_21 main_faker_crackSHA1_if_then_1 %i_19 main_splitter_1 %i_19 
    %result_3 = phi main_entry_1 undef main_if_else_1 %result_3 main_faker_crackSHA1_for_merge_1 %result_3 main_faker_crackSHA1_for_merge_2 %result_3 main_faker_crackSHA1_if_then_1 %result_3 main_splitter_1 %result_4 
    %t_471 = phi main_entry_1 undef main_if_else_1 %t_471 main_faker_crackSHA1_for_merge_1 %t_472 main_faker_crackSHA1_for_merge_2 %t_473 main_faker_crackSHA1_if_then_1 %t_471 main_splitter_1 %t_471 
    %MAXDIGIT_1 = phi main_entry_1 undef main_if_else_1 %MAXDIGIT_1 main_faker_crackSHA1_for_merge_1 %MAXDIGIT_2 main_faker_crackSHA1_for_merge_2 %MAXDIGIT_2 main_faker_crackSHA1_if_then_1 %MAXDIGIT_1 main_splitter_1 %MAXDIGIT_1 
    %t_474 = phi main_entry_1 undef main_if_else_1 %t_474 main_faker_crackSHA1_for_merge_1 %t_474 main_faker_crackSHA1_for_merge_2 %t_474 main_faker_crackSHA1_if_then_1 %t_474 main_splitter_1 %t_475 
    %target_1 = phi main_entry_1 undef main_if_else_1 %target_1 main_faker_crackSHA1_for_merge_1 %target_2 main_faker_crackSHA1_for_merge_2 %target_2 main_faker_crackSHA1_if_then_1 %target_2 main_splitter_1 %target_1 
    %t_476 = phi main_entry_1 undef main_if_else_1 %t_476 main_faker_crackSHA1_for_merge_1 %t_477 main_faker_crackSHA1_for_merge_2 %t_477 main_faker_crackSHA1_if_then_1 %t_476 main_splitter_1 %t_476 
    %i_22 = phi main_entry_1 undef main_if_else_1 %i_22 main_faker_crackSHA1_for_merge_1 %i_23 main_faker_crackSHA1_for_merge_2 %i_24 main_faker_crackSHA1_if_then_1 %i_22 main_splitter_1 %i_22 
    %a_6 = phi main_entry_1 undef main_if_else_1 %a_6 main_faker_crackSHA1_for_merge_1 %a_7 main_faker_crackSHA1_for_merge_2 %a_8 main_faker_crackSHA1_if_then_1 %a_6 main_splitter_1 %a_6 
    %t_478 = phi main_entry_1 undef main_if_else_1 %t_478 main_faker_crackSHA1_for_merge_1 %t_479 main_faker_crackSHA1_for_merge_2 %t_480 main_faker_crackSHA1_if_then_1 %t_478 main_splitter_1 %t_478 
    %b_6 = phi main_entry_1 undef main_if_else_1 %b_6 main_faker_crackSHA1_for_merge_1 %b_7 main_faker_crackSHA1_for_merge_2 %b_8 main_faker_crackSHA1_if_then_1 %b_6 main_splitter_1 %b_6 
    %ret_1 = phi main_entry_1 undef main_if_else_1 %ret_1 main_faker_crackSHA1_for_merge_1 %ret_1 main_faker_crackSHA1_for_merge_2 %ret_1 main_faker_crackSHA1_if_then_1 %ret_1 main_splitter_1 %ret_2 
    %op_2 = phi main_entry_1 %op_1 main_if_else_1 %op_3 main_faker_crackSHA1_for_merge_1 %op_3 main_faker_crackSHA1_for_merge_2 %op_3 main_faker_crackSHA1_if_then_1 %op_3 main_splitter_1 %op_3 
    %t_481 = phi main_entry_1 undef main_if_else_1 %t_481 main_faker_crackSHA1_for_merge_1 %t_481 main_faker_crackSHA1_for_merge_2 %t_481 main_faker_crackSHA1_if_then_1 %t_481 main_splitter_1 %t_482 
    %i_25 = phi main_entry_1 undef main_if_else_1 %i_25 main_faker_crackSHA1_for_merge_1 %i_25 main_faker_crackSHA1_for_merge_2 %i_25 main_faker_crackSHA1_if_then_1 %i_25 main_splitter_1 %i_26 
    %t_483 = call getInt 
    %op_3 = move %t_483
    %t_484 = seq %op_3 0
    br %t_484 main_while_merge_1 main_if_merge_1

main_if_merge_1:
    %t_485 = seq %op_3 1
    br %t_485 main_if_then_1 main_if_else_1

main_if_then_1:
    %t_486 = call getString 
    %input_7 = move %t_486
    %input_4 = move %input_7
    %i_27 = move 0
    %i_28 = move 0
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_cond_1:
    %i_29 = phi main_if_then_1 %i_28 main_faker_computeSHA1_for_body_1 %i_30 
    %t_487 = call string.length %input_4 
    %t_488 = slt %i_29 %t_487
    br %t_488 main_faker_computeSHA1_for_body_1 main_faker_computeSHA1_for_merge_1

main_faker_computeSHA1_for_body_1:
    %t_489 = mul %i_29 8
    %t_490 = add %t_489 8
    %t_491 = add %inputBuffer_2 %t_490
    %t_492 = call string.ord %input_4 %i_29 
    store %t_492 %t_491
    %t_493 = move %i_29
    %i_30 = add %i_29 1
    jump main_faker_computeSHA1_for_cond_1

main_faker_computeSHA1_for_merge_1:
    %t_494 = call string.length %input_4 
    %t_495 = call sha1 %inputBuffer_2 %t_494 
    %result_4 = move %t_495
    %i_31 = move 0
    jump main_faker_computeSHA1_for_cond_2

main_faker_computeSHA1_for_cond_2:
    %i_13 = phi main_faker_computeSHA1_for_merge_1 %i_12 main_faker_computeSHA1_splitter_1 %i_32 
    %x_23 = phi main_faker_computeSHA1_for_merge_1 %x_22 main_faker_computeSHA1_splitter_1 %x_32 
    %digit_4 = phi main_faker_computeSHA1_for_merge_1 %digit_3 main_faker_computeSHA1_splitter_1 %digit_7 
    %x_27 = phi main_faker_computeSHA1_for_merge_1 %x_26 main_faker_computeSHA1_splitter_1 %x_33 
    %x_29 = phi main_faker_computeSHA1_for_merge_1 %x_28 main_faker_computeSHA1_splitter_1 %x_34 
    %t_475 = phi main_faker_computeSHA1_for_merge_1 %t_474 main_faker_computeSHA1_splitter_1 %t_496 
    %ret_2 = phi main_faker_computeSHA1_for_merge_1 %ret_1 main_faker_computeSHA1_splitter_1 %ret_3 
    %t_482 = phi main_faker_computeSHA1_for_merge_1 %t_481 main_faker_computeSHA1_splitter_1 %t_497 
    %i_26 = phi main_faker_computeSHA1_for_merge_1 %i_31 main_faker_computeSHA1_splitter_1 %i_33 
    %t_498 = load %result_4
    %t_499 = slt %i_26 %t_498
    br %t_499 main_faker_computeSHA1_for_body_2 main_splitter_1

main_splitter_1:
    call println @__str_const_4 
    jump main_while_body_1

main_faker_computeSHA1_for_body_2:
    %t_500 = mul %i_26 8
    %t_501 = add %t_500 8
    %t_502 = add %result_4 %t_501
    %t_503 = load %t_502
    %x_33 = move %t_503
    %ret_4 = move @__str_const_2
    %i_34 = move 0
    %i_35 = move 28
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_faker_toStringHex_for_cond_1:
    %i_32 = phi main_faker_computeSHA1_for_body_2 %i_35 main_faker_computeSHA1_faker_toStringHex_for_step_1 %i_36 
    %x_32 = phi main_faker_computeSHA1_for_body_2 %x_23 main_faker_computeSHA1_faker_toStringHex_for_step_1 %x_35 
    %digit_7 = phi main_faker_computeSHA1_for_body_2 %digit_4 main_faker_computeSHA1_faker_toStringHex_for_step_1 %digit_8 
    %x_34 = phi main_faker_computeSHA1_for_body_2 %x_29 main_faker_computeSHA1_faker_toStringHex_for_step_1 %x_36 
    %t_496 = phi main_faker_computeSHA1_for_body_2 %t_475 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_504 
    %ret_3 = phi main_faker_computeSHA1_for_body_2 %ret_4 main_faker_computeSHA1_faker_toStringHex_for_step_1 %ret_5 
    %t_497 = phi main_faker_computeSHA1_for_body_2 %t_482 main_faker_computeSHA1_faker_toStringHex_for_step_1 %t_505 
    %t_506 = sge %i_32 0
    br %t_506 main_faker_computeSHA1_faker_toStringHex_for_body_1 main_faker_computeSHA1_splitter_1

main_faker_computeSHA1_faker_toStringHex_for_body_1:
    %t_507 = shr %x_33 %i_32
    %t_508 = and %t_507 15
    %digit_8 = move %t_508
    %t_509 = slt %digit_8 10
    br %t_509 main_faker_computeSHA1_faker_toStringHex_if_then_1 main_faker_computeSHA1_faker_toStringHex_if_else_1

main_faker_computeSHA1_faker_toStringHex_if_then_1:
    %t_510 = add 48 %digit_8
    %x_37 = move %t_510
    %t_511 = sge %x_37 32
    br %t_511 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_1:
    %t_512 = sle %x_37 126
    br %t_512 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1:
    %t_513 = sub %x_37 32
    %t_514 = sub %x_37 32
    %t_515 = call string.substring %asciiTable_2 %t_513 %t_514 
    %t_516 = move %t_515
    %t_517 = move %t_516
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1:
    %t_518 = move @__str_const_1
    %t_519 = move %t_518
    jump main_faker_computeSHA1_faker_toStringHex_splitter_1

main_faker_computeSHA1_faker_toStringHex_splitter_1:
    %t_520 = phi main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_1 %t_517 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_1 %t_519 
    %t_521 = move %t_520
    %t_522 = call string.add %ret_3 %t_521 
    %ret_6 = move %t_522
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_if_else_1:
    %t_523 = add 65 %digit_8
    %t_524 = sub %t_523 10
    %x_38 = move %t_524
    %t_525 = sge %x_38 32
    br %t_525 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_lhs_then_2:
    %t_526 = sle %x_38 126
    br %t_526 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2:
    %t_527 = sub %x_38 32
    %t_528 = sub %x_38 32
    %t_529 = call string.substring %asciiTable_2 %t_527 %t_528 
    %t_530 = move %t_529
    %t_531 = move %t_530
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2:
    %t_532 = move @__str_const_1
    %t_533 = move %t_532
    jump main_faker_computeSHA1_faker_toStringHex_splitter_2

main_faker_computeSHA1_faker_toStringHex_splitter_2:
    %t_534 = phi main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_merge_2 %t_533 main_faker_computeSHA1_faker_toStringHex_faker_int2chr_if_then_2 %t_531 
    %t_535 = move %t_534
    %t_536 = call string.add %ret_3 %t_535 
    %ret_7 = move %t_536
    jump main_faker_computeSHA1_faker_toStringHex_for_step_1

main_faker_computeSHA1_faker_toStringHex_for_step_1:
    %x_35 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %x_38 main_faker_computeSHA1_faker_toStringHex_splitter_1 %x_32 
    %x_36 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %x_34 main_faker_computeSHA1_faker_toStringHex_splitter_1 %x_37 
    %t_504 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_496 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_520 
    %ret_5 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %ret_7 main_faker_computeSHA1_faker_toStringHex_splitter_1 %ret_6 
    %t_505 = phi main_faker_computeSHA1_faker_toStringHex_splitter_2 %t_534 main_faker_computeSHA1_faker_toStringHex_splitter_1 %t_497 
    %t_537 = sub %i_32 4
    %i_36 = move %t_537
    jump main_faker_computeSHA1_faker_toStringHex_for_cond_1

main_faker_computeSHA1_splitter_1:
    %t_538 = move %ret_3
    %t_539 = move %t_538
    call print %t_539 
    %t_540 = move %i_26
    %i_33 = add %i_26 1
    jump main_faker_computeSHA1_for_cond_2

main_if_else_1:
    %t_541 = seq %op_3 2
    br %t_541 main_if_then_2 main_while_body_1

main_if_then_2:
    %t_542 = call getString 
    %input_8 = move %t_542
    %input_6 = move %input_8
    %t_543 = mul 5 8
    %t_544 = add %t_543 8
    %t_545 = alloc %t_544
    store 5 %t_545
    %target_2 = move %t_545
    %t_546 = call string.length %input_6 
    %t_547 = sne %t_546 40
    br %t_547 main_faker_crackSHA1_if_then_1 main_faker_crackSHA1_if_merge_1

main_faker_crackSHA1_if_then_1:
    call println @__str_const_5 
    jump main_while_body_1

main_faker_crackSHA1_if_merge_1:
    %i_37 = move 0
    %i_38 = move 0
    jump main_faker_crackSHA1_for_cond_1

main_faker_crackSHA1_for_cond_1:
    %i_39 = phi main_faker_crackSHA1_if_merge_1 %i_38 main_faker_crackSHA1_for_body_1 %i_40 
    %t_548 = slt %i_39 5
    br %t_548 main_faker_crackSHA1_for_body_1 main_faker_crackSHA1_for_merge_3

main_faker_crackSHA1_for_merge_3:
    %i_41 = move 0
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_for_cond_2:
    %i_15 = phi main_faker_crackSHA1_for_merge_3 %i_14 main_faker_crackSHA1_splitter_1 %i_42 
    %result_2 = phi main_faker_crackSHA1_for_merge_3 %result_1 main_faker_crackSHA1_splitter_1 %result_5 
    %t_466 = phi main_faker_crackSHA1_for_merge_3 %t_465 main_faker_crackSHA1_splitter_1 %t_549 
    %t_468 = phi main_faker_crackSHA1_for_merge_3 %t_467 main_faker_crackSHA1_splitter_1 %t_550 
    %x_25 = phi main_faker_crackSHA1_for_merge_3 %x_24 main_faker_crackSHA1_splitter_1 %x_39 
    %digit_6 = phi main_faker_crackSHA1_for_merge_3 %digit_5 main_faker_crackSHA1_splitter_1 %digit_9 
    %t_477 = phi main_faker_crackSHA1_for_merge_3 %t_476 main_faker_crackSHA1_splitter_1 %t_551 
    %i_43 = phi main_faker_crackSHA1_for_merge_3 %i_41 main_faker_crackSHA1_splitter_1 %i_44 
    %t_552 = slt %i_43 40
    br %t_552 main_faker_crackSHA1_for_body_2 main_faker_crackSHA1_for_merge_4

main_faker_crackSHA1_for_merge_4:
    %MAXDIGIT_2 = move 4
    %digit_10 = move 0
    %digit_11 = move 1
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_for_cond_3:
    %digit_2 = phi main_faker_crackSHA1_for_merge_4 %digit_11 main_faker_crackSHA1_for_step_1 %digit_12 
    %t_461 = phi main_faker_crackSHA1_for_merge_4 %t_459 main_faker_crackSHA1_for_step_1 %t_553 
    %t_464 = phi main_faker_crackSHA1_for_merge_4 %t_462 main_faker_crackSHA1_for_step_1 %t_463 
    %now_3 = phi main_faker_crackSHA1_for_merge_4 %now_1 main_faker_crackSHA1_for_step_1 %now_7 
    %i_18 = phi main_faker_crackSHA1_for_merge_4 %i_16 main_faker_crackSHA1_for_step_1 %i_17 
    %now_6 = phi main_faker_crackSHA1_for_merge_4 %now_4 main_faker_crackSHA1_for_step_1 %now_8 
    %i_21 = phi main_faker_crackSHA1_for_merge_4 %i_19 main_faker_crackSHA1_for_step_1 %i_45 
    %t_473 = phi main_faker_crackSHA1_for_merge_4 %t_471 main_faker_crackSHA1_for_step_1 %t_554 
    %i_24 = phi main_faker_crackSHA1_for_merge_4 %i_43 main_faker_crackSHA1_for_step_1 %i_46 
    %a_8 = phi main_faker_crackSHA1_for_merge_4 %a_6 main_faker_crackSHA1_for_step_1 %a_7 
    %t_480 = phi main_faker_crackSHA1_for_merge_4 %t_478 main_faker_crackSHA1_for_step_1 %t_555 
    %b_8 = phi main_faker_crackSHA1_for_merge_4 %b_6 main_faker_crackSHA1_for_step_1 %b_7 
    %t_556 = sle %digit_2 %MAXDIGIT_2
    br %t_556 main_faker_crackSHA1_for_body_3 main_faker_crackSHA1_for_merge_2

main_faker_crackSHA1_for_merge_2:
    call println @__str_const_7 
    jump main_while_body_1

main_faker_crackSHA1_for_body_3:
    %i_47 = move 0
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_for_cond_4:
    %i_46 = phi main_faker_crackSHA1_for_body_3 %i_47 main_faker_crackSHA1_for_body_4 %i_48 
    %t_557 = slt %i_46 %digit_2
    br %t_557 main_faker_crackSHA1_for_body_4 main_faker_crackSHA1_while_body_1

main_faker_crackSHA1_for_body_4:
    %t_558 = mul %i_46 8
    %t_559 = add %t_558 8
    %t_560 = add %inputBuffer_2 %t_559
    store 48 %t_560
    %t_561 = move %i_46
    %i_48 = add %i_46 1
    jump main_faker_crackSHA1_for_cond_4

main_faker_crackSHA1_while_body_1:
    %t_460 = phi main_faker_crackSHA1_for_cond_4 %t_461 main_faker_crackSHA1_splitter_2 %t_553 
    %t_562 = phi main_faker_crackSHA1_for_cond_4 %t_464 main_faker_crackSHA1_splitter_2 %t_463 
    %now_2 = phi main_faker_crackSHA1_for_cond_4 %now_3 main_faker_crackSHA1_splitter_2 %now_7 
    %i_49 = phi main_faker_crackSHA1_for_cond_4 %i_18 main_faker_crackSHA1_splitter_2 %i_17 
    %now_5 = phi main_faker_crackSHA1_for_cond_4 %now_6 main_faker_crackSHA1_splitter_2 %now_8 
    %i_20 = phi main_faker_crackSHA1_for_cond_4 %i_21 main_faker_crackSHA1_splitter_2 %i_45 
    %t_472 = phi main_faker_crackSHA1_for_cond_4 %t_473 main_faker_crackSHA1_splitter_2 %t_554 
    %a_9 = phi main_faker_crackSHA1_for_cond_4 %a_8 main_faker_crackSHA1_splitter_2 %a_7 
    %t_479 = phi main_faker_crackSHA1_for_cond_4 %t_480 main_faker_crackSHA1_splitter_2 %t_555 
    %b_9 = phi main_faker_crackSHA1_for_cond_4 %b_8 main_faker_crackSHA1_splitter_2 %b_7 
    %t_563 = call sha1 %inputBuffer_2 %digit_2 
    %out_1 = move %t_563
    %a_7 = move %out_1
    %b_7 = move %target_2
    %t_564 = load %a_7
    %t_565 = load %b_7
    %t_566 = sne %t_564 %t_565
    br %t_566 main_faker_crackSHA1_faker_array_equal_elseBB_1 main_faker_crackSHA1_faker_array_equal_if_merge_1

main_faker_crackSHA1_faker_array_equal_elseBB_1:
    %t_567 = move 0
    %t_568 = move %t_567
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_array_equal_if_merge_1:
    %i_50 = move 0
    %i_51 = move 0
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_for_cond_1:
    %i_52 = phi main_faker_crackSHA1_faker_array_equal_if_merge_1 %i_51 main_faker_crackSHA1_faker_array_equal_for_step_1 %i_53 
    %t_569 = load %a_7
    %t_570 = slt %i_52 %t_569
    br %t_570 main_faker_crackSHA1_faker_array_equal_for_body_1 main_faker_crackSHA1_faker_array_equal_thenBB_1

main_faker_crackSHA1_faker_array_equal_for_body_1:
    %t_571 = mul %i_52 8
    %t_572 = add %t_571 8
    %t_573 = add %a_7 %t_572
    %t_574 = mul %i_52 8
    %t_575 = add %t_574 8
    %t_576 = add %b_7 %t_575
    %t_577 = load %t_573
    %t_578 = load %t_576
    %t_579 = sne %t_577 %t_578
    br %t_579 main_faker_crackSHA1_faker_array_equal_elseBB_2 main_faker_crackSHA1_faker_array_equal_for_step_1

main_faker_crackSHA1_faker_array_equal_elseBB_2:
    %t_580 = move 0
    %t_581 = move %t_580
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_faker_array_equal_for_step_1:
    %t_582 = move %i_52
    %i_53 = add %i_52 1
    jump main_faker_crackSHA1_faker_array_equal_for_cond_1

main_faker_crackSHA1_faker_array_equal_thenBB_1:
    %t_583 = move 1
    %t_584 = move %t_583
    jump main_faker_crackSHA1_splitter_3

main_faker_crackSHA1_splitter_3:
    %t_463 = phi main_faker_crackSHA1_faker_array_equal_thenBB_1 %t_584 main_faker_crackSHA1_faker_array_equal_elseBB_2 %t_581 main_faker_crackSHA1_faker_array_equal_elseBB_1 %t_568 
    %i_17 = phi main_faker_crackSHA1_faker_array_equal_thenBB_1 %i_52 main_faker_crackSHA1_faker_array_equal_elseBB_2 %i_52 main_faker_crackSHA1_faker_array_equal_elseBB_1 %i_49 
    %t_585 = move %t_463
    br %t_585 main_faker_crackSHA1_if_then_2 main_faker_crackSHA1_if_merge_2

main_faker_crackSHA1_if_merge_2:
    %now_7 = move %inputBuffer_2
    %length_2 = move %digit_2
    %i_54 = move 0
    %t_586 = sub %length_2 1
    %i_55 = move %t_586
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_faker_nextText_for_cond_1:
    %t_587 = phi main_faker_crackSHA1_if_merge_2 %t_460 main_faker_crackSHA1_faker_nextText_if_then_1 %t_588 
    %now_9 = phi main_faker_crackSHA1_if_merge_2 %now_5 main_faker_crackSHA1_faker_nextText_if_then_1 %now_10 
    %i_45 = phi main_faker_crackSHA1_if_merge_2 %i_55 main_faker_crackSHA1_faker_nextText_if_then_1 %i_56 
    %t_589 = phi main_faker_crackSHA1_if_merge_2 %t_472 main_faker_crackSHA1_faker_nextText_if_then_1 %t_590 
    %t_591 = sge %i_45 0
    br %t_591 main_faker_crackSHA1_faker_nextText_for_body_1 main_faker_crackSHA1_faker_nextText_elseBB_1

main_faker_crackSHA1_faker_nextText_elseBB_1:
    %t_592 = move 0
    %t_593 = move %t_592
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_faker_nextText_for_body_1:
    %t_594 = mul %i_45 8
    %t_595 = add %t_594 8
    %t_590 = add %now_7 %t_595
    %t_596 = mul %i_45 8
    %t_597 = add %t_596 8
    %t_598 = add %now_7 %t_597
    %t_599 = load %t_598
    %now_10 = move %t_599
    %t_600 = seq %now_10 122
    br %t_600 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_1:
    %t_601 = seq %now_10 90
    br %t_601 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_2:
    %t_602 = seq %now_10 57
    br %t_602 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3:
    %t_603 = move 65
    %t_604 = move %t_603
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3:
    %t_605 = add %now_10 1
    %t_606 = move %t_605
    %t_607 = move %t_606
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2:
    %t_608 = move 97
    %t_609 = move %t_608
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1:
    %t_610 = neg 1
    %t_611 = move %t_610
    %t_612 = move %t_611
    jump main_faker_crackSHA1_faker_nextText_splitter_1

main_faker_crackSHA1_faker_nextText_splitter_1:
    %t_588 = phi main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_1 %t_612 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_2 %t_609 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_merge_3 %t_607 main_faker_crackSHA1_faker_nextText_faker_nextLetter_if_then_3 %t_604 
    %t_613 = move %t_588
    store %t_613 %t_590
    %t_614 = mul %i_45 8
    %t_615 = add %t_614 8
    %t_616 = add %now_7 %t_615
    %t_617 = neg 1
    %t_618 = load %t_616
    %t_619 = seq %t_618 %t_617
    br %t_619 main_faker_crackSHA1_faker_nextText_if_then_1 main_faker_crackSHA1_faker_nextText_thenBB_1

main_faker_crackSHA1_faker_nextText_thenBB_1:
    %t_620 = move 1
    %t_621 = move %t_620
    jump main_faker_crackSHA1_splitter_2

main_faker_crackSHA1_splitter_2:
    %t_553 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_588 main_faker_crackSHA1_faker_nextText_elseBB_1 %t_587 
    %now_8 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %now_10 main_faker_crackSHA1_faker_nextText_elseBB_1 %now_9 
    %t_554 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_590 main_faker_crackSHA1_faker_nextText_elseBB_1 %t_589 
    %t_555 = phi main_faker_crackSHA1_faker_nextText_thenBB_1 %t_621 main_faker_crackSHA1_faker_nextText_elseBB_1 %t_593 
    %t_622 = move %t_555
    br %t_622 main_faker_crackSHA1_while_body_1 main_faker_crackSHA1_for_step_1

main_faker_crackSHA1_for_step_1:
    %t_623 = move %digit_2
    %digit_12 = add %digit_2 1
    jump main_faker_crackSHA1_for_cond_3

main_faker_crackSHA1_faker_nextText_if_then_1:
    %t_624 = mul %i_45 8
    %t_625 = add %t_624 8
    %t_626 = add %now_7 %t_625
    store 48 %t_626
    %t_627 = move %i_45
    %i_56 = sub %i_45 1
    jump main_faker_crackSHA1_faker_nextText_for_cond_1

main_faker_crackSHA1_if_then_2:
    %i_57 = move 0
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_cond_5:
    %x_31 = phi main_faker_crackSHA1_if_then_2 %x_30 main_faker_crackSHA1_splitter_4 %x_40 
    %t_470 = phi main_faker_crackSHA1_if_then_2 %t_469 main_faker_crackSHA1_splitter_4 %t_628 
    %i_23 = phi main_faker_crackSHA1_if_then_2 %i_57 main_faker_crackSHA1_splitter_4 %i_58 
    %t_629 = slt %i_23 %digit_2
    br %t_629 main_faker_crackSHA1_for_body_5 main_faker_crackSHA1_for_merge_1

main_faker_crackSHA1_for_body_5:
    %t_630 = mul %i_23 8
    %t_631 = add %t_630 8
    %t_632 = add %inputBuffer_2 %t_631
    %t_633 = load %t_632
    %x_40 = move %t_633
    %t_634 = sge %x_40 32
    br %t_634 main_faker_crackSHA1_faker_int2chr_lhs_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_lhs_then_1:
    %t_635 = sle %x_40 126
    br %t_635 main_faker_crackSHA1_faker_int2chr_if_then_1 main_faker_crackSHA1_faker_int2chr_if_merge_1

main_faker_crackSHA1_faker_int2chr_if_then_1:
    %t_636 = sub %x_40 32
    %t_637 = sub %x_40 32
    %t_638 = call string.substring %asciiTable_2 %t_636 %t_637 
    %t_639 = move %t_638
    %t_640 = move %t_639
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_faker_int2chr_if_merge_1:
    %t_641 = move @__str_const_1
    %t_642 = move %t_641
    jump main_faker_crackSHA1_splitter_4

main_faker_crackSHA1_splitter_4:
    %t_628 = phi main_faker_crackSHA1_faker_int2chr_if_merge_1 %t_642 main_faker_crackSHA1_faker_int2chr_if_then_1 %t_640 
    %t_643 = move %t_628
    call print %t_643 
    %t_644 = move %i_23
    %i_58 = add %i_23 1
    jump main_faker_crackSHA1_for_cond_5

main_faker_crackSHA1_for_merge_1:
    call println @__str_const_6 
    jump main_while_body_1

main_faker_crackSHA1_for_body_2:
    %t_645 = div %i_43 8
    %t_646 = mul %t_645 8
    %t_647 = add %t_646 8
    %t_549 = add %target_2 %t_647
    %t_648 = div %i_43 8
    %t_649 = mul %t_648 8
    %t_650 = add %t_649 8
    %t_550 = add %target_2 %t_650
    %t_651 = add %i_43 3
    %t_652 = call string.substring %input_6 %i_43 %t_651 
    %x_39 = move %t_652
    %i_59 = move 0
    %result_6 = move 0
    %i_60 = move 0
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_faker_hex2int_for_cond_1:
    %i_42 = phi main_faker_crackSHA1_for_body_2 %i_60 main_faker_crackSHA1_faker_hex2int_for_step_1 %i_61 
    %result_5 = phi main_faker_crackSHA1_for_body_2 %result_6 main_faker_crackSHA1_faker_hex2int_for_step_1 %result_7 
    %digit_13 = phi main_faker_crackSHA1_for_body_2 %digit_6 main_faker_crackSHA1_faker_hex2int_for_step_1 %digit_14 
    %t_653 = call string.length %x_39 
    %t_654 = slt %i_42 %t_653
    br %t_654 main_faker_crackSHA1_faker_hex2int_for_body_1 main_faker_crackSHA1_faker_hex2int_for_merge_1

main_faker_crackSHA1_faker_hex2int_for_merge_1:
    %t_655 = move %result_5
    %t_656 = move %t_655
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_faker_hex2int_for_body_1:
    %t_657 = call string.ord %x_39 %i_42 
    %digit_14 = move %t_657
    %t_658 = sge %digit_14 48
    br %t_658 main_faker_crackSHA1_faker_hex2int_lhs_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_lhs_then_1:
    %t_659 = sle %digit_14 57
    br %t_659 main_faker_crackSHA1_faker_hex2int_if_then_1 main_faker_crackSHA1_faker_hex2int_if_else_1

main_faker_crackSHA1_faker_hex2int_if_else_1:
    %t_660 = sge %digit_14 65
    br %t_660 main_faker_crackSHA1_faker_hex2int_lhs_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_lhs_then_2:
    %t_661 = sle %digit_14 70
    br %t_661 main_faker_crackSHA1_faker_hex2int_if_then_2 main_faker_crackSHA1_faker_hex2int_if_else_2

main_faker_crackSHA1_faker_hex2int_if_then_2:
    %t_662 = mul %result_5 16
    %t_663 = add %t_662 %digit_14
    %t_664 = sub %t_663 65
    %t_665 = add %t_664 10
    %result_8 = move %t_665
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_else_2:
    %t_666 = sge %digit_14 97
    br %t_666 main_faker_crackSHA1_faker_hex2int_lhs_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_lhs_then_3:
    %t_667 = sle %digit_14 102
    br %t_667 main_faker_crackSHA1_faker_hex2int_if_then_3 main_faker_crackSHA1_faker_hex2int_if_else_3

main_faker_crackSHA1_faker_hex2int_if_else_3:
    %t_668 = move 0
    %t_669 = move %t_668
    jump main_faker_crackSHA1_splitter_1

main_faker_crackSHA1_splitter_1:
    %digit_9 = phi main_faker_crackSHA1_faker_hex2int_if_else_3 %digit_14 main_faker_crackSHA1_faker_hex2int_for_merge_1 %digit_13 
    %t_551 = phi main_faker_crackSHA1_faker_hex2int_if_else_3 %t_669 main_faker_crackSHA1_faker_hex2int_for_merge_1 %t_656 
    %t_670 = move %t_551
    %t_671 = div %i_43 4
    %t_672 = mod %t_671 2
    %t_673 = sub 1 %t_672
    %t_674 = mul %t_673 16
    %t_675 = shl %t_670 %t_674
    %t_676 = load %t_550
    %t_677 = or %t_676 %t_675
    store %t_677 %t_549
    %t_678 = add %i_43 4
    %i_44 = move %t_678
    jump main_faker_crackSHA1_for_cond_2

main_faker_crackSHA1_faker_hex2int_if_then_3:
    %t_679 = mul %result_5 16
    %t_680 = add %t_679 %digit_14
    %t_681 = sub %t_680 97
    %t_682 = add %t_681 10
    %result_9 = move %t_682
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_if_then_1:
    %t_683 = mul %result_5 16
    %t_684 = add %t_683 %digit_14
    %t_685 = sub %t_684 48
    %result_10 = move %t_685
    jump main_faker_crackSHA1_faker_hex2int_for_step_1

main_faker_crackSHA1_faker_hex2int_for_step_1:
    %result_7 = phi main_faker_crackSHA1_faker_hex2int_if_then_1 %result_10 main_faker_crackSHA1_faker_hex2int_if_then_3 %result_9 main_faker_crackSHA1_faker_hex2int_if_then_2 %result_8 
    %t_686 = move %i_42
    %i_61 = add %i_42 1
    jump main_faker_crackSHA1_faker_hex2int_for_cond_1

main_faker_crackSHA1_for_body_1:
    %t_687 = mul %i_39 8
    %t_688 = add %t_687 8
    %t_689 = add %target_2 %t_688
    store 0 %t_689
    %t_690 = move %i_39
    %i_40 = add %i_39 1
    jump main_faker_crackSHA1_for_cond_1

main_while_merge_1:
    %t_691 = move 0
    ret %t_691

}

define i64 @__init  {
__init_entry_1:
    %outputBuffer_3 = load @outputBuffer_1
    %inputBuffer_3 = load @inputBuffer_1
    %asciiTable_3 = load @asciiTable_1
    %MAXLENGTH_2 = load @MAXLENGTH_1
    %MAXCHUNK_3 = load @MAXCHUNK_1
    %chunks_3 = load @chunks_1
    %asciiTable_4 = move @__str_const_9
    %MAXCHUNK_4 = move 100
    %t_692 = sub %MAXCHUNK_4 1
    %t_693 = mul %t_692 64
    %t_694 = sub %t_693 16
    %MAXLENGTH_3 = move %t_694
    %t_695 = mul %MAXCHUNK_4 8
    %t_696 = add %t_695 8
    %t_697 = alloc %t_696
    store %MAXCHUNK_4 %t_697
    %t_698 = add %t_697 8
    %t_699 = add %t_697 %t_696
    jump __init_for_cond_1

__init_for_cond_1:
    %t_700 = phi __init_entry_1 %t_698 __init_for_body_1 %t_701 
    %t_702 = slt %t_700 %t_699
    br %t_702 __init_for_body_1 __init_for_merge_1

__init_for_body_1:
    %t_703 = mul 80 8
    %t_704 = add %t_703 8
    %t_705 = alloc %t_704
    store 80 %t_705
    store %t_705 %t_700
    %t_706 = add %t_700 8
    %t_701 = move %t_706
    jump __init_for_cond_1

__init_for_merge_1:
    %chunks_4 = move %t_697
    %t_707 = mul %MAXLENGTH_3 8
    %t_708 = add %t_707 8
    %t_709 = alloc %t_708
    store %MAXLENGTH_3 %t_709
    %inputBuffer_4 = move %t_709
    %t_710 = mul 5 8
    %t_711 = add %t_710 8
    %t_712 = alloc %t_711
    store 5 %t_712
    %outputBuffer_4 = move %t_712
    store %chunks_4 @chunks_1
    store %MAXCHUNK_4 @MAXCHUNK_1
    store %asciiTable_4 @asciiTable_1
    store %inputBuffer_4 @inputBuffer_1
    store %outputBuffer_4 @outputBuffer_1
    %t_713 = call main 
    %t_714 = move %t_713
    ret %t_714

}


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

define i64 @hex2int  {
hex2int_entry_1:
    %i_1 = move 0
    %result_1 = move 0
    %i_1 = move 0
    jump hex2int_for_cond_1

hex2int_for_cond_1:
    %t_1 = call string.length %x_1 
    %t_2 = slt %i_1 %t_1
    br %t_2 hex2int_for_body_1 hex2int_for_merge_1

hex2int_for_merge_1:
    %t_3 = move %result_1
    %t_4 = move %t_3
    jump hex2int_exit_1

hex2int_for_body_1:
    %t_5 = call string.ord %x_1 %i_1 
    %digit_1 = move %t_5
    %t_6 = sge %digit_1 48
    br %t_6 hex2int_lhs_then_1 hex2int_if_else_1

hex2int_lhs_then_1:
    %t_7 = sle %digit_1 57
    br %t_7 hex2int_if_then_1 hex2int_if_else_1

hex2int_if_then_1:
    %t_8 = mul %result_1 16
    %t_9 = add %t_8 %digit_1
    %t_10 = sub %t_9 48
    %result_1 = move %t_10
    jump hex2int_if_merge_1

hex2int_if_else_1:
    %t_11 = sge %digit_1 65
    br %t_11 hex2int_lhs_then_2 hex2int_if_else_2

hex2int_lhs_then_2:
    %t_12 = sle %digit_1 70
    br %t_12 hex2int_if_then_2 hex2int_if_else_2

hex2int_if_else_2:
    %t_13 = sge %digit_1 97
    br %t_13 hex2int_lhs_then_3 hex2int_if_else_3

hex2int_lhs_then_3:
    %t_14 = sle %digit_1 102
    br %t_14 hex2int_if_then_3 hex2int_if_else_3

hex2int_if_then_3:
    %t_15 = mul %result_1 16
    %t_16 = add %t_15 %digit_1
    %t_17 = sub %t_16 97
    %t_18 = add %t_17 10
    %result_1 = move %t_18
    jump hex2int_if_merge_2

hex2int_if_merge_2:
    jump hex2int_if_merge_3

hex2int_if_else_3:
    %t_19 = move 0
    %t_4 = move %t_19
    jump hex2int_exit_1

hex2int_exit_1:
    ret %t_4

hex2int_if_then_2:
    %t_20 = mul %result_1 16
    %t_21 = add %t_20 %digit_1
    %t_22 = sub %t_21 65
    %t_23 = add %t_22 10
    %result_1 = move %t_23
    jump hex2int_if_merge_3

hex2int_if_merge_3:
    jump hex2int_if_merge_1

hex2int_if_merge_1:
    jump hex2int_for_step_1

hex2int_for_step_1:
    %t_24 = move %i_1
    %i_1 = add %i_1 1
    jump hex2int_for_cond_1

}

define i64 @int2chr  {
int2chr_entry_1:
    %t_25 = sge %x_2 32
    br %t_25 int2chr_lhs_then_1 int2chr_if_merge_1

int2chr_lhs_then_1:
    %t_26 = sle %x_2 126
    br %t_26 int2chr_if_then_1 int2chr_if_merge_1

int2chr_if_merge_1:
    %t_27 = move @__str_const_1
    %t_28 = move %t_27
    jump int2chr_exit_1

int2chr_if_then_1:
    %t_29 = sub %x_2 32
    %t_30 = sub %x_2 32
    %t_31 = call string.substring @asciiTable_1 %t_29 %t_30 
    %t_32 = move %t_31
    %t_28 = move %t_32
    jump int2chr_exit_1

int2chr_exit_1:
    ret %t_28

}

define i64 @toStringHex  {
toStringHex_entry_1:
    %ret_1 = move @__str_const_2
    %i_2 = move 0
    %i_2 = move 28
    jump toStringHex_for_cond_1

toStringHex_for_cond_1:
    %t_33 = sge %i_2 0
    br %t_33 toStringHex_for_body_1 toStringHex_for_merge_1

toStringHex_for_body_1:
    %t_34 = shr %x_3 %i_2
    %t_35 = and %t_34 15
    %digit_2 = move %t_35
    %t_36 = slt %digit_2 10
    br %t_36 toStringHex_if_then_1 toStringHex_if_else_1

toStringHex_if_then_1:
    %t_37 = add 48 %digit_2
    %t_38 = call int2chr %t_37 
    %t_39 = call string.add %ret_1 %t_38 
    %ret_1 = move %t_39
    jump toStringHex_if_merge_1

toStringHex_if_else_1:
    %t_40 = add 65 %digit_2
    %t_41 = sub %t_40 10
    %t_42 = call int2chr %t_41 
    %t_43 = call string.add %ret_1 %t_42 
    %ret_1 = move %t_43
    jump toStringHex_if_merge_1

toStringHex_if_merge_1:
    jump toStringHex_for_step_1

toStringHex_for_step_1:
    %t_44 = sub %i_2 4
    %i_2 = move %t_44
    jump toStringHex_for_cond_1

toStringHex_for_merge_1:
    %t_45 = move %ret_1
    ret %t_45

}

define i64 @rotate_left  {
rotate_left_entry_1:
    %t_46 = seq %shift_1 1
    br %t_46 rotate_left_if_then_1 rotate_left_if_merge_1

rotate_left_if_then_1:
    %t_47 = and %x_4 2147483647
    %t_48 = shl %t_47 1
    %t_49 = shr %x_4 31
    %t_50 = and %t_49 1
    %t_51 = or %t_48 %t_50
    %t_52 = move %t_51
    %t_53 = move %t_52
    jump rotate_left_exit_1

rotate_left_if_merge_1:
    %t_54 = seq %shift_1 31
    br %t_54 rotate_left_if_then_2 rotate_left_if_merge_2

rotate_left_if_then_2:
    %t_55 = and %x_4 1
    %t_56 = shl %t_55 31
    %t_57 = shr %x_4 1
    %t_58 = and %t_57 2147483647
    %t_59 = or %t_56 %t_58
    %t_60 = move %t_59
    %t_53 = move %t_60
    jump rotate_left_exit_1

rotate_left_if_merge_2:
    %t_61 = sub 32 %shift_1
    %t_62 = shl 1 %t_61
    %t_63 = sub %t_62 1
    %t_64 = and %x_4 %t_63
    %t_65 = shl %t_64 %shift_1
    %t_66 = sub 32 %shift_1
    %t_67 = shr %x_4 %t_66
    %t_68 = shl 1 %shift_1
    %t_69 = sub %t_68 1
    %t_70 = and %t_67 %t_69
    %t_71 = or %t_65 %t_70
    %t_72 = move %t_71
    %t_53 = move %t_72
    jump rotate_left_exit_1

rotate_left_exit_1:
    ret %t_53

}

define i64 @add  {
add_entry_1:
    %t_73 = and %x_5 65535
    %t_74 = and %y_1 65535
    %t_75 = add %t_73 %t_74
    %low_1 = move %t_75
    %t_76 = shr %x_5 16
    %t_77 = and %t_76 65535
    %t_78 = shr %y_1 16
    %t_79 = and %t_78 65535
    %t_80 = add %t_77 %t_79
    %t_81 = shr %low_1 16
    %t_82 = add %t_80 %t_81
    %t_83 = and %t_82 65535
    %high_1 = move %t_83
    %t_84 = shl %high_1 16
    %t_85 = and %low_1 65535
    %t_86 = or %t_84 %t_85
    %t_87 = move %t_86
    ret %t_87

}

define i64 @lohi  {
lohi_entry_1:
    %t_88 = shl %hi_1 16
    %t_89 = or %lo_1 %t_88
    %t_90 = move %t_89
    ret %t_90

}

define i64 @sha1  {
sha1_entry_1:
    %t_91 = add %length_1 64
    %t_92 = sub %t_91 56
    %t_93 = div %t_92 64
    %t_94 = add %t_93 1
    %nChunk_1 = move %t_94
    %t_95 = sgt %nChunk_1 @MAXCHUNK_1
    br %t_95 sha1_if_then_1 sha1_if_merge_1

sha1_if_then_1:
    call println @__str_const_3 
    %t_96 = move 0
    %t_97 = move %t_96
    jump sha1_exit_1

sha1_if_merge_1:
    %i_3 = move 0
    %j_1 = move 0
    %i_3 = move 0
    jump sha1_for_cond_1

sha1_for_cond_1:
    %t_98 = slt %i_3 %nChunk_1
    br %t_98 sha1_for_body_1 sha1_for_merge_1

sha1_for_body_1:
    %j_1 = move 0
    jump sha1_for_cond_2

sha1_for_cond_2:
    %t_99 = slt %j_1 80
    br %t_99 sha1_for_body_2 sha1_for_merge_2

sha1_for_merge_2:
    jump sha1_for_step_1

sha1_for_step_1:
    %t_100 = move %i_3
    %i_3 = add %i_3 1
    jump sha1_for_cond_1

sha1_for_body_2:
    %t_101 = mul %i_3 8
    %t_102 = add %t_101 8
    %t_103 = add @chunks_1 %t_102
    %t_104 = load %t_103
    %t_105 = mul %j_1 8
    %t_106 = add %t_105 8
    %t_107 = add %t_104 %t_106
    store 0 %t_107
    jump sha1_for_step_2

sha1_for_step_2:
    %t_108 = move %j_1
    %j_1 = add %j_1 1
    jump sha1_for_cond_2

sha1_for_merge_1:
    %i_3 = move 0
    jump sha1_for_cond_3

sha1_for_cond_3:
    %t_109 = slt %i_3 %length_1
    br %t_109 sha1_for_body_3 sha1_for_merge_3

sha1_for_merge_3:
    %t_110 = div %i_3 64
    %t_111 = mul %t_110 8
    %t_112 = add %t_111 8
    %t_113 = add @chunks_1 %t_112
    %t_114 = mod %i_3 64
    %t_115 = div %t_114 4
    %t_116 = load %t_113
    %t_117 = mul %t_115 8
    %t_118 = add %t_117 8
    %t_119 = add %t_116 %t_118
    %t_120 = div %i_3 64
    %t_121 = mul %t_120 8
    %t_122 = add %t_121 8
    %t_123 = add @chunks_1 %t_122
    %t_124 = mod %i_3 64
    %t_125 = div %t_124 4
    %t_126 = load %t_123
    %t_127 = mul %t_125 8
    %t_128 = add %t_127 8
    %t_129 = add %t_126 %t_128
    %t_130 = mod %i_3 4
    %t_131 = sub 3 %t_130
    %t_132 = mul %t_131 8
    %t_133 = shl 128 %t_132
    %t_134 = load %t_129
    %t_135 = or %t_134 %t_133
    store %t_135 %t_119
    %t_136 = sub %nChunk_1 1
    %t_137 = mul %t_136 8
    %t_138 = add %t_137 8
    %t_139 = add @chunks_1 %t_138
    %t_140 = load %t_139
    %t_141 = mul 15 8
    %t_142 = add %t_141 8
    %t_143 = add %t_140 %t_142
    %t_144 = shl %length_1 3
    store %t_144 %t_143
    %t_145 = sub %nChunk_1 1
    %t_146 = mul %t_145 8
    %t_147 = add %t_146 8
    %t_148 = add @chunks_1 %t_147
    %t_149 = load %t_148
    %t_150 = mul 14 8
    %t_151 = add %t_150 8
    %t_152 = add %t_149 %t_151
    %t_153 = shr %length_1 29
    %t_154 = and %t_153 7
    store %t_154 %t_152
    %h0_1 = move 1732584193
    %t_155 = call lohi 43913 61389 
    %h1_1 = move %t_155
    %t_156 = call lohi 56574 39098 
    %h2_1 = move %t_156
    %h3_1 = move 271733878
    %t_157 = call lohi 57840 50130 
    %h4_1 = move %t_157
    %i_3 = move 0
    jump sha1_for_cond_4

sha1_for_cond_4:
    %t_158 = slt %i_3 %nChunk_1
    br %t_158 sha1_for_body_4 sha1_for_merge_4

sha1_for_body_4:
    %j_1 = move 16
    jump sha1_for_cond_5

sha1_for_cond_5:
    %t_159 = slt %j_1 80
    br %t_159 sha1_for_body_5 sha1_for_merge_5

sha1_for_merge_5:
    %a_1 = move %h0_1
    %b_1 = move %h1_1
    %c_1 = move %h2_1
    %d_1 = move %h3_1
    %e_1 = move %h4_1
    %j_1 = move 0
    jump sha1_for_cond_6

sha1_for_cond_6:
    %t_160 = slt %j_1 80
    br %t_160 sha1_for_body_6 sha1_for_merge_6

sha1_for_merge_6:
    %t_161 = call add %h0_1 %a_1 
    %h0_1 = move %t_161
    %t_162 = call add %h1_1 %b_1 
    %h1_1 = move %t_162
    %t_163 = call add %h2_1 %c_1 
    %h2_1 = move %t_163
    %t_164 = call add %h3_1 %d_1 
    %h3_1 = move %t_164
    %t_165 = call add %h4_1 %e_1 
    %h4_1 = move %t_165
    jump sha1_for_step_3

sha1_for_step_3:
    %t_166 = move %i_3
    %i_3 = add %i_3 1
    jump sha1_for_cond_4

sha1_for_body_6:
    %f_1 = move 0
    %k_1 = move 0
    %t_167 = slt %j_1 20
    br %t_167 sha1_if_then_2 sha1_if_else_1

sha1_if_else_1:
    %t_168 = slt %j_1 40
    br %t_168 sha1_if_then_3 sha1_if_else_2

sha1_if_else_2:
    %t_169 = slt %j_1 60
    br %t_169 sha1_if_then_4 sha1_if_else_3

sha1_if_else_3:
    %t_170 = xor %b_1 %c_1
    %t_171 = xor %t_170 %d_1
    %f_1 = move %t_171
    %t_172 = call lohi 49622 51810 
    %k_1 = move %t_172
    jump sha1_if_merge_2

sha1_if_then_4:
    %t_173 = and %b_1 %c_1
    %t_174 = and %b_1 %d_1
    %t_175 = or %t_173 %t_174
    %t_176 = and %c_1 %d_1
    %t_177 = or %t_175 %t_176
    %f_1 = move %t_177
    %t_178 = call lohi 48348 36635 
    %k_1 = move %t_178
    jump sha1_if_merge_2

sha1_if_merge_2:
    jump sha1_if_merge_3

sha1_if_then_3:
    %t_179 = xor %b_1 %c_1
    %t_180 = xor %t_179 %d_1
    %f_1 = move %t_180
    %k_1 = move 1859775393
    jump sha1_if_merge_3

sha1_if_merge_3:
    jump sha1_if_merge_4

sha1_if_then_2:
    %t_181 = and %b_1 %c_1
    %t_182 = not %b_1
    %t_183 = and %t_182 %d_1
    %t_184 = or %t_181 %t_183
    %f_1 = move %t_184
    %k_1 = move 1518500249
    jump sha1_if_merge_4

sha1_if_merge_4:
    %t_185 = call rotate_left %a_1 5 
    %t_186 = call add %t_185 %e_1 
    %t_187 = call add %f_1 %k_1 
    %t_188 = call add %t_186 %t_187 
    %t_189 = mul %i_3 8
    %t_190 = add %t_189 8
    %t_191 = add @chunks_1 %t_190
    %t_192 = load %t_191
    %t_193 = mul %j_1 8
    %t_194 = add %t_193 8
    %t_195 = add %t_192 %t_194
    %t_196 = load %t_195
    %t_197 = call add %t_188 %t_196 
    %temp_1 = move %t_197
    %e_1 = move %d_1
    %d_1 = move %c_1
    %t_198 = call rotate_left %b_1 30 
    %c_1 = move %t_198
    %b_1 = move %a_1
    %a_1 = move %temp_1
    jump sha1_for_step_4

sha1_for_step_4:
    %t_199 = move %j_1
    %j_1 = add %j_1 1
    jump sha1_for_cond_6

sha1_for_body_5:
    %t_200 = mul %i_3 8
    %t_201 = add %t_200 8
    %t_202 = add @chunks_1 %t_201
    %t_203 = load %t_202
    %t_204 = mul %j_1 8
    %t_205 = add %t_204 8
    %t_206 = add %t_203 %t_205
    %t_207 = mul %i_3 8
    %t_208 = add %t_207 8
    %t_209 = add @chunks_1 %t_208
    %t_210 = sub %j_1 3
    %t_211 = load %t_209
    %t_212 = mul %t_210 8
    %t_213 = add %t_212 8
    %t_214 = add %t_211 %t_213
    %t_215 = mul %i_3 8
    %t_216 = add %t_215 8
    %t_217 = add @chunks_1 %t_216
    %t_218 = sub %j_1 8
    %t_219 = load %t_217
    %t_220 = mul %t_218 8
    %t_221 = add %t_220 8
    %t_222 = add %t_219 %t_221
    %t_223 = load %t_214
    %t_224 = load %t_222
    %t_225 = xor %t_223 %t_224
    %t_226 = mul %i_3 8
    %t_227 = add %t_226 8
    %t_228 = add @chunks_1 %t_227
    %t_229 = sub %j_1 14
    %t_230 = load %t_228
    %t_231 = mul %t_229 8
    %t_232 = add %t_231 8
    %t_233 = add %t_230 %t_232
    %t_234 = load %t_233
    %t_235 = xor %t_225 %t_234
    %t_236 = mul %i_3 8
    %t_237 = add %t_236 8
    %t_238 = add @chunks_1 %t_237
    %t_239 = sub %j_1 16
    %t_240 = load %t_238
    %t_241 = mul %t_239 8
    %t_242 = add %t_241 8
    %t_243 = add %t_240 %t_242
    %t_244 = load %t_243
    %t_245 = xor %t_235 %t_244
    %t_246 = call rotate_left %t_245 1 
    store %t_246 %t_206
    jump sha1_for_step_5

sha1_for_step_5:
    %t_247 = move %j_1
    %j_1 = add %j_1 1
    jump sha1_for_cond_5

sha1_for_merge_4:
    %t_248 = mul 0 8
    %t_249 = add %t_248 8
    %t_250 = add @outputBuffer_1 %t_249
    store %h0_1 %t_250
    %t_251 = mul 1 8
    %t_252 = add %t_251 8
    %t_253 = add @outputBuffer_1 %t_252
    store %h1_1 %t_253
    %t_254 = mul 2 8
    %t_255 = add %t_254 8
    %t_256 = add @outputBuffer_1 %t_255
    store %h2_1 %t_256
    %t_257 = mul 3 8
    %t_258 = add %t_257 8
    %t_259 = add @outputBuffer_1 %t_258
    store %h3_1 %t_259
    %t_260 = mul 4 8
    %t_261 = add %t_260 8
    %t_262 = add @outputBuffer_1 %t_261
    store %h4_1 %t_262
    %t_263 = move @outputBuffer_1
    %t_97 = move %t_263
    jump sha1_exit_1

sha1_exit_1:
    ret %t_97

sha1_for_body_3:
    %t_264 = div %i_3 64
    %t_265 = mul %t_264 8
    %t_266 = add %t_265 8
    %t_267 = add @chunks_1 %t_266
    %t_268 = mod %i_3 64
    %t_269 = div %t_268 4
    %t_270 = load %t_267
    %t_271 = mul %t_269 8
    %t_272 = add %t_271 8
    %t_273 = add %t_270 %t_272
    %t_274 = div %i_3 64
    %t_275 = mul %t_274 8
    %t_276 = add %t_275 8
    %t_277 = add @chunks_1 %t_276
    %t_278 = mod %i_3 64
    %t_279 = div %t_278 4
    %t_280 = load %t_277
    %t_281 = mul %t_279 8
    %t_282 = add %t_281 8
    %t_283 = add %t_280 %t_282
    %t_284 = mul %i_3 8
    %t_285 = add %t_284 8
    %t_286 = add %input_1 %t_285
    %t_287 = mod %i_3 4
    %t_288 = sub 3 %t_287
    %t_289 = mul %t_288 8
    %t_290 = load %t_286
    %t_291 = shl %t_290 %t_289
    %t_292 = load %t_283
    %t_293 = or %t_292 %t_291
    store %t_293 %t_273
    jump sha1_for_step_6

sha1_for_step_6:
    %t_294 = move %i_3
    %i_3 = add %i_3 1
    jump sha1_for_cond_3

}

define void @computeSHA1  {
computeSHA1_entry_1:
    %i_4 = move 0
    %i_4 = move 0
    jump computeSHA1_for_cond_1

computeSHA1_for_cond_1:
    %t_295 = call string.length %input_2 
    %t_296 = slt %i_4 %t_295
    br %t_296 computeSHA1_for_body_1 computeSHA1_for_merge_1

computeSHA1_for_body_1:
    %t_297 = mul %i_4 8
    %t_298 = add %t_297 8
    %t_299 = add @inputBuffer_1 %t_298
    %t_300 = call string.ord %input_2 %i_4 
    store %t_300 %t_299
    jump computeSHA1_for_step_1

computeSHA1_for_step_1:
    %t_301 = move %i_4
    %i_4 = add %i_4 1
    jump computeSHA1_for_cond_1

computeSHA1_for_merge_1:
    %t_302 = call string.length %input_2 
    %t_303 = call sha1 @inputBuffer_1 %t_302 
    %result_2 = move %t_303
    %i_4 = move 0
    jump computeSHA1_for_cond_2

computeSHA1_for_cond_2:
    %t_304 = load %result_2
    %t_305 = slt %i_4 %t_304
    br %t_305 computeSHA1_for_body_2 computeSHA1_for_merge_2

computeSHA1_for_body_2:
    %t_306 = mul %i_4 8
    %t_307 = add %t_306 8
    %t_308 = add %result_2 %t_307
    %t_309 = load %t_308
    %t_310 = call toStringHex %t_309 
    call print %t_310 
    jump computeSHA1_for_step_2

computeSHA1_for_step_2:
    %t_311 = move %i_4
    %i_4 = add %i_4 1
    jump computeSHA1_for_cond_2

computeSHA1_for_merge_2:
    call println @__str_const_4 
    ret 

}

define i64 @nextLetter  {
nextLetter_entry_1:
    %t_312 = seq %now_1 122
    br %t_312 nextLetter_if_then_1 nextLetter_if_merge_1

nextLetter_if_merge_1:
    %t_313 = seq %now_1 90
    br %t_313 nextLetter_if_then_2 nextLetter_if_merge_2

nextLetter_if_then_2:
    %t_314 = move 97
    %t_315 = move %t_314
    jump nextLetter_exit_1

nextLetter_if_merge_2:
    %t_316 = seq %now_1 57
    br %t_316 nextLetter_if_then_3 nextLetter_if_merge_3

nextLetter_if_merge_3:
    %t_317 = add %now_1 1
    %t_318 = move %t_317
    %t_315 = move %t_318
    jump nextLetter_exit_1

nextLetter_if_then_3:
    %t_319 = move 65
    %t_315 = move %t_319
    jump nextLetter_exit_1

nextLetter_if_then_1:
    %t_320 = neg 1
    %t_321 = move %t_320
    %t_315 = move %t_321
    jump nextLetter_exit_1

nextLetter_exit_1:
    ret %t_315

}

define i64 @nextText  {
nextText_entry_1:
    %i_5 = move 0
    %t_322 = sub %length_2 1
    %i_5 = move %t_322
    jump nextText_for_cond_1

nextText_for_cond_1:
    %t_323 = sge %i_5 0
    br %t_323 nextText_for_body_1 nextText_for_merge_1

nextText_for_merge_1:
    jump nextText_elseBB_1

nextText_elseBB_1:
    %t_324 = move 0
    jump nextText_mergeBB_1

nextText_mergeBB_1:
    %t_325 = move %t_324
    jump nextText_exit_1

nextText_for_body_1:
    %t_326 = mul %i_5 8
    %t_327 = add %t_326 8
    %t_328 = add %now_2 %t_327
    %t_329 = mul %i_5 8
    %t_330 = add %t_329 8
    %t_331 = add %now_2 %t_330
    %t_332 = load %t_331
    %t_333 = call nextLetter %t_332 
    store %t_333 %t_328
    %t_334 = mul %i_5 8
    %t_335 = add %t_334 8
    %t_336 = add %now_2 %t_335
    %t_337 = neg 1
    %t_338 = load %t_336
    %t_339 = seq %t_338 %t_337
    br %t_339 nextText_if_then_1 nextText_if_else_1

nextText_if_else_1:
    jump nextText_thenBB_1

nextText_thenBB_1:
    %t_340 = move 1
    jump nextText_mergeBB_2

nextText_mergeBB_2:
    %t_325 = move %t_340
    jump nextText_exit_1

nextText_exit_1:
    ret %t_325

nextText_if_then_1:
    %t_341 = mul %i_5 8
    %t_342 = add %t_341 8
    %t_343 = add %now_2 %t_342
    store 48 %t_343
    jump nextText_if_merge_1

nextText_if_merge_1:
    jump nextText_for_step_1

nextText_for_step_1:
    %t_344 = move %i_5
    %i_5 = sub %i_5 1
    jump nextText_for_cond_1

}

define i64 @array_equal  {
array_equal_entry_1:
    %t_345 = load %a_2
    %t_346 = load %b_2
    %t_347 = sne %t_345 %t_346
    br %t_347 array_equal_if_then_1 array_equal_if_merge_1

array_equal_if_then_1:
    jump array_equal_elseBB_1

array_equal_elseBB_1:
    %t_348 = move 0
    jump array_equal_mergeBB_1

array_equal_mergeBB_1:
    %t_349 = move %t_348
    jump array_equal_exit_1

array_equal_if_merge_1:
    %i_6 = move 0
    %i_6 = move 0
    jump array_equal_for_cond_1

array_equal_for_cond_1:
    %t_350 = load %a_2
    %t_351 = slt %i_6 %t_350
    br %t_351 array_equal_for_body_1 array_equal_for_merge_1

array_equal_for_body_1:
    %t_352 = mul %i_6 8
    %t_353 = add %t_352 8
    %t_354 = add %a_2 %t_353
    %t_355 = mul %i_6 8
    %t_356 = add %t_355 8
    %t_357 = add %b_2 %t_356
    %t_358 = load %t_354
    %t_359 = load %t_357
    %t_360 = sne %t_358 %t_359
    br %t_360 array_equal_if_then_2 array_equal_if_merge_2

array_equal_if_then_2:
    jump array_equal_elseBB_2

array_equal_elseBB_2:
    %t_361 = move 0
    jump array_equal_mergeBB_2

array_equal_mergeBB_2:
    %t_349 = move %t_361
    jump array_equal_exit_1

array_equal_if_merge_2:
    jump array_equal_for_step_1

array_equal_for_step_1:
    %t_362 = move %i_6
    %i_6 = add %i_6 1
    jump array_equal_for_cond_1

array_equal_for_merge_1:
    jump array_equal_thenBB_1

array_equal_thenBB_1:
    %t_363 = move 1
    jump array_equal_mergeBB_3

array_equal_mergeBB_3:
    %t_349 = move %t_363
    jump array_equal_exit_1

array_equal_exit_1:
    ret %t_349

}

define void @crackSHA1  {
crackSHA1_entry_1:
    %t_364 = mul 5 8
    %t_364 = add %t_364 8
    %t_365 = alloc %t_364
    store 5 %t_365
    %target_1 = move %t_365
    %t_366 = call string.length %input_3 
    %t_367 = sne %t_366 40
    br %t_367 crackSHA1_if_then_1 crackSHA1_if_merge_1

crackSHA1_if_merge_1:
    %i_7 = move 0
    %i_7 = move 0
    jump crackSHA1_for_cond_1

crackSHA1_for_cond_1:
    %t_368 = slt %i_7 5
    br %t_368 crackSHA1_for_body_1 crackSHA1_for_merge_1

crackSHA1_for_body_1:
    %t_369 = mul %i_7 8
    %t_370 = add %t_369 8
    %t_371 = add %target_1 %t_370
    store 0 %t_371
    jump crackSHA1_for_step_1

crackSHA1_for_step_1:
    %t_372 = move %i_7
    %i_7 = add %i_7 1
    jump crackSHA1_for_cond_1

crackSHA1_for_merge_1:
    %i_7 = move 0
    jump crackSHA1_for_cond_2

crackSHA1_for_cond_2:
    %t_373 = slt %i_7 40
    br %t_373 crackSHA1_for_body_2 crackSHA1_for_merge_2

crackSHA1_for_body_2:
    %t_374 = div %i_7 8
    %t_375 = mul %t_374 8
    %t_376 = add %t_375 8
    %t_377 = add %target_1 %t_376
    %t_378 = div %i_7 8
    %t_379 = mul %t_378 8
    %t_380 = add %t_379 8
    %t_381 = add %target_1 %t_380
    %t_382 = add %i_7 3
    %t_383 = call string.substring %input_3 %i_7 %t_382 
    %t_384 = call hex2int %t_383 
    %t_385 = div %i_7 4
    %t_386 = mod %t_385 2
    %t_387 = sub 1 %t_386
    %t_388 = mul %t_387 16
    %t_389 = shl %t_384 %t_388
    %t_390 = load %t_381
    %t_391 = or %t_390 %t_389
    store %t_391 %t_377
    jump crackSHA1_for_step_2

crackSHA1_for_step_2:
    %t_392 = add %i_7 4
    %i_7 = move %t_392
    jump crackSHA1_for_cond_2

crackSHA1_for_merge_2:
    %MAXDIGIT_1 = move 4
    %digit_3 = move 0
    %digit_3 = move 1
    jump crackSHA1_for_cond_3

crackSHA1_for_cond_3:
    %t_393 = sle %digit_3 %MAXDIGIT_1
    br %t_393 crackSHA1_for_body_3 crackSHA1_for_merge_3

crackSHA1_for_merge_3:
    call println @__str_const_7 
    jump crackSHA1_exit_1

crackSHA1_for_body_3:
    %i_7 = move 0
    jump crackSHA1_for_cond_4

crackSHA1_for_cond_4:
    %t_394 = slt %i_7 %digit_3
    br %t_394 crackSHA1_for_body_4 crackSHA1_for_merge_4

crackSHA1_for_merge_4:
    jump crackSHA1_while_cond_1

crackSHA1_while_cond_1:
    jump crackSHA1_while_body_1

crackSHA1_while_body_1:
    %t_395 = call sha1 @inputBuffer_1 %digit_3 
    %out_1 = move %t_395
    %t_396 = call array_equal %out_1 %target_1 
    br %t_396 crackSHA1_if_then_2 crackSHA1_if_merge_2

crackSHA1_if_merge_2:
    %t_397 = call nextText @inputBuffer_1 %digit_3 
    br %t_397 crackSHA1_if_merge_3 crackSHA1_if_then_3

crackSHA1_if_merge_3:
    jump crackSHA1_while_cond_1

crackSHA1_if_then_3:
    jump crackSHA1_while_merge_1

crackSHA1_while_merge_1:
    jump crackSHA1_for_step_3

crackSHA1_for_step_3:
    %t_398 = move %digit_3
    %digit_3 = add %digit_3 1
    jump crackSHA1_for_cond_3

crackSHA1_if_then_2:
    %i_7 = move 0
    jump crackSHA1_for_cond_5

crackSHA1_for_cond_5:
    %t_399 = slt %i_7 %digit_3
    br %t_399 crackSHA1_for_body_5 crackSHA1_for_merge_5

crackSHA1_for_merge_5:
    call println @__str_const_6 
    jump crackSHA1_exit_1

crackSHA1_for_body_5:
    %t_400 = mul %i_7 8
    %t_401 = add %t_400 8
    %t_402 = add @inputBuffer_1 %t_401
    %t_403 = load %t_402
    %t_404 = call int2chr %t_403 
    call print %t_404 
    jump crackSHA1_for_step_4

crackSHA1_for_step_4:
    %t_405 = move %i_7
    %i_7 = add %i_7 1
    jump crackSHA1_for_cond_5

crackSHA1_for_body_4:
    %t_406 = mul %i_7 8
    %t_407 = add %t_406 8
    %t_408 = add @inputBuffer_1 %t_407
    store 48 %t_408
    jump crackSHA1_for_step_5

crackSHA1_for_step_5:
    %t_409 = move %i_7
    %i_7 = add %i_7 1
    jump crackSHA1_for_cond_4

crackSHA1_if_then_1:
    call println @__str_const_5 
    jump crackSHA1_exit_1

crackSHA1_exit_1:
    ret 

}

define i64 @main  {
main_entry_1:
    %op_1 = move 0
    %input_4 = move @__str_const_8
    jump main_while_cond_1

main_while_cond_1:
    jump main_while_body_1

main_while_body_1:
    %t_410 = call getInt 
    %op_1 = move %t_410
    %t_411 = seq %op_1 0
    br %t_411 main_if_then_1 main_if_merge_1

main_if_then_1:
    jump main_while_merge_1

main_while_merge_1:
    %t_412 = move 0
    ret %t_412

main_if_merge_1:
    %t_413 = seq %op_1 1
    br %t_413 main_if_then_2 main_if_else_1

main_if_then_2:
    %t_414 = call getString 
    %input_4 = move %t_414
    call computeSHA1 %input_4 
    jump main_if_merge_2

main_if_else_1:
    %t_415 = seq %op_1 2
    br %t_415 main_if_then_3 main_if_merge_3

main_if_then_3:
    %t_416 = call getString 
    %input_4 = move %t_416
    call crackSHA1 %input_4 
    jump main_if_merge_3

main_if_merge_3:
    jump main_if_merge_2

main_if_merge_2:
    jump main_while_cond_1

}

define i64 @__init  {
__init_entry_1:
    @asciiTable_1 = move @__str_const_9
    @MAXCHUNK_1 = move 100
    %t_417 = sub @MAXCHUNK_1 1
    %t_418 = mul %t_417 64
    %t_419 = sub %t_418 16
    @MAXLENGTH_1 = move %t_419
    %t_420 = mul @MAXCHUNK_1 8
    %t_420 = add %t_420 8
    %t_421 = alloc %t_420
    store @MAXCHUNK_1 %t_421
    %t_422 = add %t_421 8
    %t_423 = add %t_421 %t_420
    jump __init_for_cond_1

__init_for_cond_1:
    %t_424 = slt %t_422 %t_423
    br %t_424 __init_for_body_1 __init_for_merge_1

__init_for_body_1:
    %t_425 = mul 80 8
    %t_425 = add %t_425 8
    %t_426 = alloc %t_425
    store 80 %t_426
    store %t_426 %t_422
    jump __init_for_step_1

__init_for_step_1:
    %t_427 = add %t_422 8
    %t_422 = move %t_427
    jump __init_for_cond_1

__init_for_merge_1:
    @chunks_1 = move %t_421
    %t_428 = mul @MAXLENGTH_1 8
    %t_428 = add %t_428 8
    %t_429 = alloc %t_428
    store @MAXLENGTH_1 %t_429
    @inputBuffer_1 = move %t_429
    %t_430 = mul 5 8
    %t_430 = add %t_430 8
    %t_431 = alloc %t_430
    store 5 %t_431
    @outputBuffer_1 = move %t_431
    %t_432 = call main 
    %t_433 = move %t_432
    ret %t_433

}


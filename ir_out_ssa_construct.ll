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
    %t_1 = mul 2 8
    %t_2 = add %t_1 8
    %t_3 = alloc %t_2
    store 2 %t_3
    %t_4 = add %t_3 8
    %t_5 = add %t_3 %t_2
    jump A_Optimizer_for_cond_1

A_Optimizer_for_cond_1:
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
    %t_32 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_33 
    %t_34 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_35 
    %t_36 = phi A_Optimizer_entry_1 undef A_Optimizer_for_step_1 %t_37 
    %t_38 = phi A_Optimizer_entry_1 %t_4 A_Optimizer_for_step_1 %t_39 
    %t_40 = slt %t_38 %t_5
    br %t_40 A_Optimizer_for_body_1 A_Optimizer_for_merge_1

A_Optimizer_for_body_1:
    %t_41 = mul 2 8
    %t_42 = add %t_41 8
    %t_43 = alloc %t_42
    store 2 %t_43
    store %t_43 %t_38
    %t_44 = add %t_43 8
    %t_37 = add %t_43 %t_42
    jump A_Optimizer_for_cond_2

A_Optimizer_for_cond_2:
    %t_7 = phi A_Optimizer_for_body_1 %t_6 A_Optimizer_for_step_2 %t_45 
    %t_9 = phi A_Optimizer_for_body_1 %t_8 A_Optimizer_for_step_2 %t_46 
    %t_11 = phi A_Optimizer_for_body_1 %t_44 A_Optimizer_for_step_2 %t_47 
    %t_13 = phi A_Optimizer_for_body_1 %t_12 A_Optimizer_for_step_2 %t_48 
    %t_15 = phi A_Optimizer_for_body_1 %t_14 A_Optimizer_for_step_2 %t_49 
    %t_17 = phi A_Optimizer_for_body_1 %t_16 A_Optimizer_for_step_2 %t_50 
    %t_19 = phi A_Optimizer_for_body_1 %t_18 A_Optimizer_for_step_2 %t_51 
    %t_21 = phi A_Optimizer_for_body_1 %t_20 A_Optimizer_for_step_2 %t_52 
    %t_23 = phi A_Optimizer_for_body_1 %t_22 A_Optimizer_for_step_2 %t_53 
    %t_25 = phi A_Optimizer_for_body_1 %t_24 A_Optimizer_for_step_2 %t_54 
    %t_27 = phi A_Optimizer_for_body_1 %t_26 A_Optimizer_for_step_2 %t_55 
    %t_29 = phi A_Optimizer_for_body_1 %t_28 A_Optimizer_for_step_2 %t_56 
    %t_31 = phi A_Optimizer_for_body_1 %t_30 A_Optimizer_for_step_2 %t_57 
    %t_33 = phi A_Optimizer_for_body_1 %t_32 A_Optimizer_for_step_2 %t_58 
    %t_35 = phi A_Optimizer_for_body_1 %t_34 A_Optimizer_for_step_2 %t_59 
    %t_60 = slt %t_11 %t_37
    br %t_60 A_Optimizer_for_body_2 A_Optimizer_for_step_1

A_Optimizer_for_body_2:
    %t_61 = mul 2 8
    %t_62 = add %t_61 8
    %t_63 = alloc %t_62
    store 2 %t_63
    store %t_63 %t_11
    %t_64 = add %t_63 8
    %t_59 = add %t_63 %t_62
    jump A_Optimizer_for_cond_3

A_Optimizer_for_cond_3:
    %t_45 = phi A_Optimizer_for_body_2 %t_7 A_Optimizer_for_step_3 %t_65 
    %t_46 = phi A_Optimizer_for_body_2 %t_9 A_Optimizer_for_step_3 %t_66 
    %t_48 = phi A_Optimizer_for_body_2 %t_13 A_Optimizer_for_step_3 %t_67 
    %t_49 = phi A_Optimizer_for_body_2 %t_15 A_Optimizer_for_step_3 %t_68 
    %t_50 = phi A_Optimizer_for_body_2 %t_17 A_Optimizer_for_step_3 %t_69 
    %t_51 = phi A_Optimizer_for_body_2 %t_19 A_Optimizer_for_step_3 %t_70 
    %t_52 = phi A_Optimizer_for_body_2 %t_21 A_Optimizer_for_step_3 %t_71 
    %t_53 = phi A_Optimizer_for_body_2 %t_23 A_Optimizer_for_step_3 %t_72 
    %t_54 = phi A_Optimizer_for_body_2 %t_25 A_Optimizer_for_step_3 %t_73 
    %t_55 = phi A_Optimizer_for_body_2 %t_27 A_Optimizer_for_step_3 %t_74 
    %t_56 = phi A_Optimizer_for_body_2 %t_64 A_Optimizer_for_step_3 %t_75 
    %t_57 = phi A_Optimizer_for_body_2 %t_31 A_Optimizer_for_step_3 %t_76 
    %t_58 = phi A_Optimizer_for_body_2 %t_33 A_Optimizer_for_step_3 %t_77 
    %t_78 = slt %t_56 %t_59
    br %t_78 A_Optimizer_for_body_3 A_Optimizer_for_step_2

A_Optimizer_for_body_3:
    %t_79 = mul 2 8
    %t_80 = add %t_79 8
    %t_81 = alloc %t_80
    store 2 %t_81
    store %t_81 %t_56
    %t_82 = add %t_81 8
    %t_66 = add %t_81 %t_80
    jump A_Optimizer_for_cond_4

A_Optimizer_for_cond_4:
    %t_65 = phi A_Optimizer_for_body_3 %t_45 A_Optimizer_for_step_4 %t_83 
    %t_67 = phi A_Optimizer_for_body_3 %t_48 A_Optimizer_for_step_4 %t_84 
    %t_68 = phi A_Optimizer_for_body_3 %t_49 A_Optimizer_for_step_4 %t_85 
    %t_69 = phi A_Optimizer_for_body_3 %t_82 A_Optimizer_for_step_4 %t_86 
    %t_70 = phi A_Optimizer_for_body_3 %t_51 A_Optimizer_for_step_4 %t_87 
    %t_71 = phi A_Optimizer_for_body_3 %t_52 A_Optimizer_for_step_4 %t_88 
    %t_72 = phi A_Optimizer_for_body_3 %t_53 A_Optimizer_for_step_4 %t_89 
    %t_73 = phi A_Optimizer_for_body_3 %t_54 A_Optimizer_for_step_4 %t_90 
    %t_74 = phi A_Optimizer_for_body_3 %t_55 A_Optimizer_for_step_4 %t_91 
    %t_76 = phi A_Optimizer_for_body_3 %t_57 A_Optimizer_for_step_4 %t_92 
    %t_77 = phi A_Optimizer_for_body_3 %t_58 A_Optimizer_for_step_4 %t_93 
    %t_94 = slt %t_69 %t_66
    br %t_94 A_Optimizer_for_body_4 A_Optimizer_for_step_3

A_Optimizer_for_step_3:
    %t_95 = add %t_56 8
    %t_75 = move %t_95
    jump A_Optimizer_for_cond_3

A_Optimizer_for_body_4:
    %t_96 = mul 2 8
    %t_97 = add %t_96 8
    %t_98 = alloc %t_97
    store 2 %t_98
    store %t_98 %t_69
    %t_99 = add %t_98 8
    %t_89 = add %t_98 %t_97
    jump A_Optimizer_for_cond_5

A_Optimizer_for_cond_5:
    %t_83 = phi A_Optimizer_for_body_4 %t_65 A_Optimizer_for_step_5 %t_100 
    %t_84 = phi A_Optimizer_for_body_4 %t_67 A_Optimizer_for_step_5 %t_101 
    %t_85 = phi A_Optimizer_for_body_4 %t_68 A_Optimizer_for_step_5 %t_102 
    %t_87 = phi A_Optimizer_for_body_4 %t_70 A_Optimizer_for_step_5 %t_103 
    %t_88 = phi A_Optimizer_for_body_4 %t_71 A_Optimizer_for_step_5 %t_104 
    %t_90 = phi A_Optimizer_for_body_4 %t_73 A_Optimizer_for_step_5 %t_105 
    %t_91 = phi A_Optimizer_for_body_4 %t_74 A_Optimizer_for_step_5 %t_106 
    %t_92 = phi A_Optimizer_for_body_4 %t_76 A_Optimizer_for_step_5 %t_107 
    %t_93 = phi A_Optimizer_for_body_4 %t_99 A_Optimizer_for_step_5 %t_108 
    %t_109 = slt %t_93 %t_89
    br %t_109 A_Optimizer_for_body_5 A_Optimizer_for_step_4

A_Optimizer_for_body_5:
    %t_110 = mul 2 8
    %t_111 = add %t_110 8
    %t_112 = alloc %t_111
    store 2 %t_112
    store %t_112 %t_93
    %t_113 = add %t_112 8
    %t_107 = add %t_112 %t_111
    jump A_Optimizer_for_cond_6

A_Optimizer_for_cond_6:
    %t_100 = phi A_Optimizer_for_body_5 %t_83 A_Optimizer_for_step_6 %t_114 
    %t_101 = phi A_Optimizer_for_body_5 %t_84 A_Optimizer_for_step_6 %t_115 
    %t_102 = phi A_Optimizer_for_body_5 %t_85 A_Optimizer_for_step_6 %t_116 
    %t_103 = phi A_Optimizer_for_body_5 %t_113 A_Optimizer_for_step_6 %t_117 
    %t_104 = phi A_Optimizer_for_body_5 %t_88 A_Optimizer_for_step_6 %t_118 
    %t_105 = phi A_Optimizer_for_body_5 %t_90 A_Optimizer_for_step_6 %t_119 
    %t_106 = phi A_Optimizer_for_body_5 %t_91 A_Optimizer_for_step_6 %t_120 
    %t_121 = slt %t_103 %t_107
    br %t_121 A_Optimizer_for_body_6 A_Optimizer_for_step_5

A_Optimizer_for_step_5:
    %t_122 = add %t_93 8
    %t_108 = move %t_122
    jump A_Optimizer_for_cond_5

A_Optimizer_for_body_6:
    %t_123 = mul 2 8
    %t_124 = add %t_123 8
    %t_125 = alloc %t_124
    store 2 %t_125
    store %t_125 %t_103
    %t_126 = add %t_125 8
    %t_115 = add %t_125 %t_124
    jump A_Optimizer_for_cond_7

A_Optimizer_for_cond_7:
    %t_114 = phi A_Optimizer_for_body_6 %t_100 A_Optimizer_for_step_7 %t_127 
    %t_116 = phi A_Optimizer_for_body_6 %t_102 A_Optimizer_for_step_7 %t_128 
    %t_118 = phi A_Optimizer_for_body_6 %t_104 A_Optimizer_for_step_7 %t_129 
    %t_119 = phi A_Optimizer_for_body_6 %t_105 A_Optimizer_for_step_7 %t_130 
    %t_120 = phi A_Optimizer_for_body_6 %t_126 A_Optimizer_for_step_7 %t_131 
    %t_132 = slt %t_120 %t_115
    br %t_132 A_Optimizer_for_body_7 A_Optimizer_for_step_6

A_Optimizer_for_step_6:
    %t_133 = add %t_103 8
    %t_117 = move %t_133
    jump A_Optimizer_for_cond_6

A_Optimizer_for_body_7:
    %t_134 = mul 2 8
    %t_135 = add %t_134 8
    %t_136 = alloc %t_135
    store 2 %t_136
    store %t_136 %t_120
    %t_137 = add %t_136 8
    %t_128 = add %t_136 %t_135
    jump A_Optimizer_for_cond_8

A_Optimizer_for_cond_8:
    %t_127 = phi A_Optimizer_for_body_7 %t_114 A_Optimizer_for_step_8 %t_138 
    %t_129 = phi A_Optimizer_for_body_7 %t_118 A_Optimizer_for_step_8 %t_139 
    %t_130 = phi A_Optimizer_for_body_7 %t_137 A_Optimizer_for_step_8 %t_140 
    %t_141 = slt %t_130 %t_128
    br %t_141 A_Optimizer_for_body_8 A_Optimizer_for_step_7

A_Optimizer_for_step_7:
    %t_142 = add %t_120 8
    %t_131 = move %t_142
    jump A_Optimizer_for_cond_7

A_Optimizer_for_body_8:
    %t_143 = mul 2 8
    %t_144 = add %t_143 8
    %t_145 = alloc %t_144
    store 2 %t_145
    store %t_145 %t_130
    %t_146 = add %t_145 8
    %t_139 = add %t_145 %t_144
    jump A_Optimizer_for_cond_9

A_Optimizer_for_cond_9:
    %t_138 = phi A_Optimizer_for_body_8 %t_146 A_Optimizer_for_body_9 %t_147 
    %t_148 = slt %t_138 %t_139
    br %t_148 A_Optimizer_for_body_9 A_Optimizer_for_step_8

A_Optimizer_for_step_8:
    %t_149 = add %t_130 8
    %t_140 = move %t_149
    jump A_Optimizer_for_cond_8

A_Optimizer_for_body_9:
    %t_150 = mul 2 8
    %t_151 = add %t_150 8
    %t_152 = alloc %t_151
    store 2 %t_152
    store %t_152 %t_138
    %t_153 = add %t_138 8
    %t_147 = move %t_153
    jump A_Optimizer_for_cond_9

A_Optimizer_for_step_4:
    %t_154 = add %t_69 8
    %t_86 = move %t_154
    jump A_Optimizer_for_cond_4

A_Optimizer_for_step_2:
    %t_155 = add %t_11 8
    %t_47 = move %t_155
    jump A_Optimizer_for_cond_2

A_Optimizer_for_step_1:
    %t_156 = add %t_38 8
    %t_39 = move %t_156
    jump A_Optimizer_for_cond_1

A_Optimizer_for_merge_1:
    %arr_1 = move %t_3
    %sum_1 = move 0
    %i_1 = move 1
    jump A_Optimizer_for_cond_10

A_Optimizer_for_cond_10:
    %i_2 = phi A_Optimizer_for_merge_1 %i_1 A_Optimizer_for_body_10 %i_3 
    %sum_2 = phi A_Optimizer_for_merge_1 %sum_1 A_Optimizer_for_body_10 %sum_3 
    %t_157 = sle %i_2 1000
    br %t_157 A_Optimizer_for_body_10 A_Optimizer_for_merge_2

A_Optimizer_for_merge_2:
    %t_158 = call toString %sum_2 
    call println %t_158 
    %i_4 = move 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_cond_11:
    %i_5 = phi A_Optimizer_for_merge_2 %i_4 A_Optimizer_for_body_11 %i_6 
    %sum_4 = phi A_Optimizer_for_merge_2 %sum_2 A_Optimizer_for_body_11 %sum_5 
    %t_159 = sle %i_5 1000000
    br %t_159 A_Optimizer_for_body_11 A_Optimizer_for_merge_3

A_Optimizer_for_body_11:
    %t_160 = mod 9876 1234
    %t_161 = mul %t_160 2345
    %t_162 = mod %t_161 1234
    %t_163 = mul %t_162 2345
    %t_164 = mod %t_163 1234
    %t_165 = mul %t_164 2345
    %t_166 = mod %t_165 1234
    %t_167 = mul %t_166 2345
    %t_168 = mod %t_167 1234
    %t_169 = mul %t_168 2345
    %t_170 = mod %t_169 1234
    %t_171 = mul %t_170 2345
    %t_172 = mod %t_171 1234
    %t_173 = mul %t_172 2345
    %t_174 = mod %t_173 1234
    %t_175 = mul %t_174 2345
    %t_176 = mod %t_175 1234
    %t_177 = mul %t_176 2345
    %t_178 = mod %t_177 1234
    %t_179 = mul %t_178 2345
    %t_180 = mod %t_179 1234
    %t_181 = mul %t_180 2345
    %t_182 = mod %t_181 1234
    %t_183 = mul %t_182 2345
    %t_184 = mod %t_183 1234
    %t_185 = mul %t_184 2345
    %t_186 = mod %t_185 1234
    %t_187 = mul %t_186 2345
    %t_188 = mod %t_187 1234
    %t_189 = mul %t_188 2345
    %t_190 = mod %t_189 1234
    %t_191 = mul %t_190 2345
    %t_192 = mod %t_191 1234
    %t_193 = mul %t_192 2345
    %t_194 = mod %t_193 1234
    %t_195 = mul %t_194 2345
    %t_196 = mod %t_195 1234
    %t_197 = mul %t_196 2345
    %t_198 = mod %t_197 1234
    %t_199 = mul %t_198 2345
    %t_200 = mod %t_199 1234
    %t_201 = mul %t_200 2345
    %t_202 = mod %t_201 1234
    %t_203 = mul %t_202 2345
    %t_204 = mod %t_203 1234
    %t_205 = mul %t_204 2345
    %t_206 = mod %t_205 1234
    %t_207 = mul %t_206 2345
    %t_208 = mod %t_207 1234
    %t_209 = mul %t_208 2345
    %t_210 = mod %t_209 1234
    %t_211 = mul %t_210 2345
    %t_212 = mod %t_211 1234
    %t_213 = mul %t_212 2345
    %t_214 = mod %t_213 1234
    %t_215 = mul %t_214 2345
    %t_216 = mod %t_215 1234
    %t_217 = mul %t_216 2345
    %t_218 = mod %t_217 1234
    %t_219 = mul %t_218 2345
    %t_220 = mod %t_219 1234
    %t_221 = mul %t_220 2345
    %t_222 = mod %t_221 1234
    %t_223 = mul %t_222 2345
    %t_224 = mod %t_223 1234
    %t_225 = mul %t_224 2345
    %t_226 = mod %t_225 1234
    %t_227 = mul %t_226 2345
    %t_228 = mod %t_227 1234
    %t_229 = mul %t_228 2345
    %t_230 = mod %t_229 1234
    %t_231 = mul %t_230 2345
    %t_232 = mod %t_231 1234
    %t_233 = mul %t_232 2345
    %t_234 = mod %t_233 1234
    %t_235 = mul %t_234 2345
    %t_236 = mod %t_235 1234
    %t_237 = mul %t_236 2345
    %t_238 = mod %t_237 1234
    %t_239 = mul %t_238 2345
    %t_240 = mod %t_239 1234
    %t_241 = mul %t_240 2345
    %t_242 = mod %t_241 1234
    %t_243 = mul %t_242 2345
    %t_244 = mod %t_243 1234
    %t_245 = mul %t_244 2345
    %t_246 = mod %t_245 1234
    %t_247 = mul %t_246 2345
    %t_248 = mod %t_247 1234
    %t_249 = mul %t_248 2345
    %t_250 = mod %t_249 1234
    %t_251 = mul %t_250 2345
    %t_252 = mod %t_251 1234
    %t_253 = mul %t_252 2345
    %t_254 = mod %t_253 1234
    %t_255 = mul %t_254 2345
    %t_256 = mod %t_255 1234
    %t_257 = mul %t_256 2345
    %t_258 = mod %t_257 1234
    %t_259 = mul %t_258 2345
    %t_260 = mod %t_259 1234
    %t_261 = mul %t_260 2345
    %t_262 = mod %t_261 1234
    %t_263 = mul %t_262 2345
    %t_264 = mod %t_263 1234
    %t_265 = mul %t_264 2345
    %t_266 = mod %t_265 1234
    %t_267 = mul %t_266 2345
    %t_268 = mod %t_267 1234
    %t_269 = mul %t_268 2345
    %t_270 = mod %t_269 1234
    %t_271 = mul %t_270 2345
    %t_272 = mod %t_271 1234
    %t_273 = mul %t_272 2345
    %t_274 = mod %t_273 1234
    %t_275 = mul %t_274 2345
    %t_276 = mod %t_275 1234
    %t_277 = mul %t_276 2345
    %t_278 = mod %t_277 1234
    %t_279 = mul %t_278 2345
    %t_280 = mod %t_279 1234
    %t_281 = mul %t_280 2345
    %t_282 = mod %t_281 1234
    %t_283 = mul %t_282 2345
    %t_284 = mod %t_283 1234
    %t_285 = mul %t_284 2345
    %t_286 = mod %t_285 1234
    %t_287 = mul %t_286 2345
    %t_288 = mod %t_287 1234
    %t_289 = mul %t_288 2345
    %t_290 = mod %t_289 1234
    %t_291 = mul %t_290 2345
    %t_292 = mod %t_291 1234
    %t_293 = mul %t_292 2345
    %t_294 = mod %t_293 1234
    %t_295 = mul %t_294 2345
    %t_296 = mod %t_295 1234
    %t_297 = mul %t_296 2345
    %t_298 = mod %t_297 1234
    %t_299 = mul %t_298 2345
    %t_300 = mod %t_299 1234
    %t_301 = mul %t_300 2345
    %t_302 = mod %t_301 1234
    %t_303 = mul %t_302 2345
    %t_304 = mod %t_303 1234
    %t_305 = mul %t_304 2345
    %t_306 = mod %t_305 1234
    %t_307 = mul %t_306 2345
    %t_308 = mod %t_307 1234
    %t_309 = mul %t_308 2345
    %t_310 = mod %t_309 1234
    %t_311 = mul %t_310 2345
    %t_312 = mod %t_311 1234
    %t_313 = mul %t_312 2345
    %t_314 = mod %t_313 1234
    %t_315 = mul %t_314 2345
    %t_316 = mod %t_315 1234
    %t_317 = mul %t_316 2345
    %t_318 = mod %t_317 1234
    %t_319 = mul %t_318 2345
    %t_320 = mod %t_319 1234
    %t_321 = mul %t_320 2345
    %t_322 = mod %t_321 1234
    %t_323 = mul %t_322 2345
    %t_324 = mod %t_323 1234
    %t_325 = mul %t_324 2345
    %t_326 = mod %t_325 1234
    %t_327 = mul %t_326 2345
    %t_328 = mod %t_327 1234
    %t_329 = mul %t_328 2345
    %t_330 = mod %t_329 1234
    %t_331 = mul %t_330 2345
    %t_332 = mod %t_331 1234
    %t_333 = mul %t_332 2345
    %t_334 = mod %t_333 1234
    %t_335 = mul %t_334 2345
    %t_336 = mod %t_335 1234
    %t_337 = mul %t_336 2345
    %t_338 = mod %t_337 1234
    %t_339 = mul %t_338 2345
    %t_340 = mod %t_339 1234
    %t_341 = mod %t_340 11
    %t_342 = add %sum_4 %t_341
    %sum_5 = move %t_342
    %t_343 = move %i_5
    %i_6 = add %i_5 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_merge_3:
    %t_344 = call toString %sum_4 
    call println %t_344 
    %i_7 = move 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_cond_12:
    %i_8 = phi A_Optimizer_for_merge_3 %i_7 A_Optimizer_for_step_9 %i_9 
    %t_345 = sle %i_8 200000000
    br %t_345 A_Optimizer_for_step_9 A_Optimizer_for_merge_4

A_Optimizer_for_step_9:
    %t_346 = move %i_8
    %i_9 = add %i_8 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_merge_4:
    ret 

A_Optimizer_for_body_10:
    %t_347 = mul 0 8
    %t_348 = add %t_347 8
    %t_349 = add %arr_1 %t_348
    %t_350 = load %t_349
    %t_351 = mul 1 8
    %t_352 = add %t_351 8
    %t_353 = add %t_350 %t_352
    %t_354 = load %t_353
    %t_355 = mul 0 8
    %t_356 = add %t_355 8
    %t_357 = add %t_354 %t_356
    %t_358 = load %t_357
    %t_359 = mul 1 8
    %t_360 = add %t_359 8
    %t_361 = add %t_358 %t_360
    %t_362 = load %t_361
    %t_363 = mul 0 8
    %t_364 = add %t_363 8
    %t_365 = add %t_362 %t_364
    %t_366 = load %t_365
    %t_367 = mul 1 8
    %t_368 = add %t_367 8
    %t_369 = add %t_366 %t_368
    %t_370 = load %t_369
    %t_371 = mul 0 8
    %t_372 = add %t_371 8
    %t_373 = add %t_370 %t_372
    %t_374 = load %t_373
    %t_375 = mul 1 8
    %t_376 = add %t_375 8
    %t_377 = add %t_374 %t_376
    %t_378 = load %t_377
    %t_379 = mul 0 8
    %t_380 = add %t_379 8
    %t_381 = add %t_378 %t_380
    %t_382 = load %t_381
    %t_383 = mul 1 8
    %t_384 = add %t_383 8
    %t_385 = add %t_382 %t_384
    %t_386 = add 123 %i_2
    store %t_386 %t_385
    %t_387 = mul 0 8
    %t_388 = add %t_387 8
    %t_389 = add %arr_1 %t_388
    %t_390 = load %t_389
    %t_391 = mul 1 8
    %t_392 = add %t_391 8
    %t_393 = add %t_390 %t_392
    %t_394 = load %t_393
    %t_395 = mul 0 8
    %t_396 = add %t_395 8
    %t_397 = add %t_394 %t_396
    %t_398 = load %t_397
    %t_399 = mul 1 8
    %t_400 = add %t_399 8
    %t_401 = add %t_398 %t_400
    %t_402 = load %t_401
    %t_403 = mul 0 8
    %t_404 = add %t_403 8
    %t_405 = add %t_402 %t_404
    %t_406 = load %t_405
    %t_407 = mul 1 8
    %t_408 = add %t_407 8
    %t_409 = add %t_406 %t_408
    %t_410 = load %t_409
    %t_411 = mul 0 8
    %t_412 = add %t_411 8
    %t_413 = add %t_410 %t_412
    %t_414 = load %t_413
    %t_415 = mul 1 8
    %t_416 = add %t_415 8
    %t_417 = add %t_414 %t_416
    %t_418 = load %t_417
    %t_419 = mul 0 8
    %t_420 = add %t_419 8
    %t_421 = add %t_418 %t_420
    %t_422 = load %t_421
    %t_423 = mul 1 8
    %t_424 = add %t_423 8
    %t_425 = add %t_422 %t_424
    %t_426 = load %t_425
    %t_427 = add %sum_2 %t_426
    %sum_3 = move %t_427
    %t_428 = move %i_2
    %i_3 = add %i_2 1
    jump A_Optimizer_for_cond_10

}

define i64 @A_A  {
A_A_entry_1:
    %t_429 = add %this_1 0
    %t_430 = mul 2 8
    %t_431 = add %t_430 8
    %t_432 = alloc %t_431
    store 2 %t_432
    %t_433 = add %t_432 8
    %t_434 = add %t_432 %t_431
    jump A_A_for_cond_1

A_A_for_cond_1:
    %t_435 = phi A_A_entry_1 undef A_A_for_step_1 %t_436 
    %t_437 = phi A_A_entry_1 undef A_A_for_step_1 %t_438 
    %t_439 = phi A_A_entry_1 undef A_A_for_step_1 %t_440 
    %t_441 = phi A_A_entry_1 undef A_A_for_step_1 %t_442 
    %t_443 = phi A_A_entry_1 undef A_A_for_step_1 %t_444 
    %t_445 = phi A_A_entry_1 undef A_A_for_step_1 %t_446 
    %t_447 = phi A_A_entry_1 %t_433 A_A_for_step_1 %t_448 
    %t_449 = phi A_A_entry_1 undef A_A_for_step_1 %t_450 
    %t_451 = phi A_A_entry_1 undef A_A_for_step_1 %t_452 
    %t_453 = phi A_A_entry_1 undef A_A_for_step_1 %t_454 
    %t_455 = phi A_A_entry_1 undef A_A_for_step_1 %t_456 
    %t_457 = phi A_A_entry_1 undef A_A_for_step_1 %t_458 
    %t_459 = phi A_A_entry_1 undef A_A_for_step_1 %t_460 
    %t_461 = phi A_A_entry_1 undef A_A_for_step_1 %t_462 
    %t_463 = phi A_A_entry_1 undef A_A_for_step_1 %t_464 
    %t_465 = phi A_A_entry_1 undef A_A_for_step_1 %t_466 
    %t_467 = phi A_A_entry_1 undef A_A_for_step_1 %t_468 
    %t_469 = slt %t_447 %t_434
    br %t_469 A_A_for_body_1 A_A_for_merge_1

A_A_for_merge_1:
    store %t_432 %t_429
    ret 0

A_A_for_body_1:
    %t_470 = mul 2 8
    %t_471 = add %t_470 8
    %t_472 = alloc %t_471
    store 2 %t_472
    store %t_472 %t_447
    %t_473 = add %t_472 8
    %t_458 = add %t_472 %t_471
    jump A_A_for_cond_2

A_A_for_cond_2:
    %t_436 = phi A_A_for_body_1 %t_435 A_A_for_step_2 %t_474 
    %t_438 = phi A_A_for_body_1 %t_437 A_A_for_step_2 %t_475 
    %t_440 = phi A_A_for_body_1 %t_439 A_A_for_step_2 %t_476 
    %t_442 = phi A_A_for_body_1 %t_441 A_A_for_step_2 %t_477 
    %t_444 = phi A_A_for_body_1 %t_443 A_A_for_step_2 %t_478 
    %t_446 = phi A_A_for_body_1 %t_445 A_A_for_step_2 %t_479 
    %t_450 = phi A_A_for_body_1 %t_449 A_A_for_step_2 %t_480 
    %t_452 = phi A_A_for_body_1 %t_451 A_A_for_step_2 %t_481 
    %t_454 = phi A_A_for_body_1 %t_453 A_A_for_step_2 %t_482 
    %t_456 = phi A_A_for_body_1 %t_455 A_A_for_step_2 %t_483 
    %t_460 = phi A_A_for_body_1 %t_459 A_A_for_step_2 %t_484 
    %t_462 = phi A_A_for_body_1 %t_461 A_A_for_step_2 %t_485 
    %t_464 = phi A_A_for_body_1 %t_473 A_A_for_step_2 %t_486 
    %t_466 = phi A_A_for_body_1 %t_465 A_A_for_step_2 %t_487 
    %t_468 = phi A_A_for_body_1 %t_467 A_A_for_step_2 %t_488 
    %t_489 = slt %t_464 %t_458
    br %t_489 A_A_for_body_2 A_A_for_step_1

A_A_for_body_2:
    %t_490 = mul 3 8
    %t_491 = add %t_490 8
    %t_492 = alloc %t_491
    store 3 %t_492
    store %t_492 %t_464
    %t_493 = add %t_492 8
    %t_487 = add %t_492 %t_491
    jump A_A_for_cond_3

A_A_for_cond_3:
    %t_474 = phi A_A_for_body_2 %t_436 A_A_for_step_3 %t_494 
    %t_475 = phi A_A_for_body_2 %t_438 A_A_for_step_3 %t_495 
    %t_476 = phi A_A_for_body_2 %t_440 A_A_for_step_3 %t_496 
    %t_477 = phi A_A_for_body_2 %t_493 A_A_for_step_3 %t_497 
    %t_478 = phi A_A_for_body_2 %t_444 A_A_for_step_3 %t_498 
    %t_479 = phi A_A_for_body_2 %t_446 A_A_for_step_3 %t_499 
    %t_480 = phi A_A_for_body_2 %t_450 A_A_for_step_3 %t_500 
    %t_481 = phi A_A_for_body_2 %t_452 A_A_for_step_3 %t_501 
    %t_482 = phi A_A_for_body_2 %t_454 A_A_for_step_3 %t_502 
    %t_483 = phi A_A_for_body_2 %t_456 A_A_for_step_3 %t_503 
    %t_484 = phi A_A_for_body_2 %t_460 A_A_for_step_3 %t_504 
    %t_485 = phi A_A_for_body_2 %t_462 A_A_for_step_3 %t_505 
    %t_488 = phi A_A_for_body_2 %t_468 A_A_for_step_3 %t_506 
    %t_507 = slt %t_477 %t_487
    br %t_507 A_A_for_body_3 A_A_for_step_2

A_A_for_body_3:
    %t_508 = mul 2 8
    %t_509 = add %t_508 8
    %t_510 = alloc %t_509
    store 2 %t_510
    store %t_510 %t_477
    %t_511 = add %t_510 8
    %t_503 = add %t_510 %t_509
    jump A_A_for_cond_4

A_A_for_cond_4:
    %t_494 = phi A_A_for_body_3 %t_474 A_A_for_step_4 %t_512 
    %t_495 = phi A_A_for_body_3 %t_475 A_A_for_step_4 %t_513 
    %t_496 = phi A_A_for_body_3 %t_476 A_A_for_step_4 %t_514 
    %t_498 = phi A_A_for_body_3 %t_478 A_A_for_step_4 %t_515 
    %t_499 = phi A_A_for_body_3 %t_479 A_A_for_step_4 %t_516 
    %t_500 = phi A_A_for_body_3 %t_480 A_A_for_step_4 %t_517 
    %t_501 = phi A_A_for_body_3 %t_481 A_A_for_step_4 %t_518 
    %t_502 = phi A_A_for_body_3 %t_482 A_A_for_step_4 %t_519 
    %t_504 = phi A_A_for_body_3 %t_511 A_A_for_step_4 %t_520 
    %t_505 = phi A_A_for_body_3 %t_485 A_A_for_step_4 %t_521 
    %t_506 = phi A_A_for_body_3 %t_488 A_A_for_step_4 %t_522 
    %t_523 = slt %t_504 %t_503
    br %t_523 A_A_for_body_4 A_A_for_step_3

A_A_for_step_3:
    %t_524 = add %t_477 8
    %t_497 = move %t_524
    jump A_A_for_cond_3

A_A_for_body_4:
    %t_525 = mul 3 8
    %t_526 = add %t_525 8
    %t_527 = alloc %t_526
    store 3 %t_527
    store %t_527 %t_504
    %t_528 = add %t_527 8
    %t_521 = add %t_527 %t_526
    jump A_A_for_cond_5

A_A_for_cond_5:
    %t_512 = phi A_A_for_body_4 %t_494 A_A_for_step_5 %t_529 
    %t_513 = phi A_A_for_body_4 %t_495 A_A_for_step_5 %t_530 
    %t_514 = phi A_A_for_body_4 %t_496 A_A_for_step_5 %t_531 
    %t_515 = phi A_A_for_body_4 %t_498 A_A_for_step_5 %t_532 
    %t_516 = phi A_A_for_body_4 %t_499 A_A_for_step_5 %t_533 
    %t_517 = phi A_A_for_body_4 %t_500 A_A_for_step_5 %t_534 
    %t_518 = phi A_A_for_body_4 %t_501 A_A_for_step_5 %t_535 
    %t_519 = phi A_A_for_body_4 %t_528 A_A_for_step_5 %t_536 
    %t_522 = phi A_A_for_body_4 %t_506 A_A_for_step_5 %t_537 
    %t_538 = slt %t_519 %t_521
    br %t_538 A_A_for_body_5 A_A_for_step_4

A_A_for_step_4:
    %t_539 = add %t_504 8
    %t_520 = move %t_539
    jump A_A_for_cond_4

A_A_for_body_5:
    %t_540 = mul 2 8
    %t_541 = add %t_540 8
    %t_542 = alloc %t_541
    store 2 %t_542
    store %t_542 %t_519
    %t_543 = add %t_542 8
    %t_535 = add %t_542 %t_541
    jump A_A_for_cond_6

A_A_for_cond_6:
    %t_529 = phi A_A_for_body_5 %t_512 A_A_for_step_6 %t_544 
    %t_530 = phi A_A_for_body_5 %t_513 A_A_for_step_6 %t_545 
    %t_531 = phi A_A_for_body_5 %t_514 A_A_for_step_6 %t_546 
    %t_532 = phi A_A_for_body_5 %t_515 A_A_for_step_6 %t_547 
    %t_533 = phi A_A_for_body_5 %t_543 A_A_for_step_6 %t_548 
    %t_534 = phi A_A_for_body_5 %t_517 A_A_for_step_6 %t_549 
    %t_537 = phi A_A_for_body_5 %t_522 A_A_for_step_6 %t_550 
    %t_551 = slt %t_533 %t_535
    br %t_551 A_A_for_body_6 A_A_for_step_5

A_A_for_step_5:
    %t_552 = add %t_519 8
    %t_536 = move %t_552
    jump A_A_for_cond_5

A_A_for_body_6:
    %t_553 = mul 2 8
    %t_554 = add %t_553 8
    %t_555 = alloc %t_554
    store 2 %t_555
    store %t_555 %t_533
    %t_556 = add %t_555 8
    %t_550 = add %t_555 %t_554
    jump A_A_for_cond_7

A_A_for_cond_7:
    %t_544 = phi A_A_for_body_6 %t_529 A_A_for_step_7 %t_557 
    %t_545 = phi A_A_for_body_6 %t_530 A_A_for_step_7 %t_558 
    %t_546 = phi A_A_for_body_6 %t_531 A_A_for_step_7 %t_559 
    %t_547 = phi A_A_for_body_6 %t_532 A_A_for_step_7 %t_560 
    %t_549 = phi A_A_for_body_6 %t_556 A_A_for_step_7 %t_561 
    %t_562 = slt %t_549 %t_550
    br %t_562 A_A_for_body_7 A_A_for_step_6

A_A_for_step_6:
    %t_563 = add %t_533 8
    %t_548 = move %t_563
    jump A_A_for_cond_6

A_A_for_body_7:
    %t_564 = mul 3 8
    %t_565 = add %t_564 8
    %t_566 = alloc %t_565
    store 3 %t_566
    store %t_566 %t_549
    %t_567 = add %t_566 8
    %t_557 = add %t_566 %t_565
    jump A_A_for_cond_8

A_A_for_cond_8:
    %t_558 = phi A_A_for_body_7 %t_567 A_A_for_step_8 %t_568 
    %t_559 = phi A_A_for_body_7 %t_546 A_A_for_step_8 %t_569 
    %t_560 = phi A_A_for_body_7 %t_547 A_A_for_step_8 %t_570 
    %t_571 = slt %t_558 %t_557
    br %t_571 A_A_for_body_8 A_A_for_step_7

A_A_for_body_8:
    %t_572 = mul 2 8
    %t_573 = add %t_572 8
    %t_574 = alloc %t_573
    store 2 %t_574
    store %t_574 %t_558
    %t_575 = add %t_574 8
    %t_570 = add %t_574 %t_573
    jump A_A_for_cond_9

A_A_for_cond_9:
    %t_569 = phi A_A_for_body_8 %t_575 A_A_for_body_9 %t_576 
    %t_577 = slt %t_569 %t_570
    br %t_577 A_A_for_body_9 A_A_for_step_8

A_A_for_step_8:
    %t_578 = add %t_558 8
    %t_568 = move %t_578
    jump A_A_for_cond_8

A_A_for_body_9:
    %t_579 = mul 2 8
    %t_580 = add %t_579 8
    %t_581 = alloc %t_580
    store 2 %t_581
    store %t_581 %t_569
    %t_582 = add %t_569 8
    %t_576 = move %t_582
    jump A_A_for_cond_9

A_A_for_step_7:
    %t_583 = add %t_549 8
    %t_561 = move %t_583
    jump A_A_for_cond_7

A_A_for_step_2:
    %t_584 = add %t_464 8
    %t_486 = move %t_584
    jump A_A_for_cond_2

A_A_for_step_1:
    %t_585 = add %t_447 8
    %t_448 = move %t_585
    jump A_A_for_cond_1

}

define i64 @quicksort  {
quicksort_entry_1:
    %a_left_2 = load @a_left_1
    %a_right_2 = load @a_right_1
    %a_2 = load @a_1
    %sum_6 = move 0
    %t_586 = mul %l_1 8
    %t_587 = add %t_586 8
    %t_588 = add %a_2 %t_587
    %t_589 = load %t_588
    %x_1 = move %t_589
    %z_l_1 = move 0
    %z_r_1 = move 0
    %t_590 = add %l_1 1
    %i_10 = move %t_590
    jump quicksort_for_cond_1

quicksort_for_cond_1:
    %sum_7 = phi quicksort_entry_1 %sum_6 quicksort_for_step_1 %sum_8 
    %i_11 = phi quicksort_entry_1 %i_10 quicksort_for_step_1 %i_12 
    %z_r_2 = phi quicksort_entry_1 %z_r_1 quicksort_for_step_1 %z_r_3 
    %z_l_2 = phi quicksort_entry_1 %z_l_1 quicksort_for_step_1 %z_l_3 
    %t_591 = slt %i_11 %r_1
    br %t_591 quicksort_for_body_1 quicksort_for_merge_1

quicksort_for_body_1:
    %t_592 = move %sum_7
    %sum_8 = add %sum_7 1
    %t_593 = mul %i_11 8
    %t_594 = add %t_593 8
    %t_595 = add %a_2 %t_594
    %t_596 = load %t_595
    %t_597 = slt %t_596 %x_1
    br %t_597 quicksort_if_then_1 quicksort_if_else_1

quicksort_if_else_1:
    %t_598 = move %z_r_2
    %z_r_4 = add %z_r_2 1
    %t_599 = mul %t_598 8
    %t_600 = add %t_599 8
    %t_601 = add %a_right_2 %t_600
    %t_602 = mul %i_11 8
    %t_603 = add %t_602 8
    %t_604 = add %a_2 %t_603
    %t_605 = load %t_604
    store %t_605 %t_601
    jump quicksort_for_step_1

quicksort_if_then_1:
    %t_606 = move %z_l_2
    %z_l_4 = add %z_l_2 1
    %t_607 = mul %t_606 8
    %t_608 = add %t_607 8
    %t_609 = add %a_left_2 %t_608
    %t_610 = mul %i_11 8
    %t_611 = add %t_610 8
    %t_612 = add %a_2 %t_611
    %t_613 = load %t_612
    store %t_613 %t_609
    jump quicksort_for_step_1

quicksort_for_step_1:
    %z_r_3 = phi quicksort_if_then_1 %z_r_2 quicksort_if_else_1 %z_r_4 
    %z_l_3 = phi quicksort_if_then_1 %z_l_4 quicksort_if_else_1 %z_l_2 
    %t_614 = move %i_11
    %i_12 = add %i_11 1
    jump quicksort_for_cond_1

quicksort_for_merge_1:
    %p_1 = move %l_1
    %i_13 = move 0
    jump quicksort_for_cond_2

quicksort_for_cond_2:
    %p_2 = phi quicksort_for_merge_1 %p_1 quicksort_for_body_2 %p_3 
    %i_14 = phi quicksort_for_merge_1 %i_13 quicksort_for_body_2 %i_15 
    %t_615 = slt %i_14 %z_l_2
    br %t_615 quicksort_for_body_2 quicksort_for_merge_2

quicksort_for_merge_2:
    %t_616 = move %p_2
    %p_4 = add %p_2 1
    %t_617 = mul %t_616 8
    %t_618 = add %t_617 8
    %t_619 = add %a_2 %t_618
    store %x_1 %t_619
    %i_16 = move 0
    jump quicksort_for_cond_3

quicksort_for_cond_3:
    %p_5 = phi quicksort_for_merge_2 %p_4 quicksort_for_body_3 %p_6 
    %i_17 = phi quicksort_for_merge_2 %i_16 quicksort_for_body_3 %i_18 
    %t_620 = slt %i_17 %z_r_2
    br %t_620 quicksort_for_body_3 quicksort_for_merge_3

quicksort_for_body_3:
    %t_621 = move %p_5
    %p_6 = add %p_5 1
    %t_622 = mul %t_621 8
    %t_623 = add %t_622 8
    %t_624 = add %a_2 %t_623
    %t_625 = mul %i_17 8
    %t_626 = add %t_625 8
    %t_627 = add %a_right_2 %t_626
    %t_628 = load %t_627
    store %t_628 %t_624
    %t_629 = move %i_17
    %i_18 = add %i_17 1
    jump quicksort_for_cond_3

quicksort_for_merge_3:
    %t_630 = sgt %z_l_2 1
    br %t_630 quicksort_if_then_2 quicksort_if_merge_1

quicksort_if_then_2:
    %t_631 = add %l_1 %z_l_2
    %t_632 = call quicksort %l_1 %t_631 
    %t_633 = add %sum_7 %t_632
    %sum_9 = move %t_633
    jump quicksort_if_merge_1

quicksort_if_merge_1:
    %sum_10 = phi quicksort_for_merge_3 %sum_7 quicksort_if_then_2 %sum_9 
    %t_634 = sgt %z_r_2 1
    br %t_634 quicksort_if_then_3 quicksort_if_merge_2

quicksort_if_then_3:
    %t_635 = sub %r_1 %z_r_2
    %t_636 = call quicksort %t_635 %r_1 
    %t_637 = add %sum_10 %t_636
    %sum_11 = move %t_637
    jump quicksort_if_merge_2

quicksort_if_merge_2:
    %sum_12 = phi quicksort_if_merge_1 %sum_10 quicksort_if_then_3 %sum_11 
    %t_638 = move %sum_12
    ret %t_638

quicksort_for_body_2:
    %t_639 = move %p_2
    %p_3 = add %p_2 1
    %t_640 = mul %t_639 8
    %t_641 = add %t_640 8
    %t_642 = add %a_2 %t_641
    %t_643 = mul %i_14 8
    %t_644 = add %t_643 8
    %t_645 = add %a_left_2 %t_644
    %t_646 = load %t_645
    store %t_646 %t_642
    %t_647 = move %i_14
    %i_15 = add %i_14 1
    jump quicksort_for_cond_2

}

define i64 @calc  {
calc_entry_1:
    %a_left_3 = load @a_left_1
    %a_right_3 = load @a_right_1
    %a_3 = load @a_1
    %n_2 = load @n_1
    %i_19 = move 1
    jump calc_for_cond_1

calc_for_cond_1:
    %i_20 = phi calc_entry_1 %i_19 calc_for_body_1 %i_21 
    %t_648 = sle %i_20 %n_2
    br %t_648 calc_for_body_1 calc_for_merge_1

calc_for_merge_1:
    %sum_13 = move 0
    %i_22 = move %n_2
    jump calc_for_cond_2

calc_for_cond_2:
    %sum_14 = phi calc_for_merge_1 %sum_13 calc_for_body_2 %sum_15 
    %i_23 = phi calc_for_merge_1 %i_22 calc_for_body_2 %i_24 
    %t_649 = sge %i_23 1
    br %t_649 calc_for_body_2 calc_for_merge_2

calc_for_merge_2:
    %t_650 = move %sum_14
    ret %t_650

calc_for_body_2:
    %t_651 = mul %i_23 8
    %t_652 = add %t_651 8
    %t_653 = add %a_3 %t_652
    %t_654 = load %t_653
    %t_655 = mul %t_654 8
    %t_656 = add %t_655 8
    %t_657 = add %a_left_3 %t_656
    %t_658 = load %t_657
    %l_2 = move %t_658
    %t_659 = mul %i_23 8
    %t_660 = add %t_659 8
    %t_661 = add %a_3 %t_660
    %t_662 = load %t_661
    %t_663 = mul %t_662 8
    %t_664 = add %t_663 8
    %t_665 = add %a_right_3 %t_664
    %t_666 = load %t_665
    %r_2 = move %t_666
    %t_667 = mul %l_2 8
    %t_668 = add %t_667 8
    %t_669 = add %a_right_3 %t_668
    store %r_2 %t_669
    %t_670 = mul %r_2 8
    %t_671 = add %t_670 8
    %t_672 = add %a_left_3 %t_671
    store %l_2 %t_672
    %t_673 = add %sum_14 %r_2
    %t_674 = sub %t_673 %l_2
    %t_675 = sub %t_674 2
    %sum_15 = move %t_675
    %t_676 = move %i_23
    %i_24 = sub %i_23 1
    jump calc_for_cond_2

calc_for_body_1:
    %t_677 = mul %i_20 8
    %t_678 = add %t_677 8
    %t_679 = add %a_left_3 %t_678
    %t_680 = sub %i_20 1
    store %t_680 %t_679
    %t_681 = mul %i_20 8
    %t_682 = add %t_681 8
    %t_683 = add %a_right_3 %t_682
    %t_684 = add %i_20 1
    store %t_684 %t_683
    %t_685 = move %i_20
    %i_21 = add %i_20 1
    jump calc_for_cond_1

}

define i64 @mergesort  {
mergesort_entry_1:
    %a_left_4 = load @a_left_1
    %a_4 = load @a_1
    %a_right_4 = load @a_right_1
    %t_686 = add %l_3 1
    %t_687 = seq %t_686 %r_3
    br %t_687 mergesort_if_then_1 mergesort_if_merge_1

mergesort_if_then_1:
    %t_688 = move 0
    %t_689 = move %t_688
    jump mergesort_exit_1

mergesort_if_merge_1:
    %t_690 = add %l_3 %r_3
    %t_691 = shr %t_690 1
    %mid_1 = move %t_691
    %sum_16 = move 0
    %t_692 = call mergesort %l_3 %mid_1 
    %t_693 = add %sum_16 %t_692
    %sum_17 = move %t_693
    %t_694 = call mergesort %mid_1 %r_3 
    %t_695 = add %sum_17 %t_694
    %sum_18 = move %t_695
    %n_l_1 = move 0
    %n_r_1 = move 0
    %i_25 = move %l_3
    jump mergesort_for_cond_1

mergesort_for_cond_1:
    %i_26 = phi mergesort_if_merge_1 %i_25 mergesort_for_body_1 %i_27 
    %n_l_2 = phi mergesort_if_merge_1 %n_l_1 mergesort_for_body_1 %n_l_3 
    %t_696 = slt %i_26 %mid_1
    br %t_696 mergesort_for_body_1 mergesort_for_merge_1

mergesort_for_merge_1:
    %i_28 = move %mid_1
    jump mergesort_for_cond_2

mergesort_for_cond_2:
    %n_r_2 = phi mergesort_for_merge_1 %n_r_1 mergesort_for_body_2 %n_r_3 
    %i_29 = phi mergesort_for_merge_1 %i_28 mergesort_for_body_2 %i_30 
    %t_697 = slt %i_29 %r_3
    br %t_697 mergesort_for_body_2 mergesort_for_merge_2

mergesort_for_body_2:
    %t_698 = move %n_r_2
    %n_r_3 = add %n_r_2 1
    %t_699 = mul %t_698 8
    %t_700 = add %t_699 8
    %t_701 = add %a_right_4 %t_700
    %t_702 = mul %i_29 8
    %t_703 = add %t_702 8
    %t_704 = add %a_4 %t_703
    %t_705 = load %t_704
    store %t_705 %t_701
    %t_706 = move %i_29
    %i_30 = add %i_29 1
    jump mergesort_for_cond_2

mergesort_for_merge_2:
    %z_l_5 = move 0
    %z_r_5 = move 0
    %z_1 = move %l_3
    jump mergesort_while_cond_1

mergesort_while_cond_1:
    %sum_19 = phi mergesort_for_merge_2 %sum_18 mergesort_if_else_1 %sum_20 mergesort_if_then_2 %sum_20 
    %z_r_6 = phi mergesort_for_merge_2 %z_r_5 mergesort_if_else_1 %z_r_7 mergesort_if_then_2 %z_r_6 
    %z_l_6 = phi mergesort_for_merge_2 %z_l_5 mergesort_if_else_1 %z_l_6 mergesort_if_then_2 %z_l_7 
    %z_2 = phi mergesort_for_merge_2 %z_1 mergesort_if_else_1 %z_3 mergesort_if_then_2 %z_4 
    %t_707 = slt %z_l_6 %n_l_2
    br %t_707 mergesort_lhs_then_1 mergesort_while_cond_2

mergesort_lhs_then_1:
    %t_708 = slt %z_r_6 %n_r_2
    br %t_708 mergesort_while_body_1 mergesort_while_cond_2

mergesort_while_body_1:
    %t_709 = move %sum_19
    %sum_20 = add %sum_19 1
    %t_710 = mul %z_l_6 8
    %t_711 = add %t_710 8
    %t_712 = add %a_left_4 %t_711
    %t_713 = mul %z_r_6 8
    %t_714 = add %t_713 8
    %t_715 = add %a_right_4 %t_714
    %t_716 = load %t_712
    %t_717 = load %t_715
    %t_718 = slt %t_716 %t_717
    br %t_718 mergesort_if_then_2 mergesort_if_else_1

mergesort_if_then_2:
    %t_719 = move %z_2
    %z_4 = add %z_2 1
    %t_720 = mul %t_719 8
    %t_721 = add %t_720 8
    %t_722 = add %a_4 %t_721
    %t_723 = move %z_l_6
    %z_l_7 = add %z_l_6 1
    %t_724 = mul %t_723 8
    %t_725 = add %t_724 8
    %t_726 = add %a_left_4 %t_725
    %t_727 = load %t_726
    store %t_727 %t_722
    jump mergesort_while_cond_1

mergesort_if_else_1:
    %t_728 = move %z_2
    %z_3 = add %z_2 1
    %t_729 = mul %t_728 8
    %t_730 = add %t_729 8
    %t_731 = add %a_4 %t_730
    %t_732 = move %z_r_6
    %z_r_7 = add %z_r_6 1
    %t_733 = mul %t_732 8
    %t_734 = add %t_733 8
    %t_735 = add %a_right_4 %t_734
    %t_736 = load %t_735
    store %t_736 %t_731
    jump mergesort_while_cond_1

mergesort_while_cond_2:
    %z_l_8 = phi mergesort_while_cond_1 %z_l_6 mergesort_while_body_2 %z_l_9 mergesort_lhs_then_1 %z_l_6 
    %z_5 = phi mergesort_while_cond_1 %z_2 mergesort_while_body_2 %z_6 mergesort_lhs_then_1 %z_2 
    %t_737 = slt %z_l_8 %n_l_2
    br %t_737 mergesort_while_body_2 mergesort_while_cond_3

mergesort_while_body_2:
    %t_738 = move %z_5
    %z_6 = add %z_5 1
    %t_739 = mul %t_738 8
    %t_740 = add %t_739 8
    %t_741 = add %a_4 %t_740
    %t_742 = move %z_l_8
    %z_l_9 = add %z_l_8 1
    %t_743 = mul %t_742 8
    %t_744 = add %t_743 8
    %t_745 = add %a_left_4 %t_744
    %t_746 = load %t_745
    store %t_746 %t_741
    jump mergesort_while_cond_2

mergesort_while_cond_3:
    %z_r_8 = phi mergesort_while_cond_2 %z_r_6 mergesort_while_body_3 %z_r_9 
    %z_7 = phi mergesort_while_cond_2 %z_5 mergesort_while_body_3 %z_8 
    %t_747 = slt %z_r_8 %n_r_2
    br %t_747 mergesort_while_body_3 mergesort_while_merge_1

mergesort_while_body_3:
    %t_748 = move %z_7
    %z_8 = add %z_7 1
    %t_749 = mul %t_748 8
    %t_750 = add %t_749 8
    %t_751 = add %a_4 %t_750
    %t_752 = move %z_r_8
    %z_r_9 = add %z_r_8 1
    %t_753 = mul %t_752 8
    %t_754 = add %t_753 8
    %t_755 = add %a_right_4 %t_754
    %t_756 = load %t_755
    store %t_756 %t_751
    jump mergesort_while_cond_3

mergesort_while_merge_1:
    %t_757 = move %sum_19
    %t_758 = move %t_757
    jump mergesort_exit_1

mergesort_exit_1:
    %mid_2 = phi mergesort_while_merge_1 %mid_1 mergesort_if_then_1 undef 
    %t_759 = phi mergesort_while_merge_1 %t_758 mergesort_if_then_1 %t_689 
    %sum_21 = phi mergesort_while_merge_1 %sum_19 mergesort_if_then_1 undef 
    %z_r_10 = phi mergesort_while_merge_1 %z_r_8 mergesort_if_then_1 undef 
    %n_r_4 = phi mergesort_while_merge_1 %n_r_2 mergesort_if_then_1 undef 
    %i_31 = phi mergesort_while_merge_1 %i_29 mergesort_if_then_1 undef 
    %n_l_4 = phi mergesort_while_merge_1 %n_l_2 mergesort_if_then_1 undef 
    %z_l_10 = phi mergesort_while_merge_1 %z_l_8 mergesort_if_then_1 undef 
    %z_9 = phi mergesort_while_merge_1 %z_7 mergesort_if_then_1 undef 
    ret %t_759

mergesort_for_body_1:
    %t_760 = move %n_l_2
    %n_l_3 = add %n_l_2 1
    %t_761 = mul %t_760 8
    %t_762 = add %t_761 8
    %t_763 = add %a_left_4 %t_762
    %t_764 = mul %i_26 8
    %t_765 = add %t_764 8
    %t_766 = add %a_4 %t_765
    %t_767 = load %t_766
    store %t_767 %t_763
    %t_768 = move %i_26
    %i_27 = add %i_26 1
    jump mergesort_for_cond_1

}

define i64 @heapsort  {
heapsort_entry_1:
    %heap_2 = load @heap_1
    %a_5 = load @a_1
    %n_3 = load @n_1
    %sum_22 = move 0
    %i_32 = move 1
    jump heapsort_for_cond_1

heapsort_for_cond_1:
    %sum_23 = phi heapsort_entry_1 %sum_22 heapsort_for_step_1 %sum_24 
    %x_2 = phi heapsort_entry_1 undef heapsort_for_step_1 %x_3 
    %i_33 = phi heapsort_entry_1 %i_32 heapsort_for_step_1 %i_34 
    %t_769 = sle %i_33 %n_3
    br %t_769 heapsort_for_body_1 heapsort_for_merge_1

heapsort_for_merge_1:
    %heap_size_1 = move %n_3
    %i_35 = move 1
    jump heapsort_for_cond_2

heapsort_for_cond_2:
    %l_4 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %l_5 
    %x_4 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %x_5 
    %sum_25 = phi heapsort_for_merge_1 %sum_23 heapsort_for_step_2 %sum_26 
    %heap_size_2 = phi heapsort_for_merge_1 %heap_size_1 heapsort_for_step_2 %heap_size_3 
    %y_1 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %y_2 
    %i_36 = phi heapsort_for_merge_1 %i_35 heapsort_for_step_2 %i_37 
    %r_4 = phi heapsort_for_merge_1 undef heapsort_for_step_2 %r_5 
    %t_770 = sle %i_36 %n_3
    br %t_770 heapsort_for_body_2 heapsort_for_merge_2

heapsort_for_body_2:
    %t_771 = mul %i_36 8
    %t_772 = add %t_771 8
    %t_773 = add %a_5 %t_772
    %t_774 = mul 1 8
    %t_775 = add %t_774 8
    %t_776 = add %heap_2 %t_775
    %t_777 = load %t_776
    store %t_777 %t_773
    %t_778 = mul 1 8
    %t_779 = add %t_778 8
    %t_780 = add %heap_2 %t_779
    %t_781 = move %heap_size_2
    %heap_size_3 = sub %heap_size_2 1
    %t_782 = mul %t_781 8
    %t_783 = add %t_782 8
    %t_784 = add %heap_2 %t_783
    %t_785 = load %t_784
    store %t_785 %t_780
    %x_6 = move 1
    jump heapsort_while_cond_1

heapsort_while_cond_1:
    %l_6 = phi heapsort_for_body_2 %l_4 heapsort_if_merge_1 %l_7 
    %x_5 = phi heapsort_for_body_2 %x_6 heapsort_if_merge_1 %x_7 
    %sum_27 = phi heapsort_for_body_2 %sum_25 heapsort_if_merge_1 %sum_28 
    %y_3 = phi heapsort_for_body_2 %y_1 heapsort_if_merge_1 %y_4 
    %r_6 = phi heapsort_for_body_2 %r_4 heapsort_if_merge_1 %r_7 
    %t_786 = shl %x_5 1
    %t_787 = sle %t_786 %heap_size_3
    br %t_787 heapsort_while_body_1 heapsort_for_step_2

heapsort_while_body_1:
    %t_788 = shl %x_5 1
    %l_7 = move %t_788
    %t_789 = add %l_7 1
    %r_7 = move %t_789
    %y_5 = move %l_7
    %t_790 = sle %r_7 %heap_size_3
    br %t_790 heapsort_if_then_1 heapsort_if_merge_2

heapsort_if_then_1:
    %t_791 = move %sum_27
    %sum_29 = add %sum_27 1
    %t_792 = mul %r_7 8
    %t_793 = add %t_792 8
    %t_794 = add %heap_2 %t_793
    %t_795 = mul %l_7 8
    %t_796 = add %t_795 8
    %t_797 = add %heap_2 %t_796
    %t_798 = load %t_794
    %t_799 = load %t_797
    %t_800 = slt %t_798 %t_799
    br %t_800 heapsort_if_then_2 heapsort_if_merge_2

heapsort_if_then_2:
    %y_6 = move %r_7
    jump heapsort_if_merge_2

heapsort_if_merge_2:
    %sum_30 = phi heapsort_while_body_1 %sum_27 heapsort_if_then_1 %sum_29 heapsort_if_then_2 %sum_29 
    %y_7 = phi heapsort_while_body_1 %y_5 heapsort_if_then_1 %y_5 heapsort_if_then_2 %y_6 
    %t_801 = move %sum_30
    %sum_28 = add %sum_30 1
    %t_802 = mul %x_5 8
    %t_803 = add %t_802 8
    %t_804 = add %heap_2 %t_803
    %t_805 = mul %y_7 8
    %t_806 = add %t_805 8
    %t_807 = add %heap_2 %t_806
    %t_808 = load %t_804
    %t_809 = load %t_807
    %t_810 = slt %t_808 %t_809
    br %t_810 heapsort_for_step_2 heapsort_if_merge_1

heapsort_for_step_2:
    %l_5 = phi heapsort_while_cond_1 %l_6 heapsort_if_merge_2 %l_7 
    %sum_26 = phi heapsort_while_cond_1 %sum_27 heapsort_if_merge_2 %sum_28 
    %y_2 = phi heapsort_while_cond_1 %y_3 heapsort_if_merge_2 %y_7 
    %r_5 = phi heapsort_while_cond_1 %r_6 heapsort_if_merge_2 %r_7 
    %t_811 = move %i_36
    %i_37 = add %i_36 1
    jump heapsort_for_cond_2

heapsort_if_merge_1:
    %t_812 = mul %x_5 8
    %t_813 = add %t_812 8
    %t_814 = add %heap_2 %t_813
    %t_815 = load %t_814
    %tmp_1 = move %t_815
    %t_816 = mul %x_5 8
    %t_817 = add %t_816 8
    %t_818 = add %heap_2 %t_817
    %t_819 = mul %y_7 8
    %t_820 = add %t_819 8
    %t_821 = add %heap_2 %t_820
    %t_822 = load %t_821
    store %t_822 %t_818
    %t_823 = mul %y_7 8
    %t_824 = add %t_823 8
    %t_825 = add %heap_2 %t_824
    store %tmp_1 %t_825
    %tmp_2 = move %x_5
    %x_7 = move %y_7
    %y_4 = move %tmp_2
    jump heapsort_while_cond_1

heapsort_for_merge_2:
    %t_826 = move %sum_25
    ret %t_826

heapsort_for_body_1:
    %t_827 = mul %i_33 8
    %t_828 = add %t_827 8
    %t_829 = add %heap_2 %t_828
    %t_830 = mul %i_33 8
    %t_831 = add %t_830 8
    %t_832 = add %a_5 %t_831
    %t_833 = load %t_832
    store %t_833 %t_829
    %x_8 = move %i_33
    jump heapsort_while_cond_2

heapsort_while_cond_2:
    %sum_31 = phi heapsort_for_body_1 %sum_23 heapsort_if_merge_3 %sum_32 
    %x_3 = phi heapsort_for_body_1 %x_8 heapsort_if_merge_3 %x_9 
    %t_834 = sne %x_3 1
    br %t_834 heapsort_while_body_2 heapsort_for_step_1

heapsort_while_body_2:
    %t_835 = move %sum_31
    %sum_32 = add %sum_31 1
    %t_836 = mul %x_3 8
    %t_837 = add %t_836 8
    %t_838 = add %heap_2 %t_837
    %t_839 = shr %x_3 1
    %t_840 = mul %t_839 8
    %t_841 = add %t_840 8
    %t_842 = add %heap_2 %t_841
    %t_843 = load %t_838
    %t_844 = load %t_842
    %t_845 = sgt %t_843 %t_844
    br %t_845 heapsort_for_step_1 heapsort_if_merge_3

heapsort_for_step_1:
    %sum_24 = phi heapsort_while_cond_2 %sum_31 heapsort_while_body_2 %sum_32 
    %t_846 = move %i_33
    %i_34 = add %i_33 1
    jump heapsort_for_cond_1

heapsort_if_merge_3:
    %t_847 = mul %x_3 8
    %t_848 = add %t_847 8
    %t_849 = add %heap_2 %t_848
    %t_850 = load %t_849
    %tmp_3 = move %t_850
    %t_851 = mul %x_3 8
    %t_852 = add %t_851 8
    %t_853 = add %heap_2 %t_852
    %t_854 = shr %x_3 1
    %t_855 = mul %t_854 8
    %t_856 = add %t_855 8
    %t_857 = add %heap_2 %t_856
    %t_858 = load %t_857
    store %t_858 %t_853
    %t_859 = shr %x_3 1
    %t_860 = mul %t_859 8
    %t_861 = add %t_860 8
    %t_862 = add %heap_2 %t_861
    store %tmp_3 %t_862
    %t_863 = shr %x_3 1
    %x_9 = move %t_863
    jump heapsort_while_cond_2

}

define i64 @main  {
main_entry_1:
    %a_6 = load @a_1
    %bak_2 = load @bak_1
    %n_4 = load @n_1
    %t_864 = call getInt 
    %n_5 = move %t_864
    %t_865 = call getInt 
    %k_1 = move %t_865
    %i_38 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %i_39 = phi main_entry_1 %i_38 main_if_merge_1 %i_40 
    %t_866 = sle %i_39 %n_5
    br %t_866 main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_867 = mul %i_39 8
    %t_868 = add %t_867 8
    %t_869 = add %a_6 %t_868
    store %i_39 %t_869
    %t_870 = sle %i_39 %k_1
    br %t_870 main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_871 = mul %i_39 8
    %t_872 = add %t_871 8
    %t_873 = add %a_6 %t_872
    %t_874 = add %k_1 1
    %t_875 = sub %t_874 %i_39
    store %t_875 %t_873
    jump main_if_merge_1

main_if_merge_1:
    %t_876 = mul %i_39 8
    %t_877 = add %t_876 8
    %t_878 = add %bak_2 %t_877
    %t_879 = mul %i_39 8
    %t_880 = add %t_879 8
    %t_881 = add %a_6 %t_880
    %t_882 = load %t_881
    store %t_882 %t_878
    %t_883 = move %i_39
    %i_40 = add %i_39 1
    jump main_for_cond_1

main_for_merge_1:
    %t_884 = add %n_5 1
    %t_885 = call quicksort 1 %t_884 
    %ans1_1 = move %t_885
    %i_41 = move 1
    jump main_faker_restore_for_cond_1

main_faker_restore_for_cond_1:
    %i_42 = phi main_for_merge_1 %i_41 main_faker_restore_for_body_1 %i_43 
    %t_886 = sle %i_42 %n_5
    br %t_886 main_faker_restore_for_body_1 main_splitter_1

main_splitter_1:
    store %n_5 @n_1
    %t_887 = call calc 
    %ans2_1 = move %t_887
    %i_44 = move 1
    jump main_faker_restore_for_cond_2

main_faker_restore_for_cond_2:
    %i_45 = phi main_splitter_1 %i_44 main_faker_restore_for_body_2 %i_46 
    %t_888 = sle %i_45 %n_5
    br %t_888 main_faker_restore_for_body_2 main_splitter_2

main_splitter_2:
    %t_889 = add %n_5 1
    %t_890 = call mergesort 1 %t_889 
    %ans3_1 = move %t_890
    %i_47 = move 1
    jump main_faker_restore_for_cond_3

main_faker_restore_for_cond_3:
    %i_48 = phi main_splitter_2 %i_47 main_faker_restore_for_body_3 %i_49 
    %t_891 = sle %i_48 %n_5
    br %t_891 main_faker_restore_for_body_3 main_splitter_3

main_faker_restore_for_body_3:
    %t_892 = mul %i_48 8
    %t_893 = add %t_892 8
    %t_894 = add %a_6 %t_893
    %t_895 = mul %i_48 8
    %t_896 = add %t_895 8
    %t_897 = add %bak_2 %t_896
    %t_898 = load %t_897
    store %t_898 %t_894
    %t_899 = move %i_48
    %i_49 = add %i_48 1
    jump main_faker_restore_for_cond_3

main_splitter_3:
    store %n_5 @n_1
    %t_900 = call heapsort 
    %ans4_1 = move %t_900
    %t_901 = call toString %ans1_1 
    call println %t_901 
    %t_902 = call toString %ans2_1 
    call println %t_902 
    %t_903 = call toString %ans3_1 
    call println %t_903 
    %t_904 = call toString %ans4_1 
    call println %t_904 
    %t_905 = alloc 8
    call A_A %t_905 
    %a_7 = move %t_905
    call A_Optimizer 
    %t_906 = move 0
    store %n_5 @n_1
    ret %t_906

main_faker_restore_for_body_2:
    %t_907 = mul %i_45 8
    %t_908 = add %t_907 8
    %t_909 = add %a_6 %t_908
    %t_910 = mul %i_45 8
    %t_911 = add %t_910 8
    %t_912 = add %bak_2 %t_911
    %t_913 = load %t_912
    store %t_913 %t_909
    %t_914 = move %i_45
    %i_46 = add %i_45 1
    jump main_faker_restore_for_cond_2

main_faker_restore_for_body_1:
    %t_915 = mul %i_42 8
    %t_916 = add %t_915 8
    %t_917 = add %a_6 %t_916
    %t_918 = mul %i_42 8
    %t_919 = add %t_918 8
    %t_920 = add %bak_2 %t_919
    %t_921 = load %t_920
    store %t_921 %t_917
    %t_922 = move %i_42
    %i_43 = add %i_42 1
    jump main_faker_restore_for_cond_1

}

define i64 @__init  {
__init_entry_1:
    %N_2 = load @N_1
    %heap_3 = load @heap_1
    %a_left_5 = load @a_left_1
    %a_right_5 = load @a_right_1
    %a_8 = load @a_1
    %bak_3 = load @bak_1
    %N_3 = move 100000
    %t_923 = mul %N_3 8
    %t_924 = add %t_923 8
    %t_925 = alloc %t_924
    store %N_3 %t_925
    %a_9 = move %t_925
    %t_926 = mul %N_3 8
    %t_927 = add %t_926 8
    %t_928 = alloc %t_927
    store %N_3 %t_928
    %bak_4 = move %t_928
    %t_929 = mul %N_3 8
    %t_930 = add %t_929 8
    %t_931 = alloc %t_930
    store %N_3 %t_931
    %a_left_6 = move %t_931
    %t_932 = mul %N_3 8
    %t_933 = add %t_932 8
    %t_934 = alloc %t_933
    store %N_3 %t_934
    %a_right_6 = move %t_934
    %t_935 = mul %N_3 8
    %t_936 = add %t_935 8
    %t_937 = alloc %t_936
    store %N_3 %t_937
    %heap_4 = move %t_937
    store %bak_4 @bak_1
    store %a_9 @a_1
    store %a_right_6 @a_right_1
    store %a_left_6 @a_left_1
    store %heap_4 @heap_1
    %t_938 = call main 
    %t_939 = move %t_938
    store %bak_4 @bak_1
    store %a_9 @a_1
    store %a_right_6 @a_right_1
    store %a_left_6 @a_left_1
    store %heap_4 @heap_1
    store %N_3 @N_1
    ret %t_939

}


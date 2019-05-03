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
    %t_1 = add %t_1 8
    %t_2 = alloc %t_1
    store 2 %t_2
    %t_3 = add %t_2 8
    %t_4 = add %t_2 %t_1
    jump A_Optimizer_for_cond_1

A_Optimizer_for_cond_1:
    %t_5 = slt %t_3 %t_4
    br %t_5 A_Optimizer_for_body_1 A_Optimizer_for_merge_1

A_Optimizer_for_body_1:
    %t_6 = mul 2 8
    %t_6 = add %t_6 8
    %t_7 = alloc %t_6
    store 2 %t_7
    store %t_7 %t_3
    %t_8 = add %t_7 8
    %t_9 = add %t_7 %t_6
    jump A_Optimizer_for_cond_2

A_Optimizer_for_cond_2:
    %t_10 = slt %t_8 %t_9
    br %t_10 A_Optimizer_for_body_2 A_Optimizer_for_merge_2

A_Optimizer_for_body_2:
    %t_11 = mul 2 8
    %t_11 = add %t_11 8
    %t_12 = alloc %t_11
    store 2 %t_12
    store %t_12 %t_8
    %t_13 = add %t_12 8
    %t_14 = add %t_12 %t_11
    jump A_Optimizer_for_cond_3

A_Optimizer_for_cond_3:
    %t_15 = slt %t_13 %t_14
    br %t_15 A_Optimizer_for_body_3 A_Optimizer_for_merge_3

A_Optimizer_for_body_3:
    %t_16 = mul 2 8
    %t_16 = add %t_16 8
    %t_17 = alloc %t_16
    store 2 %t_17
    store %t_17 %t_13
    %t_18 = add %t_17 8
    %t_19 = add %t_17 %t_16
    jump A_Optimizer_for_cond_4

A_Optimizer_for_cond_4:
    %t_20 = slt %t_18 %t_19
    br %t_20 A_Optimizer_for_body_4 A_Optimizer_for_merge_4

A_Optimizer_for_merge_4:
    jump A_Optimizer_for_step_1

A_Optimizer_for_step_1:
    %t_21 = add %t_13 8
    %t_13 = move %t_21
    jump A_Optimizer_for_cond_3

A_Optimizer_for_body_4:
    %t_22 = mul 2 8
    %t_22 = add %t_22 8
    %t_23 = alloc %t_22
    store 2 %t_23
    store %t_23 %t_18
    %t_24 = add %t_23 8
    %t_25 = add %t_23 %t_22
    jump A_Optimizer_for_cond_5

A_Optimizer_for_cond_5:
    %t_26 = slt %t_24 %t_25
    br %t_26 A_Optimizer_for_body_5 A_Optimizer_for_merge_5

A_Optimizer_for_body_5:
    %t_27 = mul 2 8
    %t_27 = add %t_27 8
    %t_28 = alloc %t_27
    store 2 %t_28
    store %t_28 %t_24
    %t_29 = add %t_28 8
    %t_30 = add %t_28 %t_27
    jump A_Optimizer_for_cond_6

A_Optimizer_for_cond_6:
    %t_31 = slt %t_29 %t_30
    br %t_31 A_Optimizer_for_body_6 A_Optimizer_for_merge_6

A_Optimizer_for_merge_6:
    jump A_Optimizer_for_step_2

A_Optimizer_for_step_2:
    %t_32 = add %t_24 8
    %t_24 = move %t_32
    jump A_Optimizer_for_cond_5

A_Optimizer_for_body_6:
    %t_33 = mul 2 8
    %t_33 = add %t_33 8
    %t_34 = alloc %t_33
    store 2 %t_34
    store %t_34 %t_29
    %t_35 = add %t_34 8
    %t_36 = add %t_34 %t_33
    jump A_Optimizer_for_cond_7

A_Optimizer_for_cond_7:
    %t_37 = slt %t_35 %t_36
    br %t_37 A_Optimizer_for_body_7 A_Optimizer_for_merge_7

A_Optimizer_for_merge_7:
    jump A_Optimizer_for_step_3

A_Optimizer_for_step_3:
    %t_38 = add %t_29 8
    %t_29 = move %t_38
    jump A_Optimizer_for_cond_6

A_Optimizer_for_body_7:
    %t_39 = mul 2 8
    %t_39 = add %t_39 8
    %t_40 = alloc %t_39
    store 2 %t_40
    store %t_40 %t_35
    %t_41 = add %t_40 8
    %t_42 = add %t_40 %t_39
    jump A_Optimizer_for_cond_8

A_Optimizer_for_cond_8:
    %t_43 = slt %t_41 %t_42
    br %t_43 A_Optimizer_for_body_8 A_Optimizer_for_merge_8

A_Optimizer_for_merge_8:
    jump A_Optimizer_for_step_4

A_Optimizer_for_step_4:
    %t_44 = add %t_35 8
    %t_35 = move %t_44
    jump A_Optimizer_for_cond_7

A_Optimizer_for_body_8:
    %t_45 = mul 2 8
    %t_45 = add %t_45 8
    %t_46 = alloc %t_45
    store 2 %t_46
    store %t_46 %t_41
    %t_47 = add %t_46 8
    %t_48 = add %t_46 %t_45
    jump A_Optimizer_for_cond_9

A_Optimizer_for_cond_9:
    %t_49 = slt %t_47 %t_48
    br %t_49 A_Optimizer_for_body_9 A_Optimizer_for_merge_9

A_Optimizer_for_merge_9:
    jump A_Optimizer_for_step_5

A_Optimizer_for_step_5:
    %t_50 = add %t_41 8
    %t_41 = move %t_50
    jump A_Optimizer_for_cond_8

A_Optimizer_for_body_9:
    %t_51 = mul 2 8
    %t_51 = add %t_51 8
    %t_52 = alloc %t_51
    store 2 %t_52
    store %t_52 %t_47
    jump A_Optimizer_for_step_6

A_Optimizer_for_step_6:
    %t_53 = add %t_47 8
    %t_47 = move %t_53
    jump A_Optimizer_for_cond_9

A_Optimizer_for_merge_5:
    jump A_Optimizer_for_step_7

A_Optimizer_for_step_7:
    %t_54 = add %t_18 8
    %t_18 = move %t_54
    jump A_Optimizer_for_cond_4

A_Optimizer_for_merge_3:
    jump A_Optimizer_for_step_8

A_Optimizer_for_step_8:
    %t_55 = add %t_8 8
    %t_8 = move %t_55
    jump A_Optimizer_for_cond_2

A_Optimizer_for_merge_2:
    jump A_Optimizer_for_step_9

A_Optimizer_for_step_9:
    %t_56 = add %t_3 8
    %t_3 = move %t_56
    jump A_Optimizer_for_cond_1

A_Optimizer_for_merge_1:
    %arr_1 = move %t_2
    %sum_1 = move 0
    %i_1 = move 1
    jump A_Optimizer_for_cond_10

A_Optimizer_for_cond_10:
    %t_57 = sle %i_1 1000
    br %t_57 A_Optimizer_for_body_10 A_Optimizer_for_merge_10

A_Optimizer_for_merge_10:
    %t_58 = call toString %sum_1 
    call println %t_58 
    %i_1 = move 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_cond_11:
    %t_59 = sle %i_1 1000000
    br %t_59 A_Optimizer_for_body_11 A_Optimizer_for_merge_11

A_Optimizer_for_body_11:
    %t_60 = mod 9876 1234
    %t_61 = mul %t_60 2345
    %t_62 = mod %t_61 1234
    %t_63 = mul %t_62 2345
    %t_64 = mod %t_63 1234
    %t_65 = mul %t_64 2345
    %t_66 = mod %t_65 1234
    %t_67 = mul %t_66 2345
    %t_68 = mod %t_67 1234
    %t_69 = mul %t_68 2345
    %t_70 = mod %t_69 1234
    %t_71 = mul %t_70 2345
    %t_72 = mod %t_71 1234
    %t_73 = mul %t_72 2345
    %t_74 = mod %t_73 1234
    %t_75 = mul %t_74 2345
    %t_76 = mod %t_75 1234
    %t_77 = mul %t_76 2345
    %t_78 = mod %t_77 1234
    %t_79 = mul %t_78 2345
    %t_80 = mod %t_79 1234
    %t_81 = mul %t_80 2345
    %t_82 = mod %t_81 1234
    %t_83 = mul %t_82 2345
    %t_84 = mod %t_83 1234
    %t_85 = mul %t_84 2345
    %t_86 = mod %t_85 1234
    %t_87 = mul %t_86 2345
    %t_88 = mod %t_87 1234
    %t_89 = mul %t_88 2345
    %t_90 = mod %t_89 1234
    %t_91 = mul %t_90 2345
    %t_92 = mod %t_91 1234
    %t_93 = mul %t_92 2345
    %t_94 = mod %t_93 1234
    %t_95 = mul %t_94 2345
    %t_96 = mod %t_95 1234
    %t_97 = mul %t_96 2345
    %t_98 = mod %t_97 1234
    %t_99 = mul %t_98 2345
    %t_100 = mod %t_99 1234
    %t_101 = mul %t_100 2345
    %t_102 = mod %t_101 1234
    %t_103 = mul %t_102 2345
    %t_104 = mod %t_103 1234
    %t_105 = mul %t_104 2345
    %t_106 = mod %t_105 1234
    %t_107 = mul %t_106 2345
    %t_108 = mod %t_107 1234
    %t_109 = mul %t_108 2345
    %t_110 = mod %t_109 1234
    %t_111 = mul %t_110 2345
    %t_112 = mod %t_111 1234
    %t_113 = mul %t_112 2345
    %t_114 = mod %t_113 1234
    %t_115 = mul %t_114 2345
    %t_116 = mod %t_115 1234
    %t_117 = mul %t_116 2345
    %t_118 = mod %t_117 1234
    %t_119 = mul %t_118 2345
    %t_120 = mod %t_119 1234
    %t_121 = mul %t_120 2345
    %t_122 = mod %t_121 1234
    %t_123 = mul %t_122 2345
    %t_124 = mod %t_123 1234
    %t_125 = mul %t_124 2345
    %t_126 = mod %t_125 1234
    %t_127 = mul %t_126 2345
    %t_128 = mod %t_127 1234
    %t_129 = mul %t_128 2345
    %t_130 = mod %t_129 1234
    %t_131 = mul %t_130 2345
    %t_132 = mod %t_131 1234
    %t_133 = mul %t_132 2345
    %t_134 = mod %t_133 1234
    %t_135 = mul %t_134 2345
    %t_136 = mod %t_135 1234
    %t_137 = mul %t_136 2345
    %t_138 = mod %t_137 1234
    %t_139 = mul %t_138 2345
    %t_140 = mod %t_139 1234
    %t_141 = mul %t_140 2345
    %t_142 = mod %t_141 1234
    %t_143 = mul %t_142 2345
    %t_144 = mod %t_143 1234
    %t_145 = mul %t_144 2345
    %t_146 = mod %t_145 1234
    %t_147 = mul %t_146 2345
    %t_148 = mod %t_147 1234
    %t_149 = mul %t_148 2345
    %t_150 = mod %t_149 1234
    %t_151 = mul %t_150 2345
    %t_152 = mod %t_151 1234
    %t_153 = mul %t_152 2345
    %t_154 = mod %t_153 1234
    %t_155 = mul %t_154 2345
    %t_156 = mod %t_155 1234
    %t_157 = mul %t_156 2345
    %t_158 = mod %t_157 1234
    %t_159 = mul %t_158 2345
    %t_160 = mod %t_159 1234
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
    %t_241 = mod %t_240 11
    %t_242 = add %sum_1 %t_241
    %sum_1 = move %t_242
    jump A_Optimizer_for_step_10

A_Optimizer_for_step_10:
    %t_243 = move %i_1
    %i_1 = add %i_1 1
    jump A_Optimizer_for_cond_11

A_Optimizer_for_merge_11:
    %t_244 = call toString %sum_1 
    call println %t_244 
    %i_1 = move 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_cond_12:
    %t_245 = sle %i_1 200000000
    br %t_245 A_Optimizer_for_body_12 A_Optimizer_for_merge_12

A_Optimizer_for_merge_12:
    ret 

A_Optimizer_for_body_12:
    jump A_Optimizer_for_step_11

A_Optimizer_for_step_11:
    %t_246 = move %i_1
    %i_1 = add %i_1 1
    jump A_Optimizer_for_cond_12

A_Optimizer_for_body_10:
    %t_247 = mul 0 8
    %t_248 = add %t_247 8
    %t_249 = add %arr_1 %t_248
    %t_250 = load %t_249
    %t_251 = mul 1 8
    %t_252 = add %t_251 8
    %t_253 = add %t_250 %t_252
    %t_254 = load %t_253
    %t_255 = mul 0 8
    %t_256 = add %t_255 8
    %t_257 = add %t_254 %t_256
    %t_258 = load %t_257
    %t_259 = mul 1 8
    %t_260 = add %t_259 8
    %t_261 = add %t_258 %t_260
    %t_262 = load %t_261
    %t_263 = mul 0 8
    %t_264 = add %t_263 8
    %t_265 = add %t_262 %t_264
    %t_266 = load %t_265
    %t_267 = mul 1 8
    %t_268 = add %t_267 8
    %t_269 = add %t_266 %t_268
    %t_270 = load %t_269
    %t_271 = mul 0 8
    %t_272 = add %t_271 8
    %t_273 = add %t_270 %t_272
    %t_274 = load %t_273
    %t_275 = mul 1 8
    %t_276 = add %t_275 8
    %t_277 = add %t_274 %t_276
    %t_278 = load %t_277
    %t_279 = mul 0 8
    %t_280 = add %t_279 8
    %t_281 = add %t_278 %t_280
    %t_282 = load %t_281
    %t_283 = mul 1 8
    %t_284 = add %t_283 8
    %t_285 = add %t_282 %t_284
    %t_286 = add 123 %i_1
    store %t_286 %t_285
    %t_287 = mul 0 8
    %t_288 = add %t_287 8
    %t_289 = add %arr_1 %t_288
    %t_290 = load %t_289
    %t_291 = mul 1 8
    %t_292 = add %t_291 8
    %t_293 = add %t_290 %t_292
    %t_294 = load %t_293
    %t_295 = mul 0 8
    %t_296 = add %t_295 8
    %t_297 = add %t_294 %t_296
    %t_298 = load %t_297
    %t_299 = mul 1 8
    %t_300 = add %t_299 8
    %t_301 = add %t_298 %t_300
    %t_302 = load %t_301
    %t_303 = mul 0 8
    %t_304 = add %t_303 8
    %t_305 = add %t_302 %t_304
    %t_306 = load %t_305
    %t_307 = mul 1 8
    %t_308 = add %t_307 8
    %t_309 = add %t_306 %t_308
    %t_310 = load %t_309
    %t_311 = mul 0 8
    %t_312 = add %t_311 8
    %t_313 = add %t_310 %t_312
    %t_314 = load %t_313
    %t_315 = mul 1 8
    %t_316 = add %t_315 8
    %t_317 = add %t_314 %t_316
    %t_318 = load %t_317
    %t_319 = mul 0 8
    %t_320 = add %t_319 8
    %t_321 = add %t_318 %t_320
    %t_322 = load %t_321
    %t_323 = mul 1 8
    %t_324 = add %t_323 8
    %t_325 = add %t_322 %t_324
    %t_326 = load %t_325
    %t_327 = add %sum_1 %t_326
    %sum_1 = move %t_327
    jump A_Optimizer_for_step_12

A_Optimizer_for_step_12:
    %t_328 = move %i_1
    %i_1 = add %i_1 1
    jump A_Optimizer_for_cond_10

}

define i64 @A_A  {
A_A_entry_1:
    %t_329 = add %this_1 0
    %t_330 = mul 2 8
    %t_330 = add %t_330 8
    %t_331 = alloc %t_330
    store 2 %t_331
    %t_332 = add %t_331 8
    %t_333 = add %t_331 %t_330
    jump A_A_for_cond_1

A_A_for_cond_1:
    %t_334 = slt %t_332 %t_333
    br %t_334 A_A_for_body_1 A_A_for_merge_1

A_A_for_merge_1:
    store %t_331 %t_329
    ret 0

A_A_for_body_1:
    %t_335 = mul 2 8
    %t_335 = add %t_335 8
    %t_336 = alloc %t_335
    store 2 %t_336
    store %t_336 %t_332
    %t_337 = add %t_336 8
    %t_338 = add %t_336 %t_335
    jump A_A_for_cond_2

A_A_for_cond_2:
    %t_339 = slt %t_337 %t_338
    br %t_339 A_A_for_body_2 A_A_for_merge_2

A_A_for_merge_2:
    jump A_A_for_step_1

A_A_for_step_1:
    %t_340 = add %t_332 8
    %t_332 = move %t_340
    jump A_A_for_cond_1

A_A_for_body_2:
    %t_341 = mul 3 8
    %t_341 = add %t_341 8
    %t_342 = alloc %t_341
    store 3 %t_342
    store %t_342 %t_337
    %t_343 = add %t_342 8
    %t_344 = add %t_342 %t_341
    jump A_A_for_cond_3

A_A_for_cond_3:
    %t_345 = slt %t_343 %t_344
    br %t_345 A_A_for_body_3 A_A_for_merge_3

A_A_for_body_3:
    %t_346 = mul 2 8
    %t_346 = add %t_346 8
    %t_347 = alloc %t_346
    store 2 %t_347
    store %t_347 %t_343
    %t_348 = add %t_347 8
    %t_349 = add %t_347 %t_346
    jump A_A_for_cond_4

A_A_for_cond_4:
    %t_350 = slt %t_348 %t_349
    br %t_350 A_A_for_body_4 A_A_for_merge_4

A_A_for_body_4:
    %t_351 = mul 3 8
    %t_351 = add %t_351 8
    %t_352 = alloc %t_351
    store 3 %t_352
    store %t_352 %t_348
    %t_353 = add %t_352 8
    %t_354 = add %t_352 %t_351
    jump A_A_for_cond_5

A_A_for_cond_5:
    %t_355 = slt %t_353 %t_354
    br %t_355 A_A_for_body_5 A_A_for_merge_5

A_A_for_merge_5:
    jump A_A_for_step_2

A_A_for_step_2:
    %t_356 = add %t_348 8
    %t_348 = move %t_356
    jump A_A_for_cond_4

A_A_for_body_5:
    %t_357 = mul 2 8
    %t_357 = add %t_357 8
    %t_358 = alloc %t_357
    store 2 %t_358
    store %t_358 %t_353
    %t_359 = add %t_358 8
    %t_360 = add %t_358 %t_357
    jump A_A_for_cond_6

A_A_for_cond_6:
    %t_361 = slt %t_359 %t_360
    br %t_361 A_A_for_body_6 A_A_for_merge_6

A_A_for_body_6:
    %t_362 = mul 2 8
    %t_362 = add %t_362 8
    %t_363 = alloc %t_362
    store 2 %t_363
    store %t_363 %t_359
    %t_364 = add %t_363 8
    %t_365 = add %t_363 %t_362
    jump A_A_for_cond_7

A_A_for_cond_7:
    %t_366 = slt %t_364 %t_365
    br %t_366 A_A_for_body_7 A_A_for_merge_7

A_A_for_body_7:
    %t_367 = mul 3 8
    %t_367 = add %t_367 8
    %t_368 = alloc %t_367
    store 3 %t_368
    store %t_368 %t_364
    %t_369 = add %t_368 8
    %t_370 = add %t_368 %t_367
    jump A_A_for_cond_8

A_A_for_cond_8:
    %t_371 = slt %t_369 %t_370
    br %t_371 A_A_for_body_8 A_A_for_merge_8

A_A_for_merge_8:
    jump A_A_for_step_3

A_A_for_step_3:
    %t_372 = add %t_364 8
    %t_364 = move %t_372
    jump A_A_for_cond_7

A_A_for_body_8:
    %t_373 = mul 2 8
    %t_373 = add %t_373 8
    %t_374 = alloc %t_373
    store 2 %t_374
    store %t_374 %t_369
    %t_375 = add %t_374 8
    %t_376 = add %t_374 %t_373
    jump A_A_for_cond_9

A_A_for_cond_9:
    %t_377 = slt %t_375 %t_376
    br %t_377 A_A_for_body_9 A_A_for_merge_9

A_A_for_merge_9:
    jump A_A_for_step_4

A_A_for_step_4:
    %t_378 = add %t_369 8
    %t_369 = move %t_378
    jump A_A_for_cond_8

A_A_for_body_9:
    %t_379 = mul 2 8
    %t_379 = add %t_379 8
    %t_380 = alloc %t_379
    store 2 %t_380
    store %t_380 %t_375
    jump A_A_for_step_5

A_A_for_step_5:
    %t_381 = add %t_375 8
    %t_375 = move %t_381
    jump A_A_for_cond_9

A_A_for_merge_7:
    jump A_A_for_step_6

A_A_for_step_6:
    %t_382 = add %t_359 8
    %t_359 = move %t_382
    jump A_A_for_cond_6

A_A_for_merge_6:
    jump A_A_for_step_7

A_A_for_step_7:
    %t_383 = add %t_353 8
    %t_353 = move %t_383
    jump A_A_for_cond_5

A_A_for_merge_4:
    jump A_A_for_step_8

A_A_for_step_8:
    %t_384 = add %t_343 8
    %t_343 = move %t_384
    jump A_A_for_cond_3

A_A_for_merge_3:
    jump A_A_for_step_9

A_A_for_step_9:
    %t_385 = add %t_337 8
    %t_337 = move %t_385
    jump A_A_for_cond_2

}

define void @restore  {
restore_entry_1:
    %i_2 = move 1
    jump restore_for_cond_1

restore_for_cond_1:
    %t_386 = sle %i_2 @n_1
    br %t_386 restore_for_body_1 restore_for_merge_1

restore_for_body_1:
    %t_387 = mul %i_2 8
    %t_388 = add %t_387 8
    %t_389 = add @a_1 %t_388
    %t_390 = mul %i_2 8
    %t_391 = add %t_390 8
    %t_392 = add @bak_1 %t_391
    %t_393 = load %t_392
    store %t_393 %t_389
    jump restore_for_step_1

restore_for_step_1:
    %t_394 = move %i_2
    %i_2 = add %i_2 1
    jump restore_for_cond_1

restore_for_merge_1:
    ret 

}

define i64 @quicksort  {
quicksort_entry_1:
    %sum_2 = move 0
    %t_395 = mul %l_1 8
    %t_396 = add %t_395 8
    %t_397 = add @a_1 %t_396
    %t_398 = load %t_397
    %x_1 = move %t_398
    %z_l_1 = move 0
    %z_r_1 = move 0
    %t_399 = add %l_1 1
    %i_3 = move %t_399
    jump quicksort_for_cond_1

quicksort_for_cond_1:
    %t_400 = slt %i_3 %r_1
    br %t_400 quicksort_for_body_1 quicksort_for_merge_1

quicksort_for_body_1:
    %t_401 = move %sum_2
    %sum_2 = add %sum_2 1
    %t_402 = mul %i_3 8
    %t_403 = add %t_402 8
    %t_404 = add @a_1 %t_403
    %t_405 = load %t_404
    %t_406 = slt %t_405 %x_1
    br %t_406 quicksort_if_then_1 quicksort_if_else_1

quicksort_if_else_1:
    %t_407 = move %z_r_1
    %z_r_1 = add %z_r_1 1
    %t_408 = mul %t_407 8
    %t_409 = add %t_408 8
    %t_410 = add @a_right_1 %t_409
    %t_411 = mul %i_3 8
    %t_412 = add %t_411 8
    %t_413 = add @a_1 %t_412
    %t_414 = load %t_413
    store %t_414 %t_410
    jump quicksort_if_merge_1

quicksort_if_then_1:
    %t_415 = move %z_l_1
    %z_l_1 = add %z_l_1 1
    %t_416 = mul %t_415 8
    %t_417 = add %t_416 8
    %t_418 = add @a_left_1 %t_417
    %t_419 = mul %i_3 8
    %t_420 = add %t_419 8
    %t_421 = add @a_1 %t_420
    %t_422 = load %t_421
    store %t_422 %t_418
    jump quicksort_if_merge_1

quicksort_if_merge_1:
    jump quicksort_for_step_1

quicksort_for_step_1:
    %t_423 = move %i_3
    %i_3 = add %i_3 1
    jump quicksort_for_cond_1

quicksort_for_merge_1:
    %p_1 = move %l_1
    %i_3 = move 0
    jump quicksort_for_cond_2

quicksort_for_cond_2:
    %t_424 = slt %i_3 %z_l_1
    br %t_424 quicksort_for_body_2 quicksort_for_merge_2

quicksort_for_merge_2:
    %t_425 = move %p_1
    %p_1 = add %p_1 1
    %t_426 = mul %t_425 8
    %t_427 = add %t_426 8
    %t_428 = add @a_1 %t_427
    store %x_1 %t_428
    %i_3 = move 0
    jump quicksort_for_cond_3

quicksort_for_cond_3:
    %t_429 = slt %i_3 %z_r_1
    br %t_429 quicksort_for_body_3 quicksort_for_merge_3

quicksort_for_body_3:
    %t_430 = move %p_1
    %p_1 = add %p_1 1
    %t_431 = mul %t_430 8
    %t_432 = add %t_431 8
    %t_433 = add @a_1 %t_432
    %t_434 = mul %i_3 8
    %t_435 = add %t_434 8
    %t_436 = add @a_right_1 %t_435
    %t_437 = load %t_436
    store %t_437 %t_433
    jump quicksort_for_step_2

quicksort_for_step_2:
    %t_438 = move %i_3
    %i_3 = add %i_3 1
    jump quicksort_for_cond_3

quicksort_for_merge_3:
    %t_439 = sgt %z_l_1 1
    br %t_439 quicksort_if_then_2 quicksort_if_merge_2

quicksort_if_then_2:
    %t_440 = add %l_1 %z_l_1
    %t_441 = call quicksort %l_1 %t_440 
    %t_442 = add %sum_2 %t_441
    %sum_2 = move %t_442
    jump quicksort_if_merge_2

quicksort_if_merge_2:
    %t_443 = sgt %z_r_1 1
    br %t_443 quicksort_if_then_3 quicksort_if_merge_3

quicksort_if_then_3:
    %t_444 = sub %r_1 %z_r_1
    %t_445 = call quicksort %t_444 %r_1 
    %t_446 = add %sum_2 %t_445
    %sum_2 = move %t_446
    jump quicksort_if_merge_3

quicksort_if_merge_3:
    %t_447 = move %sum_2
    ret %t_447

quicksort_for_body_2:
    %t_448 = move %p_1
    %p_1 = add %p_1 1
    %t_449 = mul %t_448 8
    %t_450 = add %t_449 8
    %t_451 = add @a_1 %t_450
    %t_452 = mul %i_3 8
    %t_453 = add %t_452 8
    %t_454 = add @a_left_1 %t_453
    %t_455 = load %t_454
    store %t_455 %t_451
    jump quicksort_for_step_3

quicksort_for_step_3:
    %t_456 = move %i_3
    %i_3 = add %i_3 1
    jump quicksort_for_cond_2

}

define i64 @calc  {
calc_entry_1:
    %i_4 = move 1
    jump calc_for_cond_1

calc_for_cond_1:
    %t_457 = sle %i_4 @n_1
    br %t_457 calc_for_body_1 calc_for_merge_1

calc_for_merge_1:
    %sum_3 = move 0
    %i_4 = move @n_1
    jump calc_for_cond_2

calc_for_cond_2:
    %t_458 = sge %i_4 1
    br %t_458 calc_for_body_2 calc_for_merge_2

calc_for_merge_2:
    %t_459 = move %sum_3
    ret %t_459

calc_for_body_2:
    %t_460 = mul %i_4 8
    %t_461 = add %t_460 8
    %t_462 = add @a_1 %t_461
    %t_463 = load %t_462
    %t_464 = mul %t_463 8
    %t_465 = add %t_464 8
    %t_466 = add @a_left_1 %t_465
    %t_467 = load %t_466
    %l_2 = move %t_467
    %t_468 = mul %i_4 8
    %t_469 = add %t_468 8
    %t_470 = add @a_1 %t_469
    %t_471 = load %t_470
    %t_472 = mul %t_471 8
    %t_473 = add %t_472 8
    %t_474 = add @a_right_1 %t_473
    %t_475 = load %t_474
    %r_2 = move %t_475
    %t_476 = mul %l_2 8
    %t_477 = add %t_476 8
    %t_478 = add @a_right_1 %t_477
    store %r_2 %t_478
    %t_479 = mul %r_2 8
    %t_480 = add %t_479 8
    %t_481 = add @a_left_1 %t_480
    store %l_2 %t_481
    %t_482 = add %sum_3 %r_2
    %t_483 = sub %t_482 %l_2
    %t_484 = sub %t_483 2
    %sum_3 = move %t_484
    jump calc_for_step_1

calc_for_step_1:
    %t_485 = move %i_4
    %i_4 = sub %i_4 1
    jump calc_for_cond_2

calc_for_body_1:
    %t_486 = mul %i_4 8
    %t_487 = add %t_486 8
    %t_488 = add @a_left_1 %t_487
    %t_489 = sub %i_4 1
    store %t_489 %t_488
    %t_490 = mul %i_4 8
    %t_491 = add %t_490 8
    %t_492 = add @a_right_1 %t_491
    %t_493 = add %i_4 1
    store %t_493 %t_492
    jump calc_for_step_2

calc_for_step_2:
    %t_494 = move %i_4
    %i_4 = add %i_4 1
    jump calc_for_cond_1

}

define i64 @mergesort  {
mergesort_entry_1:
    %t_495 = add %l_3 1
    %t_496 = seq %t_495 %r_3
    br %t_496 mergesort_if_then_1 mergesort_if_merge_1

mergesort_if_then_1:
    %t_497 = move 0
    %t_498 = move %t_497
    jump mergesort_exit_1

mergesort_if_merge_1:
    %t_499 = add %l_3 %r_3
    %t_500 = shr %t_499 1
    %mid_1 = move %t_500
    %sum_4 = move 0
    %t_501 = call mergesort %l_3 %mid_1 
    %t_502 = add %sum_4 %t_501
    %sum_4 = move %t_502
    %t_503 = call mergesort %mid_1 %r_3 
    %t_504 = add %sum_4 %t_503
    %sum_4 = move %t_504
    %n_l_1 = move 0
    %n_r_1 = move 0
    %i_5 = move %l_3
    jump mergesort_for_cond_1

mergesort_for_cond_1:
    %t_505 = slt %i_5 %mid_1
    br %t_505 mergesort_for_body_1 mergesort_for_merge_1

mergesort_for_merge_1:
    %i_5 = move %mid_1
    jump mergesort_for_cond_2

mergesort_for_cond_2:
    %t_506 = slt %i_5 %r_3
    br %t_506 mergesort_for_body_2 mergesort_for_merge_2

mergesort_for_body_2:
    %t_507 = move %n_r_1
    %n_r_1 = add %n_r_1 1
    %t_508 = mul %t_507 8
    %t_509 = add %t_508 8
    %t_510 = add @a_right_1 %t_509
    %t_511 = mul %i_5 8
    %t_512 = add %t_511 8
    %t_513 = add @a_1 %t_512
    %t_514 = load %t_513
    store %t_514 %t_510
    jump mergesort_for_step_1

mergesort_for_step_1:
    %t_515 = move %i_5
    %i_5 = add %i_5 1
    jump mergesort_for_cond_2

mergesort_for_merge_2:
    %z_l_2 = move 0
    %z_r_2 = move 0
    %z_1 = move %l_3
    jump mergesort_while_cond_1

mergesort_while_cond_1:
    %t_516 = slt %z_l_2 %n_l_1
    br %t_516 mergesort_lhs_then_1 mergesort_while_merge_1

mergesort_lhs_then_1:
    %t_517 = slt %z_r_2 %n_r_1
    br %t_517 mergesort_while_body_1 mergesort_while_merge_1

mergesort_while_body_1:
    %t_518 = move %sum_4
    %sum_4 = add %sum_4 1
    %t_519 = mul %z_l_2 8
    %t_520 = add %t_519 8
    %t_521 = add @a_left_1 %t_520
    %t_522 = mul %z_r_2 8
    %t_523 = add %t_522 8
    %t_524 = add @a_right_1 %t_523
    %t_525 = load %t_521
    %t_526 = load %t_524
    %t_527 = slt %t_525 %t_526
    br %t_527 mergesort_if_then_2 mergesort_if_else_1

mergesort_if_then_2:
    %t_528 = move %z_1
    %z_1 = add %z_1 1
    %t_529 = mul %t_528 8
    %t_530 = add %t_529 8
    %t_531 = add @a_1 %t_530
    %t_532 = move %z_l_2
    %z_l_2 = add %z_l_2 1
    %t_533 = mul %t_532 8
    %t_534 = add %t_533 8
    %t_535 = add @a_left_1 %t_534
    %t_536 = load %t_535
    store %t_536 %t_531
    jump mergesort_if_merge_2

mergesort_if_else_1:
    %t_537 = move %z_1
    %z_1 = add %z_1 1
    %t_538 = mul %t_537 8
    %t_539 = add %t_538 8
    %t_540 = add @a_1 %t_539
    %t_541 = move %z_r_2
    %z_r_2 = add %z_r_2 1
    %t_542 = mul %t_541 8
    %t_543 = add %t_542 8
    %t_544 = add @a_right_1 %t_543
    %t_545 = load %t_544
    store %t_545 %t_540
    jump mergesort_if_merge_2

mergesort_if_merge_2:
    jump mergesort_while_cond_1

mergesort_while_merge_1:
    jump mergesort_while_cond_2

mergesort_while_cond_2:
    %t_546 = slt %z_l_2 %n_l_1
    br %t_546 mergesort_while_body_2 mergesort_while_merge_2

mergesort_while_merge_2:
    jump mergesort_while_cond_3

mergesort_while_cond_3:
    %t_547 = slt %z_r_2 %n_r_1
    br %t_547 mergesort_while_body_3 mergesort_while_merge_3

mergesort_while_body_3:
    %t_548 = move %z_1
    %z_1 = add %z_1 1
    %t_549 = mul %t_548 8
    %t_550 = add %t_549 8
    %t_551 = add @a_1 %t_550
    %t_552 = move %z_r_2
    %z_r_2 = add %z_r_2 1
    %t_553 = mul %t_552 8
    %t_554 = add %t_553 8
    %t_555 = add @a_right_1 %t_554
    %t_556 = load %t_555
    store %t_556 %t_551
    jump mergesort_while_cond_3

mergesort_while_merge_3:
    %t_557 = move %sum_4
    %t_498 = move %t_557
    jump mergesort_exit_1

mergesort_exit_1:
    ret %t_498

mergesort_while_body_2:
    %t_558 = move %z_1
    %z_1 = add %z_1 1
    %t_559 = mul %t_558 8
    %t_560 = add %t_559 8
    %t_561 = add @a_1 %t_560
    %t_562 = move %z_l_2
    %z_l_2 = add %z_l_2 1
    %t_563 = mul %t_562 8
    %t_564 = add %t_563 8
    %t_565 = add @a_left_1 %t_564
    %t_566 = load %t_565
    store %t_566 %t_561
    jump mergesort_while_cond_2

mergesort_for_body_1:
    %t_567 = move %n_l_1
    %n_l_1 = add %n_l_1 1
    %t_568 = mul %t_567 8
    %t_569 = add %t_568 8
    %t_570 = add @a_left_1 %t_569
    %t_571 = mul %i_5 8
    %t_572 = add %t_571 8
    %t_573 = add @a_1 %t_572
    %t_574 = load %t_573
    store %t_574 %t_570
    jump mergesort_for_step_2

mergesort_for_step_2:
    %t_575 = move %i_5
    %i_5 = add %i_5 1
    jump mergesort_for_cond_1

}

define i64 @heapsort  {
heapsort_entry_1:
    %sum_5 = move 0
    %i_6 = move 1
    jump heapsort_for_cond_1

heapsort_for_cond_1:
    %t_576 = sle %i_6 @n_1
    br %t_576 heapsort_for_body_1 heapsort_for_merge_1

heapsort_for_merge_1:
    %heap_size_1 = move @n_1
    %i_6 = move 1
    jump heapsort_for_cond_2

heapsort_for_cond_2:
    %t_577 = sle %i_6 @n_1
    br %t_577 heapsort_for_body_2 heapsort_for_merge_2

heapsort_for_body_2:
    %t_578 = mul %i_6 8
    %t_579 = add %t_578 8
    %t_580 = add @a_1 %t_579
    %t_581 = mul 1 8
    %t_582 = add %t_581 8
    %t_583 = add @heap_1 %t_582
    %t_584 = load %t_583
    store %t_584 %t_580
    %t_585 = mul 1 8
    %t_586 = add %t_585 8
    %t_587 = add @heap_1 %t_586
    %t_588 = move %heap_size_1
    %heap_size_1 = sub %heap_size_1 1
    %t_589 = mul %t_588 8
    %t_590 = add %t_589 8
    %t_591 = add @heap_1 %t_590
    %t_592 = load %t_591
    store %t_592 %t_587
    %x_2 = move 1
    jump heapsort_while_cond_1

heapsort_while_cond_1:
    %t_593 = shl %x_2 1
    %t_594 = sle %t_593 %heap_size_1
    br %t_594 heapsort_while_body_1 heapsort_while_merge_1

heapsort_while_body_1:
    %t_595 = shl %x_2 1
    %l_4 = move %t_595
    %t_596 = add %l_4 1
    %r_4 = move %t_596
    %y_1 = move %l_4
    %t_597 = sle %r_4 %heap_size_1
    br %t_597 heapsort_if_then_1 heapsort_if_merge_1

heapsort_if_then_1:
    %t_598 = move %sum_5
    %sum_5 = add %sum_5 1
    %t_599 = mul %r_4 8
    %t_600 = add %t_599 8
    %t_601 = add @heap_1 %t_600
    %t_602 = mul %l_4 8
    %t_603 = add %t_602 8
    %t_604 = add @heap_1 %t_603
    %t_605 = load %t_601
    %t_606 = load %t_604
    %t_607 = slt %t_605 %t_606
    br %t_607 heapsort_if_then_2 heapsort_if_merge_2

heapsort_if_then_2:
    %y_1 = move %r_4
    jump heapsort_if_merge_2

heapsort_if_merge_2:
    jump heapsort_if_merge_1

heapsort_if_merge_1:
    %t_608 = move %sum_5
    %sum_5 = add %sum_5 1
    %t_609 = mul %x_2 8
    %t_610 = add %t_609 8
    %t_611 = add @heap_1 %t_610
    %t_612 = mul %y_1 8
    %t_613 = add %t_612 8
    %t_614 = add @heap_1 %t_613
    %t_615 = load %t_611
    %t_616 = load %t_614
    %t_617 = slt %t_615 %t_616
    br %t_617 heapsort_if_then_3 heapsort_if_merge_3

heapsort_if_then_3:
    jump heapsort_while_merge_1

heapsort_if_merge_3:
    %t_618 = mul %x_2 8
    %t_619 = add %t_618 8
    %t_620 = add @heap_1 %t_619
    %t_621 = load %t_620
    %tmp_1 = move %t_621
    %t_622 = mul %x_2 8
    %t_623 = add %t_622 8
    %t_624 = add @heap_1 %t_623
    %t_625 = mul %y_1 8
    %t_626 = add %t_625 8
    %t_627 = add @heap_1 %t_626
    %t_628 = load %t_627
    store %t_628 %t_624
    %t_629 = mul %y_1 8
    %t_630 = add %t_629 8
    %t_631 = add @heap_1 %t_630
    store %tmp_1 %t_631
    %tmp_1 = move %x_2
    %x_2 = move %y_1
    %y_1 = move %tmp_1
    jump heapsort_while_cond_1

heapsort_while_merge_1:
    jump heapsort_for_step_1

heapsort_for_step_1:
    %t_632 = move %i_6
    %i_6 = add %i_6 1
    jump heapsort_for_cond_2

heapsort_for_merge_2:
    %t_633 = move %sum_5
    ret %t_633

heapsort_for_body_1:
    %t_634 = mul %i_6 8
    %t_635 = add %t_634 8
    %t_636 = add @heap_1 %t_635
    %t_637 = mul %i_6 8
    %t_638 = add %t_637 8
    %t_639 = add @a_1 %t_638
    %t_640 = load %t_639
    store %t_640 %t_636
    %x_3 = move %i_6
    jump heapsort_while_cond_2

heapsort_while_cond_2:
    %t_641 = sne %x_3 1
    br %t_641 heapsort_while_body_2 heapsort_while_merge_2

heapsort_while_body_2:
    %t_642 = move %sum_5
    %sum_5 = add %sum_5 1
    %t_643 = mul %x_3 8
    %t_644 = add %t_643 8
    %t_645 = add @heap_1 %t_644
    %t_646 = shr %x_3 1
    %t_647 = mul %t_646 8
    %t_648 = add %t_647 8
    %t_649 = add @heap_1 %t_648
    %t_650 = load %t_645
    %t_651 = load %t_649
    %t_652 = sgt %t_650 %t_651
    br %t_652 heapsort_if_then_4 heapsort_if_merge_4

heapsort_if_then_4:
    jump heapsort_while_merge_2

heapsort_if_merge_4:
    %t_653 = mul %x_3 8
    %t_654 = add %t_653 8
    %t_655 = add @heap_1 %t_654
    %t_656 = load %t_655
    %tmp_1 = move %t_656
    %t_657 = mul %x_3 8
    %t_658 = add %t_657 8
    %t_659 = add @heap_1 %t_658
    %t_660 = shr %x_3 1
    %t_661 = mul %t_660 8
    %t_662 = add %t_661 8
    %t_663 = add @heap_1 %t_662
    %t_664 = load %t_663
    store %t_664 %t_659
    %t_665 = shr %x_3 1
    %t_666 = mul %t_665 8
    %t_667 = add %t_666 8
    %t_668 = add @heap_1 %t_667
    store %tmp_1 %t_668
    %t_669 = shr %x_3 1
    %x_3 = move %t_669
    jump heapsort_while_cond_2

heapsort_while_merge_2:
    jump heapsort_for_step_2

heapsort_for_step_2:
    %t_670 = move %i_6
    %i_6 = add %i_6 1
    jump heapsort_for_cond_1

}

define i64 @main  {
main_entry_1:
    %t_671 = call getInt 
    @n_1 = move %t_671
    %t_672 = call getInt 
    %k_1 = move %t_672
    %i_7 = move 1
    jump main_for_cond_1

main_for_cond_1:
    %t_673 = sle %i_7 @n_1
    br %t_673 main_for_body_1 main_for_merge_1

main_for_body_1:
    %t_674 = mul %i_7 8
    %t_675 = add %t_674 8
    %t_676 = add @a_1 %t_675
    store %i_7 %t_676
    %t_677 = sle %i_7 %k_1
    br %t_677 main_if_then_1 main_if_merge_1

main_if_then_1:
    %t_678 = mul %i_7 8
    %t_679 = add %t_678 8
    %t_680 = add @a_1 %t_679
    %t_681 = add %k_1 1
    %t_682 = sub %t_681 %i_7
    store %t_682 %t_680
    jump main_if_merge_1

main_if_merge_1:
    %t_683 = mul %i_7 8
    %t_684 = add %t_683 8
    %t_685 = add @bak_1 %t_684
    %t_686 = mul %i_7 8
    %t_687 = add %t_686 8
    %t_688 = add @a_1 %t_687
    %t_689 = load %t_688
    store %t_689 %t_685
    jump main_for_step_1

main_for_step_1:
    %t_690 = move %i_7
    %i_7 = add %i_7 1
    jump main_for_cond_1

main_for_merge_1:
    %t_691 = add @n_1 1
    %t_692 = call quicksort 1 %t_691 
    %ans1_1 = move %t_692
    call restore 
    %t_693 = call calc 
    %ans2_1 = move %t_693
    call restore 
    %t_694 = add @n_1 1
    %t_695 = call mergesort 1 %t_694 
    %ans3_1 = move %t_695
    call restore 
    %t_696 = call heapsort 
    %ans4_1 = move %t_696
    %t_697 = call toString %ans1_1 
    call println %t_697 
    %t_698 = call toString %ans2_1 
    call println %t_698 
    %t_699 = call toString %ans3_1 
    call println %t_699 
    %t_700 = call toString %ans4_1 
    call println %t_700 
    %t_701 = alloc 8
    call A_A %t_701 
    %a_2 = move %t_701
    call A_Optimizer %a_2 
    %t_702 = move 0
    ret %t_702

}

define i64 @__init  {
__init_entry_1:
    @N_1 = move 100000
    %t_703 = mul @N_1 8
    %t_703 = add %t_703 8
    %t_704 = alloc %t_703
    store @N_1 %t_704
    @a_1 = move %t_704
    %t_705 = mul @N_1 8
    %t_705 = add %t_705 8
    %t_706 = alloc %t_705
    store @N_1 %t_706
    @bak_1 = move %t_706
    %t_707 = mul @N_1 8
    %t_707 = add %t_707 8
    %t_708 = alloc %t_707
    store @N_1 %t_708
    @a_left_1 = move %t_708
    %t_709 = mul @N_1 8
    %t_709 = add %t_709 8
    %t_710 = alloc %t_709
    store @N_1 %t_710
    @a_right_1 = move %t_710
    %t_711 = mul @N_1 8
    %t_711 = add %t_711 8
    %t_712 = alloc %t_711
    store @N_1 %t_712
    @heap_1 = move %t_712
    %t_713 = call main 
    %t_714 = move %t_713
    ret %t_714

}


__builtin_string_add:
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbp
        push    rbx
        mov     rbp, rsi
        sub     rsp, 24
        mov     rbx, qword [rdi]
        mov     r15, qword [rsi]
        mov     qword [rsp+8H], rdi
        lea     edi, [rbx+r15+9H]
        movsxd  rdi, edi
        call    malloc
        mov     r14, rax
        lea     eax, [r15+rbx]
        test    ebx, ebx
        lea     r12, [r14+8H]
        mov     rcx, qword [rsp+8H]
        cdqe
        mov     qword [r14], rax
        jle     L_003
        lea     r13d, [rbx-1H]
        lea     rsi, [rcx+8H]
        mov     rdi, r12
        lea     rdx, [r13+1H]
        mov     rbx, r13
        call    memcpy
L_001:  test    r15d, r15d
        jle     L_002
        lea     r13d, [r15-1H]
        movsxd  rbx, ebx
        lea     rsi, [rbp+8H]
        lea     rdi, [r14+rbx+9H]
        add     r13, 1
        mov     rdx, r13
        add     r13, rbx
        call    memcpy
L_002:  mov     byte [r12+r13+1H], 0
        add     rsp, 24
        mov     rax, r14
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   8
L_003:  mov     r13, -1
        mov     ebx, r13d
        jmp     L_001







ALIGN   16

__builtin_string_equal:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        sete    al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

__builtin_string_inequal:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        setne   al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

__builtin_string_less:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        add     rsp, 8
        shr     eax, 31
        ret






ALIGN   8

__builtin_string_less_equal:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        setle   al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

__builtin_string_great:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        setg    al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

__builtin_string_great_equal:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        not     eax
        add     rsp, 8
        shr     eax, 31
        ret






ALIGN   8

__builtin_print:
        lea     rdx, [rdi+8H]
        lea     rsi, [rel LC0]
        mov     edi, 1
        xor     eax, eax
        jmp     __printf_chk







ALIGN   16

__builtin_println:
        add     rdi, 8
        jmp     puts






ALIGN   8

__builtin_printInt:
        push    rbp
        push    rbx
        sub     rsp, 56


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+28H], rax
        xor     eax, eax
        test    edi, edi
        je      L_008
        mov     ebx, edi
        js      L_007
L_004:  mov     eax, ebx
        mov     esi, 3435973837
        mov     edi, ebx
        mul     esi
        mov     ecx, edx
        shr     ecx, 3
        lea     eax, [rcx+rcx*4]
        add     eax, eax
        sub     edi, eax
        test    ecx, ecx
        mov     dword [rsp], edi
        je      L_010
        mov     eax, ecx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mov     dword [rsp+4H], ecx
        mov     ecx, 1374389535
        mul     ecx
        mov     ecx, edx
        shr     ecx, 5
        test    ecx, ecx
        je      L_011
        mov     eax, ecx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 274877907
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+8H], ecx
        shr     edx, 6
        test    edx, edx
        mov     ecx, edx
        je      L_012
        mov     eax, edx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 3518437209
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+0CH], ecx
        mov     ecx, edx
        shr     ecx, 13
        test    ecx, ecx
        je      L_009
        mov     eax, ecx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, ebx
        shr     edx, 5
        add     eax, eax
        sub     ecx, eax
        mov     eax, edx
        mov     dword [rsp+10H], ecx
        mov     ecx, 175921861
        mul     ecx
        mov     ecx, edx
        shr     ecx, 7
        test    ecx, ecx
        je      L_013
        mov     eax, ecx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1125899907
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+14H], ecx
        shr     edx, 18
        test    edx, edx
        mov     ecx, edx
        je      L_014
        mov     eax, edx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1801439851
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+18H], ecx
        mov     ecx, edx
        shr     ecx, 22
        test    ecx, ecx
        je      L_016
        mov     eax, ecx
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1441151881
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+1CH], ecx
        shr     edx, 25
        test    edx, edx
        mov     ecx, edx
        je      L_017
        mov     eax, edx
        shr     ebx, 9
        mul     esi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 281475
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+20H], ecx
        shr     edx, 7
        test    edx, edx
        je      L_015
        mov     dword [rsp+24H], edx
        mov     eax, 10
L_005:  sub     eax, 1
        lea     rbp, [rsp-4H]
        cdqe
        shl     rax, 2
        lea     rbx, [rsp+rax]




ALIGN   8
L_006:  mov     eax, dword [rbx]
        mov     rsi, qword [rel stdout]
        sub     rbx, 4
        lea     edi, [rax+30H]
        call    _IO_putc
        cmp     rbx, rbp
        jnz     L_006
        mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_018
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret





ALIGN   8
L_007:  mov     rsi, qword [rel stdout]
        mov     edi, 45
        neg     ebx
        call    _IO_putc
        jmp     L_004

L_008:  mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_018
        mov     rsi, qword [rel stdout]
        add     rsp, 56
        mov     edi, 48
        pop     rbx
        pop     rbp
        jmp     _IO_putc





ALIGN   8
L_009:  mov     eax, 4
        jmp     L_005





ALIGN   8
L_010:  mov     eax, 1
        jmp     L_005





ALIGN   8
L_011:  mov     eax, 2
        jmp     L_005





ALIGN   8
L_012:  mov     eax, 3
        jmp     L_005





ALIGN   8
L_013:  mov     eax, 5
        jmp     L_005





ALIGN   8
L_014:  mov     eax, 6
        jmp     L_005

L_015:  mov     eax, 9
        jmp     L_005

L_016:  mov     eax, 7
        jmp     L_005

L_017:  mov     eax, 8
        jmp     L_005


L_018:
        call    __stack_chk_fail




ALIGN   8

__builtin_printlnInt:
        push    rbp
        push    rbx
        sub     rsp, 56
        mov     rsi, qword [rel stdout]


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+28H], rax
        xor     eax, eax
        test    edi, edi
        je      L_023
        mov     ebx, edi
        js      L_022
L_019:  mov     eax, ebx
        mov     edi, 3435973837
        mul     edi
        mov     ecx, edx
        mov     edx, ebx
        shr     ecx, 3
        lea     eax, [rcx+rcx*4]
        add     eax, eax
        sub     edx, eax
        test    ecx, ecx
        mov     dword [rsp], edx
        je      L_026
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mov     dword [rsp+4H], ecx
        mov     ecx, 1374389535
        mul     ecx
        mov     ecx, edx
        shr     ecx, 5
        test    ecx, ecx
        je      L_027
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 274877907
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+8H], ecx
        mov     ecx, edx
        shr     ecx, 6
        test    ecx, ecx
        je      L_028
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 3518437209
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+0CH], ecx
        mov     ecx, edx
        shr     ecx, 13
        test    ecx, ecx
        je      L_025
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, ebx
        shr     edx, 5
        add     eax, eax
        sub     ecx, eax
        mov     eax, edx
        mov     dword [rsp+10H], ecx
        mov     ecx, 175921861
        mul     ecx
        shr     edx, 7
        test    edx, edx
        mov     ecx, edx
        je      L_029
        mov     eax, edx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1125899907
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+14H], ecx
        mov     ecx, edx
        shr     ecx, 18
        test    ecx, ecx
        je      L_030
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1801439851
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+18H], ecx
        mov     ecx, edx
        shr     ecx, 22
        test    ecx, ecx
        je      L_032
        mov     eax, ecx
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 1441151881
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+1CH], ecx
        shr     edx, 25
        test    edx, edx
        mov     ecx, edx
        je      L_033
        mov     eax, edx
        shr     ebx, 9
        mul     edi
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     edx, 281475
        add     eax, eax
        sub     ecx, eax
        mov     eax, ebx
        mul     edx
        mov     dword [rsp+20H], ecx
        shr     edx, 7
        test    edx, edx
        je      L_031
        mov     dword [rsp+24H], edx
        mov     eax, 10
L_020:  sub     eax, 1
        lea     rbp, [rsp-4H]
        cdqe
        shl     rax, 2
        lea     rbx, [rsp+rax]
L_021:  mov     eax, dword [rbx]
        sub     rbx, 4
        lea     edi, [rax+30H]
        call    _IO_putc
        cmp     rbx, rbp
        mov     rsi, qword [rel stdout]
        jnz     L_021
        jmp     L_024





ALIGN   8
L_022:  mov     edi, 45
        neg     ebx
        call    _IO_putc
        mov     rsi, qword [rel stdout]
        jmp     L_019





ALIGN   16
L_023:  mov     edi, 48
        call    _IO_putc
        mov     rsi, qword [rel stdout]
L_024:  mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_034
        add     rsp, 56
        mov     edi, 10
        pop     rbx
        pop     rbp
        jmp     _IO_putc





ALIGN   8
L_025:  mov     eax, 4
        jmp     L_020





ALIGN   8
L_026:  mov     eax, 1
        jmp     L_020





ALIGN   8
L_027:  mov     eax, 2
        jmp     L_020





ALIGN   8
L_028:  mov     eax, 3
        jmp     L_020





ALIGN   8
L_029:  mov     eax, 5
        jmp     L_020





ALIGN   8
L_030:  mov     eax, 6
        jmp     L_020

L_031:  mov     eax, 9
        jmp     L_020

L_032:  mov     eax, 7
        jmp     L_020

L_033:  mov     eax, 8
        jmp     L_020

L_034:
        call    __stack_chk_fail
        nop





ALIGN   16

__builtin_getString:
        push    rbp
        push    rbx
        mov     edi, 266
        sub     rsp, 8
        call    malloc
        lea     rbx, [rax+8H]
        lea     rdi, [rel LC0]
        mov     rbp, rax
        xor     eax, eax
        mov     rsi, rbx
        call    scanf
        mov     rdx, rbx
L_035:  mov     ecx, dword [rdx]
        add     rdx, 4
        lea     eax, [rcx-1010101H]
        not     ecx
        and     eax, ecx
        and     eax, 80808080H
        jz      L_035
        mov     ecx, eax
        shr     ecx, 16
        test    eax, 8080H
        cmove   eax, ecx
        lea     rcx, [rdx+2H]
        mov     esi, eax
        cmove   rdx, rcx
        add     sil, al
        mov     rax, rbp
        sbb     rdx, 3
        sub     rdx, rbx
        mov     qword [rbp], rdx
        add     rsp, 8
        pop     rbx
        pop     rbp
        ret






ALIGN   16

__builtin_getInt:
        mov     rdi, qword [rel stdin]
        push    r12
        push    rbp
        push    rbx
        call    _IO_getc
        lea     edx, [rax-30H]
        cmp     dl, 9
        jbe     L_040
        mov     ebx, eax
        xor     ebp, ebp
        mov     r12d, 1




ALIGN   8
L_036:  mov     rdi, qword [rel stdin]
        cmp     bl, 45
        cmove   ebp, r12d
        call    _IO_getc
        movsx   ebx, al
        sub     eax, 48
        cmp     al, 9
        ja      L_036
        sub     ebx, 48
        movsxd  rbx, ebx
        jmp     L_038





ALIGN   8
L_037:  lea     rax, [rbx+rbx*4]
        lea     rbx, [rdx+rax*2-30H]
L_038:  mov     rdi, qword [rel stdin]
        call    _IO_getc
        movsx   rdx, al
        sub     eax, 48
        cmp     al, 9
        jbe     L_037
        mov     rax, rbx
        neg     rax
        test    bpl, bpl
        cmovne  rbx, rax
L_039:  mov     rax, rbx
        pop     rbx
        pop     rbp
        pop     r12
        ret





ALIGN   8
L_040:  mov     rdi, qword [rel stdin]
        movsx   ebx, al
        sub     ebx, 48
        movsxd  rbx, ebx
        call    _IO_getc
        movsx   rdx, al
        sub     eax, 48
        cmp     al, 9
        ja      L_039
        xor     ebp, ebp
        jmp     L_037






ALIGN   8

__builtin_toString:
        push    r12
        push    rbp
        push    rbx
        sub     rsp, 64


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+38H], rax
        xor     eax, eax
        test    edi, edi
        js      L_042
        jne     L_046
        mov     edi, 10
        mov     dword [rsp+4H], 0
        call    malloc
        movzx   edi, byte [rsp+4H]
        mov     qword [rax], 1
        mov     byte [rax+9H], 0
        lea     edx, [rdi+30H]
        mov     byte [rax+8H], dl
L_041:  mov     rdi, qword [rsp+38H]


        xor     rdi, qword [fs:abs 28H]
        jne     L_056
        add     rsp, 64
        pop     rbx
        pop     rbp
        pop     r12
        ret






ALIGN   16
L_042:  neg     edi
        mov     ebp, 1
L_043:  mov     eax, edi
        mov     edx, 3435973837
        mov     ebx, edi
        mul     edx
        shr     edx, 3
        lea     eax, [rdx+rdx*4]
        mov     ecx, edx
        add     eax, eax
        sub     ebx, eax
        test    edx, edx
        mov     dword [rsp+4H], ebx
        je      L_047
        mov     eax, edx
        mov     esi, 1717986919
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 1374389535
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+8H], ecx
        shr     edx, 5
        test    edx, edx
        mov     ecx, edx
        je      L_048
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 274877907
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+0CH], ecx
        shr     edx, 6
        test    edx, edx
        mov     ecx, edx
        je      L_049
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 3518437209
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+10H], ecx
        shr     edx, 13
        test    edx, edx
        mov     ecx, edx
        je      L_051
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, edi
        shr     edx, 5
        add     eax, eax
        sub     ecx, eax
        mov     eax, edx
        mov     dword [rsp+14H], ecx
        mov     ecx, 175921861
        mul     ecx
        shr     edx, 7
        test    edx, edx
        mov     ecx, edx
        je      L_050
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 1125899907
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+18H], ecx
        shr     edx, 18
        test    edx, edx
        mov     ecx, edx
        je      L_052
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 1801439851
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+1CH], ecx
        shr     edx, 22
        test    edx, edx
        mov     ecx, edx
        je      L_053
        mov     eax, edx
        imul    esi
        shr     edx, 2
        lea     eax, [rdx+rdx*4]
        mov     edx, 1441151881
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+20H], ecx
        shr     edx, 25
        test    edx, edx
        mov     ecx, edx
        je      L_054
        mov     eax, edx
        shr     edi, 9
        imul    esi
        mov     esi, edx
        mov     edx, 281475
        shr     esi, 2
        lea     eax, [rsi+rsi*4]
        add     eax, eax
        sub     ecx, eax
        mov     eax, edi
        mul     edx
        mov     dword [rsp+24H], ecx
        shr     edx, 7
        test    edx, edx
        je      L_055
        mov     dword [rsp+28H], edx
        mov     ebx, 10
L_044:  lea     r12d, [rbx+rbp]
        lea     edi, [r12+9H]
        movsxd  r12, r12d
        movsxd  rdi, edi
        call    malloc
        test    ebp, ebp
        mov     qword [rax], r12
        lea     rdx, [rax+8H]
        mov     byte [rax+r12+8H], 0
        jz      L_045
        mov     byte [rax+8H], 45
L_045:  movsxd  rcx, ebx
        movsxd  rsi, ebp
        mov     ecx, dword [rsp+rcx*4]
        add     ecx, 48
        cmp     ebx, 1
        mov     byte [rdx+rsi], cl
        je      L_041
        lea     esi, [rbx-1H]
        lea     ecx, [rbp+1H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 2
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-2H]
        lea     ecx, [rbp+2H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 3
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-3H]
        lea     ecx, [rbp+3H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 4
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-4H]
        lea     ecx, [rbp+4H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 5
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-5H]
        lea     ecx, [rbp+5H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 6
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-6H]
        lea     ecx, [rbp+6H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 7
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-7H]
        lea     ecx, [rbp+7H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 8
        mov     byte [rdx+rcx], sil
        je      L_041
        lea     esi, [rbx-8H]
        lea     ecx, [rbp+8H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 9
        mov     byte [rdx+rcx], sil
        je      L_041
        movzx   ebx, byte [rsp+4H]
        add     ebp, 9
        movsxd  rbp, ebp
        lea     ecx, [rbx+30H]
        mov     byte [rdx+rbp], cl
        jmp     L_041





ALIGN   8
L_046:  xor     ebp, ebp
        jmp     L_043






ALIGN   16
L_047:  mov     ebx, 1
        jmp     L_044





ALIGN   8
L_048:  mov     ebx, 2
        jmp     L_044





ALIGN   8
L_049:  mov     ebx, 3
        jmp     L_044





ALIGN   8
L_050:  mov     ebx, 5
        jmp     L_044





ALIGN   8
L_051:  mov     ebx, 4
        jmp     L_044





ALIGN   8
L_052:  mov     ebx, 6
        jmp     L_044





ALIGN   8
L_053:  mov     ebx, 7
        jmp     L_044





ALIGN   8
L_054:  mov     ebx, 8
        jmp     L_044





ALIGN   8
L_055:  mov     ebx, 9
        jmp     L_044


L_056:
        call    __stack_chk_fail
        nop
ALIGN   16

__builtin_string_substring:
        push    r15
        push    r14
        push    r13
        movsxd  r13, esi
        push    r12
        push    rbp
        push    rbx
        mov     ebx, edx
        sub     ebx, r13d
        mov     r12, rdi
        lea     edi, [rbx+0AH]
        lea     r15d, [rbx+1H]
        sub     rsp, 8
        movsxd  rdi, edi
        movsxd  r14, r15d
        call    malloc
        test    r15d, r15d
        mov     rbp, rax
        mov     qword [rax], r14
        jle     L_057
        mov     edx, ebx
        lea     rdi, [rax+8H]
        lea     rsi, [r12+r13+8H]
        add     rdx, 1
        call    memcpy
L_057:  mov     byte [rbp+r14+8H], 0
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret






ALIGN   16

__builtin_string_parseInt:
        mov     edx, 1
        xor     esi, esi
        mov     r9d, 1
        jmp     L_059





ALIGN   8
L_058:  cmp     al, 45
        cmove   esi, r9d
        add     rdx, 1
L_059:  movsx   eax, byte [rdi+rdx+7H]
        movsxd  r8, edx
        lea     ecx, [rax-30H]
        cmp     cl, 9
        ja      L_058
        movsx   edx, byte [rdi+r8+8H]
        sub     eax, 48
        lea     ecx, [rdx-30H]
        cmp     cl, 9
        ja      L_061
        lea     rcx, [rdi+r8+9H]
L_060:  lea     eax, [rax+rax*4]
        add     rcx, 1
        lea     eax, [rdx+rax*2-30H]
        movsx   edx, byte [rcx-1H]
        lea     edi, [rdx-30H]
        cmp     dil, 9
        jbe     L_060
L_061:  mov     edx, eax
        neg     edx
        test    sil, sil
        cmovne  eax, edx
        ret







ALIGN   16

__builtin_string_ord:
        add     esi, 8
        movsxd  rsi, esi
        movsx   eax, byte [rdi+rsi]
        ret



SECTION .data


SECTION .bss


SECTION .rodata.str1.1

LC0:
        db 25H, 73H, 00H
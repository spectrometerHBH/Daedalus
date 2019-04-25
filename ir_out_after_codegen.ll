define void @f  %a_1.0 %b_1.0 %c_1.0 %d_1.0 %e_1.0 %f_1.0 %g_1.0 %h_1.0 {
f_entry_1:
    %h_1.0 = load %rbp_1.-1 null 0 24
    %g_1.0 = load %rbp_1.-1 null 0 16
    %f_1.0 = move %r9_1.-1
    %e_1.0 = move %r8_1.-1
    %d_1.0 = move %rcx_1.-1
    %c_1.0 = move %rdx_1.-1
    %b_1.0 = move %rsi_1.-1
    %a_1.0 = move %rdi_1.-1
    %t_1.0 = move %a_1.0
    %t_1.0 = add %t_1.0 %b_1.0
    %t_2.0 = move %t_1.0
    %t_2.0 = add %t_2.0 %c_1.0
    %t_3.0 = move %t_2.0
    %t_3.0 = add %t_3.0 %d_1.0
    %t_4.0 = move %t_3.0
    %t_4.0 = add %t_4.0 %e_1.0
    %t_5.0 = move %t_4.0
    %t_5.0 = add %t_5.0 %f_1.0
    %t_6.0 = move %t_5.0
    %t_6.0 = add %t_6.0 %g_1.0
    %t_7.0 = move %t_6.0
    %t_7.0 = add %t_7.0 %h_1.0
    %rax_1.-1 = move %t_7.0
    ret 

}

define void @main  {
main_entry_1:
    store 2 %rsp_1.-1 null 0 8
    store 1 %rsp_1.-1 null 0 0
    %rdi_1.-1 = move 1
    %rsi_1.-1 = move 1
    %rdx_1.-1 = move 1
    %rcx_1.-1 = move 1
    %r8_1.-1 = move 1
    %r9_1.-1 = move 1
    %rax_1.-1 = call f %rdi_1.-1 %rsi_1.-1 %rdx_1.-1 %rcx_1.-1 %r8_1.-1 %r9_1.-1 
    %t_8.0 = move %rax_1.-1
    %rax_1.-1 = move 0
    ret 

}

define void @__init  {
__init_entry_1:
    %rax_1.-1 = call main 
    %t_9.0 = move %rax_1.-1
    %rax_1.-1 = move %t_9.0
    ret 

}


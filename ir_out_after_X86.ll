define i64 @__init  {
__init_entry_1:
    %temp_vr14_1 = move %vr14_1
    %temp_vr15_1 = move %vr15_1
    %temp_vr13_1 = move %vr13_1
    %temp_vr12_1 = move %vr12_1
    %temp_vrbx_1 = move %vrbx_1
    %vrax_1 = call getString 
    %t_1 = move %vrax_1
    %t_2 = load %t_1 null 0 0
    %vrdi_1 = move %t_2
    %vrax_1 = call toString %vrdi_1 
    %t_3 = move %vrax_1
    %vrdi_1 = move %t_3
    call println %vrdi_1 
    %vrax_1 = move 0
    %vr14_1 = move %temp_vr14_1
    %vr15_1 = move %temp_vr15_1
    %vr13_1 = move %temp_vr13_1
    %vr12_1 = move %temp_vr12_1
    %vrbx_1 = move %temp_vrbx_1
    ret %vrax_1

}


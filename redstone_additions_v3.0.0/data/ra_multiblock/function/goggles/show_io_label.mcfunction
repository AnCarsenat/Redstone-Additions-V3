# /ra_multiblock:goggles/show_io_label
# MACRO FUNCTION — Show colored I/O indicator label above a multiblock IO block
# Context: as multiblock marker entity, at base position
# Input: $(x) $(y) $(z) = block offset from base, $(label) = text, $(color) = text color
# Labels are positioned at y+2.3 above the IO block to clear 3-tall structures

$execute positioned ~$(x) ~$(y) ~$(z) align xyz run summon text_display ~0.5 ~2.3 ~0.5 {Tags:["ra.billboard","ra.display"],billboard:"center",text:{text:"$(label)",color:"$(color)",italic:false},background:553648127,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}

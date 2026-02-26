# /ra:tools/goggles/billboard/show_output
# MACRO FUNCTION — Show red output indicator at IO block position
# Context: as multiblock marker, at base position
# Input: $(label) = text label, $(x) $(y) $(z) = block offset from base

$execute positioned ~$(x) ~$(y) ~$(z) align xyz run summon text_display ~0.5 ~1.3 ~0.5 {Tags:["ra.billboard","ra.display"],billboard:"center",text:{text:"$(label)",color:"red",italic:false},background:553648127,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}

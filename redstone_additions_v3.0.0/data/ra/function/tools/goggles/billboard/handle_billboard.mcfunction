# /ra:tools/goggles/billboard/handle_billboard
# MACRO FUNCTION — Summon text_display billboard above custom block
# Context: as custom block armor stand, at block position
# Input: $(name) = display name of the block

$summon text_display ~ ~1.2 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:{text:"$(name)",color:"gold",bold:false},background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}

# Show block status below the name
function ra:tools/goggles/status/read_status

# /ra:tools/goggles/billboard/show_nbt_line
# MACRO FUNCTION - Show a value line sourced from entity NBT with fallback
# Context: as source entity, at source position
# Input:
#   $(y)           = vertical offset
#   $(label)       = gray prefix label
#   $(path)        = NBT path on @s
#   $(suffix)      = gray suffix text
#   $(value_color) = color for rendered NBT value
#   $(fallback)    = fallback text when NBT path is missing

$execute if data entity @s $(path) run summon text_display ~ ~$(y) ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"$(label)",color:"gray"},{nbt:"$(path)",entity:"@s",color:"$(value_color)"},{text:"$(suffix)",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
$execute unless data entity @s $(path) run summon text_display ~ ~$(y) ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"$(label)",color:"gray"},{text:"$(fallback)",color:"red"},{text:"$(suffix)",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
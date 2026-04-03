# /ra:tools/goggles/billboard/show_score_line
# MACRO FUNCTION - Show a value line sourced from scoreboard with fallback
# Context: as source entity, at source position
# Input:
#   $(y)           = vertical offset
#   $(label)       = gray prefix label
#   $(objective)   = scoreboard objective name
#   $(suffix)      = gray suffix text
#   $(value_color) = color for rendered score value
#   $(fallback)    = fallback text when score is missing

$execute if score @s $(objective) matches -2147483648..2147483647 run summon text_display ~ ~$(y) ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"$(label)",color:"gray"},{score:{name:"@s",objective:"$(objective)"},color:"$(value_color)"},{text:"$(suffix)",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
$execute unless score @s $(objective) matches -2147483648..2147483647 run summon text_display ~ ~$(y) ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"$(label)",color:"gray"},{text:"$(fallback)",color:"red"},{text:"$(suffix)",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
# /ra:tools/goggles/billboard/show_literal_line
# MACRO FUNCTION - Show a value line from literal storage values
# Context: as source entity, at source position
# Input:
#   $(y)           = vertical offset
#   $(label)       = gray prefix label
#   $(value)       = literal text value to render
#   $(suffix)      = gray suffix text
#   $(value_color) = color for rendered value

$summon text_display ~ ~$(y) ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"$(label)",color:"gray"},{text:"$(value)",color:"$(value_color)"},{text:"$(suffix)",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
# /ra_gates:goggles/draw_display_uni_gate
# Context: as uni_gate armor stand, at block position
# Shows name + current gate mode

summon text_display ~ ~1.2 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:{text:"UNI Gate",color:"gold"},background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}

execute if data entity @s data.properties.gate_type run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Mode: ",color:"gray"},{nbt:"data.properties.gate_type",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

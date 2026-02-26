# /ra_sensors:goggles/draw_display_entity_detector
# Context: as entity_detector armor stand, at block position

summon text_display ~ ~1.2 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:{text:"Entity Detector",color:"gold"},background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}

execute if data entity @s data.properties.entity_selector run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Target: ",color:"gray"},{nbt:"data.properties.entity_selector",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

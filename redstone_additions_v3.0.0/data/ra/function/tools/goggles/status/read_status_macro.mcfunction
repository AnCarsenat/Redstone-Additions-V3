# /ra:tools/goggles/status/read_status_macro
# Display block-type-specific status billboard
# Context: as custom block armor stand, at block position

# Gate status: show current mode
execute if entity @s[tag=ra.custom_block.uni_gate] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Mode: ",color:"gray"},{nbt:"data.properties.gate_type",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Wireless status: show channel
execute if entity @s[tag=ra.custom_block.emitter] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Channel: ",color:"gray"},{nbt:"data.properties.channel",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}
execute if entity @s[tag=ra.custom_block.receiver] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Channel: ",color:"gray"},{nbt:"data.properties.channel",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Sensor status: show entity selector
execute if entity @s[tag=ra.custom_block.entity_detector] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Target: ",color:"gray"},{nbt:"data.properties.entity_selector",entity:"@s",color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Clock status: show cooldown
execute if entity @s[tag=ra.custom_block.clock] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Period: ",color:"gray"},{nbt:"data.properties.cooldown",entity:"@s",color:"aqua"},{text:"t",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Delayer status: show delay
execute if entity @s[tag=ra.custom_block.delayer] run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Delay: ",color:"gray"},{nbt:"data.properties.delay",entity:"@s",color:"aqua"},{text:"t",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# /ra:tools/goggles/status/read_status_macro
# Display block-type-specific status billboard
# Context: as custom block armor stand, at block position

# Gate status: show current mode
execute if entity @s[tag=ra.custom_block.uni_gate] if data entity @s data.properties.gate_type run data modify storage ra:temp status_literal set value {y:0.8,label:"Mode: ",value_color:"aqua",suffix:""}
execute if entity @s[tag=ra.custom_block.uni_gate] if data entity @s data.properties.gate_type run data modify storage ra:temp status_literal.value set from entity @s data.properties.gate_type
execute if entity @s[tag=ra.custom_block.uni_gate] if data entity @s data.properties.gate_type run function ra:tools/goggles/billboard/show_literal_line with storage ra:temp status_literal
execute if entity @s[tag=ra.custom_block.uni_gate] unless data entity @s data.properties.gate_type run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Mode: ",color:"gray"},{text:"N/A",color:"red"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Wireless status: show channel
execute if entity @s[tag=ra.custom_block.emitter] run data modify storage ra:temp status_line set value {y:0.8,label:"Channel: ",path:"data.properties.channel",suffix:"",value_color:"aqua",fallback:"N/A"}
execute if entity @s[tag=ra.custom_block.emitter] run function ra:tools/goggles/billboard/show_nbt_line with storage ra:temp status_line
execute if entity @s[tag=ra.custom_block.receiver] run data modify storage ra:temp status_line set value {y:0.8,label:"Channel: ",path:"data.properties.channel",suffix:"",value_color:"aqua",fallback:"N/A"}
execute if entity @s[tag=ra.custom_block.receiver] run function ra:tools/goggles/billboard/show_nbt_line with storage ra:temp status_line

# Sensor status: show entity selector
execute if entity @s[tag=ra.custom_block.entity_detector] run data modify storage ra:temp status_line set value {y:0.8,label:"Target: ",path:"data.properties.entity_selector",suffix:"",value_color:"aqua",fallback:"N/A"}
execute if entity @s[tag=ra.custom_block.entity_detector] run function ra:tools/goggles/billboard/show_nbt_line with storage ra:temp status_line

# Clock status: show cooldown
execute if entity @s[tag=ra.custom_block.clock] if data entity @s data.properties.cooldown run data modify storage ra:temp status_literal set value {y:0.8,label:"Period: ",value_color:"aqua",suffix:"t"}
execute if entity @s[tag=ra.custom_block.clock] if data entity @s data.properties.cooldown run data modify storage ra:temp status_literal.value set from entity @s data.properties.cooldown
execute if entity @s[tag=ra.custom_block.clock] if data entity @s data.properties.cooldown run function ra:tools/goggles/billboard/show_literal_line with storage ra:temp status_literal
execute if entity @s[tag=ra.custom_block.clock] unless data entity @s data.properties.cooldown run summon text_display ~ ~0.8 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Period: ",color:"gray"},{text:"N/A",color:"red"},{text:"t",color:"gray"}],background:1073741824,shadow:true,see_through:false,line_width:200,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

# Delayer status: show delay
execute if entity @s[tag=ra.custom_block.delayer] run data modify storage ra:temp status_line set value {y:0.8,label:"Delay: ",path:"data.properties.delay",suffix:"t",value_color:"aqua",fallback:"N/A"}
execute if entity @s[tag=ra.custom_block.delayer] run function ra:tools/goggles/billboard/show_nbt_line with storage ra:temp status_line

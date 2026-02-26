# /ra:tools/goggles/status/read_status_multiblock
# Display multiblock-specific status info (heat, enabled, etc.)
# Context: as multiblock marker entity, at base position

# Show heat status for blast forge
execute store result score #bf_heat ra.temp run data get entity @s data.status.heat
execute store result score #bf_enabled ra.temp run data get entity @s data.properties.enabled

# Summon status billboard below the name
summon text_display ~ ~1.7 ~ {Tags:["ra.billboard","ra.display"],billboard:"center",text:[{text:"Heat: ",color:"gray"},{nbt:"data.status.heat",entity:"@s",color:"gold"},{text:"/1000",color:"dark_gray"},{text:" | ",color:"dark_gray"},{text:"Enabled: ",color:"gray"},{nbt:"data.properties.enabled",entity:"@s",interpret:false,color:"aqua"}],background:1073741824,shadow:true,see_through:false,line_width:300,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.35f,0.35f,0.35f]}}

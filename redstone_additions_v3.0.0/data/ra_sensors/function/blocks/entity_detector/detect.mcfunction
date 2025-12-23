# /ra_sensors:blocks/entity_detector/detect
# Detect entities in range. As armor stand, at position.

# Get entity type and store for macro
data modify storage ra:temp entity_type set from entity @s data.properties.entity_type
execute unless data storage ra:temp entity_type run data modify storage ra:temp entity_type set value "minecraft:pig"

# Get range
execute store result score #range ra.temp run data get entity @s data.properties.range
execute if score #range ra.temp matches ..0 run scoreboard players set #range ra.temp 5

# Use macro to check for entity type
function ra_sensors:blocks/entity_detector/detect_macro with storage ra:temp

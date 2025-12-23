# /ra_sensors:blocks/tag_remover/on_powered
# Remove tag from entities in range when powered. As armor stand, at position.

# Get config
data modify storage ra:temp tag set from entity @s data.properties.tag
data modify storage ra:temp entity_type set from entity @s data.properties.entity_type
execute store result score #range ra.temp run data get entity @s data.properties.range
execute if score #range ra.temp matches ..0 run scoreboard players set #range ra.temp 3

# Check if tag is empty (clear all) or specific
execute if data entity @s data.properties.tag run execute unless data entity @s {data:{properties:{tag:""}}} run function ra_sensors:blocks/tag_remover/remove_tag_macro with storage ra:temp
execute if data entity @s {data:{properties:{tag:""}}} run function ra_sensors:blocks/tag_remover/clear_all_tags
execute unless data entity @s data.properties.tag run function ra_sensors:blocks/tag_remover/clear_all_tags

# /ra_sensors:blocks/tag_adder/on_powered
# Add tag to entities in range when powered. As armor stand, at position.

# Get config
data modify storage ra:temp tag set from entity @s data.properties.tag
data modify storage ra:temp entity_type set from entity @s data.properties.entity_type
execute store result score #range ra.temp run data get entity @s data.properties.range
execute if score #range ra.temp matches ..0 run scoreboard players set #range ra.temp 3

# Default tag if not set
execute unless data storage ra:temp tag run data modify storage ra:temp tag set value "custom_tag"

# Add tag using macro
function ra_sensors:blocks/tag_adder/add_tag_macro with storage ra:temp

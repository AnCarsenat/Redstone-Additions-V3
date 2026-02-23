# /ra_sensors:blocks/tag_remover/on_powered
# Remove tag from entities when powered. As armor stand, at position.

# Get config
data modify storage ra:temp tag set from entity @s data.properties.tag
data modify storage ra:temp entity_selector set from entity @s data.properties.entity_selector

# Check if tag is empty (clear all) or specific
execute if data entity @s data.properties.tag run execute unless data entity @s {data:{properties:{tag:""}}} run function ra_sensors:blocks/tag_remover/remove_tag_macro with storage ra:temp
execute if data entity @s {data:{properties:{tag:""}}} run function ra_sensors:blocks/tag_remover/clear_all_tags_macro with storage ra:temp
execute unless data entity @s data.properties.tag run function ra_sensors:blocks/tag_remover/clear_all_tags_macro with storage ra:temp

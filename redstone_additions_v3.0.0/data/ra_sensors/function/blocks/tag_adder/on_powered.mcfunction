# /ra_sensors:blocks/tag_adder/on_powered
# Add tag to entities in range when powered. As armor stand, at position.

# Get config
data modify storage ra:temp tag set from entity @s data.properties.tag
data modify storage ra:temp entity_type set from entity @s data.properties.entity_selector

# Add tag using macro
function ra_sensors:blocks/tag_adder/add_tag_macro with storage ra:temp

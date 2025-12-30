# /ra_sensors:blocks/tag_adder/add_tag_macro
# Macro to add tag to entities. As armor stand, at position.
# Input: $(tag) = tag to add, $(entity_type) = entity type filter (empty for all)

$execute as $(entity_selector) if entity @e[tag=!armor_stand] run tag @s add $(tag)

playsound minecraft:block.note_block.bit block @a[distance=..16] ~ ~ ~ 0.5 1.5


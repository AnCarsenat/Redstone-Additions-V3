# /ra_sensors:blocks/tag_adder/add_tag_macro
# Macro to add tag to entities. As armor stand, at position.
# Input: $(tag) = tag to add, $(entity_type) = entity type filter (empty for all)

# If entity_type is empty, target all entities; otherwise target specific type
$execute if data {entity_type:""} if score #range ra.temp matches 1 as @e[distance=..1,tag=!ra.custom_block] run tag @s add $(tag)
$execute if data {entity_type:""} if score #range ra.temp matches 2 as @e[distance=..2,tag=!ra.custom_block] run tag @s add $(tag)
$execute if data {entity_type:""} if score #range ra.temp matches 3 as @e[distance=..3,tag=!ra.custom_block] run tag @s add $(tag)
$execute if data {entity_type:""} if score #range ra.temp matches 4 as @e[distance=..4,tag=!ra.custom_block] run tag @s add $(tag)
$execute if data {entity_type:""} if score #range ra.temp matches 5 as @e[distance=..5,tag=!ra.custom_block] run tag @s add $(tag)
$execute if data {entity_type:""} if score #range ra.temp matches 6.. as @e[distance=..6,tag=!ra.custom_block] run tag @s add $(tag)

$execute unless data {entity_type:""} if score #range ra.temp matches 1 as @e[type=$(entity_type),distance=..1] run tag @s add $(tag)
$execute unless data {entity_type:""} if score #range ra.temp matches 2 as @e[type=$(entity_type),distance=..2] run tag @s add $(tag)
$execute unless data {entity_type:""} if score #range ra.temp matches 3 as @e[type=$(entity_type),distance=..3] run tag @s add $(tag)
$execute unless data {entity_type:""} if score #range ra.temp matches 4 as @e[type=$(entity_type),distance=..4] run tag @s add $(tag)
$execute unless data {entity_type:""} if score #range ra.temp matches 5 as @e[type=$(entity_type),distance=..5] run tag @s add $(tag)
$execute unless data {entity_type:""} if score #range ra.temp matches 6.. as @e[type=$(entity_type),distance=..6] run tag @s add $(tag)

playsound minecraft:block.note_block.bit block @a[distance=..16] ~ ~ ~ 0.5 1.5

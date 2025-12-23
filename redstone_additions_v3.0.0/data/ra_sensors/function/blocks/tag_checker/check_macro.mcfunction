# /ra_sensors:blocks/tag_checker/check_macro
# Macro to check for entities with specific tag. As armor stand, at position.
# Input: $(tag) = tag to check, $(entity_type) = entity type filter (empty for all)

scoreboard players set #detected ra.temp 0

# If entity_type is empty, check all entities with tag; otherwise check specific type with tag
$execute if data {entity_type:""} if score #range ra.temp matches 1 if entity @e[tag=$(tag),distance=..1,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1
$execute if data {entity_type:""} if score #range ra.temp matches 2 if entity @e[tag=$(tag),distance=..2,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1
$execute if data {entity_type:""} if score #range ra.temp matches 3 if entity @e[tag=$(tag),distance=..3,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1
$execute if data {entity_type:""} if score #range ra.temp matches 4 if entity @e[tag=$(tag),distance=..4,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1
$execute if data {entity_type:""} if score #range ra.temp matches 5 if entity @e[tag=$(tag),distance=..5,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1
$execute if data {entity_type:""} if score #range ra.temp matches 6.. if entity @e[tag=$(tag),distance=..6,tag=!ra.custom_block] run scoreboard players set #detected ra.temp 1

$execute unless data {entity_type:""} if score #range ra.temp matches 1 if entity @e[type=$(entity_type),tag=$(tag),distance=..1] run scoreboard players set #detected ra.temp 1
$execute unless data {entity_type:""} if score #range ra.temp matches 2 if entity @e[type=$(entity_type),tag=$(tag),distance=..2] run scoreboard players set #detected ra.temp 1
$execute unless data {entity_type:""} if score #range ra.temp matches 3 if entity @e[type=$(entity_type),tag=$(tag),distance=..3] run scoreboard players set #detected ra.temp 1
$execute unless data {entity_type:""} if score #range ra.temp matches 4 if entity @e[type=$(entity_type),tag=$(tag),distance=..4] run scoreboard players set #detected ra.temp 1
$execute unless data {entity_type:""} if score #range ra.temp matches 5 if entity @e[type=$(entity_type),tag=$(tag),distance=..5] run scoreboard players set #detected ra.temp 1
$execute unless data {entity_type:""} if score #range ra.temp matches 6.. if entity @e[type=$(entity_type),tag=$(tag),distance=..6] run scoreboard players set #detected ra.temp 1

# Output redstone signal based on detection (conditional command block)
execute if score #detected ra.temp matches 1 run setblock ~ ~ ~ repeating_command_block[conditional=true]
execute if score #detected ra.temp matches 0 run setblock ~ ~ ~ repeating_command_block[conditional=false]

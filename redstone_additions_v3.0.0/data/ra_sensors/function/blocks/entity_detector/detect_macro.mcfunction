# /ra_sensors:blocks/entity_detector/detect_macro
# Macro function to detect specific entity type. As armor stand, at position.
# Input: $(entity_type) = entity type to detect

scoreboard players set #detected ra.temp 0
$execute if score #range ra.temp matches 1 if entity @e[type=$(entity_type),distance=..1] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 2 if entity @e[type=$(entity_type),distance=..2] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 3 if entity @e[type=$(entity_type),distance=..3] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 4 if entity @e[type=$(entity_type),distance=..4] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 5 if entity @e[type=$(entity_type),distance=..5] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 6 if entity @e[type=$(entity_type),distance=..6] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 7 if entity @e[type=$(entity_type),distance=..7] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 8 if entity @e[type=$(entity_type),distance=..8] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 9 if entity @e[type=$(entity_type),distance=..9] run scoreboard players set #detected ra.temp 1
$execute if score #range ra.temp matches 10.. if entity @e[type=$(entity_type),distance=..10] run scoreboard players set #detected ra.temp 1

# Output redstone signal based on detection
execute if score #detected ra.temp matches 1 run setblock ~ ~ ~ calibrated_sculk_sensor[power=15]
execute if score #detected ra.temp matches 0 run setblock ~ ~ ~ calibrated_sculk_sensor[power=0]

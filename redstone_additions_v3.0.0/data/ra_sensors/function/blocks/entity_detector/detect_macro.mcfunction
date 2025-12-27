# /ra_sensors:blocks/entity_detector/detect_macro
# Macro function to detect entities using selector. As armor stand, at position.
# Input: $(entity_selector) = entity selector string, $(range) = detection range

scoreboard players set #detected ra.temp 0
$execute as $(entity_selector) if entity @e[tag=!armor_stand] run scoreboard players set #detected ra.temp 1

# Output redstone signal based on detection
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
execute if score #detected ra.temp matches 1 at @s run return run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block

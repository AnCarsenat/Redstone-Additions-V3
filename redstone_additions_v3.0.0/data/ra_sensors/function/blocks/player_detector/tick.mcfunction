# /ra_sensors:blocks/player_detector/tick
# Tick all player detectors

# Check for break detection
execute as @e[tag=ra.custom_block.player_detector] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.player_detector] at @s run function ra_sensors:blocks/player_detector/on_break

# Check for players in range and output redstone
execute as @e[tag=ra.custom_block.player_detector] at @s run function ra_sensors:blocks/player_detector/detect

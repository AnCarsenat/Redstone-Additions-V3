# /ra_sensors:blocks/entity_detector/tick
# Tick all entity detectors

# Check for break detection
execute as @e[tag=ra.custom_block.entity_detector] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.entity_detector] at @s run function ra_sensors:blocks/entity_detector/on_break

# Check for entities in range
execute as @e[tag=ra.custom_block.entity_detector] at @s run function ra_sensors:blocks/entity_detector/detect

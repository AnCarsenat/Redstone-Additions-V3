# /ra_sensors:blocks/tag_checker/tick
# Tick all tag checkers

# Check for break detection
execute as @e[tag=ra.custom_block.tag_checker] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.tag_checker] at @s run function ra_sensors:blocks/tag_checker/on_break

# Check for entities with tag in range
execute as @e[tag=ra.custom_block.tag_checker] at @s run function ra_sensors:blocks/tag_checker/check

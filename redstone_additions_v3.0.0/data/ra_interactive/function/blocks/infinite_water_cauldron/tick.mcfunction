# /ra_interactive:blocks/infinite_water_cauldron/tick
# Tick all infinite water cauldrons

# Check for break detection (only if block is air)
execute as @e[tag=ra.custom_block.infinite_water_cauldron] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.infinite_water_cauldron] at @s run function ra_interactive:blocks/infinite_water_cauldron/on_break

# Refill cauldron if emptied or partially filled
execute as @e[tag=ra.custom_block.infinite_water_cauldron] at @s if block ~ ~ ~ cauldron run setblock ~ ~ ~ water_cauldron[level=3]
execute as @e[tag=ra.custom_block.infinite_water_cauldron] at @s if block ~ ~ ~ water_cauldron[level=1] run setblock ~ ~ ~ water_cauldron[level=3]
execute as @e[tag=ra.custom_block.infinite_water_cauldron] at @s if block ~ ~ ~ water_cauldron[level=2] run setblock ~ ~ ~ water_cauldron[level=3]

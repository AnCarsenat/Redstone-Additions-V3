# /ra_interactive:blocks/infinite_snow_cauldron/tick
# Tick all infinite snow cauldrons

# Check for break detection (only if block is air)
execute as @e[tag=ra.custom_block.infinite_snow_cauldron] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.infinite_snow_cauldron] at @s run function ra_interactive:blocks/infinite_snow_cauldron/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.infinite_snow_cauldron] remove ra.broken

# Keep cauldron full (refill if emptied or partially filled)
execute as @e[tag=ra.custom_block.infinite_snow_cauldron] at @s if block ~ ~ ~ cauldron run setblock ~ ~ ~ powder_snow_cauldron[level=3]
execute as @e[tag=ra.custom_block.infinite_snow_cauldron] at @s if block ~ ~ ~ powder_snow_cauldron[level=1] run setblock ~ ~ ~ powder_snow_cauldron[level=3]
execute as @e[tag=ra.custom_block.infinite_snow_cauldron] at @s if block ~ ~ ~ powder_snow_cauldron[level=2] run setblock ~ ~ ~ powder_snow_cauldron[level=3]

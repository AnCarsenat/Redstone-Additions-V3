# /ra_interactive:blocks/infinite_lava_cauldron/tick
# Tick all infinite lava cauldrons

# Check for break detection (only if block is air)
execute as @e[tag=ra.custom_block.infinite_lava_cauldron] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.infinite_lava_cauldron] at @s run function ra_interactive:blocks/infinite_lava_cauldron/on_break

# When cauldron is empty, refill with lava
execute as @e[tag=ra.custom_block.infinite_lava_cauldron] at @s if block ~ ~ ~ cauldron run setblock ~ ~ ~ lava_cauldron

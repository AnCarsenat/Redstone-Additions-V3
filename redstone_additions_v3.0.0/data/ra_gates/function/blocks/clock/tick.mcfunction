# /ra_gates:blocks/clock/tick
# Tick all clocks

# Check for break detection
execute as @e[tag=ra.custom_block.clock] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.clock] at @s run function ra_gates:blocks/clock/on_break

# Process gate logic
execute as @e[tag=ra.custom_block.clock] at @s run function ra_gates:blocks/clock/process with entity @s data.properties



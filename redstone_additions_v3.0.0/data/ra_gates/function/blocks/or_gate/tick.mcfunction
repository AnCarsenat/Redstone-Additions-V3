# /ra_gates:blocks/or_gate/tick
# Tick all OR gates

# Check for break detection
execute as @e[tag=ra.custom_block.or_gate] at @s unless block ~ ~ ~ smooth_stone_slab run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.or_gate] at @s run function ra_gates:blocks/or_gate/on_break

# Process gate logic
execute as @e[tag=ra.custom_block.or_gate] at @s run function ra_gates:blocks/or_gate/process

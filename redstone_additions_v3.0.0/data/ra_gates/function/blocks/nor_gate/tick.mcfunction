# /ra_gates:blocks/nor_gate/tick
# Tick all NOR gates

# Check for break detection
execute as @e[tag=ra.custom_block.nor_gate] at @s unless block ~ ~ ~ smooth_stone_slab run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.nor_gate] at @s run function ra_gates:blocks/nor_gate/on_break

# Process gate logic
execute as @e[tag=ra.custom_block.nor_gate] at @s run function ra_gates:blocks/nor_gate/process

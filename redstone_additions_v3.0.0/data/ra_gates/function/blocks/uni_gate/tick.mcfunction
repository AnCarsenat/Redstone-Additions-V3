# /ra_gates:blocks/uni_gate/tick
# Tick all UNI gates

# Check for break detection
execute as @e[tag=ra.custom_block.uni_gate] at @s unless block ~ ~ ~ smooth_stone_slab run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.uni_gate] at @s run function ra_gates:blocks/uni_gate/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.uni_gate] remove ra.broken

# Process gate logic
execute as @e[tag=ra.custom_block.uni_gate] at @s run function ra_gates:blocks/uni_gate/process
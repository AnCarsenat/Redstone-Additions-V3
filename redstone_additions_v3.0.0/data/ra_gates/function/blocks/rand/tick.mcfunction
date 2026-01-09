# /ra_gates:blocks/rand/tick
# Tick all randomizers - outputs random signal on pulse

# Check for break detection
execute as @e[tag=ra.custom_block.rand] at @s unless block ~ ~ ~ bookshelf run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.rand] at @s run function ra_gates:blocks/rand/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.rand] remove ra.broken

# Process rand logic
execute as @e[tag=ra.custom_block.rand] at @s run function ra_gates:blocks/rand/process

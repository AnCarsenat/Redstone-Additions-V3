# /ra_gates:blocks/beamer/tick
# Tick all beamers - teleports redstone signal in facing direction

# Check for break detection
execute as @e[tag=ra.custom_block.beamer] at @s unless block ~ ~ ~ cyan_glazed_terracotta run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.beamer] at @s run function ra_gates:blocks/beamer/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.beamer] remove ra.broken

# Process beamer logic
execute as @e[tag=ra.custom_block.beamer] at @s run function ra_gates:blocks/beamer/process

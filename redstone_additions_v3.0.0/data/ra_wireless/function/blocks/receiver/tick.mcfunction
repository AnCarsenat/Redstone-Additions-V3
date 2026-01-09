# /ra_wireless:blocks/receiver/tick
# Tick all receivers

# Check for break detection (using purpur_block as receiver block)
execute as @e[tag=ra.custom_block.receiver] at @s unless block ~ ~ ~ purpur_block run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.receiver] at @s run function ra_wireless:blocks/receiver/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.receiver] remove ra.broken

# Process receiver logic
execute as @e[tag=ra.custom_block.receiver] at @s run function ra_wireless:blocks/receiver/process

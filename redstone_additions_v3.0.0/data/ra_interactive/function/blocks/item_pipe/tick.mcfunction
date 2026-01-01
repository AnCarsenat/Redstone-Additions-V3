# /ra_interactive:blocks/item_pipe/tick
# Tick all item pipes. Called every tick.

# Check for break detection
execute as @e[tag=ra.custom_block.item_pipe] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.item_pipe] at @s run function ra_interactive:blocks/item_pipe/on_break

# Process each item pipe
execute as @e[tag=ra.custom_block.item_pipe] at @s run function ra_interactive:blocks/item_pipe/process


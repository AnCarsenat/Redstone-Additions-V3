# /ra_interactive:blocks/spitter/tick
# Tick all spitters

# Check for break detection
execute as @e[tag=ra.custom_block.spitter] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.spitter] at @s run function ra_interactive:blocks/spitter/on_break

# Process each spitter - spit items if any in inventory
execute as @e[tag=ra.custom_block.spitter] at @s run function ra_interactive:blocks/spitter/process

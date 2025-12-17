# /ra_interactive:blocks/block_placer/tick
# Tick all block placers

# Check for break detection
execute as @e[tag=ra.custom_block.block_placer] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.block_placer] at @s run function ra_interactive:blocks/block_placer/on_break

# Check for powered dispensers - instant activation (no cooldown)
execute as @e[tag=ra.custom_block.block_placer] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:blocks/block_placer/on_powered

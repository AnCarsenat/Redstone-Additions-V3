# data/ra_interactive/function/blocks/block_breaker/tick.mcfunction
# Tick all block breakers

# Check for break detection (block removed)
execute as @e[tag=ra.custom_block.block_breaker] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.block_breaker] at @s run function ra_interactive:blocks/block_breaker/on_break

# Process cooldowns
scoreboard players add @e[tag=ra.custom_block.block_breaker] ra.cooldown 1

# Check for powered dispensers (only if cooldown ready)
execute as @e[tag=ra.custom_block.block_breaker,scores={ra.cooldown=40..}] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:blocks/block_breaker/on_powered
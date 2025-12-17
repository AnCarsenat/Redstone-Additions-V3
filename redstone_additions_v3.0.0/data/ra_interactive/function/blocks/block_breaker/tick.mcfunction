# data/ra_interactive/function/blocks/block_breaker/tick.mcfunction
# Tick all block breakers

# Check for break detection (block removed)
execute as @e[tag=ra.custom_block.block_breaker] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.block_breaker] at @s run function ra_interactive:blocks/block_breaker/on_break

# Process cooldowns
execute as @e[tag=ra.custom_block.block_breaker] if score @s ra.cooldown matches 1.. run scoreboard players remove @s ra.cooldown 1

# Check for powered dispensers (using vanilla triggered state)
execute as @e[tag=ra.custom_block.block_breaker] at @s if block ~ ~ ~ dispenser[triggered=true] if score @s ra.cooldown matches 0 run function ra_interactive:blocks/block_breaker/on_powered
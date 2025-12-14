# data/ra_interactive/function/custom_blocks/block_breaker/tick.mcfunction

# Tick all block breakers

# Check for powered dispensers
execute as @e[tag=ra.custom_block.block_breaker] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:blocks/block_breaker/on_powered

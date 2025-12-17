# data/ra_interactive/function/blocks/block_breaker/on_powered.mcfunction
# Called when block breaker dispenser is powered
# Context: as armor stand, at armor stand

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ra.cooldown 20

# Break block in front
function ra_interactive:blocks/block_breaker/break_block
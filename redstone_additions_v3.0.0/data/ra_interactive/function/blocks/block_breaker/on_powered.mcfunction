# data/ra_interactive/function/custom_blocks/block_breaker/on_powered.mcfunction

# Called when block breaker dispenser is powered
# Context: as armor stand, at armor stand




# Check cooldown
execute if score @s ra.bb.cooldown matches 1.. run return run scoreboard players remove @s ra.bb.cooldown 1

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ra.bb.cooldown 20

# Break block in front
function ra_interactive:blocks/block_breaker/break_block
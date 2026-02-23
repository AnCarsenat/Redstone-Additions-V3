# /ra_interactive:blocks/item_pipe/process
# Process item pipe logic. As armor stand (rotated to face output), at dispenser position.
# Features:
# - Check for filter item frame on ANY side of the pipe block
# - If filter exists and item MATCHES filter: try to send to adjacent container
# - If no adjacent container OR item doesn't match OR no filter: send forward
# - If no valid output: shoot item out

# Initialize cooldown if not set
execute unless score @s ra.cooldown matches -2147483648.. run scoreboard players set @s ra.cooldown 0

# Cooldown (4 ticks = 5 items/sec, like hopper)
scoreboard players add @s ra.cooldown 1
execute if score @s ra.cooldown matches ..3 run return 0

# Check if dispenser has any items (slot 0)
execute unless data block ~ ~ ~ Items[0] run return 0

# Has item - reset cooldown
scoreboard players set @s ra.cooldown 0

# Store current item data
data modify storage ra:temp pipe_item set from block ~ ~ ~ Items[0]

# Check for filter on any side of the block
execute store result score @s ra.temp run function ra_interactive:blocks/item_pipe/check_filter

# If filtered to side, we're done
execute if score @s ra.temp matches 1 run return 1

# Not filtered - try to send forward (^ ^ ^1)
execute positioned ^ ^ ^1 if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/transfer
execute if score @s ra.temp matches 1 run return 1

# No valid output - shoot the item out
function ra_interactive:blocks/item_pipe/shoot

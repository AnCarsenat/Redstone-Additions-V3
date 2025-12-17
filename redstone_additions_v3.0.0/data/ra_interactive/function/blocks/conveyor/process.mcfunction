# /ra_interactive:blocks/conveyor/process
# Process item pipe logic. As armor stand (rotated to face output), at dispenser position.
# Features:
# - Transfer items to container in front
# - Filter items to the side (left) if item frame with filter item exists
# - Shoot item out if no valid output

# Initialize cooldown if not set
execute unless score @s ra.cooldown matches -2147483648.. run scoreboard players set @s ra.cooldown 0

# Cooldown (4 ticks = 5 items/sec, like hopper)
scoreboard players add @s ra.cooldown 1
execute if score @s ra.cooldown matches ..3 run return 0

# Check if dispenser has any items (slot 0)
execute unless data block ~ ~ ~ Items[0] run return 0

# Has item - reset cooldown
scoreboard players set @s ra.cooldown 0

# Store current item data for filter check
data modify storage ra:temp pipe_item set from block ~ ~ ~ Items[0]

# Check for filter (item frame to the left: ^ ^-1 ^)
# If filter exists and matches, send to the left side
execute positioned ^-1 ^ ^ if entity @e[type=item_frame,distance=..0.5,limit=1] run function ra_interactive:blocks/conveyor/check_filter
execute if score #filtered ra.temp matches 1 run return 1

# Try to insert into container in front (^ ^ ^1)
execute positioned ^ ^ ^1 if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/transfer
execute if score #transferred ra.temp matches 1 run return 1

# No filter match and no container in front - shoot the item out
function ra_interactive:blocks/conveyor/shoot

# /ra_interactive:blocks/item_mover/process
# Move one item from container behind (^ ^ ^-1) to container in front (^ ^ ^1)
# Context: as armor stand (facing the output direction), at observer position
# Speed: hopper-rate (every 4 ticks)

# Cooldown
execute unless score @s ra.cooldown matches -2147483648.. run scoreboard players set @s ra.cooldown 0
scoreboard players add @s ra.cooldown 1
execute if score @s ra.cooldown matches ..3 run return 0

# Check for container behind (input)
execute positioned ^ ^ ^-1 unless block ~ ~ ~ #ra_lib:containers run return 0

# Check for container in front (output)
execute positioned ^ ^ ^1 unless block ~ ~ ~ #ra_lib:containers run return 0

# Check if input has items
execute positioned ^ ^ ^-1 unless data block ~ ~ ~ Items[0] run return 0

# Reset cooldown — we have work to do
scoreboard players set @s ra.cooldown 0

# Read item from input container — copy only 1 item
data modify storage ra:temp mover_item set from block ^ ^ ^-1 Items[0]
data modify storage ra:temp mover_item.count set value 1

# Ensure components field exists for macro
execute unless data storage ra:temp mover_item.components run data modify storage ra:temp mover_item.components set value {}

# Try to insert into output container
execute positioned ^ ^ ^1 store result score #mover_inserted ra.temp run function ra_lib:inventory/insert with storage ra:temp mover_item

# If insertion succeeded, consume 1 from input
execute if score #mover_inserted ra.temp matches 1.. positioned ^ ^ ^-1 run function ra_interactive:blocks/item_mover/consume_input

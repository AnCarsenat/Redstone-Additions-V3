# /ra_interactive:blocks/item_mover/consume_input
# Remove 1 item from first slot of container at current position
# Context: positioned at input container

execute unless data block ~ ~ ~ Items[0] run return 0

# Get current count
execute store result score #mover_count ra.temp run data get block ~ ~ ~ Items[0].count

# If only 1 item, remove the slot entirely
execute if score #mover_count ra.temp matches 1 run data remove block ~ ~ ~ Items[0]
execute if score #mover_count ra.temp matches 1 run return 1

# More than 1: decrement count
scoreboard players remove #mover_count ra.temp 1
execute store result block ~ ~ ~ Items[0].count int 1 run scoreboard players get #mover_count ra.temp

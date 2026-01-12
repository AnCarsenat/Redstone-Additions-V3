# /ra_interactive:blocks/item_pipe/transfer
# Transfer item from pipe to container in front.
# Positioned at ^ ^ ^1 (container location). Pipe is at ^ ^ ^-1.
# Input: storage ra:temp pipe_item = item to transfer
# Output: #transferred ra.temp = 1 if successful

scoreboard players set #transferred ra.temp 0

# Ensure components field exists for macro
execute unless data storage ra:temp pipe_item.components run data modify storage ra:temp pipe_item.components set value {}

# Use ra_lib inventory system to insert
execute store result score #inserted ra.temp run function ra_lib:inventory/insert with storage ra:temp pipe_item

# If items were inserted, transfer was successful
execute if score #inserted ra.temp matches 1.. run data remove block ^ ^ ^-1 Items[0]
execute if score #inserted ra.temp matches 1.. run scoreboard players set #transferred ra.temp 1

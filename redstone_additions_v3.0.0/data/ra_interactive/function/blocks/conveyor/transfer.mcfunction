# /ra_interactive:blocks/conveyor/transfer
# Transfer item from pipe to container in front.
# Positioned at ^ ^ ^1 (container location). Pipe is at ^ ^ ^-1.
# Input: storage ra:temp pipe_item = item to transfer
# Output: #transferred ra.temp = 1 if successful

scoreboard players set #transferred ra.temp 0

# Use ra_lib inventory system to insert
data modify storage ra:inventory item set from storage ra:temp pipe_item
function ra_lib:inventory/give_nbt

# If slot found (>= 0), transfer was successful
execute if score #slot ra.inv.slot matches 0.. run data remove block ^ ^ ^-1 Items[0]
execute if score #slot ra.inv.slot matches 0.. run scoreboard players set #transferred ra.temp 1

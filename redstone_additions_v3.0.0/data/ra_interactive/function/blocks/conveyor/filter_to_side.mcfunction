# /ra_interactive:blocks/conveyor/filter_to_side
# Filter matched - send item to the left side. As armor stand, at pipe position.
# Input: storage ra:temp pipe_item = item to transfer
# Output: #filtered ra.temp = 1 if successful

# Left side is ^-1 ^ ^ relative to pipe's facing
# Check if there's a container on the left
execute positioned ^-1 ^ ^ unless block ~ ~ ~ #ra_lib:containers run return 0

# Insert item into side container using ra_lib
data modify storage ra:inventory item set from storage ra:temp pipe_item
execute positioned ^-1 ^ ^ run function ra_lib:inventory/give_nbt

# If insertion successful, remove from pipe (we're at pipe position)
execute if score #slot ra.inv.slot matches 0.. run data remove block ~ ~ ~ Items[0]
execute if score #slot ra.inv.slot matches 0.. run scoreboard players set #filtered ra.temp 1

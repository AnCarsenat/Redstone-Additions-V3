# /ra_interactive:blocks/conveyor/filter_insert
# Insert filtered item into container at current position.
# Input: storage ra:temp pipe_item = item to insert
# Output: #filtered ra.temp = 1 if successful

# Insert into container here
data modify storage ra:inventory item set from storage ra:temp pipe_item
function ra_lib:inventory/give_nbt

# If insertion failed, return
execute unless score #slot ra.inv.slot matches 0.. run return 0

# Success! Remove item from pipe (at @s position)
execute at @s run data remove block ~ ~ ~ Items[0]
scoreboard players set #filtered ra.temp 1

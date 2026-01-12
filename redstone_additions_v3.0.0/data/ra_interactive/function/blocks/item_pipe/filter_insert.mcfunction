# /ra_interactive:blocks/item_pipe/filter_insert
# Insert filtered item into container at current position.
# Input: storage ra:temp pipe_item = item to insert
# Output: #filtered ra.temp = 1 if successful

# Ensure components field exists for macro
execute unless data storage ra:temp pipe_item.components run data modify storage ra:temp pipe_item.components set value {}

# Insert into container here
execute store result score #inserted ra.temp run function ra_lib:inventory/insert with storage ra:temp pipe_item

# If insertion failed, return
execute if score #inserted ra.temp matches 0 run return 0

# Success! Remove item from pipe (at @s position)
execute at @s run data remove block ~ ~ ~ Items[0]
scoreboard players set #filtered ra.temp 1

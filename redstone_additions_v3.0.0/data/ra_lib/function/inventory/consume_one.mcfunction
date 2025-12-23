# /ra_lib:inventory/consume_one
# Consume one item from a container by item ID. Macro function.
# Context: At container block
# Input: $(item_id) = item ID to consume (e.g., "wheat")
# Output: returns 1 if consumed, 0 if item not found

# Copy item to storage for manipulation
$execute unless data block ~ ~ ~ Items[{id:"minecraft:$(item_id)"}] run return 0

# Find the first matching item slot, copy full item to storage
$data modify storage ra:temp consume_item set from block ~ ~ ~ Items[{id:"minecraft:$(item_id)"}]

# Get current count
execute store result score #count ra.temp run data get storage ra:temp consume_item.count

# Decrement count
scoreboard players remove #count ra.temp 1

# If count > 0, update the item; if count == 0, remove it
execute if score #count ra.temp matches 1.. run data modify storage ra:temp consume_item.count set value 1
execute if score #count ra.temp matches 1.. store result storage ra:temp consume_item.count int 1 run scoreboard players get #count ra.temp

# Get the slot number
execute store result score #slot ra.temp run data get storage ra:temp consume_item.Slot

# Now update or remove based on slot
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 0 store result block ~ ~ ~ Items[{Slot:0b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 1 store result block ~ ~ ~ Items[{Slot:1b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 2 store result block ~ ~ ~ Items[{Slot:2b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 3 store result block ~ ~ ~ Items[{Slot:3b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 4 store result block ~ ~ ~ Items[{Slot:4b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 5 store result block ~ ~ ~ Items[{Slot:5b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 6 store result block ~ ~ ~ Items[{Slot:6b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 7 store result block ~ ~ ~ Items[{Slot:7b}].count int 1 run scoreboard players get #count ra.temp
execute if score #count ra.temp matches 1.. if score #slot ra.temp matches 8 store result block ~ ~ ~ Items[{Slot:8b}].count int 1 run scoreboard players get #count ra.temp

execute if score #count ra.temp matches 0 if score #slot ra.temp matches 0 run data remove block ~ ~ ~ Items[{Slot:0b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 1 run data remove block ~ ~ ~ Items[{Slot:1b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 2 run data remove block ~ ~ ~ Items[{Slot:2b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 3 run data remove block ~ ~ ~ Items[{Slot:3b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 4 run data remove block ~ ~ ~ Items[{Slot:4b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 5 run data remove block ~ ~ ~ Items[{Slot:5b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 6 run data remove block ~ ~ ~ Items[{Slot:6b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 7 run data remove block ~ ~ ~ Items[{Slot:7b}]
execute if score #count ra.temp matches 0 if score #slot ra.temp matches 8 run data remove block ~ ~ ~ Items[{Slot:8b}]

return 1

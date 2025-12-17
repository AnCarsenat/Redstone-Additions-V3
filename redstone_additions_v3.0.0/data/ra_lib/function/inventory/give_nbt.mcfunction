# /ra_lib:inventory/give_nbt
# Insert item into container with proper stacking. At container.
# Input: storage ra:inventory item {id, count, components, ...}
# Output: #slot ra.inv.slot (slot used, or -1 if full), returns 1 on success, 0 if full

# Store item info for comparison
data modify storage ra:inventory input set from storage ra:inventory item
execute store result score #input_count ra.temp run data get storage ra:inventory item.count

# First, try to stack with existing matching items
scoreboard players set #slot ra.inv.slot -1
function ra_lib:inventory/try_stack

# If stacking worked (count now 0), we're done
execute if score #input_count ra.temp matches ..0 run return 1

# If items remain, find empty slot for remainder
execute if score #input_count ra.temp matches 1.. run function ra_lib:inventory/find_empty_slot
execute if score #slot ra.inv.slot matches -1 run return 0

# Place remaining items in empty slot
execute store result storage ra:inventory item.count int 1 run scoreboard players get #input_count ra.temp
execute store result storage ra:inventory item.Slot byte 1 run scoreboard players get #slot ra.inv.slot
data modify block ~ ~ ~ Items append from storage ra:inventory item
return 1

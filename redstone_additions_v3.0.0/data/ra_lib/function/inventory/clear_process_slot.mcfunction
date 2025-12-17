# /data/ra_lib/function/inventory/clear_process_slot.mcfunction
# Process a specific slot for item removal
# Macro param: slot

# Check if this slot has an item
$execute unless data block ~ ~ ~ Items[{Slot:$(slot)b}] run return 0

# Get item count in this slot
$execute store result score #slot_count ra.inv.count run data get block ~ ~ ~ Items[{Slot:$(slot)b}].count

# Get the actual item id at this slot to compare
$data modify storage ra:inventory temp.found_id set from block ~ ~ ~ Items[{Slot:$(slot)b}].id

# Compare IDs - return if they don't match
execute store success score #match ra.temp run data modify storage ra:inventory temp.found_id set from storage ra:inventory clear.id
execute if score #match ra.temp matches 1 run return 0

# If components filter is specified, check that they match too
execute if data storage ra:inventory clear.components run function ra_lib:inventory/clear_check_components with storage ra:inventory temp
execute if data storage ra:inventory clear.components if score #match ra.temp matches 0 run return 0

# Item matches! Calculate how many to remove
# If slot has less than or equal to what we need, remove entire stack
execute if score #slot_count ra.inv.count <= #to_remove ra.inv.count run function ra_lib:inventory/clear_full_stack with storage ra:inventory temp

# If slot has more than we need, reduce the stack
execute if score #slot_count ra.inv.count > #to_remove ra.inv.count run function ra_lib:inventory/clear_partial_stack with storage ra:inventory temp

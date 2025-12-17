# /data/ra_lib/function/inventory/clear_check_components.mcfunction
# Check if the item's components match the filter
# Macro param: slot
# Input: storage ra:inventory clear.components (the filter)
# Output: #match ra.temp (1 = matches, 0 = doesn't match)

# Get the item's components from the slot
$data modify storage ra:inventory temp.found_components set from block ~ ~ ~ Items[{Slot:$(slot)b}].components

# Default to match (if no components on item but filter expects some, will fail)
scoreboard players set #match ra.temp 1

# Check each component type that might be in the filter

# Check custom_data if specified in filter
execute if data storage ra:inventory clear.components.custom_data run function ra_lib:inventory/clear_check_custom_data with storage ra:inventory temp

# Check custom_name if specified in filter
execute if data storage ra:inventory clear.components.custom_name unless data storage ra:inventory temp.found_components.custom_name run scoreboard players set #match ra.temp 0
execute if data storage ra:inventory clear.components.custom_name if data storage ra:inventory temp.found_components.custom_name run execute store success score #name_match ra.temp run data modify storage ra:inventory temp.name_check set from storage ra:inventory clear.components.custom_name
execute if data storage ra:inventory clear.components.custom_name if data storage ra:inventory temp.found_components.custom_name run execute store success score #name_found ra.temp run data modify storage ra:inventory temp.name_check set from storage ra:inventory temp.found_components.custom_name
execute if data storage ra:inventory clear.components.custom_name if score #name_match ra.temp = #name_found ra.temp run scoreboard players set #match ra.temp 0

# Check enchantments if specified (just checks if has any enchantments)
execute if data storage ra:inventory clear.components.enchantments unless data storage ra:inventory temp.found_components.enchantments run scoreboard players set #match ra.temp 0

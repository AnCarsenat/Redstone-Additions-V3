# /data/ra_lib/function/inventory/clear_check_custom_data.mcfunction
# Check if item's custom_data matches the filter
# Macro param: slot
# Uses: storage ra:inventory clear.components.custom_data, temp.found_components.custom_data

# If filter has custom_data but item doesn't, no match
execute unless data storage ra:inventory temp.found_components.custom_data run scoreboard players set #match ra.temp 0
execute unless data storage ra:inventory temp.found_components.custom_data run return 0

# Copy both for comparison
data modify storage ra:inventory temp.filter_data set from storage ra:inventory clear.components.custom_data
data modify storage ra:inventory temp.item_data set from storage ra:inventory temp.found_components.custom_data

# Use data modify to check if filter data exists in item data
# We merge the filter into a copy of item data - if unchanged, it means filter is subset
data modify storage ra:inventory temp.merged set from storage ra:inventory temp.item_data
data modify storage ra:inventory temp.merged merge from storage ra:inventory temp.filter_data

# Compare merged with original item_data - if same, filter matched
execute store success score #merge_changed ra.temp run data modify storage ra:inventory temp.compare set from storage ra:inventory temp.item_data
execute store success score #merge_result ra.temp run data modify storage ra:inventory temp.compare set from storage ra:inventory temp.merged

# If merge changed the data, filter has data not in item = no match
execute unless score #merge_changed ra.temp = #merge_result ra.temp run scoreboard players set #match ra.temp 0

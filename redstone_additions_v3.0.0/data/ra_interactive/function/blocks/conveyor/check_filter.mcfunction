# /ra_interactive:blocks/conveyor/check_filter
# Check if pipe item matches filter. Positioned at filter location (^-1 ^ ^ from pipe).
# Input: storage ra:temp pipe_item = item to check
# Output: #filtered ra.temp = 1 if filtered to side, 0 otherwise

scoreboard players set #filtered ra.temp 0

# Get filter item id from item frame at this position
data modify storage ra:temp filter_item set from entity @e[type=item_frame,distance=..0.5,limit=1,sort=nearest] Item
execute unless data storage ra:temp filter_item.id run return 0

# Compare item IDs (store to temp, compare strings via data modify success)
# Workaround: copy filter id to check location, then test if they match
data modify storage ra:temp check_id set from storage ra:temp pipe_item.id
execute store success score #match ra.temp run data modify storage ra:temp check_id set from storage ra:temp filter_item.id

# If match=0, IDs are the same (set already had that value) - filter matched!
# Run filter_to_side at pipe position (^1 ^ ^ from here, since we're at left side)
execute if score #match ra.temp matches 0 positioned ^1 ^ ^ run function ra_interactive:blocks/conveyor/filter_to_side

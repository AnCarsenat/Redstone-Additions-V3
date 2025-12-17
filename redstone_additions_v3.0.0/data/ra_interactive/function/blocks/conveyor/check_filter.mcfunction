# /ra_interactive:blocks/conveyor/check_filter
# Check for filter item frame on the pipe block. At pipe position.
# If item matches filter, send to any adjacent container (not forward).
# Input: storage ra:temp pipe_item = item to check
# Output: #filtered ra.temp = 1 if item was sent to a side container

# Find item frame attached to this block (within 1 block radius)
execute unless entity @e[type=item_frame,distance=..1.4,limit=1] run return 0

# Get filter item from nearest item frame
data modify storage ra:temp filter_item set from entity @e[type=item_frame,distance=..1.4,limit=1,sort=nearest] Item
execute unless data storage ra:temp filter_item.id run return 0

# Compare item IDs
data modify storage ra:temp check_id set from storage ra:temp pipe_item.id
execute store success score #different ra.temp run data modify storage ra:temp check_id set from storage ra:temp filter_item.id

# If items are different, filter doesn't match - return (will go forward)
execute if score #different ra.temp matches 1 run return 0

# Items match! Try to insert into any adjacent container (except forward)
# Try each side: down, up, left, right, back
execute if score #filtered ra.temp matches 0 positioned ~ ~-1 ~ if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/filter_insert
execute if score #filtered ra.temp matches 0 positioned ~ ~1 ~ if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/filter_insert
execute if score #filtered ra.temp matches 0 positioned ^-1 ^ ^ if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/filter_insert
execute if score #filtered ra.temp matches 0 positioned ^1 ^ ^ if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/filter_insert
execute if score #filtered ra.temp matches 0 positioned ^ ^ ^-1 if block ~ ~ ~ #ra_lib:containers run function ra_interactive:blocks/conveyor/filter_insert

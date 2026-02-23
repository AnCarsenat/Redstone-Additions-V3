# /ra_interactive:blocks/item_pipe/check_filter
# Check for filter item frame on the pipe block. At pipe position.
# If item matches filter, send to any adjacent container (not forward).
# Input: storage ra:temp pipe_item = item to check
# Output: returns 1 if item was sent to a side container

# Find item frame attached to this block (within 1 block radius)
execute positioned ~ ~0.5 ~ unless entity @e[type=item_frame,distance=..1.1,limit=1,sort=nearest] run return 0

# Get filter item from nearest item frame
data modify storage ra:temp filter_item set from entity @e[type=item_frame,distance=..1.1,limit=1,sort=nearest] Item
execute unless data storage ra:temp filter_item.id run return 0

# Compare item IDs
data modify storage ra:temp check_id set from storage ra:temp pipe_item.id
execute store success score @s ra.temp run data modify storage ra:temp check_id set from storage ra:temp filter_item.id

# If items are different, filter doesn't match - return (will go forward)
execute if score @s ra.temp matches 1 run return 0

# Items match! Try to insert into any adjacent container (except forward)
# Try each side: down, up, left, right, back
execute positioned ~ ~-1 ~ if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/filter_insert
execute if score @s ra.temp matches 1 run return 1
execute positioned ~ ~1 ~ if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/filter_insert
execute if score @s ra.temp matches 1 run return 1
execute positioned ^-1 ^ ^ if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/filter_insert
execute if score @s ra.temp matches 1 run return 1
execute positioned ^1 ^ ^ if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/filter_insert
execute if score @s ra.temp matches 1 run return 1
execute positioned ^ ^ ^-1 if block ~ ~ ~ #ra_lib:containers store result score @s ra.temp run function ra_interactive:blocks/item_pipe/filter_insert
execute if score @s ra.temp matches 1 run return 1
return 0

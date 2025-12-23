# /ra:tools/data_handler/check_use
# Check if player is looking at a custom block. As player, at player.

# Get block the player is looking at (within 5 blocks)
execute anchored eyes positioned ^ ^ ^1 if entity @e[tag=ra.custom_block,distance=..1.5] run function ra:tools/data_handler/show_data
execute anchored eyes positioned ^ ^ ^2 if entity @e[tag=ra.custom_block,distance=..1.5] unless data storage ra:temp data_shown run function ra:tools/data_handler/show_data
execute anchored eyes positioned ^ ^ ^3 if entity @e[tag=ra.custom_block,distance=..1.5] unless data storage ra:temp data_shown run function ra:tools/data_handler/show_data

data remove storage ra:temp data_shown

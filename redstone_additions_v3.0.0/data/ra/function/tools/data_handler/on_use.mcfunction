# /ra:tools/data_handler/on_use
# Handle data handler right-click. As player, at player.

# Find nearest custom block
execute anchored eyes positioned ^ ^ ^1 if entity @e[tag=ra.custom_block,distance=..1.5] run function ra:tools/data_handler/interact_block
execute anchored eyes positioned ^ ^ ^2 unless data storage ra:temp dh_found if entity @e[tag=ra.custom_block,distance=..1.5] run function ra:tools/data_handler/interact_block
execute anchored eyes positioned ^ ^ ^3 unless data storage ra:temp dh_found if entity @e[tag=ra.custom_block,distance=..1.5] run function ra:tools/data_handler/interact_block
execute anchored eyes positioned ^ ^ ^4 unless data storage ra:temp dh_found if entity @e[tag=ra.custom_block,distance=..1.5] run function ra:tools/data_handler/interact_block

# If no block found, show message
execute unless data storage ra:temp dh_found run tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"No custom block found. Look at a custom block and right-click.","color":"gray"}]

data remove storage ra:temp dh_found

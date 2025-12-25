# /ra:tools/creative_data_handler/on_use
# Handle creative data handler click. As player, at player.

# Only proceed if sneaking (shift + right-click)
execute unless predicate ra:is_sneaking run return 0

# Remove target tag from any previously selected block
tag @e[tag=ra.cdh_target] remove ra.cdh_target

# Find nearest custom block via raycast
data remove storage ra:temp cdh_found
execute anchored eyes positioned ^ ^ ^1 as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/creative_data_handler/found_block
execute anchored eyes positioned ^ ^ ^2 unless data storage ra:temp cdh_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/creative_data_handler/found_block
execute anchored eyes positioned ^ ^ ^3 unless data storage ra:temp cdh_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/creative_data_handler/found_block
execute anchored eyes positioned ^ ^ ^4 unless data storage ra:temp cdh_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/creative_data_handler/found_block

# If no block found
execute unless data storage ra:temp cdh_found run tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"No custom block found nearby.","color":"gray"}]
data remove storage ra:temp cdh_found

# /ra:tools/wrench/rmb_function
# Called when right-click with wrench (no sneak). As player.
# Toggles enabled state of wireless emitters/receivers

# Find nearest custom block via raycast
data remove storage ra:temp wrench_found
execute at @s anchored eyes positioned ^ ^ ^1 as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/wrench/found_block
execute at @s anchored eyes positioned ^ ^ ^2 unless data storage ra:temp wrench_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/wrench/found_block
execute at @s anchored eyes positioned ^ ^ ^3 unless data storage ra:temp wrench_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/wrench/found_block
execute at @s anchored eyes positioned ^ ^ ^4 unless data storage ra:temp wrench_found as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/wrench/found_block

# If no block found
execute unless data storage ra:temp wrench_found run tellraw @s [{"text":"[Wrench] ","color":"gold"},{"text":"No custom block found nearby.","color":"gray"}]
data remove storage ra:temp wrench_found

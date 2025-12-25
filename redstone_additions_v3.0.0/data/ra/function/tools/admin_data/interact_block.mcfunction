# /ra:tools/admin_data/interact_block
# Interact with nearest custom block. At raycasted position.

data modify storage ra:temp ad_found set value 1b

# Get nearest custom block
execute as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/admin_data/handle_interaction

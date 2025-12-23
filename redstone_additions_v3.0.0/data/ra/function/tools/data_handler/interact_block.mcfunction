# /ra:tools/data_handler/interact_block
# Interact with nearest custom block. At raycasted position.

data modify storage ra:temp dh_found set value 1b

# Get nearest custom block
execute as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/data_handler/handle_interaction

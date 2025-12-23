# /ra:tools/data_handler/show_data
# Show data of nearest custom block. At raycasted position.

# Get nearest custom block
execute as @e[tag=ra.custom_block,distance=..1.5,limit=1,sort=nearest] run function ra:tools/data_handler/display_block_data
data modify storage ra:temp data_shown set value 1b

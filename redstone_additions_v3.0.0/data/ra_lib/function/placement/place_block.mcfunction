# /data/ra_lib/function/placement/place_block.mcfunction`
# FINAL STEP YAY !!
# Place physical block with correct facing
# Context: at placement position (block-aligned + 0.5 offset)
# Uses: @p[tag=ra.placer] ra.block_facing
# Input via storage ra:block {block_tag:string, block_id:string, dir_type:int}

# Get block data from storage
execute store result score #dir_type ra.temp run data get storage ra:block dir_type

# Set player's directional type
execute as @p[tag=ra.placer] run scoreboard players operation @s ra.dir_type = #dir_type ra.temp

# Get player orientation and calculate block direction
execute as @p[tag=ra.placer] run function ra_lib:orientation/get_player_facing
execute as @p[tag=ra.placer] run function ra_lib:orientation/calculate_block_direction
execute as @p[tag=ra.placer] run function ra_lib:orientation/get_rotation_from_facing

# Store facing for block placement
execute as @p[tag=ra.placer] store result score #facing ra.temp run scoreboard players get @s ra.block_facing

# Place block based on facing
execute store result storage ra:temp facing int 1 run scoreboard players get #facing ra.temp
function ra_lib:placement/place_physical_block with storage ra:block

# Summon armor stand
function ra_lib:placement/summon_armor_stand with storage ra:block
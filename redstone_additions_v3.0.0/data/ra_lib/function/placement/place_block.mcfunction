# /data/ra_lib/function/placement/place_block.mcfunction
# FINAL STEP YAY !!
# Place physical block with correct facing
# Context: at placement position (block-aligned + 0.5 offset)
# Uses: @p[tag=ra.placer] ra.block_facing
# Input via storage ra:block data {block_tag:string, block_id:string, dir_type:int}

# Get block data from storage and set player's dir_type
execute store result score @p[tag=ra.placer] ra.dir_type run data get storage ra:block data.dir_type

# Get player orientation and calculate block direction
execute as @p[tag=ra.placer] run function ra_lib:orientation/calculate_block_facing
execute as @p[tag=ra.placer] run function ra_lib:orientation/get_rotation_from_facing

# Store facing for block placement
execute as @p[tag=ra.placer] store result score #facing ra.temp run scoreboard players get @s ra.block_facing

# Place block based on facing
execute store result storage ra:temp facing int 1 run scoreboard players get #facing ra.temp
function ra_lib:placement/place_physical_block with storage ra:block data

# Summon armor stand
function ra_lib:placement/summon_armor_stand with storage ra:block data
# /data/ra_lib/function/orientation/get_rotation_from_facing.mcfunction

# Convert block facing to armor stand rotation
# Input: @s ra.block_facing (0-5: down, up, north, south, west, east)
# Output: Sets storage ra:temp Rotation [yaw, pitch] for armor stand
# Armor stand faces the SAME direction as the block's facing property

# Default rotation [yaw, pitch] - facing south (0, 0)
data modify storage ra:temp Rotation set value [0f, 0f]

# Down (0) - armor stand looks down: yaw 0, pitch 90
execute if score @s ra.block_facing matches 0 run data modify storage ra:temp Rotation set value [0f, 90f]

# Up (1) - armor stand looks up: yaw 0, pitch -90
execute if score @s ra.block_facing matches 1 run data modify storage ra:temp Rotation set value [0f, -90f]

# North (2) - yaw 180 (facing north)
execute if score @s ra.block_facing matches 2 run data modify storage ra:temp Rotation set value [180f, 0f]

# South (3) - yaw 0 (facing south)
execute if score @s ra.block_facing matches 3 run data modify storage ra:temp Rotation set value [0f, 0f]

# West (4) - yaw 90 (facing west)
execute if score @s ra.block_facing matches 4 run data modify storage ra:temp Rotation set value [90f, 0f]

# East (5) - yaw -90 / 270 (facing east)
execute if score @s ra.block_facing matches 5 run data modify storage ra:temp Rotation set value [-90f, 0f]
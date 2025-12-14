# /data/ra_lib/function/orientation/get_rotation_from_facing.mcfunction

# Convert block facing to armor stand rotation
# Input: @s ra.block_facing
# Output: Sets storage ra:temp {yaw:float, pitch:float}

# Default
data modify storage ra:temp yaw set value 0f
data modify storage ra:temp pitch set value 0f

# Down (0) - pitch 90
execute if score @s ra.block_facing matches 0 run data modify storage ra:temp pitch set value 90f

# Up (1) - pitch -90
execute if score @s ra.block_facing matches 1 run data modify storage ra:temp pitch set value -90f

# North (2) - yaw 180
execute if score @s ra.block_facing matches 2 run data modify storage ra:temp yaw set value 180f

# South (3) - yaw 0
execute if score @s ra.block_facing matches 3 run data modify storage ra:temp yaw set value 0f

# West (4) - yaw 90
execute if score @s ra.block_facing matches 4 run data modify storage ra:temp yaw set value 90f

# East (5) - yaw -90
execute if score @s ra.block_facing matches 5 run data modify storage ra:temp yaw set value -90f
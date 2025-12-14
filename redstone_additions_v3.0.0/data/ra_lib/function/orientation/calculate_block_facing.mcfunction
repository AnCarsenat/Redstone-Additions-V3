# /data/ra_lib/function/orientation/calculate_block_facing.mcfunction

# Calculate the direction the BLOCK should face (toward the player - opposite of player look direction)
# Input: @s = player, @s ra.dir_type
# Output: @s ra.block_facing (0-5: down, up, north, south, west, east)

execute store result score @s ra.player_yaw run data get entity @s Rotation[0]
execute store result score @s ra.player_pitch run data get entity @s Rotation[1]

# Default to north facing
scoreboard players set @s ra.block_facing 2

# Non-directional blocks (dir_type 0) stay at default
execute if score @s ra.dir_type matches 0 run return 0

# Check vertical first (for dir_type 2 - full directional)
# Looking down (positive pitch) -> block faces UP (pointing away from player)
# Looking up (negative pitch) -> block faces DOWN (pointing away from player)
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches 45.. run scoreboard players set @s ra.block_facing 1
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches 45.. run return 1
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches ..-45 run scoreboard players set @s ra.block_facing 0
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches ..-45 run return 1

# Horizontal facing (block faces toward where player is looking FROM, i.e., toward player)
# Minecraft yaw: 0 = south, 90 = west, 180/-180 = north, -90 = east
# Player facing south (yaw ~0°) -> block faces NORTH (toward player)
# Player facing west (yaw ~90°) -> block faces EAST (toward player)  
# Player facing north (yaw ~180°) -> block faces SOUTH (toward player)
# Player facing east (yaw ~-90°) -> block faces WEST (toward player)

# East (-90): player yaw -135 to -45 -> block faces west (4)
execute if score @s ra.player_yaw matches -135..-46 run scoreboard players set @s ra.block_facing 4
execute if score @s ra.player_yaw matches -135..-46 run return 1

# North (180/-180): player yaw -180 to -135 OR 135 to 180 -> block faces south (3)
execute if score @s ra.player_yaw matches -180..-136 run scoreboard players set @s ra.block_facing 3
execute if score @s ra.player_yaw matches -180..-136 run return 1
execute if score @s ra.player_yaw matches 136..180 run scoreboard players set @s ra.block_facing 3
execute if score @s ra.player_yaw matches 136..180 run return 1

# West (90): player yaw 45 to 135 -> block faces east (5)
execute if score @s ra.player_yaw matches 46..135 run scoreboard players set @s ra.block_facing 5
execute if score @s ra.player_yaw matches 46..135 run return 1

# South (0): player yaw -45 to 45 -> block faces north (2)
execute if score @s ra.player_yaw matches -45..45 run scoreboard players set @s ra.block_facing 2
# /data/ra_lib/function/orientation/calculate_block_direction.mcfunction

# Calculate the direction the BLOCK should face (opposite of player look direction)
# Input: @s ra.player_yaw, @s ra.player_pitch, @s ra.dir_type
# Output: @s ra.block_facing (0-5: down, up, north, south, west, east)

# Default to no direction
scoreboard players set @s ra.block_facing 0

# Non-directional blocks (dir_type 0) stay at 0
execute if score @s ra.dir_type matches 0 run return 0

# Check vertical first (for dir_type 2 - full directional)
scoreboard players set @s ra.axis 0
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches ..-45 run scoreboard players set @s ra.axis 1
execute if score @s ra.dir_type matches 2 if score @s ra.player_pitch matches 45.. run scoreboard players set @s ra.axis 2

# If looking down -> block faces up
execute if score @s ra.axis matches 2 run scoreboard players set @s ra.block_facing 1
execute if score @s ra.axis matches 2 run return 1

# If looking up -> block faces down
execute if score @s ra.axis matches 1 run scoreboard players set @s ra.block_facing 0
execute if score @s ra.axis matches 1 run return 1

# Horizontal facing (opposite of player yaw)
# Player facing south (0°) -> block faces north (2)
# Player facing west (90°) -> block faces east (5)
# Player facing north (180°) -> block faces south (3)
# Player facing east (-90°) -> block faces west (4)

execute if score @s ra.player_yaw matches -45..44 run scoreboard players set @s ra.block_facing 2
execute if score @s ra.player_yaw matches 45..134 run scoreboard players set @s ra.block_facing 4
execute if score @s ra.player_yaw matches 135..180 run scoreboard players set @s ra.block_facing 3
execute if score @s ra.player_yaw matches -180..-136 run scoreboard players set @s ra.block_facing 3
execute if score @s ra.player_yaw matches -135..-46 run scoreboard players set @s ra.block_facing 5
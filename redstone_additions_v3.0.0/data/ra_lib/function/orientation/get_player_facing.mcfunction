# /data/ra_lib/function/orientation/get_player_facing.mcfunction`
# Get player's facing direction
# Context: Execute as player
# Sets: @s ra.player_yaw, @s ra.player_pitch

execute store result score @s ra.player_yaw run data get entity @s Rotation[0]
execute store result score @s ra.player_pitch run data get entity @s Rotation[1]
# /ra_interactive:blocks/pusher/tp_player
# Teleport player forward based on pusher facing. As player, at player position.
# Uses local coordinates from the pusher's rotation.

# Store the pusher's position and execute the tp from there
execute at @e[tag=ra.custom_block.pusher,distance=..3,limit=1,sort=nearest] run tp @s ^ ^ ^1

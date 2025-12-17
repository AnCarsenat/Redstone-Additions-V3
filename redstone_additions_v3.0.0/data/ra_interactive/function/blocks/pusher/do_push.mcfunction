# /ra_interactive:blocks/pusher/do_push
# Execute the push on all entities above. As armor stand at pusher position.
# Teleports ALL entities (including players) 1 block forward in facing direction.

# Teleport all entities above (excluding markers/armor stands) 1 block forward
# Using local coordinates from armor stand's rotation
execute as @e[type=!armor_stand,type=!item_frame,type=!marker,dx=0,dy=1,dz=0,distance=..2] at @s run tp @s ^ ^ ^1

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ra.cooldown 20

# Sound effect
playsound minecraft:block.piston.extend block @a[distance=..8] ~ ~ ~ 0.5 1.2

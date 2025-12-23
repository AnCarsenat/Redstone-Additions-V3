# /ra_interactive:blocks/pusher/do_push
# Execute the push on all entities above. As armor stand at pusher position (already positioned for dx/dy/dz check).
# Teleports ALL entities (including players) 0.5 blocks forward in facing direction.

# Teleport entities above (excluding markers/armor stands) 0.5 block forward
# We're already positioned from process.mcfunction
# For each entity: go to their position, use armor stand's rotation, then tp
execute on passengers at @s run tp @s ^ ^ ^-0.5
execute as @e[type=!armor_stand,type=!item_frame,type=!marker,type=!player,dx=0.5,dy=0.5,dz=0.5] at @s rotated as @n[tag=ra.custom_block.pusher,distance=..3] run tp @s ^ ^ ^-0.5
execute as @a[distance=..0.9] at @s rotated as @n[tag=ra.custom_block.pusher,distance=..3] run tp @s ^ ^ ^-1

# Set cooldown (20 ticks = 1 second)
scoreboard players set @n[tag=ra.custom_block.pusher,distance=..3] ra.cooldown 20

# Sound effect
playsound minecraft:block.piston.extend block @a[distance=..8] ~ ~ ~ 0.5 1.2

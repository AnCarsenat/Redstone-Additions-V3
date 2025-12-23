# /ra_interactive:blocks/pusher/process
# Push entities above the pusher forward. As armor stand, at glazed terracotta position.
# 20 tick cooldown after push. If block above, check 1 block higher (hidden pusher).

# Check for entities above and push them
# If there's a solid block directly above, check 1 block higher (hidden pusher mode)
execute unless block ~ ~1 ~ #ra_lib:passable positioned ~-0.25 ~1.5 ~-0.25 if entity @e[type=!armor_stand,type=!item_frame,type=!marker,dx=0.5,dy=0.5,dz=0.5] positioned ~ ~1 ~ run function ra_interactive:blocks/pusher/do_push
# Normal mode - check directly above
execute if block ~ ~1 ~ #ra_lib:passable positioned ~-0.25 ~0.5 ~-0.25 if entity @e[type=!armor_stand,type=!item_frame,type=!marker,dx=0.5,dy=0.5,dz=0.5] run function ra_interactive:blocks/pusher/do_push

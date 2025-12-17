# /ra_interactive:blocks/pusher/process
# Push entities above the pusher forward. As armor stand, at glazed terracotta position.
# Uses Motion for non-players, tp for players. 20 tick cooldown after push.

# Check for entities directly above (within 1.5 blocks up)
execute if entity @e[type=!armor_stand,type=!item_frame,type=!marker,dx=0,dy=1,dz=0,distance=..2] run function ra_interactive:blocks/pusher/do_push


execute at @e[tag=createSENDER] run setblock ~ ~ ~ redstone_wire
scoreboard players set @e[tag=createSENDER] send_distance 3
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=135..180] run tag @s add send_north
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-180..-135] run tag @s add send_north
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-135..-45] run tag @s add send_east
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-45..45] run tag @s add send_south
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=45..135] run tag @s add send_west

execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=135..180] run particle cloud ~ ~0.5 ~-1 0.4 0.4 0.4 0.0001 20 force @a[distance=..7]
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-180..-135] run particle cloud ~ ~0.5 ~-1 0.4 0.4 0.4 0.0001 20 force @a[distance=..7]
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-135..-45] run particle cloud ~1 ~0.5 ~ 0.4 0.4 0.4 0.0001 20 force @a[distance=..7]
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-45..45] run particle cloud ~ ~0.5 ~1 0.4 0.4 0.4 0.0001 20 force @a[distance=..7]
execute as @e[tag=createSENDER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=45..135] run particle cloud ~-1 ~0.5 ~ 0.4 0.4 0.4 0.0001 20 force @a[distance=..7]
tag @e[tag=createSENDER] remove createSENDER
execute as @e[tag=SENDER] at @s unless block ~ ~ ~ redstone_wire run function r:other/eldestroy

tag @e[tag=SENDER] remove sender_off
execute as @e[tag=SENDER] at @s if block ~ ~ ~ redstone_wire[power=0] run tag @s add sender_off

execute at @e[tag=SENDER,tag=!sender_off,tag=send_north,scores={send_distance=3}] run fill ~ ~ ~-3 ~ ~ ~-3 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_north,scores={send_distance=3}] run fill ~ ~ ~-3 ~ ~ ~-3 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_north,scores={send_distance=5}] run fill ~ ~ ~-5 ~ ~ ~-5 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_north,scores={send_distance=5}] run fill ~ ~ ~-5 ~ ~ ~-5 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_north,scores={send_distance=7}] run fill ~ ~ ~-7 ~ ~ ~-7 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_north,scores={send_distance=7}] run fill ~ ~ ~-7 ~ ~ ~-7 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_north,scores={send_distance=12}] run fill ~ ~ ~-12 ~ ~ ~-12 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_north,scores={send_distance=12}] run fill ~ ~ ~-12 ~ ~ ~-12 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_north,scores={send_distance=20}] run fill ~ ~ ~-20 ~ ~ ~-20 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_north,scores={send_distance=20}] run fill ~ ~ ~-20 ~ ~ ~-20 air replace redstone_torch

execute at @e[tag=SENDER,tag=!sender_off,tag=send_south,scores={send_distance=3}] run fill ~ ~ ~3 ~ ~ ~3 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_south,scores={send_distance=3}] run fill ~ ~ ~3 ~ ~ ~3 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_south,scores={send_distance=5}] run fill ~ ~ ~5 ~ ~ ~5 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_south,scores={send_distance=5}] run fill ~ ~ ~5 ~ ~ ~5 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_south,scores={send_distance=7}] run fill ~ ~ ~7 ~ ~ ~7 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_south,scores={send_distance=7}] run fill ~ ~ ~7 ~ ~ ~7 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_south,scores={send_distance=12}] run fill ~ ~ ~12 ~ ~ ~12 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_south,scores={send_distance=12}] run fill ~ ~ ~12 ~ ~ ~12 air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_south,scores={send_distance=20}] run fill ~ ~ ~20 ~ ~ ~20 redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_south,scores={send_distance=20}] run fill ~ ~ ~20 ~ ~ ~20 air replace redstone_torch

execute at @e[tag=SENDER,tag=!sender_off,tag=send_east,scores={send_distance=3}] run fill ~3 ~ ~ ~3 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_east,scores={send_distance=3}] run fill ~3 ~ ~ ~3 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_east,scores={send_distance=5}] run fill ~5 ~ ~ ~5 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_east,scores={send_distance=5}] run fill ~5 ~ ~ ~5 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_east,scores={send_distance=7}] run fill ~7 ~ ~ ~7 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_east,scores={send_distance=7}] run fill ~7 ~ ~ ~7 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_east,scores={send_distance=12}] run fill ~12 ~ ~ ~12 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_east,scores={send_distance=12}] run fill ~12 ~ ~ ~12 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_east,scores={send_distance=20}] run fill ~20 ~ ~ ~20 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_east,scores={send_distance=20}] run fill ~20 ~ ~ ~20 ~ ~ air replace redstone_torch

execute at @e[tag=SENDER,tag=!sender_off,tag=send_west,scores={send_distance=3}] run fill ~-3 ~ ~ ~-3 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_west,scores={send_distance=3}] run fill ~-3 ~ ~ ~-3 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_west,scores={send_distance=5}] run fill ~-5 ~ ~ ~-5 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_west,scores={send_distance=5}] run fill ~-5 ~ ~ ~-5 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_west,scores={send_distance=7}] run fill ~-7 ~ ~ ~-7 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_west,scores={send_distance=7}] run fill ~-7 ~ ~ ~-7 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_west,scores={send_distance=12}] run fill ~-12 ~ ~ ~-12 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_west,scores={send_distance=12}] run fill ~-12 ~ ~ ~-12 ~ ~ air replace redstone_torch
execute at @e[tag=SENDER,tag=!sender_off,tag=send_west,scores={send_distance=20}] run fill ~-20 ~ ~ ~-20 ~ ~ redstone_torch replace air
execute at @e[tag=SENDER,tag=sender_off,tag=send_west,scores={send_distance=20}] run fill ~-20 ~ ~ ~-20 ~ ~ air replace redstone_torch

execute at @a at @e[tag=SENDER,limit=1,sort=nearest,distance=..1,tag=send_north] run particle crit ~ ~0.5 ~-2 0 0 1 0 2 force @a[distance=..1]
execute at @a at @e[tag=SENDER,limit=1,sort=nearest,distance=..1,tag=send_south] run particle crit ~ ~0.5 ~2 0 0 1 0 2 force @a[distance=..1]
execute at @a at @e[tag=SENDER,limit=1,sort=nearest,distance=..1,tag=send_east] run particle crit ~2 ~0.5 ~ 1 0 0 0 2 force @a[distance=..1]
execute at @a at @e[tag=SENDER,limit=1,sort=nearest,distance=..1,tag=send_west] run particle crit ~-2 ~0.5 ~ 1 0 0 0 2 force @a[distance=..1]

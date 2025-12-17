
execute at @e[tag=createBEAMER] run setblock ~ ~ ~ cyan_glazed_terracotta
scoreboard players set @e[tag=createBEAMER] send_distance 2
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=135..180,x_rotation=-45..70] run tag @s add beam_north
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-180..-135,x_rotation=-45..70] run tag @s add beam_north
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-135..-45,x_rotation=-45..70] run tag @s add beam_east
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-45..45,x_rotation=-45..70] run tag @s add beam_south
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=45..135,x_rotation=-45..70] run tag @s add beam_west
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,x_rotation=-90..-45] run tag @s add beam_up
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,x_rotation=70..90] run tag @s add beam_down

execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=135..180,x_rotation=-45..70] run particle dragon_breath ~ ~0.5 ~-1 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-180..-135,x_rotation=-45..70] run particle dragon_breath ~ ~0.5 ~-1 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-135..-45,x_rotation=-45..70] run particle dragon_breath ~1 ~0.5 ~ 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=-45..45,x_rotation=-45..70] run particle dragon_breath ~ ~0.5 ~1 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,y_rotation=45..135,x_rotation=-45..70] run particle dragon_breath ~-1 ~0.5 ~ 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,x_rotation=-90..-45] run particle dragon_breath ~ ~1.5 ~ 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
execute as @e[tag=createBEAMER] at @s if entity @a[limit=1,sort=nearest,distance=..7,x_rotation=70..90] run particle dragon_breath ~ ~-0.5 ~ 0.4 0.4 0.4 0.0001 50 force @a[distance=..7]
tag @e[tag=createBEAMER] remove createBEAMER
execute as @e[tag=BEAMER] at @s unless block ~ ~ ~ cyan_glazed_terracotta run function r:other/eldestroy


tag @e[tag=beam_flanke] remove beam_flanke
tag @e[tag=BEAMER,scores={act_red=0},tag=beam_powered] remove beam_powered
tag @e[tag=BEAMER,scores={act_red=1..},tag=!beam_powered] add beam_flanke
tag @e[tag=BEAMER,scores={act_red=1..},tag=!beam_powered] add beam_powered

tag @e[tag=beam_neg_flanke] remove beam_neg_flanke
tag @e[tag=BEAMER,scores={act_red=1..},tag=beam_neg_powered] remove beam_neg_powered
tag @e[tag=BEAMER,scores={act_red=0},tag=!beam_neg_powered] add beam_neg_flanke
tag @e[tag=BEAMER,scores={act_red=0},tag=!beam_neg_powered] add beam_neg_powered

execute unless entity @e[tag=sound_off] at @e[tag=beam_neg_flanke] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 0.3
execute unless entity @e[tag=sound_off] at @e[tag=beam_flanke] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 0.3


execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_up,scores={send_distance=2,act_red=1..}] unless block ~ ~1 ~ air if block ~ ~3 ~ air run clone ~ ~1 ~ ~ ~1 ~ ~ ~3 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_up,scores={send_distance=3,act_red=1..}] unless block ~ ~1 ~ air if block ~ ~4 ~ air run clone ~ ~1 ~ ~ ~1 ~ ~ ~4 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_up,scores={send_distance=4,act_red=1..}] unless block ~ ~1 ~ air if block ~ ~5 ~ air run clone ~ ~1 ~ ~ ~1 ~ ~ ~5 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_up,scores={send_distance=5,act_red=1..}] unless block ~ ~1 ~ air if block ~ ~6 ~ air run clone ~ ~1 ~ ~ ~1 ~ ~ ~6 ~ replace move

execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_down,scores={send_distance=2,act_red=1..}] unless block ~ ~-1 ~ air if block ~ ~-3 ~ air run clone ~ ~-1 ~ ~ ~-1 ~ ~ ~-3 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_down,scores={send_distance=3,act_red=1..}] unless block ~ ~-1 ~ air if block ~ ~-4 ~ air run clone ~ ~-1 ~ ~ ~-1 ~ ~ ~-4 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_down,scores={send_distance=4,act_red=1..}] unless block ~ ~-1 ~ air if block ~ ~-5 ~ air run clone ~ ~-1 ~ ~ ~-1 ~ ~ ~-5 ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_down,scores={send_distance=5,act_red=1..}] unless block ~ ~-1 ~ air if block ~ ~-6 ~ air run clone ~ ~-1 ~ ~ ~-1 ~ ~ ~-6 ~ replace move

execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_north,scores={send_distance=2,act_red=1..}] unless block ~ ~ ~-1 air if block ~ ~ ~-3 air run clone ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~-3 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_north,scores={send_distance=3,act_red=1..}] unless block ~ ~ ~-1 air if block ~ ~ ~-4 air run clone ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~-4 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_north,scores={send_distance=4,act_red=1..}] unless block ~ ~ ~-1 air if block ~ ~ ~-5 air run clone ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~-5 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_north,scores={send_distance=5,act_red=1..}] unless block ~ ~ ~-1 air if block ~ ~ ~-6 air run clone ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~-6 replace move

execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_south,scores={send_distance=2,act_red=1..}] unless block ~ ~ ~1 air if block ~ ~ ~3 air run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~3 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_south,scores={send_distance=3,act_red=1..}] unless block ~ ~ ~1 air if block ~ ~ ~4 air run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~4 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_south,scores={send_distance=4,act_red=1..}] unless block ~ ~ ~1 air if block ~ ~ ~5 air run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~5 replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_south,scores={send_distance=5,act_red=1..}] unless block ~ ~ ~1 air if block ~ ~ ~6 air run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~6 replace move

execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_east,scores={send_distance=2,act_red=1..}] unless block ~1 ~ ~ air if block ~3 ~ ~ air run clone ~1 ~ ~ ~1 ~ ~ ~3 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_east,scores={send_distance=3,act_red=1..}] unless block ~1 ~ ~ air if block ~4 ~ ~ air run clone ~1 ~ ~ ~1 ~ ~ ~4 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_east,scores={send_distance=4,act_red=1..}] unless block ~1 ~ ~ air if block ~5 ~ ~ air run clone ~1 ~ ~ ~1 ~ ~ ~5 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_east,scores={send_distance=5,act_red=1..}] unless block ~1 ~ ~ air if block ~6 ~ ~ air run clone ~1 ~ ~ ~1 ~ ~ ~6 ~ ~ replace move

execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_west,scores={send_distance=2,act_red=1..}] unless block ~-1 ~ ~ air if block ~-3 ~ ~ air run clone ~-1 ~ ~ ~-1 ~ ~ ~-3 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_west,scores={send_distance=3,act_red=1..}] unless block ~-1 ~ ~ air if block ~-4 ~ ~ air run clone ~-1 ~ ~ ~-1 ~ ~ ~-4 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_west,scores={send_distance=4,act_red=1..}] unless block ~-1 ~ ~ air if block ~-5 ~ ~ air run clone ~-1 ~ ~ ~-1 ~ ~ ~-5 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_flanke,tag=beam_west,scores={send_distance=5,act_red=1..}] unless block ~-1 ~ ~ air if block ~-6 ~ ~ air run clone ~-1 ~ ~ ~-1 ~ ~ ~-6 ~ ~ replace move


execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_up,scores={send_distance=2}] unless block ~ ~3 ~ air if block ~ ~1 ~ air run clone ~ ~3 ~ ~ ~3 ~ ~ ~1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_up,scores={send_distance=3}] unless block ~ ~4 ~ air if block ~ ~1 ~ air run clone ~ ~4 ~ ~ ~4 ~ ~ ~1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_up,scores={send_distance=4}] unless block ~ ~5 ~ air if block ~ ~1 ~ air run clone ~ ~5 ~ ~ ~5 ~ ~ ~1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_up,scores={send_distance=5}] unless block ~ ~6 ~ air if block ~ ~1 ~ air run clone ~ ~6 ~ ~ ~6 ~ ~ ~1 ~ replace move

execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_down,scores={send_distance=2}] unless block ~ ~-3 ~ air if block ~ ~-1 ~ air run clone ~ ~-3 ~ ~ ~-3 ~ ~ ~-1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_down,scores={send_distance=3}] unless block ~ ~-4 ~ air if block ~ ~-1 ~ air run clone ~ ~-4 ~ ~ ~-4 ~ ~ ~-1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_down,scores={send_distance=4}] unless block ~ ~-5 ~ air if block ~ ~-1 ~ air run clone ~ ~-5 ~ ~ ~-5 ~ ~ ~-1 ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_down,scores={send_distance=5}] unless block ~ ~-6 ~ air if block ~ ~-1 ~ air run clone ~ ~-6 ~ ~ ~-6 ~ ~ ~-1 ~ replace move

execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_north,scores={send_distance=2}] unless block ~ ~ ~-3 air if block ~ ~ ~-1 air run clone ~ ~ ~-3 ~ ~ ~-3 ~ ~ ~-1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_north,scores={send_distance=3}] unless block ~ ~ ~-4 air if block ~ ~ ~-1 air run clone ~ ~ ~-4 ~ ~ ~-4 ~ ~ ~-1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_north,scores={send_distance=4}] unless block ~ ~ ~-5 air if block ~ ~ ~-1 air run clone ~ ~ ~-5 ~ ~ ~-5 ~ ~ ~-1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_north,scores={send_distance=5}] unless block ~ ~ ~-6 air if block ~ ~ ~-1 air run clone ~ ~ ~-6 ~ ~ ~-6 ~ ~ ~-1 replace move

execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_south,scores={send_distance=2}] unless block ~ ~ ~3 air if block ~ ~ ~1 air run clone ~ ~ ~3 ~ ~ ~3 ~ ~ ~1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_south,scores={send_distance=3}] unless block ~ ~ ~4 air if block ~ ~ ~1 air run clone ~ ~ ~4 ~ ~ ~4 ~ ~ ~1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_south,scores={send_distance=4}] unless block ~ ~ ~5 air if block ~ ~ ~1 air run clone ~ ~ ~5 ~ ~ ~5 ~ ~ ~1 replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_south,scores={send_distance=5}] unless block ~ ~ ~6 air if block ~ ~ ~1 air run clone ~ ~ ~6 ~ ~ ~6 ~ ~ ~1 replace move

execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_east,scores={send_distance=2}] unless block ~3 ~ ~ air if block ~1 ~ ~ air run clone ~3 ~ ~ ~3 ~ ~ ~1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_east,scores={send_distance=3}] unless block ~4 ~ ~ air if block ~1 ~ ~ air run clone ~4 ~ ~ ~4 ~ ~ ~1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_east,scores={send_distance=4}] unless block ~5 ~ ~ air if block ~1 ~ ~ air run clone ~5 ~ ~ ~5 ~ ~ ~1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_east,scores={send_distance=5}] unless block ~6 ~ ~ air if block ~1 ~ ~ air run clone ~6 ~ ~ ~6 ~ ~ ~1 ~ ~ replace move

execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_west,scores={send_distance=2}] unless block ~-3 ~ ~ air if block ~-1 ~ ~ air run clone ~-3 ~ ~ ~-3 ~ ~ ~-1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_west,scores={send_distance=3}] unless block ~-4 ~ ~ air if block ~-1 ~ ~ air run clone ~-4 ~ ~ ~-4 ~ ~ ~-1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_west,scores={send_distance=4}] unless block ~-5 ~ ~ air if block ~-1 ~ ~ air run clone ~-5 ~ ~ ~-5 ~ ~ ~-1 ~ ~ replace move
execute at @e[tag=BEAMER,tag=beam_neg_flanke,tag=beam_west,scores={send_distance=5}] unless block ~-6 ~ ~ air if block ~-1 ~ ~ air run clone ~-6 ~ ~ ~-6 ~ ~ ~-1 ~ ~ replace move


execute at @a at @e[tag=BEAMER,limit=1,sort=nearest,distance=..1,tag=beam_north] run particle crit ~ ~0.5 ~-2 0 0 1 0 2 force @a[distance=..1]
execute at @a at @e[tag=BEAMER,limit=1,sort=nearest,distance=..1,tag=beam_south] run particle crit ~ ~0.5 ~2 0 0 1 0 2 force @a[distance=..1]
execute at @a at @e[tag=BEAMER,limit=1,sort=nearest,distance=..1,tag=beam_east] run particle crit ~2 ~0.5 ~ 1 0 0 0 2 force @a[distance=..1]
execute at @a at @e[tag=BEAMER,limit=1,sort=nearest,distance=..1,tag=beam_west] run particle crit ~-2 ~0.5 ~ 1 0 0 0 2 force @a[distance=..1]

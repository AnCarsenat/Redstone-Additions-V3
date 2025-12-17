
execute at @e[tag=createMESSAGE] run setblock ~ ~ ~ dried_kelp_block
execute as @e[tag=createMESSAGE] run scoreboard players set @s send_distance 1000
execute at @e[tag=createMESSAGE] run summon cow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:0b,DeathLootTable:"none",PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Age:-1999980,Tags:["MESSAGECOW"],CustomName:"{\"text\":\"UNSET\",\"color\":\"aqua\",\"bold\":\"true\",\"italic\":\"false\"}"}
tag @e[tag=createMESSAGE] remove createMESSAGE
execute as @e[tag=MESSAGE] at @s unless block ~ ~ ~ dried_kelp_block run kill @e[tag=MESSAGECOW,limit=1,sort=nearest,distance=..1]
execute as @e[tag=MESSAGE] at @s unless block ~ ~ ~ dried_kelp_block run function r:other/eldestroy

execute as @e[tag=MESSAGE] at @s positioned ~-0.5 ~ ~-0.5 unless entity @a[distance=..1.5] run teleport @e[tag=MESSAGECOW,limit=1,sort=nearest,distance=..1] ~0.5 ~-0.1 ~0.4
execute as @e[tag=MESSAGE] at @s positioned ~-0.5 ~ ~-0.5 if entity @a[distance=..1.5] run teleport @e[tag=MESSAGECOW,limit=1,sort=nearest,distance=..1] ~0.5 ~0.35 ~0.4

tag @e[tag=mes_flanke] remove mes_flanke
tag @e[tag=MESSAGE,scores={act_red=0},tag=mes_powered] remove mes_powered
tag @e[tag=MESSAGE,scores={act_red=1..},tag=!mes_powered] add mes_flanke
tag @e[tag=MESSAGE,scores={act_red=1..},tag=!mes_powered] add mes_powered

execute as @e[tag=mes_flanke] at @s run function r:oelements/messagefinder
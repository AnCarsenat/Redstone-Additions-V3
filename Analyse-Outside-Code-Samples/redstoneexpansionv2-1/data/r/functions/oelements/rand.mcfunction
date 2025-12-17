
execute at @e[tag=createRAND] run setblock ~ ~ ~ bookshelf
tag @e[tag=createRAND] remove createRAND
execute as @e[tag=RAND] at @s unless block ~ ~ ~ bookshelf run function r:other/eldestroy


tag @e[tag=rand_flanke] remove rand_flanke
tag @e[tag=RAND,scores={act_red=0},tag=rand_powered] remove rand_powered
tag @e[tag=RAND,scores={act_red=1..},tag=!rand_powered] add rand_flanke
tag @e[tag=RAND,scores={act_red=1..},tag=!rand_powered] add rand_powered

execute at @e[tag=rand_flanke] run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Tags:["randt","rand_1"]}
execute at @e[tag=rand_flanke] run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Tags:["randt","rand_2"]}
tag @e[tag=randt,sort=random,limit=1] add rand_select
execute at @e[tag=rand_select,tag=rand_1] run tag @e[tag=RAND,tag=out_success,distance=..1,sort=nearest,limit=1] remove out_success
execute at @e[tag=rand_select,tag=rand_2] run tag @e[tag=RAND,tag=!out_success,distance=..1,sort=nearest,limit=1] add out_success
kill @e[tag=randt]

execute at @e[tag=createNOR] run setblock ~ ~ ~ yellow_concrete
tag @e[tag=createNOR] remove createNOR
execute as @e[tag=NOR] at @s unless block ~ ~ ~ yellow_concrete run function r:other/eldestroy

tag @e[tag=NOR] remove out_success
tag @e[tag=NOR,scores={act_red=0,inac_red=1..}] add out_success
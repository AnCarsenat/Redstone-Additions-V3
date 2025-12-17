
execute at @e[tag=createXNOR] run setblock ~ ~ ~ light_blue_terracotta
tag @e[tag=createXNOR] remove createXNOR
execute as @e[tag=XNOR] at @s unless block ~ ~ ~ light_blue_terracotta run function r:other/eldestroy

tag @e[tag=XNOR] remove out_success
tag @e[tag=XNOR,scores={act_red=1..,inac_red=0}] add out_success
tag @e[tag=XNOR,scores={act_red=0,inac_red=1..}] add out_success

execute at @e[tag=createXOR] run setblock ~ ~ ~ diamond_block
tag @e[tag=createXOR] remove createXOR
execute as @e[tag=XOR] at @s unless block ~ ~ ~ diamond_block run function r:other/eldestroy

tag @e[tag=XOR] remove out_success
tag @e[tag=XOR,scores={act_red=1,inac_red=1}] add out_success
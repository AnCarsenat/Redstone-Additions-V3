
execute at @e[tag=createAND] run setblock ~ ~ ~ gold_block
tag @e[tag=createAND] remove createAND
execute as @e[tag=AND] at @s unless block ~ ~ ~ gold_block run function r:other/eldestroy

tag @e[tag=AND] remove out_success
tag @e[tag=AND,scores={act_red=1..,inac_red=0}] add out_success
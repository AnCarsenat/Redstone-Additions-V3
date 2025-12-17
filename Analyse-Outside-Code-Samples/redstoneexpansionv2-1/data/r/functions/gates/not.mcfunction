
execute at @e[tag=createNOT] run setblock ~ ~ ~ lapis_block
tag @e[tag=createNOT] remove createNOT
execute as @e[tag=NOT] at @s unless block ~ ~ ~ lapis_block run function r:other/eldestroy

tag @e[tag=NOT] remove out_success
tag @e[tag=NOT,scores={inac_red=1..,act_red=0}] add out_success
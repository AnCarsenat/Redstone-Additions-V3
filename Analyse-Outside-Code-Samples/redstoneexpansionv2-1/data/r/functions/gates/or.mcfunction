
execute at @e[tag=createOR] run setblock ~ ~ ~ iron_block
tag @e[tag=createOR] remove createOR
execute as @e[tag=OR] at @s unless block ~ ~ ~ iron_block run function r:other/eldestroy

tag @e[tag=OR] remove out_success
tag @e[tag=OR,scores={act_red=1..}] add out_success
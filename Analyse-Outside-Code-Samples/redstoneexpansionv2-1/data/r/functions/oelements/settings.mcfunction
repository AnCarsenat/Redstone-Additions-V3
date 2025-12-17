
execute at @e[tag=createSETTINGS] run setblock ~ ~ ~ structure_block[mode=data]
execute at @e[tag=createSETTINGS] at @e[tag=SETTINGS,distance=1..] run setblock ~ ~ ~ air
tag @e[tag=createSETTINGS] remove createSETTINGS
execute as @e[tag=SETTINGS] at @s unless block ~ ~ ~ structure_block[mode=data] run function r:other/eldestroy


execute at @e[tag=createGATESET] run setblock ~ ~ ~ obsidian
tag @e[tag=createGATESET] remove createGATESET
execute as @e[tag=GATESSET] at @s unless block ~ ~ ~ obsidian run kill @s

execute at @e[tag=createSHORTSET] run setblock ~ ~ ~ black_concrete
tag @e[tag=createSHORTSET] remove createSHORTSET
execute as @e[tag=SHORTSET] at @s unless block ~ ~ ~ black_concrete run kill @s
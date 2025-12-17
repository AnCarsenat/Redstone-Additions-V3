
execute at @e[tag=createNAND] run setblock ~ ~ ~ lime_concrete
tag @e[tag=createNAND] remove createNAND
execute as @e[tag=NAND] at @s unless block ~ ~ ~ lime_concrete run function r:other/eldestroy

tag @e[tag=NAND] remove out_success
tag @e[tag=NAND,scores={inac_red=1..}] add out_success
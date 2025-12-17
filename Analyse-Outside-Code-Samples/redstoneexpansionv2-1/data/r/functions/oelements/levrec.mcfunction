
execute at @e[tag=createLEVREC] run setblock ~ ~ ~ stripped_acacia_wood
tag @e[tag=createLEVREC] remove createLEVREC
execute as @e[tag=LEVREC] at @s if block ~ ~ ~ air run function r:other/eldestroy

execute at @e[tag=levrec_on,tag=LEVREC] unless block ~ ~ ~ redstone_block run setblock ~ ~ ~ redstone_block
execute at @e[tag=!levrec_on,tag=LEVREC] if block ~ ~ ~ redstone_block run setblock ~ ~ ~ stripped_acacia_wood
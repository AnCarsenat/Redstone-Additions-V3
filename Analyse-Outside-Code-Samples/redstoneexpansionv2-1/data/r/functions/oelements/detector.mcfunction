
execute at @e[tag=createDETECTOR] run setblock ~ ~ ~ dispenser[facing=down]
execute at @e[tag=createDETECTOR] run data merge block ~ ~ ~ {Lock:"supersecret"}
scoreboard players set @e[tag=createDETECTOR] detect_player 1
scoreboard players set @e[tag=createDETECTOR] detect_radius 4
tag @e[tag=createDETECTOR] remove createDETECTOR
execute as @e[tag=DETECTOR] at @s unless block ~ ~ ~ dispenser run function r:other/eldestroy

tag @e[tag=out_success,tag=DETECTOR] remove out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=2}] at @s if entity @a[distance=..2] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=4}] at @s if entity @a[distance=..4] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=8}] at @s if entity @a[distance=..8] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=12}] at @s if entity @a[distance=..12] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=15}] at @s if entity @a[distance=..15] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=1,detect_radius=20}] at @s if entity @a[distance=..20] run tag @s[tag=!out_success] add out_success

execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=2}] at @s if entity @e[distance=..2,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=4}] at @s if entity @e[distance=..4,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=8}] at @s if entity @e[distance=..8,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=12}] at @s if entity @e[distance=..12,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=15}] at @s if entity @e[distance=..15,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=2,detect_radius=20}] at @s if entity @e[distance=..20,type=!player,type=!armor_stand] run tag @s[tag=!out_success] add out_success

execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=2}] at @s if entity @e[distance=..2,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=4}] at @s if entity @e[distance=..4,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=8}] at @s if entity @e[distance=..8,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=12}] at @s if entity @e[distance=..12,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=15}] at @s if entity @e[distance=..15,type=!armor_stand] run tag @s[tag=!out_success] add out_success
execute as @e[tag=DETECTOR,scores={detect_player=3,detect_radius=20}] at @s if entity @e[distance=..20,type=!armor_stand] run tag @s[tag=!out_success] add out_success



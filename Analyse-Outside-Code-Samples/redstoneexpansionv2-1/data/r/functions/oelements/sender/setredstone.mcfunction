
scoreboard objectives add x_dummy dummy
scoreboard objectives add y_dummy dummy
scoreboard objectives add z_dummy dummy

execute as @e[tag=setredstone] store result score @s x_dummy run data get entity @s Pos[0] 1
execute as @e[tag=setredstone] run scoreboard players operation @s x_dummy -= @s sender_x
execute as @e[tag=setredstone] store result score @s y_dummy run data get entity @s Pos[1] 1
execute as @e[tag=setredstone] run scoreboard players operation @s y_dummy -= @s sender_y
execute as @e[tag=setredstone] store result score @s z_dummy run data get entity @s Pos[2] 1
execute as @e[tag=setredstone] run scoreboard players operation @s z_dummy -= @s sender_z


execute as @e[scores={x_dummy=100..}] at @s run tp @s ~-100 ~ ~
execute as @e[scores={x_dummy=10..}] at @s run tp @s ~-10 ~ ~
execute as @e[scores={x_dummy=1..}] at @s run tp @s ~-1 ~ ~
execute as @e[scores={x_dummy=..-100}] at @s run tp @s ~100 ~ ~
execute as @e[scores={x_dummy=..-10}] at @s run tp @s ~10 ~ ~
execute as @e[scores={x_dummy=..-1}] at @s run tp @s ~1 ~ ~

execute as @e[scores={y_dummy=100..}] at @s run tp @s ~ ~-100 ~
execute as @e[scores={y_dummy=10..}] at @s run tp @s ~ ~-10 ~
execute as @e[scores={y_dummy=1..}] at @s run tp @s ~ ~-1 ~
execute as @e[scores={y_dummy=..-100}] at @s run tp @s ~ ~100 ~
execute as @e[scores={y_dummy=..-10}] at @s run tp @s ~ ~10 ~
execute as @e[scores={y_dummy=..-1}] at @s run tp @s ~ ~1 ~

execute as @e[scores={z_dummy=100..}] at @s run tp @s ~ ~ ~-100
execute as @e[scores={z_dummy=10..}] at @s run tp @s ~ ~ ~-10
execute as @e[scores={z_dummy=1..}] at @s run tp @s ~ ~ ~-1
execute as @e[scores={z_dummy=..-100}] at @s run tp @s ~ ~ ~100
execute as @e[scores={z_dummy=..-10}] at @s run tp @s ~ ~ ~10
execute as @e[scores={z_dummy=..-1}] at @s run tp @s ~ ~ ~1

execute unless entity @e[scores={x_dummy=-1..1,y_dummy=0,z_dummy=-1..1}] run function r:oelements/sender/setredstone

scoreboard objectives remove x_dummy
scoreboard objectives remove y_dummy
scoreboard objectives remove z_dummy


scoreboard players set @e[tag=checkRed] act_red 0
scoreboard players set @e[tag=checkRed] inac_red 0
execute as @e[tag=checkRed] at @s if block ~1 ~ ~ redstone_wire run tag @s add hasred1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ redstone_wire run tag @s add hasred2
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 redstone_wire run tag @s add hasred3
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 redstone_wire run tag @s add hasred4
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ redstone_wire run tag @s add hasred5
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ redstone_wire run tag @s add hasred6

execute as @e[tag=checkRed] at @s if block ~1 ~ ~ redstone_wire[power=0] run tag @s remove hasred1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ redstone_wire[power=0] run tag @s remove hasred2
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 redstone_wire[power=0] run tag @s remove hasred3
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 redstone_wire[power=0] run tag @s remove hasred4
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ redstone_wire[power=0] run tag @s remove hasred5
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ redstone_wire[power=0] run tag @s remove hasred6

scoreboard players add @e[tag=hasred1] act_red 1
scoreboard players add @e[tag=hasred2] act_red 1
scoreboard players add @e[tag=hasred3] act_red 1
scoreboard players add @e[tag=hasred4] act_red 1
scoreboard players add @e[tag=hasred5] act_red 1
scoreboard players add @e[tag=hasred6] act_red 1

execute as @e[tag=checkRed] at @s if block ~1 ~ ~ redstone_wire[power=0] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ redstone_wire[power=0] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 redstone_wire[power=0] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 redstone_wire[power=0] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ redstone_wire[power=0] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ redstone_wire[power=0] run scoreboard players add @s inac_red 1

tag @e[tag=hasred1] remove hasred1
tag @e[tag=hasred2] remove hasred2
tag @e[tag=hasred3] remove hasred3
tag @e[tag=hasred4] remove hasred4
tag @e[tag=hasred5] remove hasred5
tag @e[tag=hasred6] remove hasred6

execute as @e[tag=checkRed] at @s if block ~1 ~ ~ redstone_torch[lit=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ redstone_torch[lit=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 redstone_torch[lit=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 redstone_torch[lit=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ redstone_torch[lit=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ redstone_torch[lit=true] run scoreboard players add @s act_red 1

execute as @e[tag=checkRed] at @s if block ~1 ~ ~ lever[powered=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ lever[powered=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 lever[powered=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 lever[powered=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ lever[powered=true] run scoreboard players add @s act_red 1
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ lever[powered=true] run scoreboard players add @s act_red 1

execute as @e[tag=checkRed] at @s if block ~1 ~ ~ lever[powered=false] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~-1 ~ ~ lever[powered=false] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~1 lever[powered=false] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~ ~-1 lever[powered=false] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~1 ~ lever[powered=false] run scoreboard players add @s inac_red 1
execute as @e[tag=checkRed] at @s if block ~ ~-1 ~ lever[powered=false] run scoreboard players add @s inac_red 1


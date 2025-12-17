
execute as @e[tag=createimpgen] run scoreboard players set @s time_on 20
execute as @e[tag=createimpgen] run scoreboard players set @s time_off 20
execute as @e[tag=createimpgen] run scoreboard players operation @s time_current = @s time_off
execute at @e[tag=createimpgen] run setblock ~ ~ ~ emerald_block
tag @e[tag=createimpgen] remove createimpgen
execute as @e[tag=impgen] at @s if block ~ ~ ~ air run function r:other/eldestroy


scoreboard players remove @e[tag=impgen] time_current 1
execute as @e[tag=impgen,scores={time_current=..0}] at @s if block ~ ~ ~ emerald_block run tag @s add tmer_on
execute as @e[tag=tmer_on] run scoreboard players operation @s time_current = @s time_on
execute at @e[tag=tmer_on] run setblock ~ ~ ~ redstone_block
execute as @e[tag=impgen,scores={time_current=0}] at @s if block ~ ~ ~ redstone_block run tag @s add tmer_off
execute as @e[tag=tmer_off] run scoreboard players operation @s time_current = @s time_off
execute at @e[tag=tmer_off] run setblock ~ ~ ~ emerald_block

execute unless entity @e[tag=sound_off] at @e[tag=tmer_on] run playsound minecraft:block.stone_button.click_on master @a ~ ~ ~ 0.4
execute unless entity @e[tag=sound_off] at @e[tag=tmer_off] run playsound minecraft:block.stone_button.click_off master @a ~ ~ ~ 0.4

tag @e[tag=tmer_off] remove tmer_off
tag @e[tag=tmer_on] remove tmer_on

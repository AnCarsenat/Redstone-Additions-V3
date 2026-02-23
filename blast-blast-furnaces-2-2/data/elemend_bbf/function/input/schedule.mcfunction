tag @s remove elemend_bbf_next

execute if block ~ ~1 ~ minecraft:air positioned ~ ~1 ~ run function elemend_bbf:input/display

#set up the recipe timing: 2 ticks before the recipe is finished smelting
execute store result score @s elemend_bbf_ctime run data get entity @s data.cooking_time_spent 1
execute store result score @s elemend_bbf_calc run data get entity @s data.cooking_total_time 1
scoreboard players operation @s elemend_bbf_calc -= @s elemend_bbf_ctime
execute if score @s elemend_bbf_calc matches 5.. run scoreboard players remove @s elemend_bbf_calc 2

execute store result score @s elemend_bbf_timing run time query gametime
scoreboard players operation @s elemend_bbf_timing += @s elemend_bbf_calc

execute store result entity @s data.cooking_remain int 1 run scoreboard players get @s elemend_bbf_calc
execute if score @s elemend_bbf_calc matches 3.. run function elemend_bbf:input/variable_schedule with entity @s data
execute if score @s elemend_bbf_calc matches ..2 run function elemend_bbf:expire
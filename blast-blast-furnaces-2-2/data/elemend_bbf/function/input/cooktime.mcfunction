execute store result score @s elemend_bbf_ctime run data get entity @s data.cooking_time_spent 1
execute store result score @s elemend_bbf_calc run data get entity @s data.cooking_total_time 1
scoreboard players operation @s elemend_bbf_calc -= @s elemend_bbf_ctime
#gives the remaining cooktime of the smelted item on the executing entity in scoreboard elemend_bbf_calc
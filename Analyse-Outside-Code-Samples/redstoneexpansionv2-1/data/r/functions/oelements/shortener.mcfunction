
execute at @e[tag=createSHORTENER] run setblock ~ ~ ~ mossy_stone_bricks
scoreboard players set @e[tag=createSHORTENER] shorten_current 0
scoreboard players set @e[tag=createSHORTENER] shorten_amount 1
tag @e[tag=createSHORTENER] remove createSHORTENER
execute as @e[tag=SHORTENER] at @s unless block ~ ~ ~ mossy_stone_bricks run function r:other/eldestroy

scoreboard players remove @e[tag=SHORTENER,scores={shorten_current=1..}] shorten_current 1
tag @e[tag=short_flanke] remove short_flanke
tag @e[tag=SHORTENER,scores={act_red=0},tag=short_powered] remove short_powered
tag @e[tag=SHORTENER,scores={act_red=1..},tag=!short_powered] add short_flanke
tag @e[tag=SHORTENER,scores={act_red=1..},tag=!short_powered] add short_powered

execute as @e[tag=SHORTENER,tag=short_flanke] run scoreboard players operation @s shorten_current = @s shorten_amount

tag @e[tag=SHORTENER,scores={shorten_current=1..,act_red=1..}] add out_success
tag @e[tag=SHORTENER,scores={shorten_current=..0}] remove out_success
tag @e[tag=SHORTENER,scores={act_red=..0}] remove out_success

execute unless entity @e[tag=sound_off] at @e[tag=short_flanke] run playsound block.fire.extinguish master @a ~ ~ ~ 1
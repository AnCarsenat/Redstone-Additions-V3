
execute at @e[tag=createDELAYER] run setblock ~ ~ ~ chiseled_stone_bricks
scoreboard players set @e[tag=createDELAYER] shorten_amount 20
execute as @e[tag=createDELAYER] run scoreboard players operation @s shorten_current = @s shorten_amount
tag @e[tag=createDELAYER] remove createDELAYER
execute as @e[tag=DELAYER] at @s unless block ~ ~ ~ chiseled_stone_bricks run function r:other/eldestroy

tag @e[tag=DELAYER,scores={act_red=1..,shorten_current=0..}] add delayer_start
scoreboard players remove @e[tag=DELAYER,tag=delayer_start,scores={shorten_current=-1..}] shorten_current 1
tag @e[tag=DELAYER,scores={act_red=0,shorten_current=..-1}] remove delayer_start

tag @e[tag=DELAYER,scores={shorten_current=..0}] add out_success
tag @e[tag=DELAYER,scores={shorten_current=1..}] remove out_success

execute as @e[tag=DELAYER,scores={act_red=0,shorten_current=..-1}] run scoreboard players operation @s shorten_current = @s shorten_amount
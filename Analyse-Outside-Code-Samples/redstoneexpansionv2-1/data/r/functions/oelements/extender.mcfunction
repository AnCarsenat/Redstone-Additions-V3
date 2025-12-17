
execute at @e[tag=createEXTENDER] run setblock ~ ~ ~ mossy_cobblestone
scoreboard players set @e[tag=createEXTENDER] extend_amount 20
scoreboard players set @e[tag=createEXTENDER] extend_current 0
tag @e[tag=createEXTENDER] remove createEXTENDER
execute as @e[tag=EXTENDER] at @s unless block ~ ~ ~ mossy_cobblestone run function r:other/eldestroy

scoreboard players remove @e[tag=EXTENDER,scores={extend_current=1..}] extend_current 1
execute as @e[tag=EXTENDER,scores={act_red=1..}] run scoreboard players operation @s extend_current = @s extend_amount

tag @e[tag=EXTENDER,scores={extend_current=1..}] add out_success
tag @e[tag=EXTENDER,scores={extend_current=..0}] remove out_success
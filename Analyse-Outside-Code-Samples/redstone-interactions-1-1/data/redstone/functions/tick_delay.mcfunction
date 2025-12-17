scoreboard players remove @e[tag=use_redstone,scores={tick_delay_count=1..}] tick_delay_count 1
execute as @e[scores={tick_delay_count=0},tag=depower] at @s run function redstone:off
tag @e[scores={tick_delay_count=0}] remove depower
schedule function redstone:tick_delay 1t

execute as @e[tag=depower,tag=use_redstone] at @s run function redstone:off
tag @e[tag=depower] remove depower

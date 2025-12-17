execute as @s[tag=!powered_north,tag=!powered_east,tag=!powered_south,tag=!powered_west] run scoreboard players set @s powered 0
execute as @s[tag=powered_north,tag=!depower] run scoreboard players set @s powered 15
execute as @s[tag=powered_south,tag=!depower] run scoreboard players set @s powered 15
execute as @s[tag=powered_east,tag=!depower] run scoreboard players set @s powered 15
execute as @s[tag=powered_west,tag=!depower] run scoreboard players set @s powered 15

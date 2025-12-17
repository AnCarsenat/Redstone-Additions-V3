execute as @e[tag=withcoordin] at @s unless block ~ ~ ~ redstone_wire run function r:other/eldestroy

tag @e[tag=withcoordin,tag=sender2_off] remove sender2_off
execute as @e[tag=withcoordin,tag=!sender2_off] at @s if block ~ ~ ~ redstone_wire[power=0] run tag @s add sender2_off

tag @e[tag=sender2_flanke] remove sender2_flanke
tag @e[tag=withcoordin,tag=sender2_off,tag=sender2_powered] remove sender2_powered
tag @e[tag=withcoordin,tag=!sender2_off,tag=!sender2_powered] add sender2_flanke
tag @e[tag=withcoordin,tag=!sender2_off,tag=!sender2_powered] add sender2_powered
tag @e[tag=sender22_flanke] remove sender22_flanke
tag @e[tag=withcoordin,tag=!sender2_off,tag=sender22_powered] remove sender22_powered
tag @e[tag=withcoordin,tag=sender2_off,tag=!sender22_powered] add sender22_flanke
tag @e[tag=withcoordin,tag=sender2_off,tag=!sender22_powered] add sender22_powered


execute as @e[tag=withcoordin,tag=sender2_flanke] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["setredstone","red_on"]}
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_x = @e[tag=withcoordin,tag=sender2_flanke,limit=1,sort=nearest] sender_x
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_y = @e[tag=withcoordin,tag=sender2_flanke,limit=1,sort=nearest] sender_y
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_z = @e[tag=withcoordin,tag=sender2_flanke,limit=1,sort=nearest] sender_z
execute as @e[tag=withcoordin,tag=sender2_flanke] at @s run function r:oelements/sender/setredstone
execute at @e[tag=setredstone,tag=red_on] run fill ~ ~ ~ ~ ~ ~ redstone_block replace air

execute as @e[tag=withcoordin,tag=sender22_flanke] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["setredstone","red_off"]}
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_x = @e[tag=withcoordin,tag=sender22_flanke,limit=1,sort=nearest] sender_x
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_y = @e[tag=withcoordin,tag=sender22_flanke,limit=1,sort=nearest] sender_y
execute as @e[tag=setredstone] at @s run scoreboard players operation @s sender_z = @e[tag=withcoordin,tag=sender22_flanke,limit=1,sort=nearest] sender_z
execute as @e[tag=withcoordin,tag=sender22_flanke] at @s run function r:oelements/sender/setredstone
execute at @e[tag=setredstone,tag=red_off] run fill ~ ~ ~ ~ ~ ~ air replace redstone_block
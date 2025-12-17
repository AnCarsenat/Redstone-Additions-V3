#Power Detection
execute if block ~ ~ ~1 minecraft:lever[powered=true] run tag @s add lev_powered
execute if block ~ ~ ~-1 minecraft:lever[powered=true] run tag @s add lev_powered
execute if block ~-1 ~ ~ minecraft:lever[powered=true] run tag @s add lev_powered
execute if block ~1 ~ ~ minecraft:lever[powered=true] run tag @s add lev_powered

execute if block ~ ~ ~1 minecraft:lever[powered=false] run tag @s remove lev_powered
execute if block ~ ~ ~-1 minecraft:lever[powered=false] run tag @s remove lev_powered
execute if block ~-1 ~ ~ minecraft:lever[powered=false] run tag @s remove lev_powered
execute if block ~1 ~ ~ minecraft:lever[powered=false] run tag @s remove lev_powered

#Power Direction
execute if block ~ ~ ~1 minecraft:lever[powered=true] run tag @s add powered_south
execute if block ~ ~ ~-1 minecraft:lever[powered=true] run tag @s add powered_north
execute if block ~-1 ~ ~ minecraft:lever[powered=true] run tag @s add powered_west
execute if block ~1 ~ ~ minecraft:lever[powered=true] run tag @s add powered_east

execute if block ~ ~ ~1 minecraft:lever[powered=false] run tag @s remove powered_south
execute if block ~ ~ ~-1 minecraft:lever[powered=false] run tag @s remove powered_north
execute if block ~-1 ~ ~ minecraft:lever[powered=false] run tag @s remove powered_west
execute if block ~1 ~ ~ minecraft:lever[powered=false] run tag @s remove powered_east

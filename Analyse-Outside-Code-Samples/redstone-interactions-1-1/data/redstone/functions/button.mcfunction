#Power Detection
execute if block ~ ~ ~1 #minecraft:buttons[powered=true] run tag @s add but_powered
execute if block ~ ~ ~-1 #minecraft:buttons[powered=true] run tag @s add but_powered
execute if block ~-1 ~ ~ #minecraft:buttons[powered=true] run tag @s add but_powered
execute if block ~1 ~ ~ #minecraft:buttons[powered=true] run tag @s add but_powered

execute if block ~ ~ ~1 #minecraft:buttons[powered=false] run tag @s remove but_powered
execute if block ~ ~ ~-1 #minecraft:buttons[powered=false] run tag @s remove but_powered
execute if block ~-1 ~ ~ #minecraft:buttons[powered=false] run tag @s remove but_powered
execute if block ~1 ~ ~ #minecraft:buttons[powered=false] run tag @s remove but_powered

#Power Direction
execute if block ~ ~ ~1 #minecraft:buttons[powered=true] run tag @s add powered_south
execute if block ~ ~ ~-1 #minecraft:buttons[powered=true] run tag @s add powered_north
execute if block ~-1 ~ ~ #minecraft:buttons[powered=true] run tag @s add powered_west
execute if block ~1 ~ ~ #minecraft:buttons[powered=true] run tag @s add powered_east

execute if block ~ ~ ~1 #minecraft:buttons[powered=false] run tag @s remove powered_south
execute if block ~ ~ ~-1 #minecraft:buttons[powered=false] run tag @s remove powered_north
execute if block ~-1 ~ ~ #minecraft:buttons[powered=false] run tag @s remove powered_west
execute if block ~1 ~ ~ #minecraft:buttons[powered=false] run tag @s remove powered_east

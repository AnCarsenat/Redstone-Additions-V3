#Power Detection
execute if block ~ ~ ~1 minecraft:redstone_wire[south=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add red_powered
execute if block ~ ~ ~-1 minecraft:redstone_wire[north=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add red_powered
execute if block ~-1 ~ ~ minecraft:redstone_wire[west=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add red_powered
execute if block ~1 ~ ~ minecraft:redstone_wire[east=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add red_powered

execute if block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s remove red_powered
execute if block ~ ~ ~-1 minecraft:redstone_wire[power=0] run tag @s remove red_powered
execute if block ~1 ~ ~ minecraft:redstone_wire[power=0] run tag @s remove red_powered
execute if block ~-1 ~ ~ minecraft:redstone_wire[power=0] run tag @s remove red_powered

#Power Direction
execute if block ~ ~ ~1 minecraft:redstone_wire[south=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add powered_south
execute if block ~ ~ ~-1 minecraft:redstone_wire[north=side] unless block ~ ~ ~-1 minecraft:redstone_wire[power=0] run tag @s add powered_north
execute if block ~-1 ~ ~ minecraft:redstone_wire[west=side] unless block ~-1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add powered_west
execute if block ~1 ~ ~ minecraft:redstone_wire[east=side] unless block ~1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add powered_east

execute if block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s remove powered_south
execute if block ~ ~ ~-1 minecraft:redstone_wire[power=0] run tag @s remove powered_north
execute if block ~-1 ~ ~ minecraft:redstone_wire[power=0] run tag @s remove powered_west
execute if block ~1 ~ ~ minecraft:redstone_wire[power=0] run tag @s remove powered_east

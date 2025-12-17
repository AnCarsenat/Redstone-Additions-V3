#Power Detection
execute if block ~ ~ ~1 minecraft:comparator[facing=south,powered=true] run tag @s add comp_powered
execute if block ~ ~ ~-1 minecraft:comparator[facing=north,powered=true] run tag @s add comp_powered
execute if block ~-1 ~ ~ minecraft:comparator[facing=west,powered=true] run tag @s add comp_powered
execute if block ~1 ~ ~ minecraft:comparator[facing=east,powered=true] run tag @s add comp_powered

execute if block ~ ~ ~1 minecraft:comparator[facing=south,powered=false] run tag @s remove comp_powered
execute if block ~ ~ ~-1 minecraft:comparator[facing=north,powered=false] run tag @s remove comp_powered
execute if block ~-1 ~ ~ minecraft:comparator[facing=west,powered=false] run tag @s remove comp_powered
execute if block ~1 ~ ~ minecraft:comparator[facing=east,powered=false] run tag @s remove comp_powered

#Power Direction
execute if block ~ ~ ~1 minecraft:comparator[facing=south,powered=true] run tag @s add powered_south
execute if block ~ ~ ~-1 minecraft:comparator[facing=north,powered=true] run tag @s add powered_north
execute if block ~-1 ~ ~ minecraft:comparator[facing=west,powered=true] run tag @s add powered_west
execute if block ~1 ~ ~ minecraft:comparator[facing=east,powered=true] run tag @s add powered_east

execute if block ~ ~ ~1 minecraft:comparator[facing=south,powered=false] run tag @s remove powered_south
execute if block ~ ~ ~-1 minecraft:comparator[facing=north,powered=false] run tag @s remove powered_north
execute if block ~-1 ~ ~ minecraft:comparator[facing=west,powered=false] run tag @s remove powered_west
execute if block ~1 ~ ~ minecraft:comparator[facing=east,powered=false] run tag @s remove powered_east

# /ra_lib:redstone/detect/comparator
# Internal: Detect powered comparators facing us. Power 15.

# North (comparator at z-1 facing south)
execute if block ~ ~ ~-1 minecraft:comparator[facing=south,powered=true] run tag @s add ra.powered.comparator
execute if block ~ ~ ~-1 minecraft:comparator[facing=south,powered=true] run scoreboard players set @s ra.power.north 15

# South (comparator at z+1 facing north)
execute if block ~ ~ ~1 minecraft:comparator[facing=north,powered=true] run tag @s add ra.powered.comparator
execute if block ~ ~ ~1 minecraft:comparator[facing=north,powered=true] run scoreboard players set @s ra.power.south 15

# West (comparator at x-1 facing east)
execute if block ~-1 ~ ~ minecraft:comparator[facing=east,powered=true] run tag @s add ra.powered.comparator
execute if block ~-1 ~ ~ minecraft:comparator[facing=east,powered=true] run scoreboard players set @s ra.power.west 15

# East (comparator at x+1 facing west)
execute if block ~1 ~ ~ minecraft:comparator[facing=west,powered=true] run tag @s add ra.powered.comparator
execute if block ~1 ~ ~ minecraft:comparator[facing=west,powered=true] run scoreboard players set @s ra.power.east 15

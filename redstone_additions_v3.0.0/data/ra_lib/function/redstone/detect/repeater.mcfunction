# /ra_lib:redstone/detect/repeater
# Internal: Detect powered repeaters. Always power 15.

# North (repeater at z-1 facing south = outputting into us)
execute if block ~ ~ ~-1 minecraft:repeater[facing=south,powered=true] run tag @s add ra.powered.repeater
execute if block ~ ~ ~-1 minecraft:repeater[facing=south,powered=true] run scoreboard players set @s ra.power.north 15

# South (repeater at z+1 facing north)
execute if block ~ ~ ~1 minecraft:repeater[facing=north,powered=true] run tag @s add ra.powered.repeater
execute if block ~ ~ ~1 minecraft:repeater[facing=north,powered=true] run scoreboard players set @s ra.power.south 15

# West (repeater at x-1 facing east)
execute if block ~-1 ~ ~ minecraft:repeater[facing=east,powered=true] run tag @s add ra.powered.repeater
execute if block ~-1 ~ ~ minecraft:repeater[facing=east,powered=true] run scoreboard players set @s ra.power.west 15

# East (repeater at x+1 facing west)
execute if block ~1 ~ ~ minecraft:repeater[facing=west,powered=true] run tag @s add ra.powered.repeater
execute if block ~1 ~ ~ minecraft:repeater[facing=west,powered=true] run scoreboard players set @s ra.power.east 15

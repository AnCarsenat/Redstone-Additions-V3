# /ra_lib:redstone/detect/dust
# Internal: Detect redstone dust pointing at block. Power 15 when powered (blockstate check).
# Note: In 1.21+ we cannot read exact power level from blockstate, so we use 15 when powered.

# North (dust at z-1 pointing south) - check if powered (not power=0)
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=side] unless block ~ ~ ~-1 minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=side] unless block ~ ~ ~-1 minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.north 15

execute if block ~ ~ ~-1 minecraft:redstone_wire[south=up] unless block ~ ~ ~-1 minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=up] unless block ~ ~ ~-1 minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.north 15

# South (dust at z+1 pointing north)
execute if block ~ ~ ~1 minecraft:redstone_wire[north=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~ ~ ~1 minecraft:redstone_wire[north=side] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.south 15

execute if block ~ ~ ~1 minecraft:redstone_wire[north=up] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~ ~ ~1 minecraft:redstone_wire[north=up] unless block ~ ~ ~1 minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.south 15

# West (dust at x-1 pointing east)
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=side] unless block ~-1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=side] unless block ~-1 ~ ~ minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.west 15

execute if block ~-1 ~ ~ minecraft:redstone_wire[east=up] unless block ~-1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=up] unless block ~-1 ~ ~ minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.west 15

# East (dust at x+1 pointing west)
execute if block ~1 ~ ~ minecraft:redstone_wire[west=side] unless block ~1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~1 ~ ~ minecraft:redstone_wire[west=side] unless block ~1 ~ ~ minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.east 15

execute if block ~1 ~ ~ minecraft:redstone_wire[west=up] unless block ~1 ~ ~ minecraft:redstone_wire[power=0] run tag @s add ra.powered.dust
execute if block ~1 ~ ~ minecraft:redstone_wire[west=up] unless block ~1 ~ ~ minecraft:redstone_wire[power=0] run scoreboard players set @s ra.power.east 15

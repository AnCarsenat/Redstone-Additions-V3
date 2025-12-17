# /ra_lib:redstone/detect/dust
# Internal: Detect redstone dust pointing at block. Power 0-15.

# North (dust at z-1 pointing south)
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=side] store result score #temp ra.temp run data get block ~ ~ ~-1 power
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=side] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=side] if score #temp ra.temp > @s ra.power.north run scoreboard players operation @s ra.power.north = #temp ra.temp

execute if block ~ ~ ~-1 minecraft:redstone_wire[south=up] store result score #temp ra.temp run data get block ~ ~ ~-1 power
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=up] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~ ~ ~-1 minecraft:redstone_wire[south=up] if score #temp ra.temp > @s ra.power.north run scoreboard players operation @s ra.power.north = #temp ra.temp

# South (dust at z+1 pointing north)
execute if block ~ ~ ~1 minecraft:redstone_wire[north=side] store result score #temp ra.temp run data get block ~ ~ ~1 power
execute if block ~ ~ ~1 minecraft:redstone_wire[north=side] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~ ~ ~1 minecraft:redstone_wire[north=side] if score #temp ra.temp > @s ra.power.south run scoreboard players operation @s ra.power.south = #temp ra.temp

execute if block ~ ~ ~1 minecraft:redstone_wire[north=up] store result score #temp ra.temp run data get block ~ ~ ~1 power
execute if block ~ ~ ~1 minecraft:redstone_wire[north=up] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~ ~ ~1 minecraft:redstone_wire[north=up] if score #temp ra.temp > @s ra.power.south run scoreboard players operation @s ra.power.south = #temp ra.temp

# West (dust at x-1 pointing east)
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=side] store result score #temp ra.temp run data get block ~-1 ~ ~ power
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=side] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=side] if score #temp ra.temp > @s ra.power.west run scoreboard players operation @s ra.power.west = #temp ra.temp

execute if block ~-1 ~ ~ minecraft:redstone_wire[east=up] store result score #temp ra.temp run data get block ~-1 ~ ~ power
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=up] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~-1 ~ ~ minecraft:redstone_wire[east=up] if score #temp ra.temp > @s ra.power.west run scoreboard players operation @s ra.power.west = #temp ra.temp

# East (dust at x+1 pointing west)
execute if block ~1 ~ ~ minecraft:redstone_wire[west=side] store result score #temp ra.temp run data get block ~1 ~ ~ power
execute if block ~1 ~ ~ minecraft:redstone_wire[west=side] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~1 ~ ~ minecraft:redstone_wire[west=side] if score #temp ra.temp > @s ra.power.east run scoreboard players operation @s ra.power.east = #temp ra.temp

execute if block ~1 ~ ~ minecraft:redstone_wire[west=up] store result score #temp ra.temp run data get block ~1 ~ ~ power
execute if block ~1 ~ ~ minecraft:redstone_wire[west=up] if score #temp ra.temp matches 1.. run tag @s add ra.powered.dust
execute if block ~1 ~ ~ minecraft:redstone_wire[west=up] if score #temp ra.temp > @s ra.power.east run scoreboard players operation @s ra.power.east = #temp ra.temp

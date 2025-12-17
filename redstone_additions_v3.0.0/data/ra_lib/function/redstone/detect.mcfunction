# /ra_lib:redstone/detect
# Detect all redstone power. As entity, at position.
# Output: ra.power (0-15), ra.power.{dir}, tags ra.powered, ra.powered.{source}, ra.powered.{dir}

function ra_lib:redstone/clear

scoreboard players set @s ra.power 0
scoreboard players set @s ra.power.north 0
scoreboard players set @s ra.power.south 0
scoreboard players set @s ra.power.east 0
scoreboard players set @s ra.power.west 0
scoreboard players set @s ra.power.up 0
scoreboard players set @s ra.power.down 0

function ra_lib:redstone/detect/dust
function ra_lib:redstone/detect/repeater
function ra_lib:redstone/detect/comparator
function ra_lib:redstone/detect/lever
function ra_lib:redstone/detect/button
function ra_lib:redstone/detect/block
function ra_lib:redstone/detect/torch

# Max power
execute if score @s ra.power.north > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.north
execute if score @s ra.power.south > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.south
execute if score @s ra.power.east > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.east
execute if score @s ra.power.west > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.west
execute if score @s ra.power.up > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.up
execute if score @s ra.power.down > @s ra.power run scoreboard players operation @s ra.power = @s ra.power.down

# Tags
execute if score @s ra.power matches 1.. run tag @s add ra.powered
execute if score @s ra.power matches 15 run tag @s add ra.powered.strong
execute if score @s ra.power.north matches 1.. run tag @s add ra.powered.north
execute if score @s ra.power.south matches 1.. run tag @s add ra.powered.south
execute if score @s ra.power.east matches 1.. run tag @s add ra.powered.east
execute if score @s ra.power.west matches 1.. run tag @s add ra.powered.west
execute if score @s ra.power.up matches 1.. run tag @s add ra.powered.up
execute if score @s ra.power.down matches 1.. run tag @s add ra.powered.down

# Return power level
return run scoreboard players get @s ra.power

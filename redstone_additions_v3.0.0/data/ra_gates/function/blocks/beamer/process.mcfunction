# /ra_gates:blocks/beamer/process
# Process Beamer logic. As armor stand, at position.
# Teleports redstone signal at configurable distance in facing direction

# Get distance from properties (default 5 blocks)
execute unless data entity @s data.properties.distance run data modify entity @s data.properties.distance set value 5

# Get facing direction
execute store result score @s ra.dir run data get entity @s data.dir

# Output based on power and facing direction
# Direction 0 = south (+Z)
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 0 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 0 positioned ~ ~ ~1 run function ra_gates:blocks/beamer/beam_z_positive
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 0 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 0 positioned ~ ~ ~1 run function ra_gates:blocks/beamer/unbeam_z_positive

# Direction 1 = west (-X)
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 1 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 1 positioned ~-1 ~ ~ run function ra_gates:blocks/beamer/beam_x_negative
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 1 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 1 positioned ~-1 ~ ~ run function ra_gates:blocks/beamer/unbeam_x_negative

# Direction 2 = north (-Z)
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 2 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 2 positioned ~ ~ ~-1 run function ra_gates:blocks/beamer/beam_z_negative
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 2 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 2 positioned ~ ~ ~-1 run function ra_gates:blocks/beamer/unbeam_z_negative

# Direction 3 = east (+X)
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 3 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 1.. if score @s ra.dir matches 3 positioned ~1 ~ ~ run function ra_gates:blocks/beamer/beam_x_positive
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 3 store result storage ra:beamer steps int 1 run data get entity @s data.properties.distance
execute if score @s ra.act_red matches 0 if score @s ra.dir matches 3 positioned ~1 ~ ~ run function ra_gates:blocks/beamer/unbeam_x_positive

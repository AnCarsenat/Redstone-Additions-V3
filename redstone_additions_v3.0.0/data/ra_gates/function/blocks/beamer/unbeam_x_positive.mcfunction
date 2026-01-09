# /ra_gates:blocks/beamer/unbeam_x_positive
# Remove beam in +X direction

execute store result score #steps ra.temp run data get storage ra:beamer steps
execute if score #steps ra.temp matches 2.. run scoreboard players remove #steps ra.temp 1
execute if score #steps ra.temp matches 2.. store result storage ra:beamer steps int 1 run scoreboard players get #steps ra.temp
execute if score #steps ra.temp matches 1.. positioned ~1 ~ ~ run function ra_gates:blocks/beamer/unbeam_x_positive
execute if score #steps ra.temp matches ..1 run setblock ~ ~ ~ iron_block

# /ra_gates:blocks/beamer/beam_z_positive
# Beam in +Z direction - called with storage ra:beamer steps

# Get steps remaining
execute store result score #steps ra.temp run data get storage ra:beamer steps

# If more than 1 step, continue recursing
execute if score #steps ra.temp matches 2.. run scoreboard players remove #steps ra.temp 1
execute if score #steps ra.temp matches 2.. store result storage ra:beamer steps int 1 run scoreboard players get #steps ra.temp
execute if score #steps ra.temp matches 1.. positioned ~ ~ ~1 run function ra_gates:blocks/beamer/beam_z_positive

# Place at final position
execute if score #steps ra.temp matches ..1 run setblock ~ ~ ~ redstone_block

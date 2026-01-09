# /ra_gates:blocks/rand/trigger
# Trigger random output

# Generate random number 0-1
execute store result score @s ra.temp run random value 0..1

# Output based on result
execute if score @s ra.temp matches 1 at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute if score @s ra.temp matches 0 at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block

# Particle feedback
execute if score @s ra.temp matches 1 run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.3 0.3 0.02 5
execute if score @s ra.temp matches 0 run particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.02 5

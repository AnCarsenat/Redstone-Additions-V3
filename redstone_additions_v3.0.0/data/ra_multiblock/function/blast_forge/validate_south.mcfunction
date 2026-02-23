# /ra_multiblock:blast_forge/validate_south
# Validate blast forge structure with hopper to the SOUTH of base
# Context: at multiblock base position
# Structure: 3x3x3, hopper at Z+2, furnace at Z+1, base at Z

# Check furnace directly in front (south)
execute unless block ~ ~ ~1 minecraft:furnace run return 0

# Check hopper in front of furnace
execute unless block ~ ~ ~2 minecraft:hopper run return 0

# Check bottom layer (Y-1) - all nether bricks
execute unless block ~-1 ~-1 ~0 minecraft:nether_bricks run return 0
execute unless block ~0 ~-1 ~0 minecraft:nether_bricks run return 0
execute unless block ~1 ~-1 ~0 minecraft:nether_bricks run return 0
execute unless block ~-1 ~-1 ~1 minecraft:nether_bricks run return 0
execute unless block ~0 ~-1 ~1 minecraft:nether_bricks run return 0
execute unless block ~1 ~-1 ~1 minecraft:nether_bricks run return 0
execute unless block ~-1 ~-1 ~2 minecraft:nether_bricks run return 0
execute unless block ~0 ~-1 ~2 minecraft:nether_bricks run return 0
execute unless block ~1 ~-1 ~2 minecraft:nether_bricks run return 0

# Check middle layer (Y) - nether bricks on sides, skip center row (hopper/furnace/base)
execute unless block ~-1 ~0 ~0 minecraft:nether_bricks run return 0
execute unless block ~1 ~0 ~0 minecraft:nether_bricks run return 0
execute unless block ~-1 ~0 ~1 minecraft:nether_bricks run return 0
execute unless block ~1 ~0 ~1 minecraft:nether_bricks run return 0
execute unless block ~-1 ~0 ~2 minecraft:nether_bricks run return 0
execute unless block ~1 ~0 ~2 minecraft:nether_bricks run return 0

# Check top layer (Y+1) - all nether bricks
execute unless block ~-1 ~1 ~0 minecraft:nether_bricks run return 0
execute unless block ~0 ~1 ~0 minecraft:nether_bricks run return 0
execute unless block ~1 ~1 ~0 minecraft:nether_bricks run return 0
execute unless block ~-1 ~1 ~1 minecraft:nether_bricks run return 0
execute unless block ~0 ~1 ~1 minecraft:nether_bricks run return 0
execute unless block ~1 ~1 ~1 minecraft:nether_bricks run return 0
execute unless block ~-1 ~1 ~2 minecraft:nether_bricks run return 0
execute unless block ~0 ~1 ~2 minecraft:nether_bricks run return 0
execute unless block ~1 ~1 ~2 minecraft:nether_bricks run return 0

# Store direction in storage for marker setup
data modify storage ra:multiblock facing set value "south"

# Valid!
return 1

# /ra_multiblock:blast_forge/check_north
# Check north-facing blast forge structure validity
# Context: as marker, at hopper position

# Check hopper still exists
execute unless block ~ ~ ~ minecraft:hopper run return 0

# Check 3x3 brick wall (Z+1)
execute unless block ~-1 ~-1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~-1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~-1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~-1 ~0 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~0 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~0 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~-1 ~1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~1 ~1 #ra_multiblock:blast_forge_bricks run return 0

# Check blast furnace (Z+2)
execute unless block ~0 ~0 ~2 minecraft:blast_furnace run return 0

# Valid
scoreboard players set @s ra.multiblock 1

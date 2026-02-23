# /ra_multiblock:blast_forge/check_south
# Check south-facing blast forge structure validity

execute unless block ~ ~ ~ minecraft:hopper run return 0

execute unless block ~-1 ~-1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~-1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~-1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~-1 ~0 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~0 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~0 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~-1 ~1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~0 ~1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~1 ~-1 #ra_multiblock:blast_forge_bricks run return 0

execute unless block ~0 ~0 ~-2 minecraft:blast_furnace run return 0

scoreboard players set @s ra.multiblock 1

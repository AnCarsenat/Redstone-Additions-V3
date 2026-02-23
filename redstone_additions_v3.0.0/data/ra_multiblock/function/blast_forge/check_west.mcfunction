# /ra_multiblock:blast_forge/check_west
# Check west-facing blast forge structure validity

execute unless block ~ ~ ~ minecraft:hopper run return 0

execute unless block ~1 ~-1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~-1 ~0 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~-1 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~0 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~0 ~0 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~0 ~1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~1 ~-1 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~1 ~0 #ra_multiblock:blast_forge_bricks run return 0
execute unless block ~1 ~1 ~1 #ra_multiblock:blast_forge_bricks run return 0

execute unless block ~2 ~0 ~0 minecraft:blast_furnace run return 0

scoreboard players set @s ra.multiblock 1

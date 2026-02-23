# /ra_multiblock:blast_forge/check_facing
# MACRO FUNCTION — Periodic structure integrity check
# Called: function ... with storage ra:multiblock bf_dir.{direction}
# Context: as multiblock marker, at base position
# Sets @s ra.multiblock to 1 if valid

# === Functional blocks ===
$execute unless block $(furnace) minecraft:blast_furnace run return 0
$execute unless block $(in1) minecraft:barrel run return 0
$execute unless block $(in2) minecraft:barrel run return 0
$execute unless block $(out1) minecraft:barrel run return 0

# === Corner bricks (Y=0) ===
$execute unless block $(b1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b4) #ra_multiblock:blast_forge_bricks run return 0

# === Floor (Y-1) ===
$execute unless block $(f1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f4) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f5) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f6) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f7) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f8) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f9) #ra_multiblock:blast_forge_bricks run return 0

# === Ceiling (Y+1) ===
$execute unless block $(c1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c4) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c5) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c6) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c7) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c8) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c9) #ra_multiblock:blast_forge_bricks run return 0

# All checks passed — structure valid
scoreboard players set @s ra.multiblock 1

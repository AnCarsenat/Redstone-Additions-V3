# /ra_multiblock:blast_forge/validate_facing
# MACRO FUNCTION — Validate blast forge structure for one direction
# Called: function ... with storage ra:multiblock bf_dir.{north|south|east|west}
# Context: at multiblock base position (0,0,0)
# Returns: 1 if valid, 0 if invalid
#
# Structure Layout (3x3x3):
#   Y-1: 9 nether brick floor
#   Y=0: 4 corner bricks + blast_furnace + 2 input barrels + 1 output barrel + BASE
#   Y+1: 9 nether brick ceiling

# === Functional blocks ===
$execute unless block $(furnace) minecraft:blast_furnace run return 0
$execute unless block $(in1) minecraft:barrel run return 0
$execute unless block $(in2) minecraft:barrel run return 0
$execute unless block $(out1) minecraft:barrel run return 0

# === Middle layer (Y=0) corner bricks ===
$execute unless block $(b1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(b4) #ra_multiblock:blast_forge_bricks run return 0

# === Floor (Y-1) — 9 nether brick blocks ===
$execute unless block $(f1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f4) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f5) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f6) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f7) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f8) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(f9) #ra_multiblock:blast_forge_bricks run return 0

# === Ceiling (Y+1) — 9 nether brick blocks ===
$execute unless block $(c1) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c2) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c3) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c4) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c5) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c6) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c7) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c8) #ra_multiblock:blast_forge_bricks run return 0
$execute unless block $(c9) #ra_multiblock:blast_forge_bricks run return 0

# === Store direction + IO positions for marker setup ===
$data modify storage ra:multiblock facing set value "$(facing)"
$data modify storage ra:multiblock inputs set from storage ra:multiblock bf_dir.$(facing).io_inputs
$data modify storage ra:multiblock outputs set from storage ra:multiblock bf_dir.$(facing).io_outputs
$data modify storage ra:multiblock controls set from storage ra:multiblock bf_dir.$(facing).io_controls

return 1

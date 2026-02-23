# /ra_multiblock:blast_forge/process_facing
# MACRO FUNCTION — Recipe matching + IO for one direction
# Called: function ... with storage ra:multiblock bf_dir.{direction}
# Context: as multiblock marker, at base position
#
# Inputs:  in1 (material barrel), in2 (fuel barrel)
# Outputs: out1 (result barrel)
# Fuels:   coal, charcoal, blaze_powder
# Recipes: defined in blast_forge/recipes/ subfolder

data remove storage ra:temp bf

# === Read material from input_1 ===
$data modify storage ra:temp bf.material set from block $(in1) Items[0]
execute unless data storage ra:temp bf.material run return 0

# === Read fuel from input_2 ===
$data modify storage ra:temp bf.fuel set from block $(in2) Items[0]
execute unless data storage ra:temp bf.fuel run return 0

# === Validate fuel type ===
execute unless data storage ra:temp bf.fuel{id:"minecraft:coal"} unless data storage ra:temp bf.fuel{id:"minecraft:charcoal"} unless data storage ra:temp bf.fuel{id:"minecraft:blaze_powder"} run return 0

# === Recipe Matching (data-driven from recipes/ subfolder) ===
data remove storage ra:temp bf.result
function ra_multiblock:blast_forge/recipes/match_all
execute unless data storage ra:temp bf.result run return 0

# === Consume 1 material + 1 fuel ===
$execute positioned $(in1) run function ra_multiblock:blast_forge/consume_first_item
$execute positioned $(in2) run function ra_multiblock:blast_forge/consume_first_item

# === Insert result into output barrel ===
$execute positioned $(out1) run function ra_lib:inventory/insert with storage ra:temp bf.result

# === Processing Effects ===
$particle minecraft:flame $(smoke) 0.2 0.2 0.2 0.02 10
playsound minecraft:block.furnace.fire_crackle block @a[distance=..8] ~ ~ ~ 0.5 1
playsound minecraft:block.lava.extinguish block @a[distance=..8] ~ ~ ~ 0.2 1.5

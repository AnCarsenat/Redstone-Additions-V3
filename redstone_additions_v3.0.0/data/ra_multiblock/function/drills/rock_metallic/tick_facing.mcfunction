# /ra_multiblock:drill/tick_facing
# Per-tick logic for drill multiblock
# Called: function ... with storage ra:multiblock drill_dir.{direction}
# Context: as multiblock marker, at base position (already checked enabled)

# === Redstone Control ===
execute if block $(ctrl) minecraft:redstone_block run return 0

# === Visual Feedback: block particles ===
particle block minecraft:stone ~ ~1 ~ 0.5 0.2 0.5 0.1 5 force

# === Drill Processing ===
function ra_multiblock:drills/rock_metallic/process_facing with storage ra:multiblock drill_dir.$(facing)

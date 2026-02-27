
# /ra_multiblock:drill/tick
# Per-tick processing for drill multiblock
# Context: as multiblock marker, at base position
# Dispatches to tick_facing macro

# Skip if disabled
execute unless data entity @s data.properties{enabled:1b} run return 0

# Dispatch tick logic
function ra_multiblock:drills/rock_metallic/tick_facing

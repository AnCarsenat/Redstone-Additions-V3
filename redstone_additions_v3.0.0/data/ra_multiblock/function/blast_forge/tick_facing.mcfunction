# /ra_multiblock:blast_forge/tick_facing
# MACRO FUNCTION — Per-tick logic for one direction
# Called: function ... with storage ra:multiblock bf_dir.{direction}
# Context: as multiblock marker, at base position (already checked enabled)

# === Redstone Control ===
# Redstone block behind base = forge is locked (like hopper locking)
$execute if block $(ctrl) minecraft:redstone_block run return 0

# === Timer ===
scoreboard players add @s ra.mb_timer 1

# Ambient smoke particles at blast furnace position (first 19 ticks of each cycle)
$execute if score @s ra.mb_timer matches 1..19 run particle minecraft:smoke $(smoke) 0.1 0.1 0.1 0.005 2

# Process every 100 ticks (5 seconds)
execute unless score @s ra.mb_timer matches 100.. run return 0
scoreboard players set @s ra.mb_timer 0

# Dispatch to recipe processing with same direction data
$function ra_multiblock:blast_forge/process_facing with storage ra:multiblock bf_dir.$(facing)

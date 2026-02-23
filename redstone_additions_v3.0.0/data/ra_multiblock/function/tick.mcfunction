# /ra_multiblock:tick
# Tick all multiblock types

# === Periodic Structure Validation (every 40 ticks = 2 seconds) ===
scoreboard players add #mb_validate_timer ra.multiblock 1
execute if score #mb_validate_timer ra.multiblock matches 40.. run function ra_lib_multiblock:validate_all
execute if score #mb_validate_timer ra.multiblock matches 40.. run scoreboard players set #mb_validate_timer ra.multiblock 0

# === Tick Active Multiblocks ===
# Each type dispatched separately for efficient tag-based selection
execute as @e[tag=ra.multiblock.blast_forge] at @s run function ra_multiblock:blast_forge/tick

# /ra_multiblock:tick
# Tick all multiblocks

# Validate structures periodically (every 2 seconds = 40 ticks)
scoreboard players add #mb_validate_timer ra.multiblock 1
execute if score #mb_validate_timer ra.multiblock matches 40.. run function ra_lib_multiblock:validate_all
execute if score #mb_validate_timer ra.multiblock matches 40.. run scoreboard players set #mb_validate_timer ra.multiblock 0

# Process active multiblocks
execute as @e[tag=ra.multiblock.blast_forge] at @s if data entity @s data.properties{enabled:1b} run function ra_multiblock:blast_forge/tick

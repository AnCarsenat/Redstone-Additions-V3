# /ra_lib_multiblock:validate_single
# Validate a single multiblock structure
# Context: as multiblock marker, at its position

# Reset validation flag
scoreboard players set @s ra.multiblock 0

# Type-specific structure check (sets score to 1 if valid)
execute if entity @s[tag=ra.multiblock.blast_forge] run function ra_multiblock:blast_forge/check_structure

# If structure is broken, disassemble
execute if score @s ra.multiblock matches 0 run function ra_lib_multiblock:disassemble

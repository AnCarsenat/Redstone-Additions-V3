# /ra_lib_multiblock:disassemble
# Disassemble multiblock at current position
# Context: as multiblock marker entity

# Type-specific cleanup
execute if entity @s[tag=ra.multiblock.blast_forge] run function ra_multiblock:blast_forge/on_break

# Effects
execute at @s run playsound minecraft:block.anvil.land block @a[distance=..16] ~ ~ ~ 0.5 0.8
execute at @s run particle minecraft:smoke ~ ~0.5 ~ 0.3 0.3 0.3 0.02 15

tellraw @a[distance=..16] [{"text":"[RA] ","color":"gold"},{"text":"Multiblock disassembled.","color":"yellow"}]

# Remove marker
kill @s

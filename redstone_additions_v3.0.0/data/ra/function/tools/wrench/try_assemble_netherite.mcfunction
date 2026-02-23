# /ra:tools/wrench/try_assemble_netherite
# Try to assemble a netherite-tier multiblock
# Context: at multiblock base position

# No netherite-tier multiblocks yet
tellraw @a[distance=..8] [{"text":"[Wrench] ","color":"gold"},{"text":"No netherite-tier multiblocks available yet.","color":"gray"}]
playsound minecraft:block.note_block.bass block @a[distance=..8] ~ ~ ~ 0.5 0.8

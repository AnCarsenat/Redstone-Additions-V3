# /data/ra_interactive/tags/function/ra_tick_blocks.json

# Break the block in front of the armor stand
# Context: as armor stand facing the target direction, at armor stand

# Use armor stand's rotation to break block in front
# ^ ^ ^1 means 1 block in the direction the armor stand is facing
execute positioned ^ ^ ^1 unless block ~ ~ ~ #ra_lib:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy

# Play sound
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 0.8

# Particle effect
execute positioned ^ ^ ^1 run particle minecraft:block{block_state:"minecraft:stone"} ~ ~ ~ 0.3 0.3 0.3 0.1 20
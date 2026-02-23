# /ra_lib_multiblock:create_marker
# Create multiblock marker entity at current position
# Context: at controller block position (multiblock base)
# Input storage ra:multiblock: {type:"multiblock_id", facing:"direction"}

# Create marker with multiblock data
execute align xyz run summon armor_stand ~0.5 ~ ~0.5 {Marker:1b,Invisible:1b,NoGravity:1b,Tags:["ra.multiblock","ra.multiblock.new"],Small:1b}

# Transfer type data to marker
execute as @e[tag=ra.multiblock.new,limit=1] run function ra_lib_multiblock:setup_marker

# Epic assembly effects!
playsound minecraft:block.respawn_anchor.set_spawn block @a[distance=..16] ~ ~ ~ 1 0.8
playsound minecraft:block.beacon.activate block @a[distance=..16] ~ ~ ~ 0.8 1.5
playsound minecraft:entity.player.levelup block @a[distance=..16] ~ ~ ~ 0.5 0.5

# Particle burst
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.3 50
particle minecraft:electric_spark ~ ~0.5 ~ 1 1 1 0.1 30
particle minecraft:flash ~ ~0.5 ~ 0 0 0 0 1

tellraw @a[distance=..16] [{"text":"[RA] ","color":"gold"},{"text":"Multiblock assembled!","color":"green","bold":true}]

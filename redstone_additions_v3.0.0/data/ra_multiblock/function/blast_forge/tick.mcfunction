# /ra_multiblock:blast_forge/tick
# Process blast forge every tick
# Context: as multiblock marker, at multiblock base position

# Check if enabled
execute unless data entity @s data.properties{enabled:1b} run return 0

# Increment processing timer
scoreboard players add @s ra.mb_timer 1

# Process every 100 ticks (5 seconds)
execute unless score @s ra.mb_timer matches 100.. run return 0
scoreboard players set @s ra.mb_timer 0

# Get hopper items based on facing direction
# Hopper is 2 blocks in front of base
execute if data entity @s {data:{facing:"north"}} run data modify entity @s data.input set from block ~ ~ ~-2 Items
execute if data entity @s {data:{facing:"south"}} run data modify entity @s data.input set from block ~ ~ ~2 Items
execute if data entity @s {data:{facing:"east"}} run data modify entity @s data.input set from block ~2 ~ ~ Items
execute if data entity @s {data:{facing:"west"}} run data modify entity @s data.input set from block ~-2 ~ ~ Items

# Check if there are items
execute unless data entity @s data.input[0] run return 0

# Process first item slot
execute if data entity @s {data:{facing:"north"}} positioned ~ ~ ~-2 run function ra_multiblock:blast_forge/process
execute if data entity @s {data:{facing:"south"}} positioned ~ ~ ~2 run function ra_multiblock:blast_forge/process
execute if data entity @s {data:{facing:"east"}} positioned ~2 ~ ~ run function ra_multiblock:blast_forge/process
execute if data entity @s {data:{facing:"west"}} positioned ~-2 ~ ~ run function ra_multiblock:blast_forge/process

# Particles at furnace (1 block in front of base)
execute if data entity @s {data:{facing:"north"}} run particle minecraft:flame ~ ~0.3 ~-1 0.2 0.1 0.2 0.01 5
execute if data entity @s {data:{facing:"south"}} run particle minecraft:flame ~ ~0.3 ~1 0.2 0.1 0.2 0.01 5
execute if data entity @s {data:{facing:"east"}} run particle minecraft:flame ~1 ~0.3 ~ 0.2 0.1 0.2 0.01 5
execute if data entity @s {data:{facing:"west"}} run particle minecraft:flame ~-1 ~0.3 ~ 0.2 0.1 0.2 0.01 5
playsound minecraft:block.furnace.fire_crackle block @a[distance=..8] ~ ~ ~ 0.3 1

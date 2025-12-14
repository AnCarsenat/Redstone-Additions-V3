# /data/ra_lib/function/removal/drop_item.mcfunction
# Drop the bat spawn egg when custom block is broken
# Context: as armor stand, at armor stand

# NOTE THIS IS BRUTE FORCE METHOD, IMPROVE LATER

# Summon item based on block type
execute if entity @s[tag=ra.custom_block.block_breaker] run summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_name":'{"text":"Block Breaker","color":"red"}',custom_data:{block_breaker:true},entity_data:{id:"minecraft:bat",Tags:["ra.spawned","ra.place.block_breaker"],Silent:1b,NoAI:1b}}}}

# Play sound
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1

# Remove armor stand
kill @s
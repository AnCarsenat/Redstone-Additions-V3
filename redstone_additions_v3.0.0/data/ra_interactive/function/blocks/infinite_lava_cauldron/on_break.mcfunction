# /ra_interactive:blocks/infinite_lava_cauldron/on_break
# Called when infinite lava cauldron is broken. As armor stand, at position.

# Kill vanilla cauldron drop if any
kill @e[type=item,nbt={Item:{id:"minecraft:cauldron"}},distance=..2,limit=1,sort=nearest]

# Drop the infinite lava cauldron item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:cauldron","minecraft:item_name":'Infinite Lava Cauldron',"minecraft:custom_data":{ra:{infinite_lava_cauldron:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.infinite_lava_cauldron"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

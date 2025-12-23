# /ra_interactive:blocks/infinite_snow_cauldron/on_break
# Called when infinite snow cauldron is broken. As armor stand, at position.

# Kill vanilla cauldron drop if any
kill @e[type=item,nbt={Item:{id:"minecraft:cauldron"}},distance=..2,limit=1,sort=nearest]

# Drop the infinite snow cauldron item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:cauldron","minecraft:item_name":'Infinite Snow Cauldron',"minecraft:custom_data":{ra:{infinite_snow_cauldron:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.infinite_snow_cauldron"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

# /ra_gates:blocks/beamer/on_break
# Handle Beamer break

# Kill vanilla cyan_glazed_terracotta drop
kill @e[type=item,nbt={Item:{id:"minecraft:cyan_glazed_terracotta"}},distance=..2,limit=1,sort=nearest]

# Drop the Beamer item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:cyan_glazed_terracotta","minecraft:item_name":"Beamer","minecraft:custom_data":{ra:{beamer:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.beamer"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

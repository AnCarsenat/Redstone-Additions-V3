# /ra_interactive:blocks/pusher/on_break
# Called when pusher is broken. As armor stand, at position.

# Kill the vanilla glazed terracotta drop
kill @e[type=item,nbt={Item:{id:"minecraft:magenta_glazed_terracotta"}},distance=..2,limit=1,sort=nearest]

# Drop the pusher item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:magenta_glazed_terracotta","minecraft:item_name":"Pusher","minecraft:custom_data":{ra:{pusher:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.pusher"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

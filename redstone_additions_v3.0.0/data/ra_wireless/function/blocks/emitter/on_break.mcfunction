# /ra_wireless:blocks/emitter/on_break
# Handle Emitter break

# Kill vanilla end_stone_bricks drop
kill @e[type=item,nbt={Item:{id:"minecraft:end_stone_bricks"}},distance=..2,limit=1,sort=nearest]

# Drop the Emitter item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:end_stone_bricks","minecraft:item_name":"Wireless Emitter","minecraft:custom_data":{ra:{emitter:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.emitter"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

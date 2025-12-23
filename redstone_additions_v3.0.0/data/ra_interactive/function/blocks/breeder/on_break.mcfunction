# /ra_interactive:blocks/breeder/on_break
# Called when breeder is broken. As armor stand, at position.

# Kill the vanilla dispenser drop
kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},distance=..2,limit=1,sort=nearest]

# Drop items inside
# function ra_interactive:blocks/breeder/drop_items

# Drop the breeder item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name": 'Breeder',"minecraft:custom_data":{ra:{breeder:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.breeder"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

# /ra_interactive:blocks/message/on_break
# Called when message block is broken. As armor stand, at position.

# Kill vanilla note_block drop
kill @e[type=item,nbt={Item:{id:"minecraft:note_block"}},distance=..2,limit=1,sort=nearest]

# Drop the message block item with its properties
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:note_block","minecraft:item_name":'Message Block',"minecraft:custom_data":{ra:{message_block:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.message_block"],Silent:1b,NoAI:1b,Invulnerable:1b}}},Tags:["ra.drop_temp"]}

playsound minecraft:block.wood.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

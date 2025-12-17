# /ra_interactive:blocks/spitter/on_break
# Called when spitter is broken. As armor stand, at position.

# Kill the vanilla dropper drop
kill @e[type=item,nbt={Item:{id:"minecraft:dropper"}},distance=..2,limit=1,sort=nearest]

# Drop items inside
execute if data block ~ ~ ~ Items[0] run summon item ~ ~0.5 ~ {Tags:["ra.drop_temp"]}
execute if entity @e[type=item,tag=ra.drop_temp,limit=1] run data modify entity @e[type=item,tag=ra.drop_temp,limit=1] Item set from block ~ ~ ~ Items[0]
execute as @e[type=item,tag=ra.drop_temp] run tag @s remove ra.drop_temp

# Drop the spitter item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dropper","minecraft:item_name":"Spitter","minecraft:custom_data":{ra:{spitter:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.spitter"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s

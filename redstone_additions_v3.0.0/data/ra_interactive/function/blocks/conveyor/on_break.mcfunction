# /ra_interactive:blocks/conveyor/on_break
# Called when item pipe is broken. As armor stand, at position.

# Kill the vanilla dispenser drop to prevent duplicate items
kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},distance=..2,limit=1,sort=nearest]

# Drop items inside the pipe first
data modify storage ra:temp Items set from block ~ ~ ~ Items
execute if data storage ra:temp Items[0] run loot spawn ~ ~0.5 ~ mine ~ ~ ~ air{drop_contents:{}}

# Drop the item pipe itself
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":'"Item Pipe"',"minecraft:custom_data":{ra:{item_pipe:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.item_pipe"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

# Kill the armor stand
kill @s

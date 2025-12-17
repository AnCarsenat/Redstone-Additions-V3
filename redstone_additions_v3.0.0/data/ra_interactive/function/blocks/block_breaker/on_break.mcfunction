# /ra_interactive:blocks/block_breaker/on_break
# Called when block breaker is broken. As armor stand, at position.

# Drop the exact same item as the give command
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":'{"text":"Block Breaker","color":"red","italic":false}',"minecraft:custom_data":{ra:{block_breaker:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.block_breaker"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

# Kill the armor stand
kill @s

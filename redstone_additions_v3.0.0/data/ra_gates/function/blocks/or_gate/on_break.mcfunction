# /ra_gates:blocks/or_gate/on_break
# Handle OR gate break


# Revert any redstone blocks back to iron blocks
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block

# Drop the OR Gate item at the armor stand's position
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:smooth_stone_slab","minecraft:item_name":"OR Gate","minecraft:custom_data":{ra:{or_gate:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.or_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}}},Tags:["ra.drop_temp"]}

# Kill the armor stand
kill @s

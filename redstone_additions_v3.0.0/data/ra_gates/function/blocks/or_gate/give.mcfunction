# /ra_gates:blocks/or_gate/give
# Give OR Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE if ANY input is powered

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="OR Gate",custom_data={ra:{or_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.or_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]

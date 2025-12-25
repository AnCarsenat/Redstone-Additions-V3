# /ra_gates:blocks/and_gate/give
# Give AND Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE only if ALL inputs are powered

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="AND Gate",custom_data={ra:{and_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.and_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
